/*************************************************************************************************
 * @file ble_app.h
 * @author BLE GROUP ()
 * @brief 
 * @version 1.0.0
 * @date 2025-03-24
 * 
 * 
*************************************************************************************************/
#include <stdint.h>

#define ADV_MIN_INTVL   160//160     //0.1S : 160*0.625ms
#define ADV_MAX_INTVL   160//192     //0.12S: 192*0.625ms


#define DFT_SLP_CNT_MIN_INTVL   800     //1S: 700*1.25ms
#define DFT_SLP_CNT_MAX_INTVL   800     //1.2S: 800*1.25ms
#define DFT_SLP_LT              80      //
#define DFT_SLP_TO              1000    //



void app_ble_init(void);

void ble_timing_compensate(uint32_t sys_clk);