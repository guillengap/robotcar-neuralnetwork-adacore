pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__autonomous_ada_car.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__autonomous_ada_car.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;

package body ada_main is

   E060 : Short_Integer; pragma Import (Ada, E060, "ada__tags_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__bb__timing_events_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__soft_links_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__exception_table_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__streams_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__finalization_root_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "ada__finalization_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "system__storage_pools_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__finalization_masters_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "ada__real_time_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__pool_global_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "system__tasking__protected_objects_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "system__tasking__protected_objects__multiprocessors_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__tasking__restricted__stages_E");
   E305 : Short_Integer; pragma Import (Ada, E305, "bmp_fonts_E");
   E237 : Short_Integer; pragma Import (Ada, E237, "cortex_m__cache_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "hal__audio_E");
   E272 : Short_Integer; pragma Import (Ada, E272, "hal__bitmap_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "bitmap_color_conversion_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "hal__block_drivers_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "hal__framebuffer_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "hal__gpio_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "hal__i2c_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "hal__real_time_clock_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "hal__sdmmc_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "hal__spi_E");
   E288 : Short_Integer; pragma Import (Ada, E288, "hal__time_E");
   E295 : Short_Integer; pragma Import (Ada, E295, "hal__touch_panel_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "hal__uart_E");
   E307 : Short_Integer; pragma Import (Ada, E307, "hershey_fonts_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "bitmapped_drawing_E");
   E286 : Short_Integer; pragma Import (Ada, E286, "ili9341_E");
   E292 : Short_Integer; pragma Import (Ada, E292, "l3gd20_E");
   E290 : Short_Integer; pragma Import (Ada, E290, "ravenscar_time_E");
   E239 : Short_Integer; pragma Import (Ada, E239, "sdmmc_init_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "soft_drawing_bitmap_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "memory_mapped_bitmap_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__adc_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "stm32__dac_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "stm32__dma__interrupts_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "stm32__dma2d_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "stm32__dma2d__interrupt_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "stm32__dma2d__polling_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "stm32__dma2d_bitmap_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "stm32__exti_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "stm32__fmc_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "stm32__power_control_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "stm32__rtc_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "stm32__spi_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "stm32__spi__dma_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "stm32__gpio_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "stm32__i2c_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "stm32__i2c__dma_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "stm32__i2s_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "stm32__sdmmc_interrupt_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "stm32__sdmmc_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "stm32__syscfg_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "stm32__usarts_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "stm32__device_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "stm32__ltdc_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "stm32__setup_E");
   E299 : Short_Integer; pragma Import (Ada, E299, "stmpe811_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "framebuffer_ltdc_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "framebuffer_ili9341_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "stm32__sdram_E");
   E294 : Short_Integer; pragma Import (Ada, E294, "touch_panel_stmpe811_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "stm32__board_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "last_chance_handler_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "lcd_std_out_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      procedure Install_Restricted_Handlers_Sequential;
      pragma Import (C,Install_Restricted_Handlers_Sequential, "__gnat_attach_all_handlers");

      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Partition_Elaboration_Policy := 'S';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, True, True, False, False, False, False, True, 
           False, False, False, False, False, False, False, True, 
           True, False, False, False, False, False, True, False, 
           False, False, False, False, False, False, False, False, 
           True, True, False, False, True, True, False, False, 
           False, True, False, False, False, False, True, False, 
           True, True, False, False, False, False, True, True, 
           True, True, True, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, True, True, 
           False, True, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, False, True, False, False, 
           False, False, False, True, False, False, True, False, 
           False, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, False, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           False, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 0, 0, 5, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Bb.Timing_Events'Elab_Spec;
      E082 := E082 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E060 := E060 + 1;
      System.Exception_Table'Elab_Body;
      E094 := E094 + 1;
      E096 := E096 + 1;
      Ada.Streams'Elab_Spec;
      E138 := E138 + 1;
      System.Finalization_Root'Elab_Spec;
      E146 := E146 + 1;
      Ada.Finalization'Elab_Spec;
      E144 := E144 + 1;
      System.Storage_Pools'Elab_Spec;
      E148 := E148 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E141 := E141 + 1;
      Ada.Real_Time'Elab_Body;
      E127 := E127 + 1;
      System.Pool_Global'Elab_Spec;
      E150 := E150 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E208 := E208 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E214 := E214 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E159 := E159 + 1;
      E305 := E305 + 1;
      E237 := E237 + 1;
      HAL.AUDIO'ELAB_SPEC;
      E223 := E223 + 1;
      HAL.BITMAP'ELAB_SPEC;
      E272 := E272 + 1;
      E279 := E279 + 1;
      HAL.BLOCK_DRIVERS'ELAB_SPEC;
      E246 := E246 + 1;
      HAL.FRAMEBUFFER'ELAB_SPEC;
      E273 := E273 + 1;
      HAL.GPIO'ELAB_SPEC;
      E196 := E196 + 1;
      HAL.I2C'ELAB_SPEC;
      E204 := E204 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E227 := E227 + 1;
      HAL.SDMMC'ELAB_SPEC;
      E241 := E241 + 1;
      HAL.SPI'ELAB_SPEC;
      E136 := E136 + 1;
      HAL.TIME'ELAB_SPEC;
      E288 := E288 + 1;
      HAL.TOUCH_PANEL'ELAB_SPEC;
      E295 := E295 + 1;
      HAL.UART'ELAB_SPEC;
      E257 := E257 + 1;
      E307 := E307 + 1;
      E303 := E303 + 1;
      ILI9341'ELAB_SPEC;
      ILI9341'ELAB_BODY;
      E286 := E286 + 1;
      L3GD20'ELAB_SPEC;
      L3GD20'ELAB_BODY;
      E292 := E292 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E290 := E290 + 1;
      E239 := E239 + 1;
      Soft_Drawing_Bitmap'Elab_Spec;
      Soft_Drawing_Bitmap'Elab_Body;
      E281 := E281 + 1;
      Memory_Mapped_Bitmap'Elab_Spec;
      Memory_Mapped_Bitmap'Elab_Body;
      E277 := E277 + 1;
      STM32.ADC'ELAB_SPEC;
      E173 := E173 + 1;
      E179 := E179 + 1;
      E220 := E220 + 1;
      E261 := E261 + 1;
      STM32.DMA2D.INTERRUPT'ELAB_BODY;
      E264 := E264 + 1;
      E266 := E266 + 1;
      STM32.DMA2D_BITMAP'ELAB_SPEC;
      STM32.DMA2D_BITMAP'ELAB_BODY;
      E275 := E275 + 1;
      E192 := E192 + 1;
      E270 := E270 + 1;
      E229 := E229 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E226 := E226 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E249 := E249 + 1;
      STM32.SPI.DMA'ELAB_SPEC;
      STM32.SPI.DMA'ELAB_BODY;
      E251 := E251 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C.DMA'ELAB_SPEC;
      STM32.I2S'ELAB_SPEC;
      STM32.SDMMC'ELAB_SPEC;
      E245 := E245 + 1;
      STM32.GPIO'ELAB_BODY;
      E185 := E185 + 1;
      STM32.USARTS'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E166 := E166 + 1;
      STM32.I2C'ELAB_BODY;
      E200 := E200 + 1;
      STM32.I2C.DMA'ELAB_BODY;
      E206 := E206 + 1;
      STM32.I2S'ELAB_BODY;
      E222 := E222 + 1;
      STM32.SDMMC'ELAB_BODY;
      E234 := E234 + 1;
      E190 := E190 + 1;
      STM32.USARTS'ELAB_BODY;
      E255 := E255 + 1;
      STM32.LTDC'ELAB_BODY;
      E283 := E283 + 1;
      E297 := E297 + 1;
      STMPE811'ELAB_SPEC;
      STMPE811'ELAB_BODY;
      E299 := E299 + 1;
      Framebuffer_Ltdc'Elab_Spec;
      Framebuffer_Ili9341'Elab_Spec;
      Framebuffer_Ltdc'Elab_Body;
      E259 := E259 + 1;
      Touch_Panel_Stmpe811'Elab_Spec;
      STM32.BOARD'ELAB_SPEC;
      E135 := E135 + 1;
      Framebuffer_Ili9341'Elab_Body;
      E164 := E164 + 1;
      E268 := E268 + 1;
      Touch_Panel_Stmpe811'Elab_Body;
      E294 := E294 + 1;
      E132 := E132 + 1;
      Lcd_Std_Out'Elab_Body;
      E301 := E301 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_autonomous_ada_car");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\bmp_fonts.o
   --   C:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\hershey_fonts.o
   --   C:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\bitmapped_drawing.o
   --   C:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\last_chance_handler.o
   --   C:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\lcd_std_out.o
   --   C:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\autonomous_ada_car.o
   --   -LC:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\
   --   -LC:\Users\Jupiter\Documents\Ada_Drivers_Library-master\arch\ARM\STM32\driver_demos\autonomous_ada_car\obj\Debug\
   --   -LC:\Users\Jupiter\Documents\Ada_Drivers_Library-master\examples\shared\common\
   --   -LC:\Users\Jupiter\Documents\Ada_Drivers_Library-master\boards\stm32f429_discovery\obj\full_lib_Debug\
   --   -LC:\gnat\2019-arm-elf\arm-eabi\lib\gnat\ravenscar-full-stm32f429disco\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
