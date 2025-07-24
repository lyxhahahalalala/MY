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

#include "api_ble2g4stack.h"

#include "ble_ota_service.h"
#include "ble_service.h"

#include "driver_sys.h"

#include "hal_clock.h"

#include "conn.h"
#include "gap_def.h"

uint32_t  counter = 0;

extern uint32_t  deft_conn;


uint8_t rx_ble_adv_data_buf[256];
//only for demo
uint8_t tx_ble_adv_data_buf[] = {

    // //BLE ADV HDR
    0x42, 0x10,   //ADV TYPE, RFU, TX/RX ADDR, LEN = 6(DEVICE ADDR) + PAYLOAD LEN
    0x20, 0x15, 0xFB, 0x92, 0xA3, 0x34,  //DEVICE ADDR

    //PAYLOAD
    0x02, 0x01, 0x06, 0x06, 0xAA, 0x78, 0x9F, 0x04, 0x43, 0x08,
};
uint8_t tx_rx_flag =0;

void ble_2g4_tx_end_handler(void)
{
	tx_rx_flag = 1;
	// log_printf("tx end \n");
}

void ble_2g4_rx_end_handler(uint8_t is_sync_it,uint8_t sync_ok, uint8_t crc_ok)
{
	tx_rx_flag = 3;
	if(sync_ok&&crc_ok)
	{
	// for (int i = 0; i < (rx_ble_adv_data_buf[1]+2); i++)
	// {
	// 	log_printf("%02X ", rx_ble_adv_data_buf[i]);
	// }
	}

}

void app_2g4_tx_rx(void)
{
	static uint32_t t_2g4_tick = 0;
	
	if (hal_clock_time_exceed(t_2g4_tick, 100 * 1000)) 
	{
		t_2g4_tick = hal_clock_get_system_tick();
		tx_rx_flag = 0;
		ble_2g4_tx_data(tx_ble_adv_data_buf, sizeof(tx_ble_adv_data_buf),38,ble_2g4_tx_end_handler);
			
	}
	if(tx_rx_flag == 1 )
	{
		tx_rx_flag = 2;
		ble_2g4_rx_data(rx_ble_adv_data_buf,37,50,ble_2g4_rx_end_handler);
	}
}

// 目标设备蓝牙地址（请替换为实际从机MAC地址）
static const bt_addr_le_t target_addr = {
    .type = BT_ADDR_LE_PUBLIC, // 或 BT_ADDR_LE_RANDOM，视从机广播地址类型而定
    .a = { .val = {0x34, 0xA3, 0x92, 0xFB, 0x15, 0x20} } // 反序写入: 20:15:FB:92:A3:34
};

static struct bt_conn *default_conn = NULL;

// 扫描回调，发现设备时调用
static void device_found(const bt_addr_le_t *addr, int8_t rssi, uint8_t type, struct net_buf_simple *ad)
{
    char addr_str[BT_ADDR_LE_STR_LEN];
    bt_addr_le_to_str(addr, addr_str, sizeof(addr_str));
    log_printf("Device found: %s, RSSI: %d\n", addr_str, rssi);

    // 判断是否是目标设备
    if (bt_addr_le_cmp(addr, &target_addr) == 0) {
        log_printf("Target device found, stop scan and connect!\n");
        bt_le_scan_stop();

        struct bt_conn_le_create_param create_param = BT_CONN_LE_CREATE_PARAM_INIT(
            BT_CONN_LE_OPT_NONE, BT_GAP_SCAN_FAST_INTERVAL, BT_GAP_SCAN_FAST_WINDOW);
        struct bt_le_conn_param conn_param = {
            .interval_min = BT_GAP_INIT_CONN_INT_MIN,
            .interval_max = BT_GAP_INIT_CONN_INT_MAX,
            .latency = 0,
            .timeout = 400,
        };
        int err = bt_conn_le_create(addr, &create_param, &conn_param, &default_conn);
        if (err) {
            log_printf("Create conn failed (err %d)\n", err);
        }
    }
}

// 连接回调
static void connected(struct bt_conn *conn, uint8_t err)
{
    if (err) {
        log_printf("Connection failed (err 0x%02x)\n", err);
        return;
    }
    log_printf("Connected!\n");
    default_conn = conn;
}

static void disconnected(struct bt_conn *conn, uint8_t reason)
{
    log_printf("Disconnected (reason 0x%02x)\n", reason);
    if (default_conn) {
        bt_conn_unref(default_conn);
        default_conn = NULL;
    }
}

static struct bt_conn_cb conn_callbacks = {
    .connected = connected,
    .disconnected = disconnected,
};

int app_main(void)
{
    app_ble_init(); // BLE协议栈初始化
    bt_conn_cb_register(&conn_callbacks);

    struct bt_le_scan_param scan_param = {
        .type       = BT_HCI_LE_SCAN_ACTIVE,
        .options    = 0,
        .interval   = BT_GAP_SCAN_FAST_INTERVAL,
        .window     = BT_GAP_SCAN_FAST_WINDOW,
    };
    int err = bt_le_scan_start(&scan_param, device_found);
    if (err) {
        log_printf("Scan start failed (err %d)\n", err);
    } else {
        log_printf("Scanning...\n");
    }

    while(1)
    {
        WDT_FEED();
        ble_host_work_polling();
        hal_clock_time_run();
    }
}
