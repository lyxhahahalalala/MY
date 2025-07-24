/*************************************************************************************************
 * @file app_main.c
 * @author BLE GROUP ()
 * @brief 
 * @version 1.0.0
 * @date 2025-03-24
 * 
 * 
*************************************************************************************************/
#include "include.h"
#include "ble_app.h"

#include "api_blestack.h"
#include "api_ble_sleep_wakeup.h"
#include "ble_ota_service.h"
#include "ble_service.h"

#include "hal_clock.h"
#include "driver_sys.h"

uint32_t  counter = 0;
uint32_t  loop_counter = 0;
extern uint32_t  deft_conn;


int app_main(void)
{
    uint32_t t_loop = 0;
	app_ble_init();
#if(BLE_MODE_SEL ==BLE_STACK_VER) 
#if(BLE_SLEEP_EN)
	ble_sleep_init();
#endif
#endif

	while(1)
	{
		WDT_FEED();
		
		ble_host_work_polling();
		
		#if(BLE_SLEEP_EN)
		ble_sleep_check();//Sleep must be checked, added to 2050625
		#endif

		hal_clock_time_run();
		#if(BLE_FOTA_EN)
		if(!ota_svc_state_get())
		#endif
		{
			if (hal_clock_time_exceed(t_loop, 1000 * 1000)) 
			{
				t_loop = hal_clock_get_system_tick();
//				ble_user_data_notify_send(deft_conn,&t_loop,4);
				loop_counter++;
				log_printf(" loop = %d \n",t_loop);
			}
		    counter++;
		}
		
		//deep sleep
		#if 0  
		if(loop_counter>10)
		{
			log_printf(" adv disable \n");
			ble_adv_disable();
			config_wakeup_gpio(1<<6,1);//GPIO6 wakeup 
			log_printf(" depp sleep \n");
#if(BLE_MODE_SEL ==BLE_STACK_VER) 
#if(BLE_SLEEP_EN)
			app_sleep_enable();
#endif
#endif
		}
		if(get_GpioWakeupSource())
		{
			log_printf(" wake up :%x \n",get_GpioWakeupSource());
		}
		
		#else
		if(loop_counter == 2)
		{
#if(BLE_MODE_SEL ==BLE_STACK_VER) 
#if(BLE_SLEEP_EN)
			app_sleep_enable();
#endif
#endif
		}
		if (deft_conn)
		{
			struct bt_conn_info info;
			bt_conn_get_info((struct bt_conn *)deft_conn, &info);

			if (info.le.interval < DFT_SLP_CNT_MIN_INTVL)
			{
				#if(BLE_MODE_SEL ==BLE_STACK_VER) 
				#if(BLE_SLEEP_EN)
				app_sleep_disable();
				#endif
				#endif

				if ((counter & 0xFFFF) == 0)
				{
					int err = ble_update_conn_param(deft_conn, DFT_SLP_CNT_MIN_INTVL, DFT_SLP_CNT_MAX_INTVL, 0, DFT_SLP_TO);

					if (err)
					{
						log_printf("conn update failed (err %d).\n", err);
					}
				}
			}
			else
			{
			#if(BLE_MODE_SEL ==BLE_STACK_VER) 
			#if(BLE_SLEEP_EN)
				app_sleep_enable();
			#endif
			#endif
			}
		}
		#endif
	}
	
}