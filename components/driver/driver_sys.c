/***********************************************************************************************
 * @file     driver_sys.c
 * @brief    System Controller Driver for CP8xxx Series MCUs
 * @version  1.0.0
 * @date     2025-02-19
 * @copyright Copyright (c) 2024, CHIP PUMP Microelectronics. 
 * 
 *             All rights reserved.
 ************************************************************************************************/
#include <stdint.h>
#include "mcu_reg_def.h"
#include "driver_sys.h"

/*-------------------------------------
  Clock Management
-------------------------------------*/

/**
 * @brief Configure system clock source
 * @param clock Clock source selection:
 *        - SYS_CLK_XTAL24M: 24MHz crystal
 *        - SYS_CLK_PLL48M: 48MHz PLL output
 *        - SYS_CLK_PLL24M: 24MHz PLL output
 *        - SYS_CLK_PLL12M: 12MHz PLL output
 *        - SYS_CLK_PLL6M:  6MHz PLL output
 * 
 * @sequence
 * 1. Enable analog switch control
 * 2. Modify clock selection register
 * 3. Update clock domain configuration
 * 
 * @warning Requires PLL pre-configuration for PLL modes
 */
// Description: set system clock, cpu clk and pclk is the same as system clock
void set_sys_clk(uint32_t sel){
    uint32_t t;
    // analog switch
    t = *(volatile int *)(0x42002000);
    t = t | (1<<1);
    *(volatile int *)(0x42002000) = t;
    // read
    t = SYS_CTRL->SYS_CLKSEL;
    // modify
    t = t & (~SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Msk);
    t = t & (~SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Msk);
    switch(sel){
        case(SYS_CLK_XTAL24M):
            t = t | (1 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos);
            break;
        case(SYS_CLK_PLL48M):
            t = t | (2 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos);
            t = t | (3 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Pos);
            break;
        case(SYS_CLK_PLL24M):
            t = t | (2 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos);
            t = t | (2 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Pos);
            break;
        case(SYS_CLK_PLL12M):
            t = t | (2 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos);
            t = t | (1 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Pos);
            break;
        case(SYS_CLK_PLL6M):
            t = t | (2 << SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos);
            break;
        default:
            t = t;
            break;
    }
    // write
    SYS_CTRL->SYS_CLKSEL = t;
}


/**
 * @brief Get current clock source configuration
 * @return ENUM value of active clock source
 * @retval 0xEE indicates invalid configuration
 * 
 * @note Returns configured source, not actual lock status
 */
uint32_t get_sys_clk(void) 
{
    uint32_t t = SYS_CTRL->SYS_CLKSEL;
    uint32_t t0 = (t & SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Msk) >> SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos;
    uint32_t t1 = (t & SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Msk) >> SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Pos;
    
    // Decode clock source hierarchy
    if(t0 == 2) {
        switch(t1) {
            case 0: return SYS_CLK_PLL6M;
            case 1: return SYS_CLK_PLL12M;
            case 2: return SYS_CLK_PLL24M;
            case 3: return SYS_CLK_PLL48M;
        }
    }
    return 0xEE; // Error code
}

/**
 * @brief Get actual system clock frequency
 * @return Frequency in Hz (24MHz/48MHz/etc)
 * @retval 0xEE indicates measurement error
 * 
 * @note Direct register decode, assumes PLLs are locked
 */
uint32_t get_sys_clk_freq(void) 
{
    uint32_t t = SYS_CTRL->SYS_CLKSEL;
    uint32_t t0 = (t >> SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SYSSEL_Pos) & 0x3;
    uint32_t t1 = (t >> SYS_CTRL_SYS_CLKSEL_REG_CPU_CLK_SEL_Pos) & 0x3;
    
    if(t0 <= 1) return SYS_CLK_FREQ_24M;  // XTAL/RC24M
    if(t0 == 2) {
        switch(t1) {
            case 0: return SYS_CLK_FREQ_6M;
            case 1: return SYS_CLK_FREQ_12M;
            case 2: return SYS_CLK_FREQ_24M;
            case 3: return SYS_CLK_FREQ_48M;
        }
    }
    return 0xEE; // Error code
}

/*-------------------------------------
  Reset Control
-------------------------------------*/

/**
 * @brief Get system reset flags
 * @return Bitmask of reset sources:
 *        - BIT0: Power-on reset
 *        - BIT1: Brown-out reset  
 *        - BIT2: Watchdog reset
 *        - BIT3: Software reset
 */
uint32_t get_reset_flag(void) 
{
    return AON_CTRL->CPU_RST_RCD;
}

/**
 * @brief Clear reset status flags
 * @param d Bitmask of flags to clear
 * 
 * @note Write 1 to corresponding bits to clear status
 */
void clear_reset_flag(uint32_t d) 
{
    AON_CTRL->CPU_RST_CLR = d;
}

/**
 * @brief Initiate system software reset
 * @warning Causes immediate processor restart
 */
void sys_soft_reset(void) {
    SYS_CTRL->SYS_RESET = 1;
    while(1); // Execution stops here
}

