-- AUTHOR: GUILLERMO ALBERETO PEREZ GUILLEN

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32.Board;  use STM32.Board;
with STM32.Device; use STM32.Device;

with HAL;          use HAL;
with STM32.ADC;    use STM32.ADC;
with STM32.GPIO;   use STM32.GPIO;

with LCD_Std_Out;

with Ada.Real_Time;  use Ada.Real_Time;

with Ada.Numerics; use Ada.Numerics;

with Ada.Numerics.Elementary_Functions;
use  Ada.Numerics.Elementary_Functions;

procedure Autonomous_Ada_Car is

   Converter     : Analog_To_Digital_Converter renames ADC_1;
   Input_Channel : constant Analog_Input_Channel := 5;
   Input         : constant GPIO_Point := PA5;

   LED1       : GPIO_Point renames PG13; -- GREEN LED
   LED2       : GPIO_Point renames PG14; -- RED LED
   LED3       : GPIO_Point renames PD12;
   LED4       : GPIO_Point renames PD13;

   --  See the mapping of channels to GPIO pins at the top of the ADC package.
   --  Also see the board's User Manual for which GPIO pins are available.
   --  For example, on the F429 Discovery board, PA5 is not used by some   --  other device, and maps to ADC channel 5.

   All_Regular_Conversions : constant Regular_Channel_Conversions :=
          (1 => (Channel => Input_Channel, Sample_Time => Sample_144_Cycles));


   Raw : UInt32 := 0;
   light_Current : Integer;
   light_Before : Integer;
   eval : Float;
   lux : Float;

   HiddenWeights_1_1, HiddenWeights_1_2, HiddenWeights_1_3, HiddenWeights_1_4 : Float;
   HiddenWeights_2_1, HiddenWeights_2_2, HiddenWeights_2_3, HiddenWeights_2_4 : Float;
   HiddenWeights_3_1, HiddenWeights_3_2, HiddenWeights_3_3, HiddenWeights_3_4 : Float;

   OutputWeights_1_1, OutputWeights_1_2, OutputWeights_1_3, OutputWeights_1_4 : Float;
   OutputWeights_2_1, OutputWeights_2_2, OutputWeights_2_3, OutputWeights_2_4 : Float;
   OutputWeights_3_1, OutputWeights_3_2, OutputWeights_3_3, OutputWeights_3_4 : Float;
   OutputWeights_4_1, OutputWeights_4_2, OutputWeights_4_3, OutputWeights_4_4 : Float;

   Hidden_Layer_1_1, Hidden_Layer_1_2, Hidden_Layer_1_3, Hidden_Layer_1_4 : Float;
   Output_Layer_1_1, Output_Layer_1_2, Output_Layer_1_3, Output_Layer_1_4 : Float;

   Output_1, Output_2, Output_3, Output_4 : Integer;

   Successful : Boolean;

   procedure Print (X, Y : Natural; Value : String);

   procedure Configure_Analog_Input;

   -----------
   -- LCD Print --
   -----------

   procedure Print (X, Y : Natural; Value : String) is
      Trailing_Blanks : constant String := "   ";  -- to clear the rest of line
   begin
      --LCD_Std_Out.Put (X, Y, Value & " / 4095" & Trailing_Blanks);
      LCD_Std_Out.Put (X, Y, Value & Trailing_Blanks);
   end Print;

   ----------------------------
   -- Configure_Analog_Input --
   ----------------------------

   procedure Configure_Analog_Input is
   begin
      Enable_Clock (Input);
      Configure_IO (Input, (Mode => Mode_Analog, Resistors => Floating));
   end Configure_Analog_Input;

begin

   Initialize_LEDs;
   LED1.Clear;
   LED2.Clear;
   LED3.Clear;
   LED4.Clear;

   Configure_Analog_Input;

   Enable_Clock (Converter);

   Reset_All_ADC_Units;

   Configure_Common_Properties
     (Mode           => Independent,
      Prescalar      => PCLK2_Div_2,
      DMA_Mode       => Disabled,
      Sampling_Delay => Sampling_Delay_5_Cycles);

   Configure_Unit
     (Converter,
      Resolution => ADC_Resolution_12_Bits,
      Alignment  => Right_Aligned);

   Configure_Regular_Conversions
     (Converter,
      Continuous  => False,
      Trigger     => Software_Triggered,
      Enable_EOC  => True,
      Conversions => All_Regular_Conversions);

   Enable (Converter);

   light_Current := 0;
   light_Before := 0;

-------------------------------------------
--- NEURONAL NETWORKS' WEIGHTS
-------------------------------------------
   HiddenWeights_1_1 := -0.8330212122953609;
   HiddenWeights_1_2 := 1.0912649297996564;
   HiddenWeights_1_3 := -0.6179969826549335;
   HiddenWeights_1_4 := -1.0762413280914194;

   HiddenWeights_2_1 := -0.7221015071612642;
   HiddenWeights_2_2 := -0.3040531641938827;
   HiddenWeights_2_3 := 1.424273154914373;
   HiddenWeights_2_4 := 0.5226012446435597;

   HiddenWeights_3_1 := -1.3873042452980089;
   HiddenWeights_3_2 := 0.8796185107005765;
   HiddenWeights_3_3 := 0.6115239126364166;
   HiddenWeights_3_4 := -0.6941384010920131;

   OutputWeights_1_1 := 0.4890791000431967;
   OutputWeights_1_2 := -1.2072393706400335;
   OutputWeights_1_3 := -1.1170823069750404;
   OutputWeights_1_4 := 0.08254392928517773;

   OutputWeights_2_1 := 1.2585395954445326;
   OutputWeights_2_2 := 0.7259701403757809;
   OutputWeights_2_3 := 0.05232196665284013;
   OutputWeights_2_4 := 0.5379573853597585;

   OutputWeights_3_1 := 1.3028834913318572;
   OutputWeights_3_2 := -1.3073304956402805;
   OutputWeights_3_3 := 0.1681659447995217;
   OutputWeights_3_4 := -0.016766185238717802;

   OutputWeights_4_1 := -0.38086087439361543;
   OutputWeights_4_2 := 0.8415209522385925;
   OutputWeights_4_3 := -1.527573567687556;
   OutputWeights_4_4 := 0.476559350936026;

   loop
      light_Before := light_Current;
      Start_Conversion (Converter);

      Poll_For_Status (Converter, Regular_Channel_Conversion_Complete, Successful);
      if not Successful then
         Print (0, 0, "NOT SUCCESSFUL");
      else
         Print (0, 0, "SUCCESSFUL"); -- Successful readings
         Raw := UInt32 (Conversion_Value (Converter));
         light_Current := Integer(Raw * 1);
 
        ----------------------------------------------
        -- CHARGE INPUT VALUES...
        ----------------------------------------------
		 if light_Current >= light_Before then -- If light_Current is greater than or equal to, move forward
            eval := 1.0;
         else -- else, it turns counterclockwise
            eval := -1.0;
         end if;

         if light_Current <= 3750 then -- If light_Current is less than, move forward or turn to the left
            lux := 1.0;
         else -- else, "Stop"
            lux := -1.0;
         end if;
        ----------------------------------------------
        -- Input * HiddenWeights
		-- We use the Tanh to get values between 1 and -1
        ----------------------------------------------
         Hidden_Layer_1_1 := Tanh(1.0*HiddenWeights_1_1 + eval*HiddenWeights_2_1 + lux*HiddenWeights_3_1);
         Hidden_Layer_1_2 := Tanh(1.0*HiddenWeights_1_2 + eval*HiddenWeights_2_2 + lux*HiddenWeights_3_2);
         Hidden_Layer_1_3 := Tanh(1.0*HiddenWeights_1_3 + eval*HiddenWeights_2_3 + lux*HiddenWeights_3_3);
         Hidden_Layer_1_4 := Tanh(1.0*HiddenWeights_1_4 + eval*HiddenWeights_2_4 + lux*HiddenWeights_3_4);
        ----------------------------------------------
        -- Hidden_Layers * OutputWeights
		-- We use the Tanh to get values between 1 and -1
        ----------------------------------------------
         Output_Layer_1_1 := Tanh(Hidden_Layer_1_1*OutputWeights_1_1 + Hidden_Layer_1_2*OutputWeights_2_1 + Hidden_Layer_1_3*OutputWeights_3_1 + Hidden_Layer_1_4*OutputWeights_4_1);
         Output_Layer_1_2 := Tanh(Hidden_Layer_1_1*OutputWeights_1_2 + Hidden_Layer_1_2*OutputWeights_2_2 + Hidden_Layer_1_3*OutputWeights_3_2 + Hidden_Layer_1_4*OutputWeights_4_2);
         Output_Layer_1_3 := Tanh(Hidden_Layer_1_1*OutputWeights_1_3 + Hidden_Layer_1_2*OutputWeights_2_3 + Hidden_Layer_1_3*OutputWeights_3_3 + Hidden_Layer_1_4*OutputWeights_4_3);
         Output_Layer_1_4 := Tanh(Hidden_Layer_1_1*OutputWeights_1_4 + Hidden_Layer_1_2*OutputWeights_2_4 + Hidden_Layer_1_3*OutputWeights_3_4 + Hidden_Layer_1_4*OutputWeights_4_4);
        ----------------------------------------------
        -- We charge absolute and integer values at the outputs
        ----------------------------------------------
         Output_1 := Integer (abs (Output_Layer_1_1));
         Output_2 := Integer (abs (Output_Layer_1_2));
         Output_3 := Integer (abs (Output_Layer_1_3));
         Output_4 := Integer (abs (Output_Layer_1_4));
        ----------------------------------------------
        -- Activate the outputs according to the calculations of the neural network
        ----------------------------------------------
         if Output_1 = 1 then
            LED1.Set;
         else
            LED1.Clear;
         end if;

         if Output_2 = 1 then
            LED2.Set;
         else
            LED2.Clear;
         end if;

         if Output_3 = 1 then
             LED3.Set;
         else
            LED3.Clear;
         end if;

         if Output_4 = 1 then
            LED4.Set;
         else
            LED4.Clear;
         end if;
        ----------------------------------------------
        -- Print the outputs of the neural network
        ----------------------------------------------
         Print (0, 25, Output_1'Img);
         Print (0, 50, Output_2'Img);
         Print (0, 75, Output_3'Img);
         Print (0, 100, Output_4'Img);

      end if;

      delay until Clock + Milliseconds (100); -- slow it down to ease reading
   end loop;
end Autonomous_Ada_Car;
