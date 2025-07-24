/*************************************************************************************************
 * @file ble_service.h
 * @author BLE GROUP ()
 * @brief 
 * @version 1.0.0
 * @date 2025-04-03
 * 
 * 
*************************************************************************************************/
#ifndef _BLE_SERVICE_H_
#define _BLE_SERVICE_H_
#include <stddef.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

void ble_user_service_init(void);

int ble_user_data_notify_send(uint32_t cn_hdl, uint8_t *data, uint16_t len);



#endif