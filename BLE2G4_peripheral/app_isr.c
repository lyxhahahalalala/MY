/*************************************************************************************************
 * @file       app_isr.c
 * @author     BLE Group
 * @brief 
 * @version    1.0.8
 * @date       2025-06-25
 * 
 * @copyright Copyright (c) 2024, CHIP PUMP Microelectronics.
                 All rights reserved.
 * 
 ************************************************************************************************/
#include "include.h"


#define GPADC_Handler   Interrupt7_Handler


extern void RF_BT_IRQHandler_RAM();
extern void BT_TIMER_IRQHandler(void);
extern void VTIMER_IRQHandler(void);

extern void rf_cali_period_temp(void);

#if(BLE_SLEEP_EN)
extern void Check_PwrOn_OnBbDmaIrq();
extern void  Check_PwrOn_OnBbDmaIrq_Before();
extern void ll_conn_process_wake_up_pre_chk();
#endif

__RAM_CODE_SECTION ATTRIBUTE_ISR void RADIO_DMA_Handler(void)
{
    #if(BLE_SLEEP_EN)
    Check_PwrOn_OnBbDmaIrq_Before();
    #endif

    RF_BT_IRQHandler_RAM();

    #if(BLE_SLEEP_EN)
    Check_PwrOn_OnBbDmaIrq();
    ll_conn_process_wake_up_pre_chk();
    #endif
    
	rf_cali_period_temp();
}

__RAM_CODE_SECTION ATTRIBUTE_ISR void RADIO_TICK_Handler(void)
{
    BT_TIMER_IRQHandler(); //rom api

    #if(BLE_SLEEP_EN)
    Check_PwrOn_OnBbDmaIrq();
    ll_conn_process_wake_up_pre_chk();
    #endif

    rf_cali_period_temp();
}
__RAM_CODE_SECTION ATTRIBUTE_ISR void RTC_Handler(void)
{
    VTIMER_IRQHandler();
}


ATTRIBUTE_ISR void GPADC_Handler(void)
{

}

ATTRIBUTE_ISR void WDT_Handler(void)
{

}

ATTRIBUTE_ISR void GPIO_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER0_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER1_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER2_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER3_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER4_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER5_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER6_Handler(void)
{

}

ATTRIBUTE_ISR void TIMER7_Handler(void)
{

}