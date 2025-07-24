/*************************************************************************************************
 * @file app_main.c
 * @brief CP800x/剑池 BLE 主机端自动连接模板
 *************************************************************************************************/
#include "include.h"
#include "ble_app.h"
#include "api_ble2g4stack.h"
#include "conn.h"
#include "gap_def.h"
#include "hal_clock.h"
#include "driver_sys.h"

// 目标设备蓝牙地址（请替换为实际从机MAC地址，注意反序写入）
static const bt_addr_le_t target_addr = {
    .type = BT_ADDR_LE_PUBLIC, // 或 BT_ADDR_LE_RANDOM，视从机广播地址类型而定
    .a = { .val = {0x34, 0xA3, 0x92, 0xFB, 0x15, 0x20} } // 反序写入: 20:15:FB:92:A3:34
};

static struct bt_conn *default_conn = NULL;

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
    app_ble_init();
    bt_conn_cb_register(&conn_callbacks);

    // 直接发起连接
    struct bt_conn_le_create_param create_param = {
        .options = 0,
        .interval = 0x0060, // 60ms
        .window = 0x0030,   // 30ms
        .interval_coded = 0,
        .window_coded = 0,
        .timeout = 0,
    };
    struct bt_le_conn_param conn_param = {
        .interval_min = 0x0018,
        .interval_max = 0x0028,
        .latency = 0,
        .timeout = 400,
    };
    int err = bt_conn_le_create(&target_addr, &create_param, &conn_param, &default_conn);
    if (err) {
        log_printf("Create conn failed (err %d)\n", err);
    } else {
        log_printf("Connecting...\n");
    }

    while(1)
    {
        WDT_FEED();
        ble_host_work_polling();
        hal_clock_time_run();
    }
}