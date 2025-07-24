
.//Obj/BLE2G4_peripheral.elf:     file format elf32-littleriscv


Disassembly of section .text:

10000000 <reset_handler>:
10000000:	00000093          	li	ra,0
10000004:	8106                	mv	sp,ra
10000006:	8186                	mv	gp,ra
10000008:	8206                	mv	tp,ra
1000000a:	8286                	mv	t0,ra
1000000c:	8306                	mv	t1,ra
1000000e:	8386                	mv	t2,ra
10000010:	8406                	mv	s0,ra
10000012:	8486                	mv	s1,ra
10000014:	8506                	mv	a0,ra
10000016:	8586                	mv	a1,ra
10000018:	8606                	mv	a2,ra
1000001a:	8686                	mv	a3,ra
1000001c:	8706                	mv	a4,ra
1000001e:	8786                	mv	a5,ra
10000020:	00000517          	auipc	a0,0x0
10000024:	06050513          	addi	a0,a0,96 # 10000080 <trap_handler>
10000028:	00356513          	ori	a0,a0,3
1000002c:	30551073          	csrw	mtvec,a0
10000030:	10001517          	auipc	a0,0x10001
10000034:	ad050513          	addi	a0,a0,-1328 # 20000b00 <__VECTOR_TABLE>
10000038:	30751073          	csrw	mtvt,a0
1000003c:	10004117          	auipc	sp,0x10004
10000040:	fc410113          	addi	sp,sp,-60 # 20004000 <__StackTop>
10000044:	34011073          	csrw	mscratch,sp
10000048:	4bb000ef          	jal	10000d02 <sys_entry>

1000004c <__exit>:
1000004c:	a001                	j	1000004c <__exit>
1000004e:	00000013          	nop
10000052:	00000013          	nop
10000056:	00000013          	nop
1000005a:	00000013          	nop
1000005e:	00000013          	nop
10000062:	00000013          	nop
10000066:	00000013          	nop
1000006a:	00000013          	nop
1000006e:	00000013          	nop
10000072:	00000013          	nop
10000076:	00000013          	nop
1000007a:	00000013          	nop
1000007e:	0001                	nop

10000080 <trap_handler>:
10000080:	30047573          	csrrci	a0,mstatus,8

10000084 <__deadloop>:
10000084:	a001                	j	10000084 <__deadloop>
10000086:	30200073          	mret
	...

100000b4 <print_string_to_buf>:

#if(LOG_ENABLE)

static void print_string_to_buf(uint8_t* uartSndBuf, uint8_t* uartSndBufUseLen, uint8_t* buf, int len)
{
	for(uint8_t i = 0; i < len; i ++)
100000b4:	4781                	li	a5,0
	{
		if(*uartSndBufUseLen >= DEBUG_STRING_LOG_SINGLE_LINE_MAX_SIZE)
100000b6:	0c700313          	li	t1,199
	for(uint8_t i = 0; i < len; i ++)
100000ba:	00d7c363          	blt	a5,a3,100000c0 <print_string_to_buf+0xc>
		}
		*(uartSndBuf + *uartSndBufUseLen) = buf[i];

		*uartSndBufUseLen = *uartSndBufUseLen+1;
	}
}
100000be:	8082                	ret
		if(*uartSndBufUseLen >= DEBUG_STRING_LOG_SINGLE_LINE_MAX_SIZE)
100000c0:	0005c703          	lbu	a4,0(a1)
100000c4:	fee36de3          	bltu	t1,a4,100000be <print_string_to_buf+0xa>
		*(uartSndBuf + *uartSndBufUseLen) = buf[i];
100000c8:	00f602b3          	add	t0,a2,a5
100000cc:	0002c283          	lbu	t0,0(t0)
100000d0:	972a                	add	a4,a4,a0
	for(uint8_t i = 0; i < len; i ++)
100000d2:	0785                	addi	a5,a5,1
		*(uartSndBuf + *uartSndBufUseLen) = buf[i];
100000d4:	00570023          	sb	t0,0(a4)
		*uartSndBufUseLen = *uartSndBufUseLen+1;
100000d8:	0005c703          	lbu	a4,0(a1)
	for(uint8_t i = 0; i < len; i ++)
100000dc:	0ff7f793          	zext.b	a5,a5
		*uartSndBufUseLen = *uartSndBufUseLen+1;
100000e0:	0705                	addi	a4,a4,1
100000e2:	00e58023          	sb	a4,0(a1)
	for(uint8_t i = 0; i < len; i ++)
100000e6:	bfd1                	j	100000ba <print_string_to_buf+0x6>

100000e8 <uart_send.constprop.0>:
            return;
        }
    }
    UARTx->THR = c;
}
void uart_send(UART_Sel_e uartx, void * pdata, uint32_t len)
100000e8:	95aa                	add	a1,a1,a0
    uint8_t  *ptmp = pdata;
    uint32_t pos = 0;

    while (pos < len)
    {
        while (!(UARTx->LSR& LSR_TRANS_EMPTY));
100000ea:	41001737          	lui	a4,0x41001
    while (pos < len)
100000ee:	00b51363          	bne	a0,a1,100000f4 <uart_send.constprop.0+0xc>

        UARTx->THR = ptmp[pos++];
    }
}
100000f2:	8082                	ret
        while (!(UARTx->LSR& LSR_TRANS_EMPTY));
100000f4:	01475783          	lhu	a5,20(a4) # 41001014 <__StackTop+0x20ffd014>
100000f8:	0207f793          	andi	a5,a5,32
100000fc:	dfe5                	beqz	a5,100000f4 <uart_send.constprop.0+0xc>
        UARTx->THR = ptmp[pos++];
100000fe:	00054783          	lbu	a5,0(a0)
10000102:	0505                	addi	a0,a0,1
10000104:	00f71023          	sh	a5,0(a4)
10000108:	b7dd                	j	100000ee <uart_send.constprop.0+0x6>

1000010a <log_printf>:

    return 0;
}

void log_printf(const char *format, ...)
{
1000010a:	eec10113          	addi	sp,sp,-276
1000010e:	c02a                	sw	a0,0(sp)
10000110:	df86                	sw	ra,252(sp)
10000112:	dda2                	sw	s0,248(sp)
10000114:	dba6                	sw	s1,244(sp)
10000116:	0948                	addi	a0,sp,148
10000118:	dd7c                	sw	a5,124(a0)
1000011a:	d56c                	sw	a1,108(a0)
1000011c:	d930                	sw	a2,112(a0)
1000011e:	d974                	sw	a3,116(a0)
10000120:	dd38                	sw	a4,120(a0)
	va_list ap;

	va_start(ap, format);
10000122:	021c                	addi	a5,sp,256
10000124:	ca3e                	sw	a5,20(sp)
    uint8_t uart_tx_local_ptr = 0;
10000126:	000109a3          	sb	zero,19(sp)
    char HexFormat = 0;
1000012a:	c202                	sw	zero,4(sp)
    while(*format)
1000012c:	4702                	lw	a4,0(sp)
1000012e:	00074703          	lbu	a4,0(a4)
10000132:	e721                	bnez	a4,1000017a <log_printf+0x70>
    uart_send(LOG_UART, uart_tx_buff, uart_tx_local_ptr);
10000134:	01314583          	lbu	a1,19(sp)
10000138:	1068                	addi	a0,sp,44
1000013a:	377d                	jal	100000e8 <uart_send.constprop.0>

    dbg_print_string_raw(format, ap);

    va_end(ap);
}
1000013c:	50fe                	lw	ra,252(sp)
1000013e:	546e                	lw	s0,248(sp)
10000140:	54de                	lw	s1,244(sp)
10000142:	11410113          	addi	sp,sp,276
10000146:	8082                	ret
        for(ulIdx = 0; (format[ulIdx] != '%') && (format[ulIdx] != '\0');ulIdx++)
10000148:	0685                	addi	a3,a3,1
1000014a:	4702                	lw	a4,0(sp)
1000014c:	00d70433          	add	s0,a4,a3
10000150:	00044703          	lbu	a4,0(s0)
10000154:	1cc70363          	beq	a4,a2,1000031a <log_printf+0x210>
10000158:	fb65                	bnez	a4,10000148 <log_printf+0x3e>
        if(ulIdx>0)
1000015a:	ce91                	beqz	a3,10000176 <log_printf+0x6c>
            print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)format, ulIdx);
1000015c:	4602                	lw	a2,0(sp)
1000015e:	01310593          	addi	a1,sp,19
10000162:	1068                	addi	a0,sp,44
10000164:	c63e                	sw	a5,12(sp)
10000166:	c43a                	sw	a4,8(sp)
10000168:	37b1                	jal	100000b4 <print_string_to_buf>
        if(*format == '%')
1000016a:	4722                	lw	a4,8(sp)
1000016c:	02500693          	li	a3,37
10000170:	47b2                	lw	a5,12(sp)
10000172:	1ad70663          	beq	a4,a3,1000031e <log_printf+0x214>
        format += ulIdx;
10000176:	c022                	sw	s0,0(sp)
10000178:	bf55                	j	1000012c <log_printf+0x22>
        for(ulIdx = 0; (format[ulIdx] != '%') && (format[ulIdx] != '\0');ulIdx++)
1000017a:	4681                	li	a3,0
1000017c:	02500613          	li	a2,37
10000180:	b7e9                	j	1000014a <log_printf+0x40>
           switch(*format++)
10000182:	f9d70713          	addi	a4,a4,-99
10000186:	0ff77713          	zext.b	a4,a4
1000018a:	465d                	li	a2,23
1000018c:	1ce66763          	bltu	a2,a4,1000035a <log_printf+0x250>
10000190:	10004637          	lui	a2,0x10004
10000194:	070a                	slli	a4,a4,0x2
10000196:	39c60613          	addi	a2,a2,924 # 1000439c <__thead_uwrite8+0x2c4>
1000019a:	9732                	add	a4,a4,a2
1000019c:	4318                	lw	a4,0(a4)
1000019e:	8702                	jr	a4
100001a0:	05800693          	li	a3,88
100001a4:	1ad71b63          	bne	a4,a3,1000035a <log_printf+0x250>
                    ulValue = va_arg(vaArgP, unsigned long);
100001a8:	00478493          	addi	s1,a5,4
100001ac:	439c                	lw	a5,0(a5)
                     HexFormat='x';
100001ae:	c23a                	sw	a4,4(sp)
                    ulNeg = 0;
100001b0:	4601                	li	a2,0
                    ulBase = 16;
100001b2:	4741                	li	a4,16
                        ulValue = -(long)ulValue;
100001b4:	cc3e                	sw	a5,24(sp)
                    for(ulIdx = 1;
100001b6:	4585                	li	a1,1
                        (((ulIdx * ulBase) <= ulValue) &&
100001b8:	02e5b6b3          	mulhu	a3,a1,a4
100001bc:	02e58533          	mul	a0,a1,a4
100001c0:	00d036b3          	snez	a3,a3
100001c4:	00a7e463          	bltu	a5,a0,100001cc <log_printf+0xc2>
100001c8:	10068963          	beqz	a3,100002da <log_printf+0x1d0>
                    if(ulNeg)
100001cc:	4681                	li	a3,0
100001ce:	ce01                	beqz	a2,100001e6 <log_printf+0xdc>
                    if(ulNeg && (cFill == '0'))
100001d0:	03000513          	li	a0,48
                        ulCount--;
100001d4:	147d                	addi	s0,s0,-1
                    if(ulNeg && (cFill == '0'))
100001d6:	00a39863          	bne	t2,a0,100001e6 <log_printf+0xdc>
                        pcBuf[ulPos++] = '-';
100001da:	02d00693          	li	a3,45
100001de:	00d10e23          	sb	a3,28(sp)
100001e2:	86b2                	mv	a3,a2
                        ulNeg = 0;
100001e4:	4601                	li	a2,0
                    if((ulCount > 1) && (ulCount < 16))
100001e6:	ffe40513          	addi	a0,s0,-2
100001ea:	42b5                	li	t0,13
100001ec:	01c10313          	addi	t1,sp,28
100001f0:	00a2ee63          	bltu	t0,a0,1000020c <log_printf+0x102>
                        for(ulCount--; ulCount; ulCount--)
100001f4:	fff40513          	addi	a0,s0,-1
100001f8:	00d302b3          	add	t0,t1,a3
                            pcBuf[ulPos++] = cFill;
100001fc:	00728023          	sb	t2,0(t0)
                        for(ulCount--; ulCount; ulCount--)
10000200:	157d                	addi	a0,a0,-1
10000202:	0285                	addi	t0,t0,1
10000204:	fd65                	bnez	a0,100001fc <log_printf+0xf2>
10000206:	9436                	add	s0,s0,a3
10000208:	fff40693          	addi	a3,s0,-1
                    if(ulNeg)
1000020c:	ca11                	beqz	a2,10000220 <log_printf+0x116>
                        pcBuf[ulPos++] = '-';
1000020e:	0e468613          	addi	a2,a3,228
10000212:	0808                	addi	a0,sp,16
10000214:	962a                	add	a2,a2,a0
10000216:	02d00513          	li	a0,45
1000021a:	f2a60423          	sb	a0,-216(a2)
1000021e:	0685                	addi	a3,a3,1
                        else    pcBuf[ulPos++] = g_pcHex2[(ulValue / ulIdx) % ulBase];//X
10000220:	10004637          	lui	a2,0x10004
10000224:	12860393          	addi	t2,a2,296 # 10004128 <__thead_uwrite8+0x50>
                        if(HexFormat=='x')  pcBuf[ulPos++] = g_pcHex1[(ulValue / ulIdx) % ulBase];//x
10000228:	10004637          	lui	a2,0x10004
1000022c:	07800413          	li	s0,120
10000230:	11460613          	addi	a2,a2,276 # 10004114 <__thead_uwrite8+0x3c>
                    for(; ulIdx; ulIdx /= ulBase)
10000234:	e5d5                	bnez	a1,100002e0 <log_printf+0x1d6>
                    print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)pcBuf, ulPos);
10000236:	861a                	mv	a2,t1
10000238:	a035                	j	10000264 <log_printf+0x15a>
                    if((format[-1] == '0') && (ulCount == 0))
1000023a:	03000613          	li	a2,48
1000023e:	00c71463          	bne	a4,a2,10000246 <log_printf+0x13c>
10000242:	e011                	bnez	s0,10000246 <log_printf+0x13c>
                        cFill = '0';
10000244:	83ba                	mv	t2,a4
                    ulCount *= 10;
10000246:	4629                	li	a2,10
10000248:	02c40633          	mul	a2,s0,a2
1000024c:	fd060613          	addi	a2,a2,-48
                    ulCount += format[-1] - '0';
10000250:	00c70433          	add	s0,a4,a2
        for(ulIdx = 0; (format[ulIdx] != '%') && (format[ulIdx] != '\0');ulIdx++)
10000254:	4602                	lw	a2,0(sp)
10000256:	a8e9                	j	10000330 <log_printf+0x226>
                    ulValue = va_arg(vaArgP, unsigned long);
10000258:	00478493          	addi	s1,a5,4
1000025c:	439c                	lw	a5,0(a5)
                    print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)&ulValue, 1);
1000025e:	4685                	li	a3,1
10000260:	0830                	addi	a2,sp,24
                    ulValue = va_arg(vaArgP, unsigned long);
10000262:	cc3e                	sw	a5,24(sp)
                    print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)pcBuf, ulPos);
10000264:	01310593          	addi	a1,sp,19
10000268:	1068                	addi	a0,sp,44
1000026a:	35a9                	jal	100000b4 <print_string_to_buf>
                    break;
1000026c:	a881                	j	100002bc <log_printf+0x1b2>
                    ulValue = va_arg(vaArgP, unsigned long);
1000026e:	00478493          	addi	s1,a5,4
10000272:	439c                	lw	a5,0(a5)
                    if((long)ulValue < 0)
10000274:	0407db63          	bgez	a5,100002ca <log_printf+0x1c0>
                        ulValue = -(long)ulValue;
10000278:	40f007b3          	neg	a5,a5
                        ulNeg = 1;
1000027c:	4605                	li	a2,1
                    ulBase = 10;
1000027e:	4729                	li	a4,10
10000280:	bf15                	j	100001b4 <log_printf+0xaa>
                    pcStr = va_arg(vaArgP, char *);
10000282:	4390                	lw	a2,0(a5)
10000284:	00478493          	addi	s1,a5,4
                    for(ulIdx = 0; pcStr[ulIdx] != '\0'; ulIdx++)
10000288:	4681                	li	a3,0
1000028a:	00d607b3          	add	a5,a2,a3
1000028e:	0007c783          	lbu	a5,0(a5)
10000292:	e79d                	bnez	a5,100002c0 <log_printf+0x1b6>
                    print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)pcStr, ulIdx);
10000294:	01310593          	addi	a1,sp,19
10000298:	1068                	addi	a0,sp,44
1000029a:	c436                	sw	a3,8(sp)
1000029c:	3d21                	jal	100000b4 <print_string_to_buf>
                    if(ulCount > ulIdx)
1000029e:	46a2                	lw	a3,8(sp)
100002a0:	0086fe63          	bgeu	a3,s0,100002bc <log_printf+0x1b2>
                        ulCount -= ulIdx;
100002a4:	8c15                	sub	s0,s0,a3
                            print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)" ", 1);
100002a6:	10004637          	lui	a2,0x10004
100002aa:	4685                	li	a3,1
100002ac:	11060613          	addi	a2,a2,272 # 10004110 <__thead_uwrite8+0x38>
100002b0:	01310593          	addi	a1,sp,19
100002b4:	1068                	addi	a0,sp,44
100002b6:	147d                	addi	s0,s0,-1
100002b8:	3bf5                	jal	100000b4 <print_string_to_buf>
                        while(ulCount--)
100002ba:	f475                	bnez	s0,100002a6 <log_printf+0x19c>
                        pcBuf[ulPos++] = '-';
100002bc:	87a6                	mv	a5,s1
100002be:	b5bd                	j	1000012c <log_printf+0x22>
                    for(ulIdx = 0; pcStr[ulIdx] != '\0'; ulIdx++)
100002c0:	0685                	addi	a3,a3,1
100002c2:	b7e1                	j	1000028a <log_printf+0x180>
                    ulValue = va_arg(vaArgP, unsigned long);
100002c4:	00478493          	addi	s1,a5,4
100002c8:	439c                	lw	a5,0(a5)
                        ulNeg = 0;
100002ca:	4601                	li	a2,0
100002cc:	bf4d                	j	1000027e <log_printf+0x174>
                    ulValue = va_arg(vaArgP, unsigned long);
100002ce:	00478493          	addi	s1,a5,4
                     HexFormat='x';
100002d2:	07800713          	li	a4,120
                    ulValue = va_arg(vaArgP, unsigned long);
100002d6:	439c                	lw	a5,0(a5)
                     HexFormat='x';
100002d8:	bdd9                	j	100001ae <log_printf+0xa4>
                        ulIdx *= ulBase, ulCount--)
100002da:	147d                	addi	s0,s0,-1
100002dc:	85aa                	mv	a1,a0
100002de:	bde9                	j	100001b8 <log_printf+0xae>
                        if(HexFormat=='x')  pcBuf[ulPos++] = g_pcHex1[(ulValue / ulIdx) % ulBase];//x
100002e0:	02b7d533          	divu	a0,a5,a1
100002e4:	4292                	lw	t0,4(sp)
100002e6:	02e57533          	remu	a0,a0,a4
100002ea:	00829d63          	bne	t0,s0,10000304 <log_printf+0x1fa>
100002ee:	9532                	add	a0,a0,a2
                        else    pcBuf[ulPos++] = g_pcHex2[(ulValue / ulIdx) % ulBase];//X
100002f0:	00054503          	lbu	a0,0(a0)
100002f4:	00d302b3          	add	t0,t1,a3
100002f8:	0685                	addi	a3,a3,1
100002fa:	00a28023          	sb	a0,0(t0)
                    for(; ulIdx; ulIdx /= ulBase)
100002fe:	02e5d5b3          	divu	a1,a1,a4
10000302:	bf0d                	j	10000234 <log_printf+0x12a>
                        else    pcBuf[ulPos++] = g_pcHex2[(ulValue / ulIdx) % ulBase];//X
10000304:	951e                	add	a0,a0,t2
10000306:	b7ed                	j	100002f0 <log_printf+0x1e6>
10000308:	c43e                	sw	a5,8(sp)
                    print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)format - 1, 1);
1000030a:	4685                	li	a3,1
1000030c:	01310593          	addi	a1,sp,19
10000310:	1068                	addi	a0,sp,44
10000312:	334d                	jal	100000b4 <print_string_to_buf>
10000314:	47a2                	lw	a5,8(sp)
                        pcBuf[ulPos++] = '-';
10000316:	84be                	mv	s1,a5
10000318:	b755                	j	100002bc <log_printf+0x1b2>
        if(ulIdx>0)
1000031a:	e40691e3          	bnez	a3,1000015c <log_printf+0x52>
            format++;
1000031e:	00140613          	addi	a2,s0,1
            cFill = ' ';
10000322:	02000393          	li	t2,32
            ulCount = 0;
10000326:	4401                	li	s0,0
           switch(*format++)
10000328:	07a00693          	li	a3,122
1000032c:	06200593          	li	a1,98
10000330:	00160713          	addi	a4,a2,1
10000334:	c03a                	sw	a4,0(sp)
10000336:	00064703          	lbu	a4,0(a2)
1000033a:	02e6e063          	bltu	a3,a4,1000035a <log_printf+0x250>
1000033e:	e4e5e2e3          	bltu	a1,a4,10000182 <log_printf+0x78>
10000342:	03900513          	li	a0,57
10000346:	e4e56de3          	bltu	a0,a4,100001a0 <log_printf+0x96>
1000034a:	02f00513          	li	a0,47
1000034e:	eee566e3          	bltu	a0,a4,1000023a <log_printf+0x130>
10000352:	02500693          	li	a3,37
10000356:	fad709e3          	beq	a4,a3,10000308 <log_printf+0x1fe>
                    print_string_to_buf(uart_tx_buff, &uart_tx_local_ptr, (uint8_t*)"ERROR", 5);
1000035a:	10004637          	lui	a2,0x10004
1000035e:	c43e                	sw	a5,8(sp)
10000360:	4695                	li	a3,5
10000362:	13c60613          	addi	a2,a2,316 # 1000413c <__thead_uwrite8+0x64>
10000366:	b75d                	j	1000030c <log_printf+0x202>

10000368 <ble_connected>:

    ble_set_adv_param(&adv_info);
}

static void ble_connected(struct bt_conn *conn, uint8_t err)
{
10000368:	1161                	addi	sp,sp,-8
1000036a:	c022                	sw	s0,0(sp)
1000036c:	c206                	sw	ra,4(sp)
1000036e:	842a                	mv	s0,a0
    if (err)
10000370:	c591                	beqz	a1,1000037c <ble_connected+0x14>
    {
        log_printf("Connection failed (err 0x%02x)\n", err);
10000372:	10004537          	lui	a0,0x10004
10000376:	14450513          	addi	a0,a0,324 # 10004144 <__thead_uwrite8+0x6c>
1000037a:	3b41                	jal	1000010a <log_printf>
    }
	deft_conn = (uint32_t)conn;
	
    log_printf("Connected successed! (conn->handle 0x%02x)\n", conn->handle);	
1000037c:	00045583          	lhu	a1,0(s0)
}
10000380:	4402                	lw	s0,0(sp)
10000382:	4092                	lw	ra,4(sp)
    log_printf("Connected successed! (conn->handle 0x%02x)\n", conn->handle);	
10000384:	10004537          	lui	a0,0x10004
10000388:	16450513          	addi	a0,a0,356 # 10004164 <__thead_uwrite8+0x8c>
}
1000038c:	0121                	addi	sp,sp,8
    log_printf("Connected successed! (conn->handle 0x%02x)\n", conn->handle);	
1000038e:	bbb5                	j	1000010a <log_printf>

10000390 <ble_param_req>:
#endif
}

static bool ble_param_req(struct bt_conn *conn, struct bt_le_conn_param *param)
{
    log_printf("ble_param_req! (conn->handle 0x%02x)\n", conn->handle);
10000390:	00055583          	lhu	a1,0(a0)
10000394:	10004537          	lui	a0,0x10004
{
10000398:	1171                	addi	sp,sp,-4
    log_printf("ble_param_req! (conn->handle 0x%02x)\n", conn->handle);
1000039a:	19050513          	addi	a0,a0,400 # 10004190 <__thead_uwrite8+0xb8>
{
1000039e:	c006                	sw	ra,0(sp)
    log_printf("ble_param_req! (conn->handle 0x%02x)\n", conn->handle);
100003a0:	33ad                	jal	1000010a <log_printf>
	return 0;
}
100003a2:	4082                	lw	ra,0(sp)
100003a4:	4501                	li	a0,0
100003a6:	0111                	addi	sp,sp,4
100003a8:	8082                	ret

100003aa <ble_param_update>:

static void ble_param_update(struct bt_conn *conn, uint16_t interval, uint16_t latency,
                             uint16_t timeout)
{
    log_printf("ble_param_update! (conn->handle 0x%02x)\n", conn->handle);
100003aa:	00055583          	lhu	a1,0(a0)
100003ae:	10004537          	lui	a0,0x10004
100003b2:	1b850513          	addi	a0,a0,440 # 100041b8 <__thead_uwrite8+0xe0>
100003b6:	bb91                	j	1000010a <log_printf>

100003b8 <ble_phy_update>:
}

static void ble_phy_update(struct bt_conn *conn, struct bt_conn_le_phy_info *param)
{
	log_printf("ble_phy_update! TX_PHY=%x,RX_PHY=%x \n", param->tx_phy,param->rx_phy);
100003b8:	0015c603          	lbu	a2,1(a1)
100003bc:	0005c583          	lbu	a1,0(a1)
100003c0:	10004537          	lui	a0,0x10004
100003c4:	1e450513          	addi	a0,a0,484 # 100041e4 <__thead_uwrite8+0x10c>
100003c8:	b389                	j	1000010a <log_printf>

100003ca <gatt_data_write>:

volatile uint8_t ccc_cfg_enable =0;///< Client Characteristic Configuration (CCC) status flag

static ssize_t  gatt_data_write(struct bt_conn *conn, const struct bt_gatt_attr *attr, const uint8_t *buf, uint16_t len,uint16_t offset, uint8_t flags)
{
	log_printf("gatt_data_write \n");
100003ca:	10004537          	lui	a0,0x10004
{
100003ce:	1141                	addi	sp,sp,-16
	log_printf("gatt_data_write \n");
100003d0:	20c50513          	addi	a0,a0,524 # 1000420c <__thead_uwrite8+0x134>
{
100003d4:	c422                	sw	s0,8(sp)
100003d6:	c226                	sw	s1,4(sp)
100003d8:	c606                	sw	ra,12(sp)
100003da:	84b2                	mv	s1,a2
100003dc:	8436                	mv	s0,a3
	log_printf("gatt_data_write \n");
100003de:	3335                	jal	1000010a <log_printf>
    for(uint8_t i=0;i<len;i++)
100003e0:	4781                	li	a5,0
100003e2:	0087ed63          	bltu	a5,s0,100003fc <gatt_data_write+0x32>
    log_printf("%02x ", buf[i]);
    log_printf("\n ");
100003e6:	10004537          	lui	a0,0x10004
100003ea:	22850513          	addi	a0,a0,552 # 10004228 <__thead_uwrite8+0x150>
100003ee:	3b31                	jal	1000010a <log_printf>
	return len;
}
100003f0:	40b2                	lw	ra,12(sp)
100003f2:	8522                	mv	a0,s0
100003f4:	4422                	lw	s0,8(sp)
100003f6:	4492                	lw	s1,4(sp)
100003f8:	0141                	addi	sp,sp,16
100003fa:	8082                	ret
    log_printf("%02x ", buf[i]);
100003fc:	00f48733          	add	a4,s1,a5
10000400:	00074583          	lbu	a1,0(a4)
10000404:	10004537          	lui	a0,0x10004
10000408:	22050513          	addi	a0,a0,544 # 10004220 <__thead_uwrite8+0x148>
1000040c:	c03e                	sw	a5,0(sp)
1000040e:	39f5                	jal	1000010a <log_printf>
    for(uint8_t i=0;i<len;i++)
10000410:	4782                	lw	a5,0(sp)
10000412:	0785                	addi	a5,a5,1
10000414:	0ff7f793          	zext.b	a5,a5
10000418:	b7e9                	j	100003e2 <gatt_data_write+0x18>

1000041a <svc_ccc_cfg_changed>:
    return bt_gatt_attr_read(conn, attr, buf, len, offset, read_data,20 );//sizeof(read_data)
}

static void svc_ccc_cfg_changed(const struct bt_gatt_attr *attr, uint16_t value)
{
	ccc_cfg_enable = value;
1000041a:	200027b7          	lui	a5,0x20002
1000041e:	0ff5f593          	zext.b	a1,a1
10000422:	1a078793          	addi	a5,a5,416 # 200021a0 <wdalignbuf>
10000426:	02b78023          	sb	a1,32(a5)
	log_printf("ccc_cfg_enable :%d \n",ccc_cfg_enable);
1000042a:	0207c583          	lbu	a1,32(a5)
1000042e:	10004537          	lui	a0,0x10004
10000432:	22c50513          	addi	a0,a0,556 # 1000422c <__thead_uwrite8+0x154>
10000436:	b9d1                	j	1000010a <log_printf>

10000438 <ble_disconnected>:
    log_printf("Disconnection reason (err 0x%02x)\n", reason);
10000438:	10004537          	lui	a0,0x10004
{
1000043c:	1171                	addi	sp,sp,-4
    log_printf("Disconnection reason (err 0x%02x)\n", reason);
1000043e:	24450513          	addi	a0,a0,580 # 10004244 <__thead_uwrite8+0x16c>
{
10000442:	c006                	sw	ra,0(sp)
    log_printf("Disconnection reason (err 0x%02x)\n", reason);
10000444:	31d9                	jal	1000010a <log_printf>
}
10000446:	4082                	lw	ra,0(sp)
10000448:	0111                	addi	sp,sp,4
    ble_adv_enable();
1000044a:	0220106f          	j	1000146c <ble_adv_enable>

1000044e <ble_periph_init>:
 * - BLE_FOTA_EN: OTA service initialization
 * - BLE_MODE_SEL: Stack version selection
 */
void ble_periph_init(int err)
{
    if (err)
1000044e:	c519                	beqz	a0,1000045c <ble_periph_init+0xe>
10000450:	85aa                	mv	a1,a0
    {
        log_printf("Bluetooth init failed (err %d)\n", err);
10000452:	10004537          	lui	a0,0x10004
10000456:	26850513          	addi	a0,a0,616 # 10004268 <__thead_uwrite8+0x190>
1000045a:	b945                	j	1000010a <log_printf>
{
1000045c:	1101                	addi	sp,sp,-32
1000045e:	ce06                	sw	ra,28(sp)
10000460:	cc22                	sw	s0,24(sp)
        return;
    }

	bt_gatt_init();
10000462:	f0007097          	auipc	ra,0xf0007
10000466:	2b2080e7          	jalr	690(ra) # 7714 <bt_gatt_init>
);


void ble_user_service_init(void)
{
	log_printf("ble_user_service_init \n");
1000046a:	10004537          	lui	a0,0x10004
1000046e:	28850513          	addi	a0,a0,648 # 10004288 <__thead_uwrite8+0x1b0>
    ble_user_service_add(&user_ble_service);
10000472:	10004437          	lui	s0,0x10004
	log_printf("ble_user_service_init \n");
10000476:	3951                	jal	1000010a <log_printf>
    ble_user_service_add(&user_ble_service);
10000478:	41840413          	addi	s0,s0,1048 # 10004418 <user_ble_service>
1000047c:	8522                	mv	a0,s0
1000047e:	026010ef          	jal	100014a4 <ble_user_service_add>
);
					   

void ble_ota_service_init(void)
{
    ble_user_service_add(&user_ble_ota_service);
10000482:	00840513          	addi	a0,s0,8
10000486:	01e010ef          	jal	100014a4 <ble_user_service_add>
	
#if(BLE_FOTA_EN)
	ble_ota_service_init();
#endif

    ble_event_callback(&ble_conn_callbacks);
1000048a:	20001537          	lui	a0,0x20001
1000048e:	a0050513          	addi	a0,a0,-1536 # 20000a00 <ble_conn_callbacks>
10000492:	090010ef          	jal	10001522 <ble_event_callback>

	ll_adv_reset();
10000496:	f0002097          	auipc	ra,0xf0002
1000049a:	19c080e7          	jalr	412(ra) # 2632 <ll_adv_reset>
    uint8_t  new_addr[] = {0x34, 0xC3, 0xE2, 0xD8, 0x55, 0x20};
1000049e:	d8e2c7b7          	lui	a5,0xd8e2c
100004a2:	33478793          	addi	a5,a5,820 # d8e2c334 <__StackTop+0xb8e28334>
100004a6:	c03e                	sw	a5,0(sp)
100004a8:	6789                	lui	a5,0x2
100004aa:	05578793          	addi	a5,a5,85 # 2055 <aes_encrypt+0x17>
    ble_set_adv_addr(new_addr);
100004ae:	850a                	mv	a0,sp
    uint8_t  new_addr[] = {0x34, 0xC3, 0xE2, 0xD8, 0x55, 0x20};
100004b0:	00f11223          	sh	a5,4(sp)
    ble_set_adv_addr(new_addr);
100004b4:	769000ef          	jal	1000141c <ble_set_adv_addr>
    ble_set_adv_data(adv_data,ARRAY_SIZE(adv_data));
100004b8:	01040513          	addi	a0,s0,16
100004bc:	4589                	li	a1,2
100004be:	7c3000ef          	jal	10001480 <ble_set_adv_data>
    ble_set_scan_rsp_data(scan_rsp_data,ARRAY_SIZE(scan_rsp_data));
100004c2:	458d                	li	a1,3
100004c4:	02040513          	addi	a0,s0,32
100004c8:	7cb000ef          	jal	10001492 <ble_set_scan_rsp_data>
    adv_info.min_interval = ADV_MIN_INTVL;
100004cc:	00a007b7          	lui	a5,0xa00
100004d0:	0a078793          	addi	a5,a5,160 # a000a0 <__FLASH_SIZE+0x9c00a0>
    ble_set_adv_param(&adv_info);
100004d4:	0028                	addi	a0,sp,8
    memset(&adv_info,0,sizeof(adv_info));
100004d6:	00011a23          	sh	zero,20(sp)
    adv_info.min_interval = ADV_MIN_INTVL;
100004da:	c43e                	sw	a5,8(sp)
    adv_info.channel_map = BT_LE_ADV_CHAN_MAP_ALL;
100004dc:	479d                	li	a5,7
100004de:	00f10aa3          	sb	a5,21(sp)
    memset(&adv_info,0,sizeof(adv_info));
100004e2:	c602                	sw	zero,12(sp)
100004e4:	c802                	sw	zero,16(sp)
100004e6:	00010b23          	sb	zero,22(sp)
    ble_set_adv_param(&adv_info);
100004ea:	73f000ef          	jal	10001428 <ble_set_adv_param>
    
    ble_adv_param_init();

	
    ble_adv_enable();
100004ee:	77f000ef          	jal	1000146c <ble_adv_enable>

    log_printf("Advertising successfully started!\n");
100004f2:	10004537          	lui	a0,0x10004
100004f6:	2a050513          	addi	a0,a0,672 # 100042a0 <__thead_uwrite8+0x1c8>
100004fa:	3901                	jal	1000010a <log_printf>
}
100004fc:	40f2                	lw	ra,28(sp)
100004fe:	4462                	lw	s0,24(sp)
10000500:	6105                	addi	sp,sp,32
10000502:	8082                	ret

10000504 <ota_data_send>:
{
10000504:	fdc10113          	addi	sp,sp,-36
10000508:	ce22                	sw	s0,28(sp)
1000050a:	842e                	mv	s0,a1
    uint8_t read_data[]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
1000050c:	100045b7          	lui	a1,0x10004
{
10000510:	cc26                	sw	s1,24(sp)
10000512:	c22a                	sw	a0,4(sp)
10000514:	84b2                	mv	s1,a2
    uint8_t read_data[]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
10000516:	45058593          	addi	a1,a1,1104 # 10004450 <scan_rsp_data+0x18>
1000051a:	461d                	li	a2,7
1000051c:	0808                	addi	a0,sp,16
{
1000051e:	d006                	sw	ra,32(sp)
10000520:	c636                	sw	a3,12(sp)
10000522:	c43a                	sw	a4,8(sp)
    uint8_t read_data[]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
10000524:	f000c097          	auipc	ra,0xf000c
10000528:	490080e7          	jalr	1168(ra) # c9b4 <memcpy>
	log_printf("gatt_data_read \n");
1000052c:	10004537          	lui	a0,0x10004
10000530:	2c450513          	addi	a0,a0,708 # 100042c4 <__thead_uwrite8+0x1ec>
10000534:	3ed9                	jal	1000010a <log_printf>
    return bt_gatt_attr_read(conn, attr, buf, len, offset, read_data, sizeof(read_data));
10000536:	4722                	lw	a4,8(sp)
10000538:	46b2                	lw	a3,12(sp)
1000053a:	4512                	lw	a0,4(sp)
1000053c:	461d                	li	a2,7
1000053e:	c032                	sw	a2,0(sp)
10000540:	081c                	addi	a5,sp,16
10000542:	8626                	mv	a2,s1
10000544:	85a2                	mv	a1,s0
10000546:	f0007097          	auipc	ra,0xf0007
1000054a:	240080e7          	jalr	576(ra) # 7786 <bt_gatt_attr_read>
}
1000054e:	5082                	lw	ra,32(sp)
10000550:	4472                	lw	s0,28(sp)
10000552:	44e2                	lw	s1,24(sp)
10000554:	02410113          	addi	sp,sp,36
10000558:	8082                	ret

1000055a <ota_svc_data_send>:
    ota_svc_indication(cn_hdl, (void *)&integrity_check_rsp, sizeof(integrity_check_rsp));
}

static ssize_t ota_svc_data_send(struct bt_conn *conn, const struct bt_gatt_attr *attr, void *buf,
                         uint16_t len, uint16_t offset)
{
1000055a:	1161                	addi	sp,sp,-8
    return bt_gatt_attr_read(conn, attr, buf, len, offset, ota_params.ack, OTA_ACK_BUF_LENGTH_MAX);
1000055c:	47ed                	li	a5,27
1000055e:	c03e                	sw	a5,0(sp)
10000560:	200027b7          	lui	a5,0x20002
10000564:	23c78793          	addi	a5,a5,572 # 2000223c <ota_params+0x78>
{
10000568:	c206                	sw	ra,4(sp)
    return bt_gatt_attr_read(conn, attr, buf, len, offset, ota_params.ack, OTA_ACK_BUF_LENGTH_MAX);
1000056a:	f0007097          	auipc	ra,0xf0007
1000056e:	21c080e7          	jalr	540(ra) # 7786 <bt_gatt_attr_read>
}
10000572:	4092                	lw	ra,4(sp)
10000574:	0121                	addi	sp,sp,8
10000576:	8082                	ret

10000578 <gatt_data_read>:
    uint8_t read_data[256]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
10000578:	030207b7          	lui	a5,0x3020
{
1000057c:	ee410113          	addi	sp,sp,-284
    uint8_t read_data[256]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
10000580:	10078793          	addi	a5,a5,256 # 3020100 <__FLASH_SIZE+0x2fe0100>
10000584:	c83e                	sw	a5,16(sp)
10000586:	000607b7          	lui	a5,0x60
1000058a:	50478793          	addi	a5,a5,1284 # 60504 <__FLASH_SIZE+0x20504>
{
1000058e:	10812a23          	sw	s0,276(sp)
10000592:	10912823          	sw	s1,272(sp)
10000596:	c22a                	sw	a0,4(sp)
10000598:	842e                	mv	s0,a1
1000059a:	84b2                	mv	s1,a2
    uint8_t read_data[256]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
1000059c:	4581                	li	a1,0
1000059e:	0f800613          	li	a2,248
100005a2:	0828                	addi	a0,sp,24
{
100005a4:	c436                	sw	a3,8(sp)
100005a6:	c63a                	sw	a4,12(sp)
    uint8_t read_data[256]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
100005a8:	ca3e                	sw	a5,20(sp)
{
100005aa:	10112c23          	sw	ra,280(sp)
    uint8_t read_data[256]={0x0,0x1,0x2,0x3,0x4,0x5,0x6};//"CP8000 TEST Data";
100005ae:	f000c097          	auipc	ra,0xf000c
100005b2:	41e080e7          	jalr	1054(ra) # c9cc <memset>
100005b6:	4701                	li	a4,0
	read_data[i] = i;	
100005b8:	081c                	addi	a5,sp,16
	for(uint8_t i= 0;i<255;i++)
100005ba:	0ff00693          	li	a3,255
	read_data[i] = i;	
100005be:	00e78633          	add	a2,a5,a4
100005c2:	00e60023          	sb	a4,0(a2)
	for(uint8_t i= 0;i<255;i++)
100005c6:	0705                	addi	a4,a4,1
100005c8:	fed71be3          	bne	a4,a3,100005be <gatt_data_read+0x46>
	log_printf("gatt_data_read \n");
100005cc:	10004537          	lui	a0,0x10004
100005d0:	2c450513          	addi	a0,a0,708 # 100042c4 <__thead_uwrite8+0x1ec>
100005d4:	3e1d                	jal	1000010a <log_printf>
    return bt_gatt_attr_read(conn, attr, buf, len, offset, read_data,20 );//sizeof(read_data)
100005d6:	4751                	li	a4,20
100005d8:	c03a                	sw	a4,0(sp)
100005da:	46a2                	lw	a3,8(sp)
100005dc:	4732                	lw	a4,12(sp)
100005de:	4512                	lw	a0,4(sp)
100005e0:	081c                	addi	a5,sp,16
100005e2:	8626                	mv	a2,s1
100005e4:	85a2                	mv	a1,s0
100005e6:	f0007097          	auipc	ra,0xf0007
100005ea:	1a0080e7          	jalr	416(ra) # 7786 <bt_gatt_attr_read>
}
100005ee:	11812083          	lw	ra,280(sp)
100005f2:	11412403          	lw	s0,276(sp)
100005f6:	11012483          	lw	s1,272(sp)
100005fa:	11c10113          	addi	sp,sp,284
100005fe:	8082                	ret

10000600 <ota_svc_data_rcv>:
 * 2. Perform full page writes when possible
 * 3. Maintain write acknowledgment bitmap
 */
static ssize_t ota_svc_data_rcv(struct bt_conn *conn, const struct bt_gatt_attr *attr, const void *buf,
                       uint16_t length, uint16_t offset, uint8_t flags)
{
10000600:	fd810113          	addi	sp,sp,-40
10000604:	d022                	sw	s0,32(sp)
    uint16_t len;
//    log_printf("data recv \n");
//    for(uint8_t i =0;i<length;i++)
//    log_printf("%x ",ptr->data[i]);
//    log_printf(" \n");
    if(ptr->segment_id == CEILING(FLASH_SS, ota_params.segment_data_max_length) - 1)
10000606:	20002437          	lui	s0,0x20002
1000060a:	1a040413          	addi	s0,s0,416 # 200021a0 <wdalignbuf>
1000060e:	09445703          	lhu	a4,148(s0)
10000612:	6505                	lui	a0,0x1
10000614:	fff50793          	addi	a5,a0,-1 # fff <__STACK_SIZE+0xbff>
10000618:	97ba                	add	a5,a5,a4
1000061a:	02e7c7b3          	div	a5,a5,a4
{
1000061e:	d206                	sw	ra,36(sp)
10000620:	ce26                	sw	s1,28(sp)
10000622:	c436                	sw	a3,8(sp)
    if(ptr->segment_id == CEILING(FLASH_SS, ota_params.segment_data_max_length) - 1)
10000624:	00064683          	lbu	a3,0(a2)
{
10000628:	c232                	sw	a2,4(sp)
    if(ptr->segment_id == CEILING(FLASH_SS, ota_params.segment_data_max_length) - 1)
1000062a:	85ba                	mv	a1,a4
1000062c:	863a                	mv	a2,a4
1000062e:	17fd                	addi	a5,a5,-1
10000630:	00f69963          	bne	a3,a5,10000642 <ota_svc_data_rcv+0x42>
    {
        len = FLASH_SS % ota_params.segment_data_max_length ? FLASH_SS % ota_params.segment_data_max_length : ota_params.segment_data_max_length;
10000634:	02e56633          	rem	a2,a0,a4
10000638:	10060163          	beqz	a2,1000073a <ota_svc_data_rcv+0x13a>
1000063c:	01061713          	slli	a4,a2,0x10
10000640:	8341                	srli	a4,a4,0x10
    {
        len = ota_params.segment_data_max_length;
    }

    uint8_t *data_ptr = ptr->data;
    uint32_t start_addr = ota_params.new_image.base + ota_params.current_sector * FLASH_SS + ptr->segment_id * ota_params.segment_data_max_length;
10000642:	02b686b3          	mul	a3,a3,a1
    uint8_t *data_ptr = ptr->data;
10000646:	4792                	lw	a5,4(sp)
    uint32_t start_addr = ota_params.new_image.base + ota_params.current_sector * FLASH_SS + ptr->segment_id * ota_params.segment_data_max_length;
10000648:	08842503          	lw	a0,136(s0)

    uint32_t end_addr = start_addr + len;
1000064c:	ca3a                	sw	a4,20(sp)
    uint8_t *data_ptr = ptr->data;
1000064e:	0785                	addi	a5,a5,1
10000650:	c03e                	sw	a5,0(sp)
    uint32_t start_addr = ota_params.new_image.base + ota_params.current_sector * FLASH_SS + ptr->segment_id * ota_params.segment_data_max_length;
10000652:	09845783          	lhu	a5,152(s0)
10000656:	07b2                	slli	a5,a5,0xc
10000658:	97aa                	add	a5,a5,a0
1000065a:	00d784b3          	add	s1,a5,a3
    uint32_t page_aligned_addr = (start_addr + FLASH_PS) & ~(FLASH_PS - 1);
1000065e:	10048313          	addi	t1,s1,256
    uint16_t pro_len;
    log_printf("start_addr :%x ,%d\n",start_addr,len);
10000662:	10004537          	lui	a0,0x10004
    uint32_t end_addr = start_addr + len;
10000666:	009706b3          	add	a3,a4,s1
    uint32_t page_aligned_addr = (start_addr + FLASH_PS) & ~(FLASH_PS - 1);
1000066a:	f0037313          	andi	t1,t1,-256
    log_printf("start_addr :%x ,%d\n",start_addr,len);
1000066e:	85a6                	mv	a1,s1
10000670:	2d850513          	addi	a0,a0,728 # 100042d8 <__thead_uwrite8+0x200>
    uint32_t end_addr = start_addr + len;
10000674:	c836                	sw	a3,16(sp)
    uint32_t page_aligned_addr = (start_addr + FLASH_PS) & ~(FLASH_PS - 1);
10000676:	c61a                	sw	t1,12(sp)
    log_printf("start_addr :%x ,%d\n",start_addr,len);
10000678:	3c49                	jal	1000010a <log_printf>
   
    if (end_addr > page_aligned_addr)
1000067a:	4332                	lw	t1,12(sp)
1000067c:	46c2                	lw	a3,16(sp)
1000067e:	4752                	lw	a4,20(sp)
10000680:	0cd37e63          	bgeu	t1,a3,1000075c <ota_svc_data_rcv+0x15c>
    {
        pro_len = page_aligned_addr - start_addr;
10000684:	01049293          	slli	t0,s1,0x10
10000688:	0342                	slli	t1,t1,0x10
1000068a:	01035313          	srli	t1,t1,0x10
1000068e:	0102d293          	srli	t0,t0,0x10
10000692:	405306b3          	sub	a3,t1,t0

        flash_write(start_addr, data_ptr, pro_len);
10000696:	4582                	lw	a1,0(sp)
10000698:	01069613          	slli	a2,a3,0x10
1000069c:	8241                	srli	a2,a2,0x10
1000069e:	8526                	mv	a0,s1
100006a0:	cc3a                	sw	a4,24(sp)
        pro_len = page_aligned_addr - start_addr;
100006a2:	ca16                	sw	t0,20(sp)
100006a4:	c81a                	sw	t1,16(sp)
        flash_write(start_addr, data_ptr, pro_len);
100006a6:	c632                	sw	a2,12(sp)
100006a8:	10001097          	auipc	ra,0x10001
100006ac:	ace080e7          	jalr	-1330(ra) # 20001176 <flash_write>
        start_addr += pro_len;
100006b0:	4632                	lw	a2,12(sp)
        data_ptr += pro_len;
100006b2:	4702                	lw	a4,0(sp)
        len -= pro_len;
100006b4:	4342                	lw	t1,16(sp)
100006b6:	42d2                	lw	t0,20(sp)
        data_ptr += pro_len;
100006b8:	00c706b3          	add	a3,a4,a2
        len -= pro_len;
100006bc:	4762                	lw	a4,24(sp)
        start_addr += pro_len;
100006be:	009607b3          	add	a5,a2,s1
        len -= pro_len;
100006c2:	406284b3          	sub	s1,t0,t1
100006c6:	94ba                	add	s1,s1,a4
100006c8:	04c2                	slli	s1,s1,0x10
100006ca:	80c1                	srli	s1,s1,0x10
        start_addr += pro_len;
100006cc:	853e                	mv	a0,a5
100006ce:	00f48733          	add	a4,s1,a5
        while (len >= FLASH_PS)
100006d2:	8f09                	sub	a4,a4,a0
100006d4:	0742                	slli	a4,a4,0x10
100006d6:	40f685b3          	sub	a1,a3,a5
100006da:	8341                	srli	a4,a4,0x10
100006dc:	0ff00613          	li	a2,255
100006e0:	95aa                	add	a1,a1,a0
100006e2:	04e66e63          	bltu	a2,a4,1000073e <ota_svc_data_rcv+0x13e>
100006e6:	0084d513          	srli	a0,s1,0x8
100006ea:	f0000713          	li	a4,-256
100006ee:	02e50733          	mul	a4,a0,a4
100006f2:	00e48633          	add	a2,s1,a4
100006f6:	0642                	slli	a2,a2,0x10
100006f8:	8241                	srli	a2,a2,0x10
            flash_write(start_addr, data_ptr, FLASH_PS);
            start_addr += FLASH_PS;
            data_ptr += FLASH_PS;
            len -= FLASH_PS;
        }
        if (len > 0)
100006fa:	ca09                	beqz	a2,1000070c <ota_svc_data_rcv+0x10c>
100006fc:	0522                	slli	a0,a0,0x8
        {
            flash_write(start_addr, data_ptr, len);
100006fe:	00a685b3          	add	a1,a3,a0
10000702:	953e                	add	a0,a0,a5
        }
    }
    else
    {
        flash_write(start_addr, data_ptr, len);
10000704:	10001097          	auipc	ra,0x10001
10000708:	a72080e7          	jalr	-1422(ra) # 20001176 <flash_write>
    }

        
    ota_params.ack[ptr->segment_id/8] |= 1 << ptr->segment_id % 8;
1000070c:	4792                	lw	a5,4(sp)

    return length;
}
1000070e:	4522                	lw	a0,8(sp)
    ota_params.ack[ptr->segment_id/8] |= 1 << ptr->segment_id % 8;
10000710:	0007c783          	lbu	a5,0(a5)
10000714:	0037d713          	srli	a4,a5,0x3
10000718:	943a                	add	s0,s0,a4
1000071a:	0077f713          	andi	a4,a5,7
1000071e:	4785                	li	a5,1
10000720:	00e797b3          	sll	a5,a5,a4
10000724:	09c44703          	lbu	a4,156(s0)
10000728:	8fd9                	or	a5,a5,a4
1000072a:	08f40e23          	sb	a5,156(s0)
}
1000072e:	5092                	lw	ra,36(sp)
10000730:	5402                	lw	s0,32(sp)
10000732:	44f2                	lw	s1,28(sp)
10000734:	02810113          	addi	sp,sp,40
10000738:	8082                	ret
1000073a:	863a                	mv	a2,a4
1000073c:	b719                	j	10000642 <ota_svc_data_rcv+0x42>
            flash_write(start_addr, data_ptr, FLASH_PS);
1000073e:	10000613          	li	a2,256
10000742:	c836                	sw	a3,16(sp)
10000744:	c63e                	sw	a5,12(sp)
10000746:	c02a                	sw	a0,0(sp)
10000748:	10001097          	auipc	ra,0x10001
1000074c:	a2e080e7          	jalr	-1490(ra) # 20001176 <flash_write>
            start_addr += FLASH_PS;
10000750:	4502                	lw	a0,0(sp)
10000752:	46c2                	lw	a3,16(sp)
10000754:	47b2                	lw	a5,12(sp)
10000756:	10050513          	addi	a0,a0,256
            len -= FLASH_PS;
1000075a:	bf95                	j	100006ce <ota_svc_data_rcv+0xce>
        flash_write(start_addr, data_ptr, len);
1000075c:	4582                	lw	a1,0(sp)
1000075e:	863a                	mv	a2,a4
10000760:	8526                	mv	a0,s1
10000762:	b74d                	j	10000704 <ota_svc_data_rcv+0x104>

10000764 <ota_svc_indication.constprop.0>:
static void ota_svc_indication(struct bt_conn * cn_hdl, uint8_t *data, uint16_t len)
10000764:	fdc10113          	addi	sp,sp,-36
10000768:	ce22                	sw	s0,28(sp)
1000076a:	cc26                	sw	s1,24(sp)
1000076c:	842a                	mv	s0,a0
1000076e:	84ae                	mv	s1,a1
    memset(&params, 0, sizeof(params));
10000770:	4661                	li	a2,24
10000772:	4581                	li	a1,0
10000774:	850a                	mv	a0,sp
static void ota_svc_indication(struct bt_conn * cn_hdl, uint8_t *data, uint16_t len)
10000776:	d006                	sw	ra,32(sp)
    memset(&params, 0, sizeof(params));
10000778:	f000c097          	auipc	ra,0xf000c
1000077c:	254080e7          	jalr	596(ra) # c9cc <memset>
    params.attr = &user_ble_ota_service.attrs[3];
10000780:	100047b7          	lui	a5,0x10004
10000784:	49478793          	addi	a5,a5,1172 # 10004494 <attr_user_ble_ota_service+0x3c>
10000788:	c23e                	sw	a5,4(sp)
    bt_gatt_indicate(cn_hdl, &params);
1000078a:	858a                	mv	a1,sp
    params.len  = len;
1000078c:	47c9                	li	a5,18
    bt_gatt_indicate(cn_hdl, &params);
1000078e:	8522                	mv	a0,s0
    params.data = data;
10000790:	c826                	sw	s1,16(sp)
    params.len  = len;
10000792:	00f11a23          	sh	a5,20(sp)
    bt_gatt_indicate(cn_hdl, &params);
10000796:	f0007097          	auipc	ra,0xf0007
1000079a:	5b8080e7          	jalr	1464(ra) # 7d4e <bt_gatt_indicate>
    transaction_id++;
1000079e:	200027b7          	lui	a5,0x20002
100007a2:	1a078793          	addi	a5,a5,416 # 200021a0 <wdalignbuf>
100007a6:	0bc7d703          	lhu	a4,188(a5)
}
100007aa:	5082                	lw	ra,32(sp)
100007ac:	4472                	lw	s0,28(sp)
    transaction_id++;
100007ae:	0705                	addi	a4,a4,1
100007b0:	0ae79e23          	sh	a4,188(a5)
}
100007b4:	44e2                	lw	s1,24(sp)
100007b6:	02410113          	addi	sp,sp,36
100007ba:	8082                	ret

100007bc <ota_svc_ctrl_rcv>:
{
100007bc:	fcc10113          	addi	sp,sp,-52
100007c0:	d622                	sw	s0,44(sp)
100007c2:	d426                	sw	s1,40(sp)
100007c4:	d806                	sw	ra,48(sp)
	log_printf("OTA CMD %x \n ",ctrl->type);
100007c6:	00064583          	lbu	a1,0(a2)
{
100007ca:	c02a                	sw	a0,0(sp)
	log_printf("OTA CMD %x \n ",ctrl->type);
100007cc:	10004537          	lui	a0,0x10004
100007d0:	2ec50513          	addi	a0,a0,748 # 100042ec <__thead_uwrite8+0x214>
{
100007d4:	84b2                	mv	s1,a2
100007d6:	c236                	sw	a3,4(sp)
	for(uint8_t i =0;i<len;i++)
100007d8:	4401                	li	s0,0
	log_printf("OTA CMD %x \n ",ctrl->type);
100007da:	3a05                	jal	1000010a <log_printf>
	for(uint8_t i =0;i<len;i++)
100007dc:	4792                	lw	a5,4(sp)
100007de:	02f46763          	bltu	s0,a5,1000080c <ota_svc_ctrl_rcv+0x50>
	log_printf(" \n ");
100007e2:	10004537          	lui	a0,0x10004
100007e6:	30050513          	addi	a0,a0,768 # 10004300 <__thead_uwrite8+0x228>
100007ea:	3205                	jal	1000010a <log_printf>
    switch((ctrl->type&0xFF))
100007ec:	0004c703          	lbu	a4,0(s1)
100007f0:	4699                	li	a3,6
100007f2:	177d                	addi	a4,a4,-1
100007f4:	0ff77713          	zext.b	a4,a4
100007f8:	04e6ec63          	bltu	a3,a4,10000850 <ota_svc_ctrl_rcv+0x94>
100007fc:	100046b7          	lui	a3,0x10004
10000800:	070a                	slli	a4,a4,0x2
10000802:	3fc68693          	addi	a3,a3,1020 # 100043fc <__thead_uwrite8+0x324>
10000806:	9736                	add	a4,a4,a3
10000808:	4318                	lw	a4,0(a4)
1000080a:	8702                	jr	a4
	log_printf("%x ",tmp_data_buf[i]);
1000080c:	008486b3          	add	a3,s1,s0
10000810:	0006c583          	lbu	a1,0(a3)
10000814:	10004537          	lui	a0,0x10004
10000818:	2fc50513          	addi	a0,a0,764 # 100042fc <__thead_uwrite8+0x224>
1000081c:	30fd                	jal	1000010a <log_printf>
	for(uint8_t i =0;i<len;i++)
1000081e:	00140713          	addi	a4,s0,1
10000822:	0ff77413          	zext.b	s0,a4
10000826:	bf5d                	j	100007dc <ota_svc_ctrl_rcv+0x20>
            if(ctrl->u.signature.idx)
10000828:	0014c703          	lbu	a4,1(s1)
1000082c:	20002437          	lui	s0,0x20002
10000830:	1a040413          	addi	s0,s0,416 # 200021a0 <wdalignbuf>
10000834:	00248593          	addi	a1,s1,2
                memcpy(&ota_params.digest.data[0],ctrl->u.digest.data,OTA_DIGEST_CMD_DATA_LENGTH);
10000838:	4641                	li	a2,16
1000083a:	06540513          	addi	a0,s0,101
            if(ctrl->u.signature.idx)
1000083e:	e319                	bnez	a4,10000844 <ota_svc_ctrl_rcv+0x88>
                memcpy(&ota_params.signature.data[0],ctrl->u.signature.data,OTA_SIGNATURE_CMD_DATA_LENGTH);
10000840:	02540513          	addi	a0,s0,37
10000844:	f000c097          	auipc	ra,0xf000c
10000848:	170080e7          	jalr	368(ra) # c9b4 <memcpy>
    ota_params.state = state;
1000084c:	02040223          	sb	zero,36(s0)
    uint8_t cfm_status = len;
10000850:	00414503          	lbu	a0,4(sp)
}
10000854:	50c2                	lw	ra,48(sp)
10000856:	5432                	lw	s0,44(sp)
10000858:	54a2                	lw	s1,40(sp)
1000085a:	03410113          	addi	sp,sp,52
1000085e:	8082                	ret
    return ota_params.state;
10000860:	20002737          	lui	a4,0x20002
10000864:	1a070413          	addi	s0,a4,416 # 200021a0 <wdalignbuf>
            if(ota_svc_state_get()==OTA_IDLE)
10000868:	02444603          	lbu	a2,36(s0)
1000086c:	4685                	li	a3,1
                cfm_status = OTA_CFM_STATUS_BUSY;
1000086e:	8536                	mv	a0,a3
            if(ota_svc_state_get()==OTA_IDLE)
10000870:	f275                	bnez	a2,10000854 <ota_svc_ctrl_rcv+0x98>
                ota_params.con_hdl = conn;
10000872:	4782                	lw	a5,0(sp)
    ota_params.state = state;
10000874:	02d40223          	sb	a3,36(s0)
                ota_params.new_image.base = OTA_IMAGE_STORE_BASE_ADDR;//ctrl->u.start_req.new_image_base;//
10000878:	1001f6b7          	lui	a3,0x1001f
1000087c:	08d42423          	sw	a3,136(s0)
                ota_params.new_image.size = ctrl->u.start_req.new_image_size;
10000880:	00548513          	addi	a0,s1,5
                ota_params.con_hdl = conn;
10000884:	0af42c23          	sw	a5,184(s0)
                ota_params.new_image.size = ctrl->u.start_req.new_image_size;
10000888:	7da030ef          	jal	10004062 <__thead_uread4>
1000088c:	08a42623          	sw	a0,140(s0)
                ota_params.segment_data_max_length = ctrl->u.start_req.segment_data_max_length;
10000890:	00a4c583          	lbu	a1,10(s1)
10000894:	0094c603          	lbu	a2,9(s1)
                ota_params.new_image.size = ctrl->u.start_req.new_image_size;
10000898:	86aa                	mv	a3,a0
                ota_params.segment_data_max_length = ctrl->u.start_req.segment_data_max_length;
1000089a:	05a2                	slli	a1,a1,0x8
1000089c:	8dd1                	or	a1,a1,a2
1000089e:	08b41a23          	sh	a1,148(s0)
    uint32_t size = ota_params.new_image.size;
100008a2:	84aa                	mv	s1,a0
    while(size)
100008a4:	c085                	beqz	s1,100008c4 <ota_svc_ctrl_rcv+0x108>
        flash_sector_erase(offset);
100008a6:	1001f537          	lui	a0,0x1001f
100008aa:	9536                	add	a0,a0,a3
100008ac:	8d05                	sub	a0,a0,s1
100008ae:	c62e                	sw	a1,12(sp)
100008b0:	c436                	sw	a3,8(sp)
100008b2:	10000097          	auipc	ra,0x10000
100008b6:	6fa080e7          	jalr	1786(ra) # 20000fac <flash_sector_erase>
        if(size > FLASH_SS)
100008ba:	6605                	lui	a2,0x1
100008bc:	46a2                	lw	a3,8(sp)
100008be:	45b2                	lw	a1,12(sp)
100008c0:	04966063          	bltu	a2,s1,10000900 <ota_svc_ctrl_rcv+0x144>
				log_printf("segment_data_max_length:%d \n",ota_params.segment_data_max_length);
100008c4:	10004537          	lui	a0,0x10004
100008c8:	30450513          	addi	a0,a0,772 # 10004304 <__thead_uwrite8+0x22c>
100008cc:	83fff0ef          	jal	1000010a <log_printf>
                log_printf("base addr:%x  size:%d\n",ota_params.new_image.base,ota_params.new_image.size);
100008d0:	08c42603          	lw	a2,140(s0)
100008d4:	08842583          	lw	a1,136(s0)
100008d8:	10004537          	lui	a0,0x10004
100008dc:	32450513          	addi	a0,a0,804 # 10004324 <__thead_uwrite8+0x24c>
100008e0:	82bff0ef          	jal	1000010a <log_printf>
                log_printf("start req status:%d \n",status);
100008e4:	10004537          	lui	a0,0x10004
100008e8:	4581                	li	a1,0
100008ea:	33c50513          	addi	a0,a0,828 # 1000433c <__thead_uwrite8+0x264>
100008ee:	81dff0ef          	jal	1000010a <log_printf>
    start_rsp.type = OTA_START_RSP;
100008f2:	478d                	li	a5,3
    ota_svc_indication(cn_hdl, (void *)&integrity_check_rsp, sizeof(integrity_check_rsp));
100008f4:	4502                	lw	a0,0(sp)
100008f6:	080c                	addi	a1,sp,16
    integrity_check_rsp.type = OTA_INTEGRITY_CHECK_RSP;
100008f8:	00f11823          	sh	a5,16(sp)
    ota_svc_indication(cn_hdl, (void *)&integrity_check_rsp, sizeof(integrity_check_rsp));
100008fc:	35a5                	jal	10000764 <ota_svc_indication.constprop.0>
}
100008fe:	bf89                	j	10000850 <ota_svc_ctrl_rcv+0x94>
            size -= FLASH_SS;
10000900:	8c91                	sub	s1,s1,a2
            offset += FLASH_SS;
10000902:	b74d                	j	100008a4 <ota_svc_ctrl_rcv+0xe8>
            ota_params.current_sector = ctrl->u.new_sector.sector_idx;
10000904:	0024c783          	lbu	a5,2(s1)
10000908:	0014c703          	lbu	a4,1(s1)
1000090c:	20002537          	lui	a0,0x20002
10000910:	07a2                	slli	a5,a5,0x8
10000912:	1a050513          	addi	a0,a0,416 # 200021a0 <wdalignbuf>
10000916:	8fd9                	or	a5,a5,a4
10000918:	08f51c23          	sh	a5,152(a0)
            memset(ota_params.ack,0,OTA_ACK_BUF_LENGTH_MAX);
1000091c:	466d                	li	a2,27
1000091e:	4581                	li	a1,0
10000920:	09c50513          	addi	a0,a0,156
10000924:	f000c097          	auipc	ra,0xf000c
10000928:	0a8080e7          	jalr	168(ra) # c9cc <memset>
        break;
1000092c:	b715                	j	10000850 <ota_svc_ctrl_rcv+0x94>
            ota_params.finish_ind->integrity_checking_result = true;
1000092e:	200027b7          	lui	a5,0x20002
10000932:	2307a783          	lw	a5,560(a5) # 20002230 <ota_params+0x6c>
10000936:	4705                	li	a4,1
10000938:	00e78223          	sb	a4,4(a5)
    integrity_check_rsp.type = OTA_INTEGRITY_CHECK_RSP;
1000093c:	4799                	li	a5,6
1000093e:	bf5d                	j	100008f4 <ota_svc_ctrl_rcv+0x138>
             if (ctrl->u.finish.status & OTA_STATUS_MASK)
10000940:	0014c703          	lbu	a4,1(s1)
10000944:	20002437          	lui	s0,0x20002
10000948:	1a040413          	addi	s0,s0,416 # 200021a0 <wdalignbuf>
1000094c:	00177693          	andi	a3,a4,1
10000950:	ee068ee3          	beqz	a3,1000084c <ota_svc_ctrl_rcv+0x90>
                    .erase_flag  = (ctrl->u.finish.status & OTA_SETTINGS_ERASE_MASK) ? 1 : 0,
10000954:	8709                	srai	a4,a4,0x2
10000956:	8b05                	andi	a4,a4,1
                struct ota_cfg_info  ota_cfg_info =
10000958:	ca3a                	sw	a4,20(sp)
1000095a:	10000737          	lui	a4,0x10000
1000095e:	cc3a                	sw	a4,24(sp)
10000960:	1001f737          	lui	a4,0x1001f
10000964:	ce3a                	sw	a4,28(sp)
10000966:	10001737          	lui	a4,0x10001
1000096a:	d03a                	sw	a4,32(sp)
1000096c:	08c42703          	lw	a4,140(s0)
10000970:	acbdf6b7          	lui	a3,0xacbdf
10000974:	faf68693          	addi	a3,a3,-81 # acbdefaf <__StackTop+0x8cbdafaf>
                flash_sector_erase(OTA_CFG_FLASH_BASE_ADDR);   //OTA CFG INFO CLEAR (PAGE ERASE)
10000978:	1003d537          	lui	a0,0x1003d
                struct ota_cfg_info  ota_cfg_info =
1000097c:	c836                	sw	a3,16(sp)
1000097e:	d23a                	sw	a4,36(sp)
                flash_sector_erase(OTA_CFG_FLASH_BASE_ADDR);   //OTA CFG INFO CLEAR (PAGE ERASE)
10000980:	10000097          	auipc	ra,0x10000
10000984:	62c080e7          	jalr	1580(ra) # 20000fac <flash_sector_erase>
                flash_write(OTA_CFG_FLASH_BASE_ADDR, (uint8_t *)&ota_cfg_info, sizeof(struct ota_cfg_info));
10000988:	4661                	li	a2,24
1000098a:	080c                	addi	a1,sp,16
1000098c:	1003d537          	lui	a0,0x1003d
10000990:	10000097          	auipc	ra,0x10000
10000994:	7e6080e7          	jalr	2022(ra) # 20001176 <flash_write>
                if (ctrl->u.finish.status & OTA_REBOOT_MASK)
10000998:	0014c783          	lbu	a5,1(s1)
1000099c:	8b89                	andi	a5,a5,2
1000099e:	ea0787e3          	beqz	a5,1000084c <ota_svc_ctrl_rcv+0x90>
                    REG_WRT(0x40000008, 1);  //reset system
100009a2:	400007b7          	lui	a5,0x40000
100009a6:	4705                	li	a4,1
100009a8:	c798                	sw	a4,8(a5)
  \brief   Wait For Interrupt
  \details Wait For Interrupt is a hint instruction that suspends execution until one of a number of events occurs.
 */
__ALWAYS_STATIC_INLINE void __WFI(void)
{
    __ASM volatile("wfi");
100009aa:	10500073          	wfi
}
100009ae:	bd79                	j	1000084c <ota_svc_ctrl_rcv+0x90>

100009b0 <ble_2g4_tx_end_handler>:

void ble_2g4_tx_end_handler(void)
{
	tx_rx_flag = 1;
	// log_printf("tx end \n");
}
100009b0:	8082                	ret

100009b2 <ble_2g4_rx_end_handler>:
	// {
	// 	log_printf("%02X ", rx_ble_adv_data_buf[i]);
	// }
	}

}
100009b2:	8082                	ret

100009b4 <WDT_Handler>:
}

ATTRIBUTE_ISR void WDT_Handler(void)
{

}
100009b4:	30200073          	mret

100009b8 <GPIO_Handler>:

ATTRIBUTE_ISR void GPIO_Handler(void)
100009b8:	30200073          	mret

100009bc <TIMER0_Handler>:
{

}

ATTRIBUTE_ISR void TIMER0_Handler(void)
100009bc:	30200073          	mret

100009c0 <TIMER1_Handler>:
{

}

ATTRIBUTE_ISR void TIMER1_Handler(void)
100009c0:	30200073          	mret

100009c4 <TIMER2_Handler>:
{

}

ATTRIBUTE_ISR void TIMER2_Handler(void)
100009c4:	30200073          	mret

100009c8 <TIMER3_Handler>:
{

}

ATTRIBUTE_ISR void TIMER3_Handler(void)
100009c8:	30200073          	mret

100009cc <TIMER4_Handler>:
{

}

ATTRIBUTE_ISR void TIMER4_Handler(void)
100009cc:	30200073          	mret

100009d0 <TIMER5_Handler>:
{

}

ATTRIBUTE_ISR void TIMER5_Handler(void)
100009d0:	30200073          	mret

100009d4 <TIMER6_Handler>:
{

}

ATTRIBUTE_ISR void TIMER6_Handler(void)
100009d4:	30200073          	mret

100009d8 <TIMER7_Handler>:
{

}

ATTRIBUTE_ISR void TIMER7_Handler(void)
100009d8:	30200073          	mret
{
100009dc:	872a                	mv	a4,a0
    while(str[c++] != '\0');
100009de:	4781                	li	a5,0
100009e0:	853e                	mv	a0,a5
100009e2:	0785                	addi	a5,a5,1 # 40000001 <__StackTop+0x1fffc001>
100009e4:	00f706b3          	add	a3,a4,a5
100009e8:	fff6c683          	lbu	a3,-1(a3)
100009ec:	faf5                	bnez	a3,100009e0 <TIMER7_Handler+0x8>
}
100009ee:	8082                	ret

100009f0 <puts>:
{
100009f0:	1161                	addi	sp,sp,-8
100009f2:	c206                	sw	ra,4(sp)
100009f4:	c022                	sw	s0,0(sp)
100009f6:	842a                	mv	s0,a0
    uart_send(LOG_UART, (void *)str, strlen(str));
100009f8:	f000c097          	auipc	ra,0xf000c
100009fc:	fa8080e7          	jalr	-88(ra) # c9a0 <strlen>
10000a00:	85aa                	mv	a1,a0
10000a02:	8522                	mv	a0,s0
10000a04:	ee4ff0ef          	jal	100000e8 <uart_send.constprop.0>
    uart_send(LOG_UART, "\n", 1);
10000a08:	10004537          	lui	a0,0x10004
10000a0c:	38c50513          	addi	a0,a0,908 # 1000438c <__thead_uwrite8+0x2b4>
10000a10:	4585                	li	a1,1
10000a12:	ed6ff0ef          	jal	100000e8 <uart_send.constprop.0>
}
10000a16:	4092                	lw	ra,4(sp)
10000a18:	4402                	lw	s0,0(sp)
10000a1a:	4501                	li	a0,0
10000a1c:	0121                	addi	sp,sp,8
10000a1e:	8082                	ret

10000a20 <main>:
#include "include.h"
 
int app_main(void);

int main(void)
{
10000a20:	1161                	addi	sp,sp,-8
10000a22:	c206                	sw	ra,4(sp)
void gpio_set_func(ENUM_GPIO_PIN pin, uint8_t func_code)
{
    if(!VALID_PIN(pin)) return;

    /* Direct register access with boundary check */
	*(volatile uint8_t *)(GPIO_ATF_BASE + pin) = (func_code & 0xFF);
10000a24:	40010737          	lui	a4,0x40010
10000a28:	02800793          	li	a5,40
10000a2c:	20f70423          	sb	a5,520(a4) # 40010208 <__StackTop+0x2000c208>
10000a30:	47a5                	li	a5,9
10000a32:	20f704a3          	sb	a5,521(a4)
	RESET_UART(uart_id);
10000a36:	40000693          	li	a3,1024
10000a3a:	40000737          	lui	a4,0x40000
10000a3e:	c714                	sw	a3,8(a4)
10000a40:	c002                	sw	zero,0(sp)
10000a42:	4702                	lw	a4,0(sp)
10000a44:	1ce7d163          	bge	a5,a4,10000c06 <main+0x1e6>
10000a48:	400006b7          	lui	a3,0x40000
10000a4c:	0006a423          	sw	zero,8(a3) # 40000008 <__StackTop+0x1fffc008>
    if( SYS_CTRL->SYS_CLKSEL_b.REG_UART_CLK_SEL == 2)
10000a50:	52dc                	lw	a5,36(a3)
10000a52:	4709                	li	a4,2
10000a54:	83a9                	srli	a5,a5,0xa
10000a56:	8b8d                	andi	a5,a5,3
10000a58:	1ae79b63          	bne	a5,a4,10000c0e <main+0x1ee>
        return 48000000;
10000a5c:	02dc7737          	lui	a4,0x2dc7
10000a60:	c0070713          	addi	a4,a4,-1024 # 2dc6c00 <__FLASH_SIZE+0x2d86c00>
    if( SYS_CTRL->SYS_CLKSEL_b.REG_UART_CLK_SEL == 2)
10000a64:	52dc                	lw	a5,36(a3)
  \param [in]  priority  Priority to set.
 */
__STATIC_INLINE void csi_vic_set_prio(int32_t IRQn, uint32_t priority)
{
    uint8_t nlbits = (CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos;
    uint8_t clic_intcfg_prio_mask = (uint8_t)(0xff << (8 - nlbits));
10000a66:	4621                	li	a2,8
    UARTx->LCR_b.DLAB = 1;
10000a68:	410017b7          	lui	a5,0x41001
10000a6c:	00c7c683          	lbu	a3,12(a5) # 4100100c <__StackTop+0x20ffd00c>
#if(LOG_ENABLE)
	log_dbg_init();
	
	log_printf("SDK_VERSION:%x \n",SDK_VERSION);
10000a70:	65c1                	lui	a1,0x10
10000a72:	10004537          	lui	a0,0x10004
10000a76:	f806e693          	ori	a3,a3,-128
10000a7a:	00d78623          	sb	a3,12(a5)
    int divisor = ((get_uart_clk() / baudrate) >> 4);
10000a7e:	66f1                	lui	a3,0x1c
10000a80:	20068693          	addi	a3,a3,512 # 1c200 <memset+0xf834>
10000a84:	02d75733          	divu	a4,a4,a3

    CLIC->CLICINT[IRQn].CTL = (CLIC->CLICINT[IRQn].CTL & (~clic_intcfg_prio_mask)) | (priority << (8 - nlbits));
10000a88:	e08016b7          	lui	a3,0xe0801
10000a8c:	05a1                	addi	a1,a1,8 # 10008 <memset+0x363c>
10000a8e:	35450513          	addi	a0,a0,852 # 10004354 <__thead_uwrite8+0x27c>
10000a92:	8311                	srli	a4,a4,0x4
    UARTx->DLL = divisor & 0xff;
10000a94:	0ff77713          	zext.b	a4,a4
10000a98:	00e78023          	sb	a4,0(a5)
    UARTx->DLH = (divisor >> 8) & 0xff;
10000a9c:	00078223          	sb	zero,4(a5)
    UARTx->DLF = fract;
10000aa0:	0c078023          	sb	zero,192(a5)
    UARTx->LCR_b.DLAB = 0;
10000aa4:	00c7c703          	lbu	a4,12(a5)
10000aa8:	07f77713          	andi	a4,a4,127
10000aac:	00e78623          	sb	a4,12(a5)
    UARTx->LCR &= (~LCR_PARITY_ENABLE);
10000ab0:	00c7c703          	lbu	a4,12(a5)
10000ab4:	0f777713          	andi	a4,a4,247
10000ab8:	00e78623          	sb	a4,12(a5)
    UARTx->LCR |= LCR_WORD_SIZE_8;
10000abc:	00c7c703          	lbu	a4,12(a5)
10000ac0:	00376713          	ori	a4,a4,3
10000ac4:	00e78623          	sb	a4,12(a5)
    UARTx->LCR &= LCR_STOP_BIT1;
10000ac8:	00c7c703          	lbu	a4,12(a5)
10000acc:	0fb77713          	andi	a4,a4,251
10000ad0:	00e78623          	sb	a4,12(a5)
    UARTx->IER_b.ERBFI = 0;
10000ad4:	0047c703          	lbu	a4,4(a5)
10000ad8:	9b79                	andi	a4,a4,-2
10000ada:	00e78223          	sb	a4,4(a5)
    UARTx->IER_b.ETBEI = 0;
10000ade:	0047c703          	lbu	a4,4(a5)
10000ae2:	9b75                	andi	a4,a4,-3
10000ae4:	00e78223          	sb	a4,4(a5)
    UARTx->FCR_b.FIFOE = 0x1;
10000ae8:	0087c703          	lbu	a4,8(a5)
10000aec:	00176713          	ori	a4,a4,1
10000af0:	00e78423          	sb	a4,8(a5)
    UARTx->FCR_b.RT = 1;
10000af4:	0087c703          	lbu	a4,8(a5)
10000af8:	03f77713          	andi	a4,a4,63
10000afc:	04076713          	ori	a4,a4,64
10000b00:	00e78423          	sb	a4,8(a5)
    uint8_t nlbits = (CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos;
10000b04:	e08007b7          	lui	a5,0xe0800
10000b08:	43dc                	lw	a5,4(a5)
    uint8_t clic_intcfg_prio_mask = (uint8_t)(0xff << (8 - nlbits));
10000b0a:	0ff00713          	li	a4,255
    uint8_t nlbits = (CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos;
10000b0e:	83d5                	srli	a5,a5,0x15
    uint8_t clic_intcfg_prio_mask = (uint8_t)(0xff << (8 - nlbits));
10000b10:	8bbd                	andi	a5,a5,15
10000b12:	8e1d                	sub	a2,a2,a5
    CLIC->CLICINT[IRQn].CTL = (CLIC->CLICINT[IRQn].CTL & (~clic_intcfg_prio_mask)) | (priority << (8 - nlbits));
10000b14:	0636c783          	lbu	a5,99(a3) # e0801063 <__StackTop+0xc07fd063>
    uint8_t clic_intcfg_prio_mask = (uint8_t)(0xff << (8 - nlbits));
10000b18:	00c71733          	sll	a4,a4,a2
    CLIC->CLICINT[IRQn].CTL = (CLIC->CLICINT[IRQn].CTL & (~clic_intcfg_prio_mask)) | (priority << (8 - nlbits));
10000b1c:	fff74713          	not	a4,a4
10000b20:	8ff9                	and	a5,a5,a4
10000b22:	470d                	li	a4,3
10000b24:	00c71733          	sll	a4,a4,a2
10000b28:	8fd9                	or	a5,a5,a4
10000b2a:	0ff7f793          	zext.b	a5,a5
10000b2e:	06f681a3          	sb	a5,99(a3)
    CLIC->CLICINT[IRQn].IE |= CLIC_INTIE_IE_Msk;
10000b32:	0616c783          	lbu	a5,97(a3)
10000b36:	0017e793          	ori	a5,a5,1
10000b3a:	06f680a3          	sb	a5,97(a3)
10000b3e:	dccff0ef          	jal	1000010a <log_printf>
	log_printf("SDK_DATE:%x \n",SDK_DATE);
10000b42:	202505b7          	lui	a1,0x20250
10000b46:	10004537          	lui	a0,0x10004
10000b4a:	62758593          	addi	a1,a1,1575 # 20250627 <__StackTop+0x24c627>
10000b4e:	36850513          	addi	a0,a0,872 # 10004368 <__thead_uwrite8+0x290>
10000b52:	db8ff0ef          	jal	1000010a <log_printf>
 * - VTIMER for BLE event scheduling
 * - Custom clock synchronization hooks
 */
void app_ble_init(void)
{
    log_printf("app ble init\n ");
10000b56:	10004537          	lui	a0,0x10004
10000b5a:	37850513          	addi	a0,a0,888 # 10004378 <__thead_uwrite8+0x2a0>
10000b5e:	dacff0ef          	jal	1000010a <log_printf>

    VTIMER_Init(); //must init before app init, because app will init timer in app_init
10000b62:	2fa1                	jal	100012ba <VTIMER_Init>

    ble_set_adv_addr(ble_mac_addr);
10000b64:	20001537          	lui	a0,0x20001
10000b68:	a2850513          	addi	a0,a0,-1496 # 20000a28 <ble_mac_addr>
10000b6c:	0b1000ef          	jal	1000141c <ble_set_adv_addr>

    bt_base_init(bt_buf_init_ext);
10000b70:	10002537          	lui	a0,0x10002
10000b74:	a4c50513          	addi	a0,a0,-1460 # 10001a4c <bt_buf_init_ext>
10000b78:	783000ef          	jal	10001afa <bt_base_init>

    uint32_t sys_timeout_tick_get_hook(void);
    void sys_timeout_init(SYS_TIMEOUT_TICK_GET_HOOK tick_hook);
    sys_timeout_init(sys_timeout_tick_get_hook);
10000b7c:	20001537          	lui	a0,0x20001
10000b80:	38650513          	addi	a0,a0,902 # 20001386 <sys_timeout_tick_get_hook>
10000b84:	f000c097          	auipc	ra,0xf000c
10000b88:	ae8080e7          	jalr	-1304(ra) # c66c <sys_timeout_init>

	ble_host_init();
10000b8c:	1a9000ef          	jal	10001534 <ble_host_init>
	
    bt_enable(ble_periph_init);
10000b90:	10000537          	lui	a0,0x10000
10000b94:	44e50513          	addi	a0,a0,1102 # 1000044e <ble_periph_init>
10000b98:	f0009097          	auipc	ra,0xf0009
10000b9c:	9a2080e7          	jalr	-1630(ra) # 953a <bt_enable>
	
#if(BLE_MODE_SEL ==BLE_2G4_STACK_VER)
	ble_2g4_init();
10000ba0:	23b000ef          	jal	100015da <ble_2g4_init>
int app_main(void)
{
	app_ble_init();
	while(1)
	{
		delay_ms(200);
10000ba4:	0c800513          	li	a0,200
10000ba8:	10000097          	auipc	ra,0x10000
10000bac:	706080e7          	jalr	1798(ra) # 200012ae <delay_ms>
		log_printf("1 ");
10000bb0:	10004537          	lui	a0,0x10004
10000bb4:	38850513          	addi	a0,a0,904 # 10004388 <__thead_uwrite8+0x2b0>
10000bb8:	d52ff0ef          	jal	1000010a <log_printf>
		WDT_FEED();
10000bbc:	400007b7          	lui	a5,0x40000
10000bc0:	0d800713          	li	a4,216
10000bc4:	10e7a023          	sw	a4,256(a5) # 40000100 <__StackTop+0x1fffc100>
		
		ble_host_work_polling();
10000bc8:	201000ef          	jal	100015c8 <ble_host_work_polling>
{
	static uint32_t pre_tick = 0;

	uint32_t cur_tick = REG_RD(0x42000104);// (SYS_CTRL->AON_RTC);
	
	if(cur_tick >= pre_tick)
10000bcc:	20002737          	lui	a4,0x20002
10000bd0:	1a070713          	addi	a4,a4,416 # 200021a0 <wdalignbuf>
	uint32_t cur_tick = REG_RD(0x42000104);// (SYS_CTRL->AON_RTC);
10000bd4:	420007b7          	lui	a5,0x42000
10000bd8:	1047a583          	lw	a1,260(a5) # 42000104 <__StackTop+0x21ffc104>
	if(cur_tick >= pre_tick)
10000bdc:	0c872683          	lw	a3,200(a4)
	{   
		_u32_tick += (cur_tick - pre_tick);
10000be0:	0c072783          	lw	a5,192(a4)
10000be4:	0c472603          	lw	a2,196(a4)
	if(cur_tick >= pre_tick)
10000be8:	02d5e863          	bltu	a1,a3,10000c18 <main+0x1f8>
		_u32_tick += (cur_tick - pre_tick);
10000bec:	40d586b3          	sub	a3,a1,a3
		pre_tick = cur_tick;
	}
	else
	{
		_u32_tick += ( 0xFFFFFFFF- pre_tick + cur_tick);
10000bf0:	97b6                	add	a5,a5,a3
10000bf2:	00d7b6b3          	sltu	a3,a5,a3
10000bf6:	9636                	add	a2,a2,a3
		_u32_tick += (cur_tick - pre_tick);
10000bf8:	0cf72023          	sw	a5,192(a4)
10000bfc:	0cc72223          	sw	a2,196(a4)
		pre_tick = cur_tick;
10000c00:	0cb72423          	sw	a1,200(a4)
10000c04:	b745                	j	10000ba4 <main+0x184>
	RESET_UART(uart_id);
10000c06:	4702                	lw	a4,0(sp)
10000c08:	0705                	addi	a4,a4,1
10000c0a:	c03a                	sw	a4,0(sp)
10000c0c:	bd1d                	j	10000a42 <main+0x22>
        return 24000000;
10000c0e:	016e3737          	lui	a4,0x16e3
10000c12:	60070713          	addi	a4,a4,1536 # 16e3600 <__FLASH_SIZE+0x16a3600>
10000c16:	b5b9                	j	10000a64 <main+0x44>
		_u32_tick += ( 0xFFFFFFFF- pre_tick + cur_tick);
10000c18:	fff58513          	addi	a0,a1,-1
10000c1c:	40d506b3          	sub	a3,a0,a3
10000c20:	bfc1                	j	10000bf0 <main+0x1d0>

10000c22 <Default_Handler>:
10000c22:	400007b7          	lui	a5,0x40000
10000c26:	0f800713          	li	a4,248
10000c2a:	10e7a023          	sw	a4,256(a5) # 40000100 <__StackTop+0x1fffc100>
10000c2e:	a001                	j	10000c2e <Default_Handler+0xc>

10000c30 <clic_init>:
10000c30:	e0800737          	lui	a4,0xe0800
10000c34:	435c                	lw	a5,4(a4)
10000c36:	83d1                	srli	a5,a5,0x14
10000c38:	8bf9                	andi	a5,a5,30
10000c3a:	00f70023          	sb	a5,0(a4) # e0800000 <__StackTop+0xc07fc000>
10000c3e:	4701                	li	a4,0
10000c40:	e0800537          	lui	a0,0xe0800
10000c44:	6585                	lui	a1,0x1
10000c46:	4685                	li	a3,1
10000c48:	03000613          	li	a2,48
10000c4c:	00271793          	slli	a5,a4,0x2
10000c50:	97aa                	add	a5,a5,a0
10000c52:	97ae                	add	a5,a5,a1
10000c54:	00d78023          	sb	a3,0(a5)
10000c58:	000780a3          	sb	zero,1(a5)
10000c5c:	00d78123          	sb	a3,2(a5)
10000c60:	0705                	addi	a4,a4,1
10000c62:	fec715e3          	bne	a4,a2,10000c4c <clic_init+0x1c>
10000c66:	8082                	ret

10000c68 <ram_init>:
10000c68:	1171                	addi	sp,sp,-4
10000c6a:	c006                	sw	ra,0(sp)
10000c6c:	10004737          	lui	a4,0x10004
10000c70:	75870713          	addi	a4,a4,1880 # 10004758 <__exidx_end>
10000c74:	100047b7          	lui	a5,0x10004
10000c78:	76478793          	addi	a5,a5,1892 # 10004764 <__copy_table_end__>
10000c7c:	86ba                	mv	a3,a4
10000c7e:	853e                	mv	a0,a5
10000c80:	04f76563          	bltu	a4,a5,10000cca <ram_init+0x62>
10000c84:	10004737          	lui	a4,0x10004
10000c88:	76470713          	addi	a4,a4,1892 # 10004764 <__copy_table_end__>
10000c8c:	100047b7          	lui	a5,0x10004
10000c90:	76c78793          	addi	a5,a5,1900 # 1000476c <__etext>
10000c94:	06f77063          	bgeu	a4,a5,10000cf4 <ram_init+0x8c>
10000c98:	86ba                	mv	a3,a4
10000c9a:	100045b7          	lui	a1,0x10004
10000c9e:	76b58593          	addi	a1,a1,1899 # 1000476b <__copy_table_end__+0x7>
10000ca2:	8d99                	sub	a1,a1,a4
10000ca4:	99e1                	andi	a1,a1,-8
10000ca6:	05a1                	addi	a1,a1,8
10000ca8:	95ba                	add	a1,a1,a4
10000caa:	a089                	j	10000cec <ram_init+0x84>
10000cac:	00279613          	slli	a2,a5,0x2
10000cb0:	4298                	lw	a4,0(a3)
10000cb2:	9732                	add	a4,a4,a2
10000cb4:	430c                	lw	a1,0(a4)
10000cb6:	42d8                	lw	a4,4(a3)
10000cb8:	9732                	add	a4,a4,a2
10000cba:	c30c                	sw	a1,0(a4)
10000cbc:	0785                	addi	a5,a5,1
10000cbe:	4698                	lw	a4,8(a3)
10000cc0:	fee7e6e3          	bltu	a5,a4,10000cac <ram_init+0x44>
10000cc4:	06b1                	addi	a3,a3,12
10000cc6:	faa6ffe3          	bgeu	a3,a0,10000c84 <ram_init+0x1c>
10000cca:	4698                	lw	a4,8(a3)
10000ccc:	4781                	li	a5,0
10000cce:	ff79                	bnez	a4,10000cac <ram_init+0x44>
10000cd0:	bfd5                	j	10000cc4 <ram_init+0x5c>
10000cd2:	4298                	lw	a4,0(a3)
10000cd4:	00279613          	slli	a2,a5,0x2
10000cd8:	9732                	add	a4,a4,a2
10000cda:	00072023          	sw	zero,0(a4)
10000cde:	0785                	addi	a5,a5,1
10000ce0:	42d8                	lw	a4,4(a3)
10000ce2:	fee7e8e3          	bltu	a5,a4,10000cd2 <ram_init+0x6a>
10000ce6:	06a1                	addi	a3,a3,8
10000ce8:	00b68663          	beq	a3,a1,10000cf4 <ram_init+0x8c>
10000cec:	42d8                	lw	a4,4(a3)
10000cee:	4781                	li	a5,0
10000cf0:	f36d                	bnez	a4,10000cd2 <ram_init+0x6a>
10000cf2:	bfd5                	j	10000ce6 <ram_init+0x7e>
10000cf4:	f000c097          	auipc	ra,0xf000c
10000cf8:	b52080e7          	jalr	-1198(ra) # c846 <t1100_rom_init>
10000cfc:	4082                	lw	ra,0(sp)
10000cfe:	0111                	addi	sp,sp,4
10000d00:	8082                	ret

10000d02 <sys_entry>:
10000d02:	400007b7          	lui	a5,0x40000
10000d06:	4398                	lw	a4,0(a5)
10000d08:	6785                	lui	a5,0x1
10000d0a:	10178793          	addi	a5,a5,257 # 1101 <__STACK_SIZE+0xd01>
10000d0e:	00f70363          	beq	a4,a5,10000d14 <sys_entry+0x12>
10000d12:	8082                	ret
10000d14:	1141                	addi	sp,sp,-16
10000d16:	c606                	sw	ra,12(sp)
10000d18:	c422                	sw	s0,8(sp)
10000d1a:	c226                	sw	s1,4(sp)
10000d1c:	37b1                	jal	10000c68 <ram_init>
10000d1e:	3f09                	jal	10000c30 <clic_init>
10000d20:	40080437          	lui	s0,0x40080
10000d24:	4785                	li	a5,1
10000d26:	c83c                	sw	a5,80(s0)
10000d28:	42000737          	lui	a4,0x42000
10000d2c:	6785                	lui	a5,0x1
10000d2e:	70178793          	addi	a5,a5,1793 # 1701 <app_main.c.2c20a20f+0x105>
10000d32:	10f72023          	sw	a5,256(a4) # 42000100 <__StackTop+0x21ffc100>
10000d36:	2051                	jal	10000dba <otp_load_cfg>
10000d38:	218d                	jal	1000119a <otp_apply_cfg>
10000d3a:	69e010ef          	jal	100023d8 <PMU_OnChip_Init>
10000d3e:	400004b7          	lui	s1,0x40000
10000d42:	50dc                	lw	a5,36(s1)
10000d44:	001007b7          	lui	a5,0x100
10000d48:	40078793          	addi	a5,a5,1024 # 100400 <__FLASH_SIZE+0xc0400>
10000d4c:	d0dc                	sw	a5,36(s1)
10000d4e:	42002737          	lui	a4,0x42002
10000d52:	431c                	lw	a5,0(a4)
10000d54:	9bf5                	andi	a5,a5,-3
10000d56:	c31c                	sw	a5,0(a4)
10000d58:	11042783          	lw	a5,272(s0) # 40080110 <__StackTop+0x2007c110>
10000d5c:	6721                	lui	a4,0x8
10000d5e:	80070713          	addi	a4,a4,-2048 # 7800 <bt_gatt_attr_get_handle+0x12>
10000d62:	8fd9                	or	a5,a5,a4
10000d64:	10f42823          	sw	a5,272(s0)
10000d68:	00fcd537          	lui	a0,0xfcd
10000d6c:	bff50513          	addi	a0,a0,-1025 # fccbff <__FLASH_SIZE+0xf8cbff>
10000d70:	10000097          	auipc	ra,0x10000
10000d74:	4ba080e7          	jalr	1210(ra) # 2000122a <poweron_unused_gpio_mask_parse_and_set>
10000d78:	12044783          	lbu	a5,288(s0)
10000d7c:	0047e793          	ori	a5,a5,4
10000d80:	12f40023          	sb	a5,288(s0)
10000d84:	40000793          	li	a5,1024
10000d88:	c49c                	sw	a5,8(s1)
10000d8a:	c002                	sw	zero,0(sp)
10000d8c:	4702                	lw	a4,0(sp)
10000d8e:	47a5                	li	a5,9
10000d90:	00e7c963          	blt	a5,a4,10000da2 <sys_entry+0xa0>
10000d94:	873e                	mv	a4,a5
10000d96:	4782                	lw	a5,0(sp)
10000d98:	0785                	addi	a5,a5,1
10000d9a:	c03e                	sw	a5,0(sp)
10000d9c:	4782                	lw	a5,0(sp)
10000d9e:	fef75ce3          	bge	a4,a5,10000d96 <sys_entry+0x94>
10000da2:	400007b7          	lui	a5,0x40000
10000da6:	0007a423          	sw	zero,8(a5) # 40000008 <__StackTop+0x1fffc008>
10000daa:	300467f3          	csrrsi	a5,mstatus,8
10000dae:	398d                	jal	10000a20 <main>
10000db0:	40b2                	lw	ra,12(sp)
10000db2:	4422                	lw	s0,8(sp)
10000db4:	4492                	lw	s1,4(sp)
10000db6:	0141                	addi	sp,sp,16
10000db8:	8082                	ret

10000dba <otp_load_cfg>:
10000dba:	1f8046b7          	lui	a3,0x1f804
10000dbe:	f3068713          	addi	a4,a3,-208 # 1f803f30 <__etext+0xf7ff7c4>
10000dc2:	200027b7          	lui	a5,0x20002
10000dc6:	29478793          	addi	a5,a5,660 # 20002294 <g_otp_cfg>
10000dca:	f7868693          	addi	a3,a3,-136
10000dce:	00072383          	lw	t2,0(a4)
10000dd2:	00472283          	lw	t0,4(a4)
10000dd6:	00872303          	lw	t1,8(a4)
10000dda:	4748                	lw	a0,12(a4)
10000ddc:	4b0c                	lw	a1,16(a4)
10000dde:	4b50                	lw	a2,20(a4)
10000de0:	0077a023          	sw	t2,0(a5)
10000de4:	0057a223          	sw	t0,4(a5)
10000de8:	0067a423          	sw	t1,8(a5)
10000dec:	c7c8                	sw	a0,12(a5)
10000dee:	cb8c                	sw	a1,16(a5)
10000df0:	cbd0                	sw	a2,20(a5)
10000df2:	0761                	addi	a4,a4,24
10000df4:	07e1                	addi	a5,a5,24
10000df6:	fcd71ce3          	bne	a4,a3,10000dce <otp_load_cfg+0x14>
10000dfa:	200027b7          	lui	a5,0x20002
10000dfe:	2947c703          	lbu	a4,660(a5) # 20002294 <g_otp_cfg>
10000e02:	0ff00793          	li	a5,255
10000e06:	00f71d63          	bne	a4,a5,10000e20 <otp_load_cfg+0x66>
10000e0a:	20002737          	lui	a4,0x20002
10000e0e:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10000e12:	00074783          	lbu	a5,0(a4)
10000e16:	9bc1                	andi	a5,a5,-16
10000e18:	00a7e793          	ori	a5,a5,10
10000e1c:	00f70023          	sb	a5,0(a4)
10000e20:	200027b7          	lui	a5,0x20002
10000e24:	2967c703          	lbu	a4,662(a5) # 20002296 <g_otp_cfg+0x2>
10000e28:	0ff00793          	li	a5,255
10000e2c:	10f70f63          	beq	a4,a5,10000f4a <otp_load_cfg+0x190>
10000e30:	200027b7          	lui	a5,0x20002
10000e34:	2987d703          	lhu	a4,664(a5) # 20002298 <g_otp_cfg+0x4>
10000e38:	67c1                	lui	a5,0x10
10000e3a:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000e3c:	12f70363          	beq	a4,a5,10000f62 <otp_load_cfg+0x1a8>
10000e40:	200027b7          	lui	a5,0x20002
10000e44:	29a7d703          	lhu	a4,666(a5) # 2000229a <g_otp_cfg+0x6>
10000e48:	67c1                	lui	a5,0x10
10000e4a:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000e4c:	12f70263          	beq	a4,a5,10000f70 <otp_load_cfg+0x1b6>
10000e50:	200027b7          	lui	a5,0x20002
10000e54:	29c7d703          	lhu	a4,668(a5) # 2000229c <g_otp_cfg+0x8>
10000e58:	67c1                	lui	a5,0x10
10000e5a:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000e5c:	12f70163          	beq	a4,a5,10000f7e <otp_load_cfg+0x1c4>
10000e60:	200027b7          	lui	a5,0x20002
10000e64:	2a07a703          	lw	a4,672(a5) # 200022a0 <g_otp_cfg+0xc>
10000e68:	57fd                	li	a5,-1
10000e6a:	12f70763          	beq	a4,a5,10000f98 <otp_load_cfg+0x1de>
10000e6e:	200027b7          	lui	a5,0x20002
10000e72:	2a47a703          	lw	a4,676(a5) # 200022a4 <g_otp_cfg+0x10>
10000e76:	57fd                	li	a5,-1
10000e78:	14f70263          	beq	a4,a5,10000fbc <otp_load_cfg+0x202>
10000e7c:	200027b7          	lui	a5,0x20002
10000e80:	2a87a703          	lw	a4,680(a5) # 200022a8 <g_otp_cfg+0x14>
10000e84:	57fd                	li	a5,-1
10000e86:	14f70d63          	beq	a4,a5,10000fe0 <otp_load_cfg+0x226>
10000e8a:	200027b7          	lui	a5,0x20002
10000e8e:	2ac7a703          	lw	a4,684(a5) # 200022ac <g_otp_cfg+0x18>
10000e92:	57fd                	li	a5,-1
10000e94:	16f70863          	beq	a4,a5,10001004 <otp_load_cfg+0x24a>
10000e98:	200027b7          	lui	a5,0x20002
10000e9c:	2b07a703          	lw	a4,688(a5) # 200022b0 <g_otp_cfg+0x1c>
10000ea0:	57fd                	li	a5,-1
10000ea2:	18f70363          	beq	a4,a5,10001028 <otp_load_cfg+0x26e>
10000ea6:	200027b7          	lui	a5,0x20002
10000eaa:	2b47a703          	lw	a4,692(a5) # 200022b4 <g_otp_cfg+0x20>
10000eae:	57fd                	li	a5,-1
10000eb0:	18f70e63          	beq	a4,a5,1000104c <otp_load_cfg+0x292>
10000eb4:	200027b7          	lui	a5,0x20002
10000eb8:	2b87a703          	lw	a4,696(a5) # 200022b8 <g_otp_cfg+0x24>
10000ebc:	57fd                	li	a5,-1
10000ebe:	1af70963          	beq	a4,a5,10001070 <otp_load_cfg+0x2b6>
10000ec2:	200027b7          	lui	a5,0x20002
10000ec6:	2bc7a703          	lw	a4,700(a5) # 200022bc <g_otp_cfg+0x28>
10000eca:	57fd                	li	a5,-1
10000ecc:	1cf70663          	beq	a4,a5,10001098 <otp_load_cfg+0x2de>
10000ed0:	200027b7          	lui	a5,0x20002
10000ed4:	2c07d703          	lhu	a4,704(a5) # 200022c0 <g_otp_cfg+0x2c>
10000ed8:	67c1                	lui	a5,0x10
10000eda:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000edc:	1ef70063          	beq	a4,a5,100010bc <otp_load_cfg+0x302>
10000ee0:	200027b7          	lui	a5,0x20002
10000ee4:	2c47d703          	lhu	a4,708(a5) # 200022c4 <g_otp_cfg+0x30>
10000ee8:	67c1                	lui	a5,0x10
10000eea:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000eec:	1ef70363          	beq	a4,a5,100010d2 <otp_load_cfg+0x318>
10000ef0:	200027b7          	lui	a5,0x20002
10000ef4:	2c67d703          	lhu	a4,710(a5) # 200022c6 <g_otp_cfg+0x32>
10000ef8:	67c1                	lui	a5,0x10
10000efa:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000efc:	1ef70663          	beq	a4,a5,100010e8 <otp_load_cfg+0x32e>
10000f00:	200027b7          	lui	a5,0x20002
10000f04:	2c87d703          	lhu	a4,712(a5) # 200022c8 <g_otp_cfg+0x34>
10000f08:	67c1                	lui	a5,0x10
10000f0a:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000f0c:	1ef70963          	beq	a4,a5,100010fe <otp_load_cfg+0x344>
10000f10:	200027b7          	lui	a5,0x20002
10000f14:	2cc7a703          	lw	a4,716(a5) # 200022cc <g_otp_cfg+0x38>
10000f18:	57fd                	li	a5,-1
10000f1a:	1ef70f63          	beq	a4,a5,10001118 <otp_load_cfg+0x35e>
10000f1e:	200027b7          	lui	a5,0x20002
10000f22:	2d07a703          	lw	a4,720(a5) # 200022d0 <g_otp_cfg+0x3c>
10000f26:	57fd                	li	a5,-1
10000f28:	20f70463          	beq	a4,a5,10001130 <otp_load_cfg+0x376>
10000f2c:	200027b7          	lui	a5,0x20002
10000f30:	2d47a703          	lw	a4,724(a5) # 200022d4 <g_otp_cfg+0x40>
10000f34:	57fd                	li	a5,-1
10000f36:	20f70c63          	beq	a4,a5,1000114e <otp_load_cfg+0x394>
10000f3a:	200027b7          	lui	a5,0x20002
10000f3e:	2d87a703          	lw	a4,728(a5) # 200022d8 <g_otp_cfg+0x44>
10000f42:	57fd                	li	a5,-1
10000f44:	22f70963          	beq	a4,a5,10001176 <otp_load_cfg+0x3bc>
10000f48:	8082                	ret
10000f4a:	20002737          	lui	a4,0x20002
10000f4e:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10000f52:	00274783          	lbu	a5,2(a4)
10000f56:	9bc1                	andi	a5,a5,-16
10000f58:	0037e793          	ori	a5,a5,3
10000f5c:	00f70123          	sb	a5,2(a4)
10000f60:	bdc1                	j	10000e30 <otp_load_cfg+0x76>
10000f62:	200027b7          	lui	a5,0x20002
10000f66:	f8d00713          	li	a4,-115
10000f6a:	28e78c23          	sb	a4,664(a5) # 20002298 <g_otp_cfg+0x4>
10000f6e:	bdc9                	j	10000e40 <otp_load_cfg+0x86>
10000f70:	200027b7          	lui	a5,0x20002
10000f74:	fb700713          	li	a4,-73
10000f78:	28e78d23          	sb	a4,666(a5) # 2000229a <g_otp_cfg+0x6>
10000f7c:	bdd1                	j	10000e50 <otp_load_cfg+0x96>
10000f7e:	20002737          	lui	a4,0x20002
10000f82:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10000f86:	00875783          	lhu	a5,8(a4)
10000f8a:	c007f793          	andi	a5,a5,-1024
10000f8e:	1407e793          	ori	a5,a5,320
10000f92:	00f71423          	sh	a5,8(a4)
10000f96:	b5e9                	j	10000e60 <otp_load_cfg+0xa6>
10000f98:	20002737          	lui	a4,0x20002
10000f9c:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10000fa0:	475c                	lw	a5,12(a4)
10000fa2:	76fd                	lui	a3,0xfffff
10000fa4:	8ff5                	and	a5,a5,a3
10000fa6:	2587e793          	ori	a5,a5,600
10000faa:	fc0106b7          	lui	a3,0xfc010
10000fae:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10000fb0:	8ff5                	and	a5,a5,a3
10000fb2:	02ab06b7          	lui	a3,0x2ab0
10000fb6:	8fd5                	or	a5,a5,a3
10000fb8:	c75c                	sw	a5,12(a4)
10000fba:	bd55                	j	10000e6e <otp_load_cfg+0xb4>
10000fbc:	20002737          	lui	a4,0x20002
10000fc0:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10000fc4:	4b1c                	lw	a5,16(a4)
10000fc6:	76fd                	lui	a3,0xfffff
10000fc8:	8ff5                	and	a5,a5,a3
10000fca:	0c87e793          	ori	a5,a5,200
10000fce:	fc0106b7          	lui	a3,0xfc010
10000fd2:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10000fd4:	8ff5                	and	a5,a5,a3
10000fd6:	00e406b7          	lui	a3,0xe40
10000fda:	8fd5                	or	a5,a5,a3
10000fdc:	cb1c                	sw	a5,16(a4)
10000fde:	bd79                	j	10000e7c <otp_load_cfg+0xc2>
10000fe0:	20002737          	lui	a4,0x20002
10000fe4:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10000fe8:	4b5c                	lw	a5,20(a4)
10000fea:	76fd                	lui	a3,0xfffff
10000fec:	8ff5                	and	a5,a5,a3
10000fee:	4b07e793          	ori	a5,a5,1200
10000ff2:	fc0106b7          	lui	a3,0xfc010
10000ff6:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10000ff8:	8ff5                	and	a5,a5,a3
10000ffa:	02ab06b7          	lui	a3,0x2ab0
10000ffe:	8fd5                	or	a5,a5,a3
10001000:	cb5c                	sw	a5,20(a4)
10001002:	b561                	j	10000e8a <otp_load_cfg+0xd0>
10001004:	20002737          	lui	a4,0x20002
10001008:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
1000100c:	4f1c                	lw	a5,24(a4)
1000100e:	76fd                	lui	a3,0xfffff
10001010:	8ff5                	and	a5,a5,a3
10001012:	1907e793          	ori	a5,a5,400
10001016:	fc0106b7          	lui	a3,0xfc010
1000101a:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
1000101c:	8ff5                	and	a5,a5,a3
1000101e:	00e406b7          	lui	a3,0xe40
10001022:	8fd5                	or	a5,a5,a3
10001024:	cf1c                	sw	a5,24(a4)
10001026:	bd8d                	j	10000e98 <otp_load_cfg+0xde>
10001028:	20002737          	lui	a4,0x20002
1000102c:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001030:	4f5c                	lw	a5,28(a4)
10001032:	76fd                	lui	a3,0xfffff
10001034:	8ff5                	and	a5,a5,a3
10001036:	7087e793          	ori	a5,a5,1800
1000103a:	fc0106b7          	lui	a3,0xfc010
1000103e:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001040:	8ff5                	and	a5,a5,a3
10001042:	02ab06b7          	lui	a3,0x2ab0
10001046:	8fd5                	or	a5,a5,a3
10001048:	cf5c                	sw	a5,28(a4)
1000104a:	bdb1                	j	10000ea6 <otp_load_cfg+0xec>
1000104c:	20002737          	lui	a4,0x20002
10001050:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001054:	531c                	lw	a5,32(a4)
10001056:	76fd                	lui	a3,0xfffff
10001058:	8ff5                	and	a5,a5,a3
1000105a:	2587e793          	ori	a5,a5,600
1000105e:	fc0106b7          	lui	a3,0xfc010
10001062:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001064:	8ff5                	and	a5,a5,a3
10001066:	00e406b7          	lui	a3,0xe40
1000106a:	8fd5                	or	a5,a5,a3
1000106c:	d31c                	sw	a5,32(a4)
1000106e:	b599                	j	10000eb4 <otp_load_cfg+0xfa>
10001070:	20002737          	lui	a4,0x20002
10001074:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001078:	535c                	lw	a5,36(a4)
1000107a:	76fd                	lui	a3,0xfffff
1000107c:	8ff5                	and	a5,a5,a3
1000107e:	6685                	lui	a3,0x1
10001080:	96068693          	addi	a3,a3,-1696 # 960 <__STACK_SIZE+0x560>
10001084:	8fd5                	or	a5,a5,a3
10001086:	fc0106b7          	lui	a3,0xfc010
1000108a:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
1000108c:	8ff5                	and	a5,a5,a3
1000108e:	02ab06b7          	lui	a3,0x2ab0
10001092:	8fd5                	or	a5,a5,a3
10001094:	d35c                	sw	a5,36(a4)
10001096:	b535                	j	10000ec2 <otp_load_cfg+0x108>
10001098:	20002737          	lui	a4,0x20002
1000109c:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
100010a0:	571c                	lw	a5,40(a4)
100010a2:	76fd                	lui	a3,0xfffff
100010a4:	8ff5                	and	a5,a5,a3
100010a6:	3207e793          	ori	a5,a5,800
100010aa:	fc0106b7          	lui	a3,0xfc010
100010ae:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
100010b0:	8ff5                	and	a5,a5,a3
100010b2:	00e406b7          	lui	a3,0xe40
100010b6:	8fd5                	or	a5,a5,a3
100010b8:	d71c                	sw	a5,40(a4)
100010ba:	bd19                	j	10000ed0 <otp_load_cfg+0x116>
100010bc:	200027b7          	lui	a5,0x20002
100010c0:	29478793          	addi	a5,a5,660 # 20002294 <g_otp_cfg>
100010c4:	02c7d703          	lhu	a4,44(a5)
100010c8:	3ff76713          	ori	a4,a4,1023
100010cc:	02e79623          	sh	a4,44(a5)
100010d0:	bd01                	j	10000ee0 <otp_load_cfg+0x126>
100010d2:	200027b7          	lui	a5,0x20002
100010d6:	29478793          	addi	a5,a5,660 # 20002294 <g_otp_cfg>
100010da:	0307d703          	lhu	a4,48(a5)
100010de:	76fd                	lui	a3,0xfffff
100010e0:	8f75                	and	a4,a4,a3
100010e2:	02e79823          	sh	a4,48(a5)
100010e6:	b529                	j	10000ef0 <otp_load_cfg+0x136>
100010e8:	200027b7          	lui	a5,0x20002
100010ec:	29478793          	addi	a5,a5,660 # 20002294 <g_otp_cfg>
100010f0:	0327d703          	lhu	a4,50(a5)
100010f4:	76fd                	lui	a3,0xfffff
100010f6:	8f75                	and	a4,a4,a3
100010f8:	02e79923          	sh	a4,50(a5)
100010fc:	b511                	j	10000f00 <otp_load_cfg+0x146>
100010fe:	20002737          	lui	a4,0x20002
10001102:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001106:	03475783          	lhu	a5,52(a4)
1000110a:	76fd                	lui	a3,0xfffff
1000110c:	8ff5                	and	a5,a5,a3
1000110e:	40c7e793          	ori	a5,a5,1036
10001112:	02f71a23          	sh	a5,52(a4)
10001116:	bbed                	j	10000f10 <otp_load_cfg+0x156>
10001118:	20002737          	lui	a4,0x20002
1000111c:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001120:	5f1c                	lw	a5,56(a4)
10001122:	800006b7          	lui	a3,0x80000
10001126:	8ff5                	and	a5,a5,a3
10001128:	0357e793          	ori	a5,a5,53
1000112c:	df1c                	sw	a5,56(a4)
1000112e:	bbc5                	j	10000f1e <otp_load_cfg+0x164>
10001130:	20002737          	lui	a4,0x20002
10001134:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001138:	5f5c                	lw	a5,60(a4)
1000113a:	800006b7          	lui	a3,0x80000
1000113e:	8ff5                	and	a5,a5,a3
10001140:	0003b6b7          	lui	a3,0x3b
10001144:	98068693          	addi	a3,a3,-1664 # 3a980 <memset+0x2dfb4>
10001148:	8fd5                	or	a5,a5,a3
1000114a:	df5c                	sw	a5,60(a4)
1000114c:	b3c5                	j	10000f2c <otp_load_cfg+0x172>
1000114e:	20002737          	lui	a4,0x20002
10001152:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
10001156:	433c                	lw	a5,64(a4)
10001158:	76fd                	lui	a3,0xfffff
1000115a:	8ff5                	and	a5,a5,a3
1000115c:	6685                	lui	a3,0x1
1000115e:	bb868693          	addi	a3,a3,-1096 # bb8 <__STACK_SIZE+0x7b8>
10001162:	8fd5                	or	a5,a5,a3
10001164:	fc0106b7          	lui	a3,0xfc010
10001168:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
1000116a:	8ff5                	and	a5,a5,a3
1000116c:	035506b7          	lui	a3,0x3550
10001170:	8fd5                	or	a5,a5,a3
10001172:	c33c                	sw	a5,64(a4)
10001174:	b3d9                	j	10000f3a <otp_load_cfg+0x180>
10001176:	20002737          	lui	a4,0x20002
1000117a:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
1000117e:	437c                	lw	a5,68(a4)
10001180:	76fd                	lui	a3,0xfffff
10001182:	8ff5                	and	a5,a5,a3
10001184:	7d07e793          	ori	a5,a5,2000
10001188:	fc0106b7          	lui	a3,0xfc010
1000118c:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
1000118e:	8ff5                	and	a5,a5,a3
10001190:	023906b7          	lui	a3,0x2390
10001194:	8fd5                	or	a5,a5,a3
10001196:	c37c                	sw	a5,68(a4)
10001198:	8082                	ret

1000119a <otp_apply_cfg>:
1000119a:	400807b7          	lui	a5,0x40080
1000119e:	1047a603          	lw	a2,260(a5) # 40080104 <__StackTop+0x2007c104>
100011a2:	fffc4737          	lui	a4,0xfffc4
100011a6:	177d                	addi	a4,a4,-1 # fffc3fff <__StackTop+0xdffbffff>
100011a8:	8e79                	and	a2,a2,a4
100011aa:	20002737          	lui	a4,0x20002
100011ae:	29470713          	addi	a4,a4,660 # 20002294 <g_otp_cfg>
100011b2:	00275683          	lhu	a3,2(a4)
100011b6:	8abd                	andi	a3,a3,15
100011b8:	06ba                	slli	a3,a3,0xe
100011ba:	8ed1                	or	a3,a3,a2
100011bc:	10d7a223          	sw	a3,260(a5)
100011c0:	1087a603          	lw	a2,264(a5)
100011c4:	76c1                	lui	a3,0xffff0
100011c6:	0ff68693          	addi	a3,a3,255 # ffff00ff <__StackTop+0xdffec0ff>
100011ca:	8e75                	and	a2,a2,a3
100011cc:	00474683          	lbu	a3,4(a4)
100011d0:	06a2                	slli	a3,a3,0x8
100011d2:	8ed1                	or	a3,a3,a2
100011d4:	10d7a423          	sw	a3,264(a5)
100011d8:	10c7a603          	lw	a2,268(a5)
100011dc:	76e1                	lui	a3,0xffff8
100011de:	07f68693          	addi	a3,a3,127 # ffff807f <__StackTop+0xdfff407f>
100011e2:	8e75                	and	a2,a2,a3
100011e4:	00674683          	lbu	a3,6(a4)
100011e8:	069e                	slli	a3,a3,0x7
100011ea:	8ed1                	or	a3,a3,a2
100011ec:	10d7a623          	sw	a3,268(a5)
100011f0:	1107a603          	lw	a2,272(a5)
100011f4:	ff0406b7          	lui	a3,0xff040
100011f8:	16fd                	addi	a3,a3,-1 # ff03ffff <__StackTop+0xdf03bfff>
100011fa:	8e75                	and	a2,a2,a3
100011fc:	5f14                	lw	a3,56(a4)
100011fe:	06ca                	slli	a3,a3,0x12
10001200:	8ed1                	or	a3,a3,a2
10001202:	10d7a823          	sw	a3,272(a5)
10001206:	42002637          	lui	a2,0x42002
1000120a:	4614                	lw	a3,8(a2)
1000120c:	880007b7          	lui	a5,0x88000
10001210:	17fd                	addi	a5,a5,-1 # 87ffffff <__StackTop+0x67ffbfff>
10001212:	8efd                	and	a3,a3,a5
10001214:	431c                	lw	a5,0(a4)
10001216:	8bbd                	andi	a5,a5,15
10001218:	07ee                	slli	a5,a5,0x1b
1000121a:	8fd5                	or	a5,a5,a3
1000121c:	c61c                	sw	a5,8(a2)
1000121e:	8082                	ret

10001220 <_timer_refresh_timeout>:
10001220:	1151                	addi	sp,sp,-12
10001222:	c406                	sw	ra,8(sp)
10001224:	c222                	sw	s0,4(sp)
10001226:	200027b7          	lui	a5,0x20002
1000122a:	2dc7a783          	lw	a5,732(a5) # 200022dc <VTIMER_Context>
1000122e:	cf95                	beqz	a5,1000126a <_timer_refresh_timeout+0x4a>
10001230:	43c0                	lw	s0,4(a5)
10001232:	2a8d                	jal	100013a4 <RTC_GetCurrentSysTime>
10001234:	0529                	addi	a0,a0,10
10001236:	02857063          	bgeu	a0,s0,10001256 <_timer_refresh_timeout+0x36>
1000123a:	40a407b3          	sub	a5,s0,a0
1000123e:	0007d363          	bgez	a5,10001244 <_timer_refresh_timeout+0x24>
10001242:	842a                	mv	s0,a0
10001244:	4585                	li	a1,1
10001246:	4505                	li	a0,1
10001248:	2a85                	jal	100013b8 <RTC_ITConfig>
1000124a:	8522                	mv	a0,s0
1000124c:	228d                	jal	100013ae <RTC_SetTimerTarget>
1000124e:	40a2                	lw	ra,8(sp)
10001250:	4412                	lw	s0,4(sp)
10001252:	0131                	addi	sp,sp,12
10001254:	8082                	ret
10001256:	40850733          	sub	a4,a0,s0
1000125a:	800007b7          	lui	a5,0x80000
1000125e:	ffe7c793          	xori	a5,a5,-2
10001262:	fee7e1e3          	bltu	a5,a4,10001244 <_timer_refresh_timeout+0x24>
10001266:	842a                	mv	s0,a0
10001268:	bff1                	j	10001244 <_timer_refresh_timeout+0x24>
1000126a:	4581                	li	a1,0
1000126c:	4505                	li	a0,1
1000126e:	22a9                	jal	100013b8 <RTC_ITConfig>
10001270:	bff9                	j	1000124e <_timer_refresh_timeout+0x2e>

10001272 <_timer_remove>:
10001272:	1151                	addi	sp,sp,-12
10001274:	c406                	sw	ra,8(sp)
10001276:	c222                	sw	s0,4(sp)
10001278:	30047473          	csrrci	s0,mstatus,8
1000127c:	200027b7          	lui	a5,0x20002
10001280:	2dc7a783          	lw	a5,732(a5) # 200022dc <VTIMER_Context>
10001284:	c395                	beqz	a5,100012a8 <_timer_remove+0x36>
10001286:	02f50363          	beq	a0,a5,100012ac <_timer_remove+0x3a>
1000128a:	873e                	mv	a4,a5
1000128c:	439c                	lw	a5,0(a5)
1000128e:	c791                	beqz	a5,1000129a <_timer_remove+0x28>
10001290:	fef51de3          	bne	a0,a5,1000128a <_timer_remove+0x18>
10001294:	411c                	lw	a5,0(a0)
10001296:	c31c                	sw	a5,0(a4)
10001298:	a011                	j	1000129c <_timer_remove+0x2a>
1000129a:	dd6d                	beqz	a0,10001294 <_timer_remove+0x22>
1000129c:	30041073          	csrw	mstatus,s0
100012a0:	40a2                	lw	ra,8(sp)
100012a2:	4412                	lw	s0,4(sp)
100012a4:	0131                	addi	sp,sp,12
100012a6:	8082                	ret
100012a8:	f975                	bnez	a0,1000129c <_timer_remove+0x2a>
100012aa:	87aa                	mv	a5,a0
100012ac:	4398                	lw	a4,0(a5)
100012ae:	200027b7          	lui	a5,0x20002
100012b2:	2ce7ae23          	sw	a4,732(a5) # 200022dc <VTIMER_Context>
100012b6:	37ad                	jal	10001220 <_timer_refresh_timeout>
100012b8:	b7d5                	j	1000129c <_timer_remove+0x2a>

100012ba <VTIMER_Init>:
100012ba:	1151                	addi	sp,sp,-12
100012bc:	c406                	sw	ra,8(sp)
100012be:	c222                	sw	s0,4(sp)
100012c0:	c026                	sw	s1,0(sp)
100012c2:	200027b7          	lui	a5,0x20002
100012c6:	2dc78793          	addi	a5,a5,732 # 200022dc <VTIMER_Context>
100012ca:	0007a023          	sw	zero,0(a5)
100012ce:	0007a223          	sw	zero,4(a5)
100012d2:	0007a423          	sw	zero,8(a5)
100012d6:	0007a623          	sw	zero,12(a5)
100012da:	0007a823          	sw	zero,16(a5)
100012de:	0007aa23          	sw	zero,20(a5)
100012e2:	0007ac23          	sw	zero,24(a5)
100012e6:	0007ae23          	sw	zero,28(a5)
100012ea:	44a1                	li	s1,8
100012ec:	40000437          	lui	s0,0x40000
100012f0:	4515                	li	a0,5
100012f2:	10000097          	auipc	ra,0x10000
100012f6:	fd6080e7          	jalr	-42(ra) # 200012c8 <VTIMER_ClkCali_Trigger>
100012fa:	03c00513          	li	a0,60
100012fe:	f000b097          	auipc	ra,0xf000b
10001302:	5d8080e7          	jalr	1496(ra) # c8d6 <delay_us>
10001306:	4785                	li	a5,1
10001308:	06f40823          	sb	a5,112(s0) # 40000070 <__StackTop+0x1fffc070>
1000130c:	10000097          	auipc	ra,0x10000
10001310:	fe4080e7          	jalr	-28(ra) # 200012f0 <VTIMER_ClkCali_Wait>
10001314:	583c                	lw	a5,112(s0)
10001316:	9bf9                	andi	a5,a5,-2
10001318:	d83c                	sw	a5,112(s0)
1000131a:	3e800513          	li	a0,1000
1000131e:	f000b097          	auipc	ra,0xf000b
10001322:	5b8080e7          	jalr	1464(ra) # c8d6 <delay_us>
10001326:	14fd                	addi	s1,s1,-1 # 3fffffff <__StackTop+0x1fffbfff>
10001328:	f4e1                	bnez	s1,100012f0 <VTIMER_Init+0x36>
1000132a:	200027b7          	lui	a5,0x20002
1000132e:	2dc78793          	addi	a5,a5,732 # 200022dc <VTIMER_Context>
10001332:	0087d703          	lhu	a4,8(a5)
10001336:	0742                	slli	a4,a4,0x10
10001338:	8341                	srli	a4,a4,0x10
1000133a:	00e79323          	sh	a4,6(a5)
1000133e:	40a2                	lw	ra,8(sp)
10001340:	4412                	lw	s0,4(sp)
10001342:	4482                	lw	s1,0(sp)
10001344:	0131                	addi	sp,sp,12
10001346:	8082                	ret

10001348 <VTIMER_IRQHandler>:
10001348:	1151                	addi	sp,sp,-12
1000134a:	c406                	sw	ra,8(sp)
1000134c:	c222                	sw	s0,4(sp)
1000134e:	c026                	sw	s1,0(sp)
10001350:	10000513          	li	a0,256
10001354:	2849                	jal	100013e6 <RTC_GetITStatus>
10001356:	e511                	bnez	a0,10001362 <VTIMER_IRQHandler+0x1a>
10001358:	40a2                	lw	ra,8(sp)
1000135a:	4412                	lw	s0,4(sp)
1000135c:	4482                	lw	s1,0(sp)
1000135e:	0131                	addi	sp,sp,12
10001360:	8082                	ret
10001362:	10000513          	li	a0,256
10001366:	2851                	jal	100013fa <RTC_ClearITPendingBit>
10001368:	a005                	j	10001388 <VTIMER_IRQHandler+0x40>
1000136a:	4448                	lw	a0,12(s0)
1000136c:	9782                	jalr	a5
1000136e:	a829                	j	10001388 <VTIMER_IRQHandler+0x40>
10001370:	409504b3          	sub	s1,a0,s1
10001374:	800007b7          	lui	a5,0x80000
10001378:	ffe7c793          	xori	a5,a5,-2
1000137c:	fc97eee3          	bltu	a5,s1,10001358 <VTIMER_IRQHandler+0x10>
10001380:	8522                	mv	a0,s0
10001382:	3dc5                	jal	10001272 <_timer_remove>
10001384:	441c                	lw	a5,8(s0)
10001386:	f3f5                	bnez	a5,1000136a <VTIMER_IRQHandler+0x22>
10001388:	200027b7          	lui	a5,0x20002
1000138c:	2dc78793          	addi	a5,a5,732 # 200022dc <VTIMER_Context>
10001390:	4380                	lw	s0,0(a5)
10001392:	d079                	beqz	s0,10001358 <VTIMER_IRQHandler+0x10>
10001394:	4044                	lw	s1,4(s0)
10001396:	2039                	jal	100013a4 <RTC_GetCurrentSysTime>
10001398:	fc957ce3          	bgeu	a0,s1,10001370 <VTIMER_IRQHandler+0x28>
1000139c:	8c89                	sub	s1,s1,a0
1000139e:	fe04c1e3          	bltz	s1,10001380 <VTIMER_IRQHandler+0x38>
100013a2:	bf5d                	j	10001358 <VTIMER_IRQHandler+0x10>

100013a4 <RTC_GetCurrentSysTime>:
100013a4:	400007b7          	lui	a5,0x40000
100013a8:	0b07a503          	lw	a0,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
100013ac:	8082                	ret

100013ae <RTC_SetTimerTarget>:
100013ae:	400007b7          	lui	a5,0x40000
100013b2:	0aa7aa23          	sw	a0,180(a5) # 400000b4 <__StackTop+0x1fffc0b4>
100013b6:	8082                	ret

100013b8 <RTC_ITConfig>:
100013b8:	c999                	beqz	a1,100013ce <RTC_ITConfig+0x16>
100013ba:	40000737          	lui	a4,0x40000
100013be:	0b875783          	lhu	a5,184(a4) # 400000b8 <__StackTop+0x1fffc0b8>
100013c2:	07c2                	slli	a5,a5,0x10
100013c4:	83c1                	srli	a5,a5,0x10
100013c6:	8d5d                	or	a0,a0,a5
100013c8:	0aa71c23          	sh	a0,184(a4)
100013cc:	8082                	ret
100013ce:	40000737          	lui	a4,0x40000
100013d2:	0b875783          	lhu	a5,184(a4) # 400000b8 <__StackTop+0x1fffc0b8>
100013d6:	07c2                	slli	a5,a5,0x10
100013d8:	83c1                	srli	a5,a5,0x10
100013da:	fff54513          	not	a0,a0
100013de:	8d7d                	and	a0,a0,a5
100013e0:	0aa71c23          	sh	a0,184(a4)
100013e4:	8082                	ret

100013e6 <RTC_GetITStatus>:
100013e6:	400007b7          	lui	a5,0x40000
100013ea:	0b87d783          	lhu	a5,184(a5) # 400000b8 <__StackTop+0x1fffc0b8>
100013ee:	00153513          	seqz	a0,a0
100013f2:	8d7d                	and	a0,a0,a5
100013f4:	00153513          	seqz	a0,a0
100013f8:	8082                	ret

100013fa <RTC_ClearITPendingBit>:
100013fa:	40000737          	lui	a4,0x40000
100013fe:	0b875783          	lhu	a5,184(a4) # 400000b8 <__StackTop+0x1fffc0b8>
10001402:	07c2                	slli	a5,a5,0x10
10001404:	83c1                	srli	a5,a5,0x10
10001406:	8fc9                	or	a5,a5,a0
10001408:	0af71c23          	sh	a5,184(a4)
1000140c:	8082                	ret

1000140e <hw_chk_and_en_irq>:
1000140e:	300027f3          	csrr	a5,mstatus
10001412:	8ba1                	andi	a5,a5,8
10001414:	e399                	bnez	a5,1000141a <hw_chk_and_en_irq+0xc>
10001416:	30046073          	csrsi	mstatus,8
1000141a:	8082                	ret

1000141c <ble_set_adv_addr>:
1000141c:	1151                	addi	sp,sp,-12
1000141e:	c406                	sw	ra,8(sp)
10001420:	2545                	jal	10001ac0 <omw_svc_set_addr>
10001422:	40a2                	lw	ra,8(sp)
10001424:	0131                	addi	sp,sp,12
10001426:	8082                	ret

10001428 <ble_set_adv_param>:
10001428:	1141                	addi	sp,sp,-16
1000142a:	c606                	sw	ra,12(sp)
1000142c:	00254383          	lbu	t2,2(a0)
10001430:	00354583          	lbu	a1,3(a0)
10001434:	05a2                	slli	a1,a1,0x8
10001436:	00054283          	lbu	t0,0(a0)
1000143a:	00154303          	lbu	t1,1(a0)
1000143e:	0322                	slli	t1,t1,0x8
10001440:	00e54783          	lbu	a5,14(a0)
10001444:	c03e                	sw	a5,0(sp)
10001446:	00d54783          	lbu	a5,13(a0)
1000144a:	00650713          	addi	a4,a0,6
1000144e:	00554683          	lbu	a3,5(a0)
10001452:	00454603          	lbu	a2,4(a0)
10001456:	0075e5b3          	or	a1,a1,t2
1000145a:	00536533          	or	a0,t1,t0
1000145e:	f0004097          	auipc	ra,0xf0004
10001462:	1c8080e7          	jalr	456(ra) # 5626 <hci_send_cmd_le_set_adv_param>
10001466:	40b2                	lw	ra,12(sp)
10001468:	0141                	addi	sp,sp,16
1000146a:	8082                	ret

1000146c <ble_adv_enable>:
1000146c:	1151                	addi	sp,sp,-12
1000146e:	c406                	sw	ra,8(sp)
10001470:	4505                	li	a0,1
10001472:	f0004097          	auipc	ra,0xf0004
10001476:	274080e7          	jalr	628(ra) # 56e6 <hci_send_cmd_le_set_adv_enable>
1000147a:	40a2                	lw	ra,8(sp)
1000147c:	0131                	addi	sp,sp,12
1000147e:	8082                	ret

10001480 <ble_set_adv_data>:
10001480:	1151                	addi	sp,sp,-12
10001482:	c406                	sw	ra,8(sp)
10001484:	f0004097          	auipc	ra,0xf0004
10001488:	20e080e7          	jalr	526(ra) # 5692 <hci_send_cmd_le_set_adv_data>
1000148c:	40a2                	lw	ra,8(sp)
1000148e:	0131                	addi	sp,sp,12
10001490:	8082                	ret

10001492 <ble_set_scan_rsp_data>:
10001492:	1151                	addi	sp,sp,-12
10001494:	c406                	sw	ra,8(sp)
10001496:	f0004097          	auipc	ra,0xf0004
1000149a:	226080e7          	jalr	550(ra) # 56bc <hci_send_cmd_le_set_scan_rsp_data>
1000149e:	40a2                	lw	ra,8(sp)
100014a0:	0131                	addi	sp,sp,12
100014a2:	8082                	ret

100014a4 <ble_user_service_add>:
100014a4:	200027b7          	lui	a5,0x20002
100014a8:	31c7c303          	lbu	t1,796(a5) # 2000231c <user_service_num>
100014ac:	479d                	li	a5,7
100014ae:	0667e663          	bltu	a5,t1,1000151a <ble_user_service_add+0x76>
100014b2:	861a                	mv	a2,t1
100014b4:	02605663          	blez	t1,100014e0 <ble_user_service_add+0x3c>
100014b8:	200027b7          	lui	a5,0x20002
100014bc:	2fc7a783          	lw	a5,764(a5) # 200022fc <user_service_list>
100014c0:	04f50f63          	beq	a0,a5,1000151e <ble_user_service_add+0x7a>
100014c4:	200027b7          	lui	a5,0x20002
100014c8:	2fc78793          	addi	a5,a5,764 # 200022fc <user_service_list>
100014cc:	4701                	li	a4,0
100014ce:	0705                	addi	a4,a4,1
100014d0:	00c70863          	beq	a4,a2,100014e0 <ble_user_service_add+0x3c>
100014d4:	0791                	addi	a5,a5,4
100014d6:	4394                	lw	a3,0(a5)
100014d8:	fea69be3          	bne	a3,a0,100014ce <ble_user_service_add+0x2a>
100014dc:	557d                	li	a0,-1
100014de:	8082                	ret
100014e0:	1151                	addi	sp,sp,-12
100014e2:	c406                	sw	ra,8(sp)
100014e4:	87aa                	mv	a5,a0
100014e6:	00130513          	addi	a0,t1,1
100014ea:	0ff57513          	zext.b	a0,a0
100014ee:	20002737          	lui	a4,0x20002
100014f2:	30a70e23          	sb	a0,796(a4) # 2000231c <user_service_num>
100014f6:	200025b7          	lui	a1,0x20002
100014fa:	2fc58713          	addi	a4,a1,764 # 200022fc <user_service_list>
100014fe:	030a                	slli	t1,t1,0x2
10001500:	933a                	add	t1,t1,a4
10001502:	00f32023          	sw	a5,0(t1)
10001506:	2fc58593          	addi	a1,a1,764
1000150a:	f0006097          	auipc	ra,0xf0006
1000150e:	230080e7          	jalr	560(ra) # 773a <bt_gatt_service_init>
10001512:	4501                	li	a0,0
10001514:	40a2                	lw	ra,8(sp)
10001516:	0131                	addi	sp,sp,12
10001518:	8082                	ret
1000151a:	5579                	li	a0,-2
1000151c:	8082                	ret
1000151e:	557d                	li	a0,-1
10001520:	8082                	ret

10001522 <ble_event_callback>:
10001522:	1151                	addi	sp,sp,-12
10001524:	c406                	sw	ra,8(sp)
10001526:	f0006097          	auipc	ra,0xf0006
1000152a:	83e080e7          	jalr	-1986(ra) # 6d64 <bt_conn_cb_register>
1000152e:	40a2                	lw	ra,8(sp)
10001530:	0131                	addi	sp,sp,12
10001532:	8082                	ret

10001534 <ble_host_init>:
10001534:	1151                	addi	sp,sp,-12
10001536:	c406                	sw	ra,8(sp)
10001538:	e08007b7          	lui	a5,0xe0800
1000153c:	43dc                	lw	a5,4(a5)
1000153e:	83d5                	srli	a5,a5,0x15
10001540:	8bbd                	andi	a5,a5,15
10001542:	46a1                	li	a3,8
10001544:	8e9d                	sub	a3,a3,a5
10001546:	e0801737          	lui	a4,0xe0801
1000154a:	09774783          	lbu	a5,151(a4) # e0801097 <__StackTop+0xc07fd097>
1000154e:	0ff7f613          	zext.b	a2,a5
10001552:	0ff00793          	li	a5,255
10001556:	00d797b3          	sll	a5,a5,a3
1000155a:	fff7c793          	not	a5,a5
1000155e:	8ff1                	and	a5,a5,a2
10001560:	460d                	li	a2,3
10001562:	00d616b3          	sll	a3,a2,a3
10001566:	8fd5                	or	a5,a5,a3
10001568:	0ff7f793          	zext.b	a5,a5
1000156c:	08f70ba3          	sb	a5,151(a4)
10001570:	09574783          	lbu	a5,149(a4)
10001574:	0ff7f793          	zext.b	a5,a5
10001578:	0017e793          	ori	a5,a5,1
1000157c:	08f70aa3          	sb	a5,149(a4)
10001580:	2329                	jal	10001a8a <hci_driver_init>
10001582:	400007b7          	lui	a5,0x40000
10001586:	53d8                	lw	a4,36(a5)
10001588:	00875793          	srli	a5,a4,0x8
1000158c:	0027f693          	andi	a3,a5,2
10001590:	c689                	beqz	a3,1000159a <ble_host_init+0x66>
10001592:	8b8d                	andi	a5,a5,3
10001594:	4689                	li	a3,2
10001596:	00d78563          	beq	a5,a3,100015a0 <ble_host_init+0x6c>
1000159a:	40a2                	lw	ra,8(sp)
1000159c:	0131                	addi	sp,sp,12
1000159e:	8082                	ret
100015a0:	8311                	srli	a4,a4,0x4
100015a2:	8b0d                	andi	a4,a4,3
100015a4:	478d                	li	a5,3
100015a6:	fef71ae3          	bne	a4,a5,1000159a <ble_host_init+0x66>
100015aa:	20000737          	lui	a4,0x20000
100015ae:	4b675783          	lhu	a5,1206(a4) # 200004b6 <ll_gap_time>
100015b2:	0791                	addi	a5,a5,4 # 40000004 <__StackTop+0x1fffc004>
100015b4:	4af71b23          	sh	a5,1206(a4)
100015b8:	20003737          	lui	a4,0x20003
100015bc:	b5875783          	lhu	a5,-1192(a4) # 20002b58 <ll_gap_time_1m>
100015c0:	0791                	addi	a5,a5,4
100015c2:	b4f71c23          	sh	a5,-1192(a4)
100015c6:	bfd1                	j	1000159a <ble_host_init+0x66>

100015c8 <ble_host_work_polling>:
100015c8:	1151                	addi	sp,sp,-12
100015ca:	c406                	sw	ra,8(sp)
100015cc:	3d5010ef          	jal	100031a0 <bt_polling_work_ext>
100015d0:	2679                	jal	1000195e <bt_att_tx_polling>
100015d2:	3d35                	jal	1000140e <hw_chk_and_en_irq>
100015d4:	40a2                	lw	ra,8(sp)
100015d6:	0131                	addi	sp,sp,12
100015d8:	8082                	ret

100015da <ble_2g4_init>:
100015da:	1151                	addi	sp,sp,-12
100015dc:	c406                	sw	ra,8(sp)
100015de:	315000ef          	jal	100020f2 <omw_svc_coe_init>
100015e2:	40a2                	lw	ra,8(sp)
100015e4:	0131                	addi	sp,sp,12
100015e6:	8082                	ret

100015e8 <omw_clkcal_delayus>:
100015e8:	41f55793          	srai	a5,a0,0x1f
100015ec:	8bfd                	andi	a5,a5,31
100015ee:	97aa                	add	a5,a5,a0
100015f0:	40000737          	lui	a4,0x40000
100015f4:	0b072703          	lw	a4,176(a4) # 400000b0 <__StackTop+0x1fffc0b0>
100015f8:	8795                	srai	a5,a5,0x5
100015fa:	4689                	li	a3,2
100015fc:	00d7f363          	bgeu	a5,a3,10001602 <omw_clkcal_delayus+0x1a>
10001600:	4789                	li	a5,2
10001602:	97ba                	add	a5,a5,a4
10001604:	400006b7          	lui	a3,0x40000
10001608:	0b06a703          	lw	a4,176(a3) # 400000b0 <__StackTop+0x1fffc0b0>
1000160c:	fef76ee3          	bltu	a4,a5,10001608 <omw_clkcal_delayus+0x20>
10001610:	8082                	ret

10001612 <omw_clkcal_reset>:
10001612:	1151                	addi	sp,sp,-12
10001614:	c406                	sw	ra,8(sp)
10001616:	c222                	sw	s0,4(sp)
10001618:	40000437          	lui	s0,0x40000
1000161c:	07044783          	lbu	a5,112(s0) # 40000070 <__StackTop+0x1fffc070>
10001620:	0ff7f793          	zext.b	a5,a5
10001624:	0027e793          	ori	a5,a5,2
10001628:	06f40823          	sb	a5,112(s0)
1000162c:	06400513          	li	a0,100
10001630:	3f65                	jal	100015e8 <omw_clkcal_delayus>
10001632:	07044783          	lbu	a5,112(s0)
10001636:	0fd7f793          	andi	a5,a5,253
1000163a:	06f40823          	sb	a5,112(s0)
1000163e:	06400513          	li	a0,100
10001642:	375d                	jal	100015e8 <omw_clkcal_delayus>
10001644:	40a2                	lw	ra,8(sp)
10001646:	4412                	lw	s0,4(sp)
10001648:	0131                	addi	sp,sp,12
1000164a:	8082                	ret

1000164c <omw_clkcal_init>:
1000164c:	40000737          	lui	a4,0x40000
10001650:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
10001654:	0fe7f793          	andi	a5,a5,254
10001658:	068a                	slli	a3,a3,0x2
1000165a:	8edd                	or	a3,a3,a5
1000165c:	0ff6f693          	zext.b	a3,a3
10001660:	06d70823          	sb	a3,112(a4)
10001664:	ffd57713          	andi	a4,a0,-3
10001668:	4785                	li	a5,1
1000166a:	00f70a63          	beq	a4,a5,1000167e <omw_clkcal_init+0x32>
1000166e:	4785                	li	a5,1
10001670:	00a79533          	sll	a0,a5,a0
10001674:	0522                	slli	a0,a0,0x8
10001676:	00b795b3          	sll	a1,a5,a1
1000167a:	8dc9                	or	a1,a1,a0
1000167c:	a039                	j	1000168a <omw_clkcal_init+0x3e>
1000167e:	00b795b3          	sll	a1,a5,a1
10001682:	05a2                	slli	a1,a1,0x8
10001684:	00a79533          	sll	a0,a5,a0
10001688:	8dc9                	or	a1,a1,a0
1000168a:	05c2                	slli	a1,a1,0x10
1000168c:	81c1                	srli	a1,a1,0x10
1000168e:	400007b7          	lui	a5,0x40000
10001692:	06b79a23          	sh	a1,116(a5) # 40000074 <__StackTop+0x1fffc074>
10001696:	dfb0                	sw	a2,120(a5)
10001698:	8082                	ret

1000169a <omw_clkcal_enable>:
1000169a:	400007b7          	lui	a5,0x40000
1000169e:	0707c703          	lbu	a4,112(a5) # 40000070 <__StackTop+0x1fffc070>
100016a2:	0ff77713          	zext.b	a4,a4
100016a6:	00176793          	ori	a5,a4,1
100016aa:	e119                	bnez	a0,100016b0 <omw_clkcal_enable+0x16>
100016ac:	ffe77793          	andi	a5,a4,-2
100016b0:	0ff7f793          	zext.b	a5,a5
100016b4:	40000737          	lui	a4,0x40000
100016b8:	06f70823          	sb	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
100016bc:	8082                	ret

100016be <omw_clkcal_calpol>:
100016be:	1151                	addi	sp,sp,-12
100016c0:	c406                	sw	ra,8(sp)
100016c2:	4681                	li	a3,0
100016c4:	3761                	jal	1000164c <omw_clkcal_init>
100016c6:	37b1                	jal	10001612 <omw_clkcal_reset>
100016c8:	4505                	li	a0,1
100016ca:	3fc1                	jal	1000169a <omw_clkcal_enable>
100016cc:	40000737          	lui	a4,0x40000
100016d0:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
100016d4:	8bc1                	andi	a5,a5,16
100016d6:	dfed                	beqz	a5,100016d0 <omw_clkcal_calpol+0x12>
100016d8:	400007b7          	lui	a5,0x40000
100016dc:	5fe8                	lw	a0,124(a5)
100016de:	40a2                	lw	ra,8(sp)
100016e0:	0131                	addi	sp,sp,12
100016e2:	8082                	ret

100016e4 <omw_clkcal_rc24m_calibration>:
100016e4:	1111                	addi	sp,sp,-28
100016e6:	cc06                	sw	ra,24(sp)
100016e8:	ca22                	sw	s0,20(sp)
100016ea:	c826                	sw	s1,16(sp)
100016ec:	400807b7          	lui	a5,0x40080
100016f0:	1087a403          	lw	s0,264(a5) # 40080108 <__StackTop+0x2007c108>
100016f4:	8421                	srai	s0,s0,0x8
100016f6:	0ff47413          	zext.b	s0,s0
100016fa:	0ff00493          	li	s1,255
100016fe:	c002                	sw	zero,0(sp)
10001700:	100007b7          	lui	a5,0x10000
10001704:	17fd                	addi	a5,a5,-1 # fffffff <__FLASH_SIZE+0xffbffff>
10001706:	c43e                	sw	a5,8(sp)
10001708:	c63e                	sw	a5,12(sp)
1000170a:	fffc57b7          	lui	a5,0xfffc5
1000170e:	68078793          	addi	a5,a5,1664 # fffc5680 <__StackTop+0xdffc1680>
10001712:	c23e                	sw	a5,4(sp)
10001714:	a82d                	j	1000174e <omw_clkcal_rc24m_calibration+0x6a>
10001716:	4782                	lw	a5,0(sp)
10001718:	40f40733          	sub	a4,s0,a5
1000171c:	01f75793          	srli	a5,a4,0x1f
10001720:	97ba                	add	a5,a5,a4
10001722:	8785                	srai	a5,a5,0x1
10001724:	84a2                	mv	s1,s0
10001726:	8c1d                	sub	s0,s0,a5
10001728:	c42a                	sw	a0,8(sp)
1000172a:	4782                	lw	a5,0(sp)
1000172c:	04f40663          	beq	s0,a5,10001778 <omw_clkcal_rc24m_calibration+0x94>
10001730:	04940463          	beq	s0,s1,10001778 <omw_clkcal_rc24m_calibration+0x94>
10001734:	400806b7          	lui	a3,0x40080
10001738:	1086a783          	lw	a5,264(a3) # 40080108 <__StackTop+0x2007c108>
1000173c:	7741                	lui	a4,0xffff0
1000173e:	0ff70713          	addi	a4,a4,255 # ffff00ff <__StackTop+0xdffec0ff>
10001742:	8f7d                	and	a4,a4,a5
10001744:	00841793          	slli	a5,s0,0x8
10001748:	8fd9                	or	a5,a5,a4
1000174a:	10f6a423          	sw	a5,264(a3)
1000174e:	0003b637          	lui	a2,0x3b
10001752:	98060613          	addi	a2,a2,-1664 # 3a980 <memset+0x2dfb4>
10001756:	4585                	li	a1,1
10001758:	450d                	li	a0,3
1000175a:	3795                	jal	100016be <omw_clkcal_calpol>
1000175c:	4792                	lw	a5,4(sp)
1000175e:	953e                	add	a0,a0,a5
10001760:	faa04be3          	bgtz	a0,10001716 <omw_clkcal_rc24m_calibration+0x32>
10001764:	40848733          	sub	a4,s1,s0
10001768:	01f75793          	srli	a5,a4,0x1f
1000176c:	97ba                	add	a5,a5,a4
1000176e:	8785                	srai	a5,a5,0x1
10001770:	c022                	sw	s0,0(sp)
10001772:	943e                	add	s0,s0,a5
10001774:	c62a                	sw	a0,12(sp)
10001776:	bf55                	j	1000172a <omw_clkcal_rc24m_calibration+0x46>
10001778:	4732                	lw	a4,12(sp)
1000177a:	41f75793          	srai	a5,a4,0x1f
1000177e:	8f3d                	xor	a4,a4,a5
10001780:	8f1d                	sub	a4,a4,a5
10001782:	47a2                	lw	a5,8(sp)
10001784:	41f7d693          	srai	a3,a5,0x1f
10001788:	8fb5                	xor	a5,a5,a3
1000178a:	8f95                	sub	a5,a5,a3
1000178c:	00e7c363          	blt	a5,a4,10001792 <omw_clkcal_rc24m_calibration+0xae>
10001790:	4482                	lw	s1,0(sp)
10001792:	06800513          	li	a0,104
10001796:	02a48533          	mul	a0,s1,a0
1000179a:	6791                	lui	a5,0x4
1000179c:	51078793          	addi	a5,a5,1296 # 4510 <ll_parse_ctrl+0x36c>
100017a0:	953e                	add	a0,a0,a5
100017a2:	021020ef          	jal	10003fc2 <__floatsidf>
100017a6:	100047b7          	lui	a5,0x10004
100017aa:	5487a603          	lw	a2,1352(a5) # 10004548 <attr_user_ble_service+0x78>
100017ae:	54c7a683          	lw	a3,1356(a5)
100017b2:	46f010ef          	jal	10003420 <__divdf3>
100017b6:	100047b7          	lui	a5,0x10004
100017ba:	5507a603          	lw	a2,1360(a5) # 10004550 <attr_user_ble_service+0x80>
100017be:	5547a683          	lw	a3,1364(a5)
100017c2:	1c4020ef          	jal	10003986 <__subdf3>
100017c6:	796020ef          	jal	10003f5c <__fixdfsi>
100017ca:	0ff00793          	li	a5,255
100017ce:	00a7d463          	bge	a5,a0,100017d6 <omw_clkcal_rc24m_calibration+0xf2>
100017d2:	0ff00513          	li	a0,255
100017d6:	400807b7          	lui	a5,0x40080
100017da:	1087a783          	lw	a5,264(a5) # 40080108 <__StackTop+0x2007c108>
100017de:	0ff00713          	li	a4,255
100017e2:	00975463          	bge	a4,s1,100017ea <omw_clkcal_rc24m_calibration+0x106>
100017e6:	0ff00493          	li	s1,255
100017ea:	fff4c713          	not	a4,s1
100017ee:	877d                	srai	a4,a4,0x1f
100017f0:	8cf9                	and	s1,s1,a4
100017f2:	04a2                	slli	s1,s1,0x8
100017f4:	ff000737          	lui	a4,0xff000
100017f8:	0ff70713          	addi	a4,a4,255 # ff0000ff <__StackTop+0xdeffc0ff>
100017fc:	8ff9                	and	a5,a5,a4
100017fe:	8cdd                	or	s1,s1,a5
10001800:	fff54793          	not	a5,a0
10001804:	87fd                	srai	a5,a5,0x1f
10001806:	8d7d                	and	a0,a0,a5
10001808:	0542                	slli	a0,a0,0x10
1000180a:	8cc9                	or	s1,s1,a0
1000180c:	400807b7          	lui	a5,0x40080
10001810:	1097a423          	sw	s1,264(a5) # 40080108 <__StackTop+0x2007c108>
10001814:	4501                	li	a0,0
10001816:	3551                	jal	1000169a <omw_clkcal_enable>
10001818:	3bed                	jal	10001612 <omw_clkcal_reset>
1000181a:	40e2                	lw	ra,24(sp)
1000181c:	4452                	lw	s0,20(sp)
1000181e:	44c2                	lw	s1,16(sp)
10001820:	0171                	addi	sp,sp,28
10001822:	8082                	ret

10001824 <omw_clkcal_rc32k_calibration>:
10001824:	1111                	addi	sp,sp,-28
10001826:	cc06                	sw	ra,24(sp)
10001828:	ca22                	sw	s0,20(sp)
1000182a:	c826                	sw	s1,16(sp)
1000182c:	400807b7          	lui	a5,0x40080
10001830:	10c7d403          	lhu	s0,268(a5) # 4008010c <__StackTop+0x2007c10c>
10001834:	801d                	srli	s0,s0,0x7
10001836:	0ff47413          	zext.b	s0,s0
1000183a:	0ff00793          	li	a5,255
1000183e:	c03e                	sw	a5,0(sp)
10001840:	4481                	li	s1,0
10001842:	100007b7          	lui	a5,0x10000
10001846:	17fd                	addi	a5,a5,-1 # fffffff <__FLASH_SIZE+0xffbffff>
10001848:	c43e                	sw	a5,8(sp)
1000184a:	c63e                	sw	a5,12(sp)
1000184c:	fffc57b7          	lui	a5,0xfffc5
10001850:	68078793          	addi	a5,a5,1664 # fffc5680 <__StackTop+0xdffc1680>
10001854:	c23e                	sw	a5,4(sp)
10001856:	a081                	j	10001896 <omw_clkcal_rc32k_calibration+0x72>
10001858:	40940733          	sub	a4,s0,s1
1000185c:	01f75793          	srli	a5,a4,0x1f
10001860:	97ba                	add	a5,a5,a4
10001862:	8785                	srai	a5,a5,0x1
10001864:	c022                	sw	s0,0(sp)
10001866:	8c1d                	sub	s0,s0,a5
10001868:	c42a                	sw	a0,8(sp)
1000186a:	04940a63          	beq	s0,s1,100018be <omw_clkcal_rc32k_calibration+0x9a>
1000186e:	4782                	lw	a5,0(sp)
10001870:	04f40763          	beq	s0,a5,100018be <omw_clkcal_rc32k_calibration+0x9a>
10001874:	400806b7          	lui	a3,0x40080
10001878:	10c6d783          	lhu	a5,268(a3) # 4008010c <__StackTop+0x2007c10c>
1000187c:	07c2                	slli	a5,a5,0x10
1000187e:	83c1                	srli	a5,a5,0x10
10001880:	7761                	lui	a4,0xffff8
10001882:	07f70713          	addi	a4,a4,127 # ffff807f <__StackTop+0xdfff407f>
10001886:	8f7d                	and	a4,a4,a5
10001888:	00741793          	slli	a5,s0,0x7
1000188c:	8fd9                	or	a5,a5,a4
1000188e:	07c2                	slli	a5,a5,0x10
10001890:	83c1                	srli	a5,a5,0x10
10001892:	10f69623          	sh	a5,268(a3)
10001896:	14700613          	li	a2,327
1000189a:	4581                	li	a1,0
1000189c:	450d                	li	a0,3
1000189e:	3505                	jal	100016be <omw_clkcal_calpol>
100018a0:	4792                	lw	a5,4(sp)
100018a2:	953e                	add	a0,a0,a5
100018a4:	faa04ae3          	bgtz	a0,10001858 <omw_clkcal_rc32k_calibration+0x34>
100018a8:	4782                	lw	a5,0(sp)
100018aa:	40878733          	sub	a4,a5,s0
100018ae:	01f75793          	srli	a5,a4,0x1f
100018b2:	97ba                	add	a5,a5,a4
100018b4:	8785                	srai	a5,a5,0x1
100018b6:	84a2                	mv	s1,s0
100018b8:	943e                	add	s0,s0,a5
100018ba:	c62a                	sw	a0,12(sp)
100018bc:	b77d                	j	1000186a <omw_clkcal_rc32k_calibration+0x46>
100018be:	4732                	lw	a4,12(sp)
100018c0:	41f75793          	srai	a5,a4,0x1f
100018c4:	8f3d                	xor	a4,a4,a5
100018c6:	8f1d                	sub	a4,a4,a5
100018c8:	47a2                	lw	a5,8(sp)
100018ca:	41f7d693          	srai	a3,a5,0x1f
100018ce:	8fb5                	xor	a5,a5,a3
100018d0:	8f95                	sub	a5,a5,a3
100018d2:	00e7c363          	blt	a5,a4,100018d8 <omw_clkcal_rc32k_calibration+0xb4>
100018d6:	c026                	sw	s1,0(sp)
100018d8:	400806b7          	lui	a3,0x40080
100018dc:	10c6d783          	lhu	a5,268(a3) # 4008010c <__StackTop+0x2007c10c>
100018e0:	07c2                	slli	a5,a5,0x10
100018e2:	83c1                	srli	a5,a5,0x10
100018e4:	7761                	lui	a4,0xffff8
100018e6:	07f70713          	addi	a4,a4,127 # ffff807f <__StackTop+0xdfff407f>
100018ea:	8f7d                	and	a4,a4,a5
100018ec:	4782                	lw	a5,0(sp)
100018ee:	079e                	slli	a5,a5,0x7
100018f0:	8fd9                	or	a5,a5,a4
100018f2:	07c2                	slli	a5,a5,0x10
100018f4:	83c1                	srli	a5,a5,0x10
100018f6:	10f69623          	sh	a5,268(a3)
100018fa:	4501                	li	a0,0
100018fc:	3b79                	jal	1000169a <omw_clkcal_enable>
100018fe:	3b11                	jal	10001612 <omw_clkcal_reset>
10001900:	40e2                	lw	ra,24(sp)
10001902:	4452                	lw	s0,20(sp)
10001904:	44c2                	lw	s1,16(sp)
10001906:	0171                	addi	sp,sp,28
10001908:	8082                	ret

1000190a <ll_conn_set_conn_buf>:
1000190a:	200007b7          	lui	a5,0x20000
1000190e:	4709                	li	a4,2
10001910:	76e78223          	sb	a4,1892(a5) # 20000764 <ble_max_conn_nr>
10001914:	20000737          	lui	a4,0x20000
10001918:	200027b7          	lui	a5,0x20002
1000191c:	32078793          	addi	a5,a5,800 # 20002320 <ll_conn_buf>
10001920:	76f72823          	sw	a5,1904(a4) # 20000770 <ll_conn>
10001924:	8082                	ret

10001926 <bt_att_set_att_info_buf>:
10001926:	1151                	addi	sp,sp,-12
10001928:	c406                	sw	ra,8(sp)
1000192a:	20002537          	lui	a0,0x20002
1000192e:	53850713          	addi	a4,a0,1336 # 20002538 <att_info_buf>
10001932:	200017b7          	lui	a5,0x20001
10001936:	82e7ac23          	sw	a4,-1992(a5) # 20000838 <att_info>
1000193a:	200007b7          	lui	a5,0x20000
1000193e:	7647c783          	lbu	a5,1892(a5) # 20000764 <ble_max_conn_nr>
10001942:	00379613          	slli	a2,a5,0x3
10001946:	8e1d                	sub	a2,a2,a5
10001948:	060a                	slli	a2,a2,0x2
1000194a:	4581                	li	a1,0
1000194c:	53850513          	addi	a0,a0,1336
10001950:	f000b097          	auipc	ra,0xf000b
10001954:	07c080e7          	jalr	124(ra) # c9cc <memset>
10001958:	40a2                	lw	ra,8(sp)
1000195a:	0131                	addi	sp,sp,12
1000195c:	8082                	ret

1000195e <bt_att_tx_polling>:
1000195e:	200007b7          	lui	a5,0x20000
10001962:	7647c783          	lbu	a5,1892(a5) # 20000764 <ble_max_conn_nr>
10001966:	cba5                	beqz	a5,100019d6 <bt_att_tx_polling+0x78>
10001968:	1131                	addi	sp,sp,-20
1000196a:	c806                	sw	ra,16(sp)
1000196c:	c622                	sw	s0,12(sp)
1000196e:	c426                	sw	s1,8(sp)
10001970:	4481                	li	s1,0
10001972:	c002                	sw	zero,0(sp)
10001974:	a831                	j	10001990 <bt_att_tx_polling+0x32>
10001976:	c85c                	sw	a5,20(s0)
10001978:	a81d                	j	100019ae <bt_att_tx_polling+0x50>
1000197a:	4782                	lw	a5,0(sp)
1000197c:	00178713          	addi	a4,a5,1
10001980:	c03a                	sw	a4,0(sp)
10001982:	04f1                	addi	s1,s1,28
10001984:	200007b7          	lui	a5,0x20000
10001988:	7647c783          	lbu	a5,1892(a5) # 20000764 <ble_max_conn_nr>
1000198c:	04f75063          	bge	a4,a5,100019cc <bt_att_tx_polling+0x6e>
10001990:	200017b7          	lui	a5,0x20001
10001994:	8387a403          	lw	s0,-1992(a5) # 20000838 <att_info>
10001998:	9426                	add	s0,s0,s1
1000199a:	401c                	lw	a5,0(s0)
1000199c:	dff9                	beqz	a5,1000197a <bt_att_tx_polling+0x1c>
1000199e:	4814                	lw	a3,16(s0)
100019a0:	c236                	sw	a3,4(sp)
100019a2:	dee1                	beqz	a3,1000197a <bt_att_tx_polling+0x1c>
100019a4:	429c                	lw	a5,0(a3)
100019a6:	c81c                	sw	a5,16(s0)
100019a8:	4858                	lw	a4,20(s0)
100019aa:	fce686e3          	beq	a3,a4,10001976 <bt_att_tx_polling+0x18>
100019ae:	4592                	lw	a1,4(sp)
100019b0:	8522                	mv	a0,s0
100019b2:	f0004097          	auipc	ra,0xf0004
100019b6:	370080e7          	jalr	880(ra) # 5d22 <att_send>
100019ba:	d161                	beqz	a0,1000197a <bt_att_tx_polling+0x1c>
100019bc:	481c                	lw	a5,16(s0)
100019be:	4712                	lw	a4,4(sp)
100019c0:	c31c                	sw	a5,0(a4)
100019c2:	c818                	sw	a4,16(s0)
100019c4:	485c                	lw	a5,20(s0)
100019c6:	fbd5                	bnez	a5,1000197a <bt_att_tx_polling+0x1c>
100019c8:	c858                	sw	a4,20(s0)
100019ca:	bf45                	j	1000197a <bt_att_tx_polling+0x1c>
100019cc:	40c2                	lw	ra,16(sp)
100019ce:	4432                	lw	s0,12(sp)
100019d0:	44a2                	lw	s1,8(sp)
100019d2:	0151                	addi	sp,sp,20
100019d4:	8082                	ret
100019d6:	8082                	ret

100019d8 <bt_conn_set_acl_conns_buf>:
100019d8:	1151                	addi	sp,sp,-12
100019da:	c406                	sw	ra,8(sp)
100019dc:	20002537          	lui	a0,0x20002
100019e0:	57050713          	addi	a4,a0,1392 # 20002570 <acl_conns_buf>
100019e4:	200017b7          	lui	a5,0x20001
100019e8:	82e7ae23          	sw	a4,-1988(a5) # 2000083c <acl_conns>
100019ec:	200007b7          	lui	a5,0x20000
100019f0:	7647c603          	lbu	a2,1892(a5) # 20000764 <ble_max_conn_nr>
100019f4:	07400793          	li	a5,116
100019f8:	02f60633          	mul	a2,a2,a5
100019fc:	4581                	li	a1,0
100019fe:	57050513          	addi	a0,a0,1392
10001a02:	f000b097          	auipc	ra,0xf000b
10001a06:	fca080e7          	jalr	-54(ra) # c9cc <memset>
10001a0a:	40a2                	lw	ra,8(sp)
10001a0c:	0131                	addi	sp,sp,12
10001a0e:	8082                	ret

10001a10 <bt_buf_init>:
10001a10:	1151                	addi	sp,sp,-12
10001a12:	c406                	sw	ra,8(sp)
10001a14:	200007b7          	lui	a5,0x20000
10001a18:	0ff00713          	li	a4,255
10001a1c:	4ae79a23          	sh	a4,1204(a5) # 200004b4 <bt_buf_max_len>
10001a20:	200007b7          	lui	a5,0x20000
10001a24:	4ac78793          	addi	a5,a5,1196 # 200004ac <bt_buf_cnt_info>
10001a28:	470d                	li	a4,3
10001a2a:	00e78023          	sb	a4,0(a5)
10001a2e:	00e78123          	sb	a4,2(a5)
10001a32:	4715                	li	a4,5
10001a34:	00e78223          	sb	a4,4(a5)
10001a38:	00e78323          	sb	a4,6(a5)
10001a3c:	8189                	srli	a1,a1,0x2
10001a3e:	f000b097          	auipc	ra,0xf000b
10001a42:	870080e7          	jalr	-1936(ra) # c2ae <simple_buf_init_buf>
10001a46:	40a2                	lw	ra,8(sp)
10001a48:	0131                	addi	sp,sp,12
10001a4a:	8082                	ret

10001a4c <bt_buf_init_ext>:
10001a4c:	1151                	addi	sp,sp,-12
10001a4e:	c406                	sw	ra,8(sp)
10001a50:	200007b7          	lui	a5,0x20000
10001a54:	472d                	li	a4,11
10001a56:	2ce78423          	sb	a4,712(a5) # 200002c8 <ll_ver_nr>
10001a5a:	20000737          	lui	a4,0x20000
10001a5e:	6785                	lui	a5,0x1
10001a60:	b2478793          	addi	a5,a5,-1244 # b24 <__STACK_SIZE+0x724>
10001a64:	2af71e23          	sh	a5,700(a4) # 200002bc <ll_company_id>
10001a68:	20000737          	lui	a4,0x20000
10001a6c:	77ed                	lui	a5,0xffffb
10001a6e:	bcd78793          	addi	a5,a5,-1075 # ffffabcd <__StackTop+0xdfff6bcd>
10001a72:	2cf71323          	sh	a5,710(a4) # 200002c6 <ll_subv_nr>
10001a76:	50000593          	li	a1,1280
10001a7a:	20002537          	lui	a0,0x20002
10001a7e:	65850513          	addi	a0,a0,1624 # 20002658 <__dyn_ram>
10001a82:	3779                	jal	10001a10 <bt_buf_init>
10001a84:	40a2                	lw	ra,8(sp)
10001a86:	0131                	addi	sp,sp,12
10001a88:	8082                	ret

10001a8a <hci_driver_init>:
10001a8a:	1151                	addi	sp,sp,-12
10001a8c:	c406                	sw	ra,8(sp)
10001a8e:	10004537          	lui	a0,0x10004
10001a92:	55850513          	addi	a0,a0,1368 # 10004558 <drv>
10001a96:	f0007097          	auipc	ra,0xf0007
10001a9a:	57e080e7          	jalr	1406(ra) # 9014 <bt_hci_driver_register>
10001a9e:	40a2                	lw	ra,8(sp)
10001aa0:	0131                	addi	sp,sp,12
10001aa2:	8082                	ret

10001aa4 <bt_storage_kv_flash_init>:
10001aa4:	8082                	ret

10001aa6 <bt_smp_recv>:
10001aa6:	4501                	li	a0,0
10001aa8:	8082                	ret

10001aaa <bt_smp_connected>:
10001aaa:	8082                	ret

10001aac <bt_smp_disconnected>:
10001aac:	8082                	ret

10001aae <bt_smp_encrypt_change>:
10001aae:	8082                	ret

10001ab0 <bt_smp_start_security>:
10001ab0:	4501                	li	a0,0
10001ab2:	8082                	ret

10001ab4 <bt_smp_update_keys>:
10001ab4:	8082                	ret

10001ab6 <bt_smp_request_ltk>:
10001ab6:	4501                	li	a0,0
10001ab8:	8082                	ret

10001aba <bt_keys_find_addr>:
10001aba:	4501                	li	a0,0
10001abc:	8082                	ret

10001abe <sys_timeout_work>:
10001abe:	8082                	ret

10001ac0 <omw_svc_set_addr>:
10001ac0:	200017b7          	lui	a5,0x20001
10001ac4:	bc078793          	addi	a5,a5,-1088 # 20000bc0 <bdaddr>
10001ac8:	00554703          	lbu	a4,5(a0)
10001acc:	00e78023          	sb	a4,0(a5)
10001ad0:	00454703          	lbu	a4,4(a0)
10001ad4:	00e780a3          	sb	a4,1(a5)
10001ad8:	00354703          	lbu	a4,3(a0)
10001adc:	00e78123          	sb	a4,2(a5)
10001ae0:	00254703          	lbu	a4,2(a0)
10001ae4:	00e781a3          	sb	a4,3(a5)
10001ae8:	00154703          	lbu	a4,1(a0)
10001aec:	00e78223          	sb	a4,4(a5)
10001af0:	00054703          	lbu	a4,0(a0)
10001af4:	00e782a3          	sb	a4,5(a5)
10001af8:	8082                	ret

10001afa <bt_base_init>:
10001afa:	1151                	addi	sp,sp,-12
10001afc:	c406                	sw	ra,8(sp)
10001afe:	c222                	sw	s0,4(sp)
10001b00:	842a                	mv	s0,a0
10001b02:	20000737          	lui	a4,0x20000
10001b06:	200017b7          	lui	a5,0x20001
10001b0a:	37a78793          	addi	a5,a5,890 # 2000137a <RADIO_CommonDescInit_SetFreq>
10001b0e:	3ef72223          	sw	a5,996(a4) # 200003e4 <RADIO_CommonDescInit_SetFreq_ptr>
10001b12:	20000737          	lui	a4,0x20000
10001b16:	100027b7          	lui	a5,0x10002
10001b1a:	aa478793          	addi	a5,a5,-1372 # 10001aa4 <bt_storage_kv_flash_init>
10001b1e:	40f72423          	sw	a5,1032(a4) # 20000408 <bt_storage_kv_flash_init_ptr>
10001b22:	20000737          	lui	a4,0x20000
10001b26:	100027b7          	lui	a5,0x10002
10001b2a:	aa678793          	addi	a5,a5,-1370 # 10001aa6 <bt_smp_recv>
10001b2e:	3ef72c23          	sw	a5,1016(a4) # 200003f8 <bt_smp_recv_ptr>
10001b32:	20000737          	lui	a4,0x20000
10001b36:	100027b7          	lui	a5,0x10002
10001b3a:	aaa78793          	addi	a5,a5,-1366 # 10001aaa <bt_smp_connected>
10001b3e:	3ef72623          	sw	a5,1004(a4) # 200003ec <bt_smp_connected_ptr>
10001b42:	20000737          	lui	a4,0x20000
10001b46:	100027b7          	lui	a5,0x10002
10001b4a:	aac78793          	addi	a5,a5,-1364 # 10001aac <bt_smp_disconnected>
10001b4e:	3ef72823          	sw	a5,1008(a4) # 200003f0 <bt_smp_disconnected_ptr>
10001b52:	20000737          	lui	a4,0x20000
10001b56:	100027b7          	lui	a5,0x10002
10001b5a:	aae78793          	addi	a5,a5,-1362 # 10001aae <bt_smp_encrypt_change>
10001b5e:	3ef72a23          	sw	a5,1012(a4) # 200003f4 <bt_smp_encrypt_change_ptr>
10001b62:	20000737          	lui	a4,0x20000
10001b66:	100027b7          	lui	a5,0x10002
10001b6a:	ab078793          	addi	a5,a5,-1360 # 10001ab0 <bt_smp_start_security>
10001b6e:	40f72023          	sw	a5,1024(a4) # 20000400 <bt_smp_start_security_ptr>
10001b72:	20000737          	lui	a4,0x20000
10001b76:	100027b7          	lui	a5,0x10002
10001b7a:	ab478793          	addi	a5,a5,-1356 # 10001ab4 <bt_smp_update_keys>
10001b7e:	40f72223          	sw	a5,1028(a4) # 20000404 <bt_smp_update_keys_ptr>
10001b82:	20000737          	lui	a4,0x20000
10001b86:	100027b7          	lui	a5,0x10002
10001b8a:	ab678793          	addi	a5,a5,-1354 # 10001ab6 <bt_smp_request_ltk>
10001b8e:	3ef72e23          	sw	a5,1020(a4) # 200003fc <bt_smp_request_ltk_ptr>
10001b92:	20000737          	lui	a4,0x20000
10001b96:	100027b7          	lui	a5,0x10002
10001b9a:	aba78793          	addi	a5,a5,-1350 # 10001aba <bt_keys_find_addr>
10001b9e:	3ef72423          	sw	a5,1000(a4) # 200003e8 <bt_keys_find_addr_ptr>
10001ba2:	20000737          	lui	a4,0x20000
10001ba6:	100027b7          	lui	a5,0x10002
10001baa:	abe78793          	addi	a5,a5,-1346 # 10001abe <sys_timeout_work>
10001bae:	40f72623          	sw	a5,1036(a4) # 2000040c <sys_timeout_work_ptr>
10001bb2:	200017b7          	lui	a5,0x20001
10001bb6:	900788a3          	sb	zero,-1775(a5) # 20000911 <g_tail_rsvd_wdl>
10001bba:	200017b7          	lui	a5,0x20001
10001bbe:	90078823          	sb	zero,-1776(a5) # 20000910 <g_hdr_rsvd_wdl>
10001bc2:	33a1                	jal	1000190a <ll_conn_set_conn_buf>
10001bc4:	3d11                	jal	100019d8 <bt_conn_set_acl_conns_buf>
10001bc6:	3385                	jal	10001926 <bt_att_set_att_info_buf>
10001bc8:	20000737          	lui	a4,0x20000
10001bcc:	200017b7          	lui	a5,0x20001
10001bd0:	e6478793          	addi	a5,a5,-412 # 20000e64 <rf_common_desc_tx_setfreq>
10001bd4:	40f72a23          	sw	a5,1044(a4) # 20000414 <rf_bt_common_desc_tx_setfreq>
10001bd8:	20000737          	lui	a4,0x20000
10001bdc:	200017b7          	lui	a5,0x20001
10001be0:	dcc78793          	addi	a5,a5,-564 # 20000dcc <rf_common_desc_rx_setfreq>
10001be4:	40f72823          	sw	a5,1040(a4) # 20000410 <rf_bt_common_desc_rx_setfreq>
10001be8:	e08007b7          	lui	a5,0xe0800
10001bec:	43dc                	lw	a5,4(a5)
10001bee:	83d5                	srli	a5,a5,0x15
10001bf0:	8bbd                	andi	a5,a5,15
10001bf2:	46a1                	li	a3,8
10001bf4:	8e9d                	sub	a3,a3,a5
10001bf6:	e0801737          	lui	a4,0xe0801
10001bfa:	04f74783          	lbu	a5,79(a4) # e080104f <__StackTop+0xc07fd04f>
10001bfe:	0ff7f613          	zext.b	a2,a5
10001c02:	0ff00793          	li	a5,255
10001c06:	00d797b3          	sll	a5,a5,a3
10001c0a:	fff7c793          	not	a5,a5
10001c0e:	8ff1                	and	a5,a5,a2
10001c10:	460d                	li	a2,3
10001c12:	00d616b3          	sll	a3,a2,a3
10001c16:	8fd5                	or	a5,a5,a3
10001c18:	0ff7f793          	zext.b	a5,a5
10001c1c:	04f707a3          	sb	a5,79(a4)
10001c20:	04d74783          	lbu	a5,77(a4)
10001c24:	0ff7f793          	zext.b	a5,a5
10001c28:	0017e793          	ori	a5,a5,1
10001c2c:	04f706a3          	sb	a5,77(a4)
10001c30:	29d1                	jal	10002104 <RADIO_Init>
10001c32:	26bd                	jal	10001fa0 <RF_BT_Init>
10001c34:	57e9                	li	a5,-6
10001c36:	20000737          	lui	a4,0x20000
10001c3a:	6ef70da3          	sb	a5,1787(a4) # 200006fb <adv_nxt_chl_tmr_gap>
10001c3e:	20000737          	lui	a4,0x20000
10001c42:	6ef70d23          	sb	a5,1786(a4) # 200006fa <adv_int_tx_gap>
10001c46:	06f00793          	li	a5,111
10001c4a:	20000737          	lui	a4,0x20000
10001c4e:	4af71b23          	sh	a5,1206(a4) # 200004b6 <ll_gap_time>
10001c52:	20003737          	lui	a4,0x20003
10001c56:	b4f71c23          	sh	a5,-1192(a4) # 20002b58 <ll_gap_time_1m>
10001c5a:	200015b7          	lui	a1,0x20001
10001c5e:	bc058593          	addi	a1,a1,-1088 # 20000bc0 <bdaddr>
10001c62:	4501                	li	a0,0
10001c64:	f0001097          	auipc	ra,0xf0001
10001c68:	870080e7          	jalr	-1936(ra) # 24d4 <ll_addr_set>
10001c6c:	9402                	jalr	s0
10001c6e:	40a2                	lw	ra,8(sp)
10001c70:	4412                	lw	s0,4(sp)
10001c72:	0131                	addi	sp,sp,12
10001c74:	8082                	ret

10001c76 <ble_2g4_coe_isr_handle_cb>:
10001c76:	200037b7          	lui	a5,0x20003
10001c7a:	bb07a783          	lw	a5,-1104(a5) # 20002bb0 <b2c_info+0x54>
10001c7e:	c3f9                	beqz	a5,10001d44 <ble_2g4_coe_isr_handle_cb+0xce>
10001c80:	1151                	addi	sp,sp,-12
10001c82:	c406                	sw	ra,8(sp)
10001c84:	0ff57513          	zext.b	a0,a0
10001c88:	e10d                	bnez	a0,10001caa <ble_2g4_coe_isr_handle_cb+0x34>
10001c8a:	9782                	jalr	a5
10001c8c:	200037b7          	lui	a5,0x20003
10001c90:	b5c78793          	addi	a5,a5,-1188 # 20002b5c <b2c_info>
10001c94:	0407a823          	sw	zero,80(a5)
10001c98:	00078523          	sb	zero,10(a5)
10001c9c:	0047c783          	lbu	a5,4(a5)
10001ca0:	4505                	li	a0,1
10001ca2:	ebb5                	bnez	a5,10001d16 <ble_2g4_coe_isr_handle_cb+0xa0>
10001ca4:	40a2                	lw	ra,8(sp)
10001ca6:	0131                	addi	sp,sp,12
10001ca8:	8082                	ret
10001caa:	20003737          	lui	a4,0x20003
10001cae:	b6074703          	lbu	a4,-1184(a4) # 20002b60 <b2c_info+0x4>
10001cb2:	cb01                	beqz	a4,10001cc2 <ble_2g4_coe_isr_handle_cb+0x4c>
10001cb4:	00058763          	beqz	a1,10001cc2 <ble_2g4_coe_isr_handle_cb+0x4c>
10001cb8:	20003737          	lui	a4,0x20003
10001cbc:	b6474703          	lbu	a4,-1180(a4) # 20002b64 <b2c_info+0x8>
10001cc0:	cb01                	beqz	a4,10001cd0 <ble_2g4_coe_isr_handle_cb+0x5a>
10001cc2:	0ff67613          	zext.b	a2,a2
10001cc6:	0ff5f593          	zext.b	a1,a1
10001cca:	4501                	li	a0,0
10001ccc:	9782                	jalr	a5
10001cce:	bf7d                	j	10001c8c <ble_2g4_coe_isr_handle_cb+0x16>
10001cd0:	20003737          	lui	a4,0x20003
10001cd4:	ce874703          	lbu	a4,-792(a4) # 20002ce8 <rx_fin_24g_4k>
10001cd8:	0ff77713          	zext.b	a4,a4
10001cdc:	420006b7          	lui	a3,0x42000
10001ce0:	cf19                	beqz	a4,10001cfe <ble_2g4_coe_isr_handle_cb+0x88>
10001ce2:	42d8                	lw	a4,4(a3)
10001ce4:	8b09                	andi	a4,a4,2
10001ce6:	df75                	beqz	a4,10001ce2 <ble_2g4_coe_isr_handle_cb+0x6c>
10001ce8:	0ff67613          	zext.b	a2,a2
10001cec:	4585                	li	a1,1
10001cee:	4501                	li	a0,0
10001cf0:	9782                	jalr	a5
10001cf2:	420007b7          	lui	a5,0x42000
10001cf6:	4705                	li	a4,1
10001cf8:	06e78223          	sb	a4,100(a5) # 42000064 <__StackTop+0x21ffc064>
10001cfc:	bf41                	j	10001c8c <ble_2g4_coe_isr_handle_cb+0x16>
10001cfe:	20003737          	lui	a4,0x20003
10001d02:	4685                	li	a3,1
10001d04:	b6d70223          	sb	a3,-1180(a4) # 20002b64 <b2c_info+0x8>
10001d08:	0ff67613          	zext.b	a2,a2
10001d0c:	4585                	li	a1,1
10001d0e:	4505                	li	a0,1
10001d10:	9782                	jalr	a5
10001d12:	4501                	li	a0,0
10001d14:	bf41                	j	10001ca4 <ble_2g4_coe_isr_handle_cb+0x2e>
10001d16:	100047b7          	lui	a5,0x10004
10001d1a:	56478793          	addi	a5,a5,1380 # 10004564 <coe_bak_regs_list>
10001d1e:	20003737          	lui	a4,0x20003
10001d22:	b7c70713          	addi	a4,a4,-1156 # 20002b7c <b2c_info+0x20>
10001d26:	03078593          	addi	a1,a5,48
10001d2a:	4394                	lw	a3,0(a5)
10001d2c:	4310                	lw	a2,0(a4)
10001d2e:	c290                	sw	a2,0(a3)
10001d30:	0791                	addi	a5,a5,4
10001d32:	0711                	addi	a4,a4,4
10001d34:	feb79be3          	bne	a5,a1,10001d2a <ble_2g4_coe_isr_handle_cb+0xb4>
10001d38:	200037b7          	lui	a5,0x20003
10001d3c:	b6078023          	sb	zero,-1184(a5) # 20002b60 <b2c_info+0x4>
10001d40:	4505                	li	a0,1
10001d42:	b78d                	j	10001ca4 <ble_2g4_coe_isr_handle_cb+0x2e>
10001d44:	200037b7          	lui	a5,0x20003
10001d48:	b5c78793          	addi	a5,a5,-1188 # 20002b5c <b2c_info>
10001d4c:	0407a823          	sw	zero,80(a5)
10001d50:	00078523          	sb	zero,10(a5)
10001d54:	0047c783          	lbu	a5,4(a5)
10001d58:	4505                	li	a0,1
10001d5a:	e391                	bnez	a5,10001d5e <ble_2g4_coe_isr_handle_cb+0xe8>
10001d5c:	8082                	ret
10001d5e:	100047b7          	lui	a5,0x10004
10001d62:	56478793          	addi	a5,a5,1380 # 10004564 <coe_bak_regs_list>
10001d66:	20003737          	lui	a4,0x20003
10001d6a:	b7c70713          	addi	a4,a4,-1156 # 20002b7c <b2c_info+0x20>
10001d6e:	03078593          	addi	a1,a5,48
10001d72:	4394                	lw	a3,0(a5)
10001d74:	4310                	lw	a2,0(a4)
10001d76:	c290                	sw	a2,0(a3)
10001d78:	0791                	addi	a5,a5,4
10001d7a:	0711                	addi	a4,a4,4
10001d7c:	feb79be3          	bne	a5,a1,10001d72 <ble_2g4_coe_isr_handle_cb+0xfc>
10001d80:	200037b7          	lui	a5,0x20003
10001d84:	b6078023          	sb	zero,-1184(a5) # 20002b60 <b2c_info+0x4>
10001d88:	4505                	li	a0,1
10001d8a:	8082                	ret

10001d8c <ble_2g4_coe_sched>:
10001d8c:	1151                	addi	sp,sp,-12
10001d8e:	c406                	sw	ra,8(sp)
10001d90:	420007b7          	lui	a5,0x42000
10001d94:	1047a583          	lw	a1,260(a5) # 42000104 <__StackTop+0x21ffc104>
10001d98:	05ce                	slli	a1,a1,0x13
10001d9a:	81cd                	srli	a1,a1,0x13
10001d9c:	200037b7          	lui	a5,0x20003
10001da0:	b5c78793          	addi	a5,a5,-1188 # 20002b5c <b2c_info>
10001da4:	d3e8                	sw	a0,100(a5)
10001da6:	3e858593          	addi	a1,a1,1000
10001daa:	05878513          	addi	a0,a5,88
10001dae:	f000a097          	auipc	ra,0xf000a
10001db2:	e24080e7          	jalr	-476(ra) # bbd2 <BT_TIMER_StartTimerRelative>
10001db6:	40a2                	lw	ra,8(sp)
10001db8:	0131                	addi	sp,sp,12
10001dba:	8082                	ret

10001dbc <ble_2g4_coe_timer_cb>:
10001dbc:	1141                	addi	sp,sp,-16
10001dbe:	c606                	sw	ra,12(sp)
10001dc0:	c422                	sw	s0,8(sp)
10001dc2:	0ff57413          	zext.b	s0,a0
10001dc6:	4681                	li	a3,0
10001dc8:	10002637          	lui	a2,0x10002
10001dcc:	f9060613          	addi	a2,a2,-112 # 10001f90 <ble_2g4_coe_isr_break_cb>
10001dd0:	100025b7          	lui	a1,0x10002
10001dd4:	c7658593          	addi	a1,a1,-906 # 10001c76 <ble_2g4_coe_isr_handle_cb>
10001dd8:	8522                	mv	a0,s0
10001dda:	f0003097          	auipc	ra,0xf0003
10001dde:	408080e7          	jalr	1032(ra) # 51e2 <ll_sch_prepare>
10001de2:	e149                	bnez	a0,10001e64 <ble_2g4_coe_timer_cb+0xa8>
10001de4:	200007b7          	lui	a5,0x20000
10001de8:	44078b23          	sb	zero,1110(a5) # 20000456 <is_desc_dma_error>
10001dec:	200037b7          	lui	a5,0x20003
10001df0:	b607c783          	lbu	a5,-1184(a5) # 20002b60 <b2c_info+0x4>
10001df4:	e7dd                	bnez	a5,10001ea2 <ble_2g4_coe_timer_cb+0xe6>
10001df6:	02500793          	li	a5,37
10001dfa:	c03e                	sw	a5,0(sp)
10001dfc:	200037b7          	lui	a5,0x20003
10001e00:	b5c7c783          	lbu	a5,-1188(a5) # 20002b5c <b2c_info>
10001e04:	4705                	li	a4,1
10001e06:	005556b7          	lui	a3,0x555
10001e0a:	55568693          	addi	a3,a3,1365 # 555555 <__FLASH_SIZE+0x515555>
10001e0e:	4601                	li	a2,0
10001e10:	4581                	li	a1,0
10001e12:	8e89c537          	lui	a0,0x8e89c
10001e16:	ed650513          	addi	a0,a0,-298 # 8e89bed6 <__StackTop+0x6e897ed6>
10001e1a:	f000a097          	auipc	ra,0xf000a
10001e1e:	270080e7          	jalr	624(ra) # c08a <RF_BT_EventPrepare>
10001e22:	e421                	bnez	s0,10001e6a <ble_2g4_coe_timer_cb+0xae>
10001e24:	200037b7          	lui	a5,0x20003
10001e28:	bac7a503          	lw	a0,-1108(a5) # 20002bac <b2c_info+0x50>
10001e2c:	200007b7          	lui	a5,0x20000
10001e30:	4207a423          	sw	zero,1064(a5) # 20000428 <rf_bt_mgr+0x8>
10001e34:	420007b7          	lui	a5,0x42000
10001e38:	1047a683          	lw	a3,260(a5) # 42000104 <__StackTop+0x21ffc104>
10001e3c:	4781                	li	a5,0
10001e3e:	4705                	li	a4,1
10001e40:	06468693          	addi	a3,a3,100
10001e44:	4601                	li	a2,0
10001e46:	00250593          	addi	a1,a0,2
10001e4a:	f000a097          	auipc	ra,0xf000a
10001e4e:	044080e7          	jalr	68(ra) # be8e <RF_BT_SendWork>
10001e52:	200037b7          	lui	a5,0x20003
10001e56:	4705                	li	a4,1
10001e58:	b6e78323          	sb	a4,-1178(a5) # 20002b66 <b2c_info+0xa>
10001e5c:	40b2                	lw	ra,12(sp)
10001e5e:	4422                	lw	s0,8(sp)
10001e60:	0141                	addi	sp,sp,16
10001e62:	8082                	ret
10001e64:	8522                	mv	a0,s0
10001e66:	371d                	jal	10001d8c <ble_2g4_coe_sched>
10001e68:	bfd5                	j	10001e5c <ble_2g4_coe_timer_cb+0xa0>
10001e6a:	200037b7          	lui	a5,0x20003
10001e6e:	b5c78793          	addi	a5,a5,-1188 # 20002b5c <b2c_info>
10001e72:	4ba8                	lw	a0,80(a5)
10001e74:	20000737          	lui	a4,0x20000
10001e78:	42a72423          	sw	a0,1064(a4) # 20000428 <rf_bt_mgr+0x8>
10001e7c:	42000737          	lui	a4,0x42000
10001e80:	10472603          	lw	a2,260(a4) # 42000104 <__StackTop+0x21ffc104>
10001e84:	0027d583          	lhu	a1,2(a5)
10001e88:	3e800793          	li	a5,1000
10001e8c:	02f585b3          	mul	a1,a1,a5
10001e90:	05c2                	slli	a1,a1,0x10
10001e92:	81c1                	srli	a1,a1,0x10
10001e94:	06460613          	addi	a2,a2,100
10001e98:	f000a097          	auipc	ra,0xf000a
10001e9c:	136080e7          	jalr	310(ra) # bfce <RF_BT_ReceiveWork>
10001ea0:	bf4d                	j	10001e52 <ble_2g4_coe_timer_cb+0x96>
10001ea2:	200037b7          	lui	a5,0x20003
10001ea6:	b657c503          	lbu	a0,-1179(a5) # 20002b65 <b2c_info+0x9>
10001eaa:	002010ef          	jal	10002eac <omw_svc_2g4_set_msb_first>
10001eae:	e459                	bnez	s0,10001f3c <ble_2g4_coe_timer_cb+0x180>
10001eb0:	200037b7          	lui	a5,0x20003
10001eb4:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
10001eb8:	20003437          	lui	s0,0x20003
10001ebc:	b5c40413          	addi	s0,s0,-1188 # 20002b5c <b2c_info>
10001ec0:	00245703          	lhu	a4,2(s0)
10001ec4:	02e782a3          	sb	a4,37(a5)
10001ec8:	8321                	srli	a4,a4,0x8
10001eca:	02e78323          	sb	a4,38(a5)
10001ece:	020781a3          	sb	zero,35(a5)
10001ed2:	02078223          	sb	zero,36(a5)
10001ed6:	20000737          	lui	a4,0x20000
10001eda:	42070713          	addi	a4,a4,1056 # 20000420 <rf_bt_mgr>
10001ede:	00072423          	sw	zero,8(a4)
10001ee2:	0027c783          	lbu	a5,2(a5)
10001ee6:	00f70023          	sb	a5,0(a4)
10001eea:	058010ef          	jal	10002f42 <RF_2G4_PrepareStart>
10001eee:	00b44603          	lbu	a2,11(s0)
10001ef2:	e20d                	bnez	a2,10001f14 <ble_2g4_coe_timer_cb+0x158>
10001ef4:	200037b7          	lui	a5,0x20003
10001ef8:	b5c78793          	addi	a5,a5,-1188 # 20002b5c <b2c_info>
10001efc:	0057c683          	lbu	a3,5(a5)
10001f00:	0007d603          	lhu	a2,0(a5)
10001f04:	0027d583          	lhu	a1,2(a5)
10001f08:	4ba8                	lw	a0,80(a5)
10001f0a:	10000097          	auipc	ra,0x10000
10001f0e:	15c080e7          	jalr	348(ra) # 20002066 <omw_svc_2g4_tx_data>
10001f12:	b781                	j	10001e52 <ble_2g4_coe_timer_cb+0x96>
10001f14:	200037b7          	lui	a5,0x20003
10001f18:	c0b7c783          	lbu	a5,-1013(a5) # 20002c0b <rf_2g4_mgr+0x3>
10001f1c:	17fd                	addi	a5,a5,-1
10001f1e:	8f91                	sub	a5,a5,a2
10001f20:	200035b7          	lui	a1,0x20003
10001f24:	b6858593          	addi	a1,a1,-1176 # 20002b68 <b2c_info+0xc>
10001f28:	20003537          	lui	a0,0x20003
10001f2c:	c4450513          	addi	a0,a0,-956 # 20002c44 <rf_2g4_preamble>
10001f30:	953e                	add	a0,a0,a5
10001f32:	f000b097          	auipc	ra,0xf000b
10001f36:	a82080e7          	jalr	-1406(ra) # c9b4 <memcpy>
10001f3a:	bf6d                	j	10001ef4 <ble_2g4_coe_timer_cb+0x138>
10001f3c:	200007b7          	lui	a5,0x20000
10001f40:	45878793          	addi	a5,a5,1112 # 20000458 <rf_common_desc_coded_recal>
10001f44:	6755                	lui	a4,0x15
10001f46:	c3d8                	sw	a4,4(a5)
10001f48:	0721                	addi	a4,a4,8 # 15008 <memset+0x863c>
10001f4a:	c7d8                	sw	a4,12(a5)
10001f4c:	20003437          	lui	s0,0x20003
10001f50:	b5c40413          	addi	s0,s0,-1188 # 20002b5c <b2c_info>
10001f54:	01c40713          	addi	a4,s0,28
10001f58:	200007b7          	lui	a5,0x20000
10001f5c:	42e7a423          	sw	a4,1064(a5) # 20000428 <rf_bt_mgr+0x8>
10001f60:	7e3000ef          	jal	10002f42 <RF_2G4_PrepareStart>
10001f64:	00245503          	lhu	a0,2(s0)
10001f68:	3e800793          	li	a5,1000
10001f6c:	02f50533          	mul	a0,a0,a5
10001f70:	10000097          	auipc	ra,0x10000
10001f74:	d6c080e7          	jalr	-660(ra) # 20001cdc <omw_svc_2g4_update_rx_to>
10001f78:	00544683          	lbu	a3,5(s0)
10001f7c:	00045603          	lhu	a2,0(s0)
10001f80:	00645583          	lhu	a1,6(s0)
10001f84:	4828                	lw	a0,80(s0)
10001f86:	10000097          	auipc	ra,0x10000
10001f8a:	048080e7          	jalr	72(ra) # 20001fce <omw_svc_2g4_rx_data>
10001f8e:	b5d1                	j	10001e52 <ble_2g4_coe_timer_cb+0x96>

10001f90 <ble_2g4_coe_isr_break_cb>:
10001f90:	1151                	addi	sp,sp,-12
10001f92:	c406                	sw	ra,8(sp)
10001f94:	0ff57513          	zext.b	a0,a0
10001f98:	3bd5                	jal	10001d8c <ble_2g4_coe_sched>
10001f9a:	40a2                	lw	ra,8(sp)
10001f9c:	0131                	addi	sp,sp,12
10001f9e:	8082                	ret

10001fa0 <RF_BT_Init>:
10001fa0:	1141                	addi	sp,sp,-16
10001fa2:	c606                	sw	ra,12(sp)
10001fa4:	c422                	sw	s0,8(sp)
10001fa6:	c226                	sw	s1,4(sp)
10001fa8:	2979                	jal	10002446 <RF_OnChip_Init>
10001faa:	200007b7          	lui	a5,0x20000
10001fae:	43078793          	addi	a5,a5,1072 # 20000430 <rf_bt_time_info>
10001fb2:	10004737          	lui	a4,0x10004
10001fb6:	59470713          	addi	a4,a4,1428 # 10004594 <time_info>
10001fba:	00075483          	lhu	s1,0(a4)
10001fbe:	00275403          	lhu	s0,2(a4)
10001fc2:	00475383          	lhu	t2,4(a4)
10001fc6:	00675283          	lhu	t0,6(a4)
10001fca:	00875303          	lhu	t1,8(a4)
10001fce:	00a75503          	lhu	a0,10(a4)
10001fd2:	00c75583          	lhu	a1,12(a4)
10001fd6:	00e75603          	lhu	a2,14(a4)
10001fda:	01075683          	lhu	a3,16(a4)
10001fde:	00d11123          	sh	a3,2(sp)
10001fe2:	01275683          	lhu	a3,18(a4)
10001fe6:	01475703          	lhu	a4,20(a4)
10001fea:	00979023          	sh	s1,0(a5)
10001fee:	00879123          	sh	s0,2(a5)
10001ff2:	00779223          	sh	t2,4(a5)
10001ff6:	00579323          	sh	t0,6(a5)
10001ffa:	00679423          	sh	t1,8(a5)
10001ffe:	00a79523          	sh	a0,10(a5)
10002002:	00b79623          	sh	a1,12(a5)
10002006:	00c79723          	sh	a2,14(a5)
1000200a:	00215603          	lhu	a2,2(sp)
1000200e:	00c79823          	sh	a2,16(a5)
10002012:	00d79923          	sh	a3,18(a5)
10002016:	00e79a23          	sh	a4,20(a5)
1000201a:	200007b7          	lui	a5,0x20000
1000201e:	42078793          	addi	a5,a5,1056 # 20000420 <rf_bt_mgr>
10002022:	0007a023          	sw	zero,0(a5)
10002026:	0007a223          	sw	zero,4(a5)
1000202a:	0007a423          	sw	zero,8(a5)
1000202e:	0007a623          	sw	zero,12(a5)
10002032:	20000737          	lui	a4,0x20000
10002036:	004a57b7          	lui	a5,0x4a5
1000203a:	07a1                	addi	a5,a5,8 # 4a5008 <__FLASH_SIZE+0x465008>
1000203c:	40f72e23          	sw	a5,1052(a4) # 2000041c <rf_bt_common_desc_txrx_ifs_delay+0x4>
10002040:	420007b7          	lui	a5,0x42000
10002044:	470d                	li	a4,3
10002046:	cfd8                	sw	a4,28(a5)
10002048:	01000737          	lui	a4,0x1000
1000204c:	65b70713          	addi	a4,a4,1627 # 100065b <__FLASH_SIZE+0xfc065b>
10002050:	d3d8                	sw	a4,36(a5)
10002052:	4721                	li	a4,8
10002054:	04e78a23          	sb	a4,84(a5) # 42000054 <__StackTop+0x21ffc054>
10002058:	200007b7          	lui	a5,0x20000
1000205c:	1b478793          	addi	a5,a5,436 # 200001b4 <rf_call_desc_list_tx_process>
10002060:	20001737          	lui	a4,0x20001
10002064:	dac70713          	addi	a4,a4,-596 # 20000dac <rf_common_desc_rftx_on>
10002068:	c798                	sw	a4,8(a5)
1000206a:	20001737          	lui	a4,0x20001
1000206e:	d8c70713          	addi	a4,a4,-628 # 20000d8c <rf_common_desc_rftx_off>
10002072:	cbb8                	sw	a4,80(a5)
10002074:	20000737          	lui	a4,0x20000
10002078:	16470713          	addi	a4,a4,356 # 20000164 <rf_call_desc_list_rx_process>
1000207c:	200016b7          	lui	a3,0x20001
10002080:	d6c68693          	addi	a3,a3,-660 # 20000d6c <rf_common_desc_rfrx_on>
10002084:	c714                	sw	a3,8(a4)
10002086:	200016b7          	lui	a3,0x20001
1000208a:	d4c68693          	addi	a3,a3,-692 # 20000d4c <rf_common_desc_rfrx_off>
1000208e:	c734                	sw	a3,72(a4)
10002090:	200006b7          	lui	a3,0x20000
10002094:	0bc68693          	addi	a3,a3,188 # 200000bc <rf_bt_common_desc_rx_pkt>
10002098:	db14                	sw	a3,48(a4)
1000209a:	20000737          	lui	a4,0x20000
1000209e:	41472683          	lw	a3,1044(a4) # 20000414 <rf_bt_common_desc_tx_setfreq>
100020a2:	20000737          	lui	a4,0x20000
100020a6:	0ad72a23          	sw	a3,180(a4) # 200000b4 <rf_bt_call_desc_list_tx_setfreq_delay>
100020aa:	200006b7          	lui	a3,0x20000
100020ae:	20001737          	lui	a4,0x20001
100020b2:	e6470713          	addi	a4,a4,-412 # 20000e64 <rf_common_desc_tx_setfreq>
100020b6:	00e6a223          	sw	a4,4(a3) # 20000004 <not_1st_tx_patch_desc>
100020ba:	20001737          	lui	a4,0x20001
100020be:	bd070713          	addi	a4,a4,-1072 # 20000bd0 <rf_common_desc_mdm_txon_v0_2_0_ext>
100020c2:	d398                	sw	a4,32(a5)
100020c4:	20001737          	lui	a4,0x20001
100020c8:	c1070713          	addi	a4,a4,-1008 # 20000c10 <rf_common_desc_rf_tx_pa_off_ext>
100020cc:	df98                	sw	a4,56(a5)
100020ce:	20001737          	lui	a4,0x20001
100020d2:	c0070713          	addi	a4,a4,-1024 # 20000c00 <rf_common_desc_rf_tx_dac_off_ext>
100020d6:	c7b8                	sw	a4,72(a5)
100020d8:	200007b7          	lui	a5,0x20000
100020dc:	4107a703          	lw	a4,1040(a5) # 20000410 <rf_bt_common_desc_rx_setfreq>
100020e0:	200007b7          	lui	a5,0x20000
100020e4:	02e7a623          	sw	a4,44(a5) # 2000002c <rf_bt_call_desc_list_rx_setfreq_delay>
100020e8:	40b2                	lw	ra,12(sp)
100020ea:	4422                	lw	s0,8(sp)
100020ec:	4492                	lw	s1,4(sp)
100020ee:	0141                	addi	sp,sp,16
100020f0:	8082                	ret

100020f2 <omw_svc_coe_init>:
100020f2:	20003737          	lui	a4,0x20003
100020f6:	100027b7          	lui	a5,0x10002
100020fa:	dbc78793          	addi	a5,a5,-580 # 10001dbc <ble_2g4_coe_timer_cb>
100020fe:	baf72e23          	sw	a5,-1092(a4) # 20002bbc <b2c_info+0x60>
10002102:	8082                	ret

10002104 <RADIO_Init>:
10002104:	200007b7          	lui	a5,0x20000
10002108:	10004737          	lui	a4,0x10004
1000210c:	5ac70713          	addi	a4,a4,1452 # 100045ac <time_info>
10002110:	00074683          	lbu	a3,0(a4)
10002114:	4ad78023          	sb	a3,1184(a5) # 200004a0 <rf_common_time_info>
10002118:	4a078793          	addi	a5,a5,1184
1000211c:	00174703          	lbu	a4,1(a4)
10002120:	00e780a3          	sb	a4,1(a5)
10002124:	200007b7          	lui	a5,0x20000
10002128:	4709                	li	a4,2
1000212a:	4ae78223          	sb	a4,1188(a5) # 200004a4 <rf_err_thr_cfg>
1000212e:	4a478793          	addi	a5,a5,1188
10002132:	00e780a3          	sb	a4,1(a5)
10002136:	02400693          	li	a3,36
1000213a:	00d78123          	sb	a3,2(a5)
1000213e:	00e781a3          	sb	a4,3(a5)
10002142:	20000737          	lui	a4,0x20000
10002146:	001e57b7          	lui	a5,0x1e5
1000214a:	07a1                	addi	a5,a5,8 # 1e5008 <__FLASH_SIZE+0x1a5008>
1000214c:	48f72e23          	sw	a5,1180(a4) # 2000049c <rf_common_desc_tx_end_delay+0x4>
10002150:	420006b7          	lui	a3,0x42000
10002154:	6705                	lui	a4,0x1
10002156:	70170793          	addi	a5,a4,1793 # 1701 <app_main.c.2c20a20f+0x105>
1000215a:	10f69023          	sh	a5,256(a3) # 42000100 <__StackTop+0x21ffc100>
1000215e:	478d                	li	a5,3
10002160:	06f68023          	sb	a5,96(a3)
10002164:	e08007b7          	lui	a5,0xe0800
10002168:	43dc                	lw	a5,4(a5)
1000216a:	83d5                	srli	a5,a5,0x15
1000216c:	8bbd                	andi	a5,a5,15
1000216e:	45a1                	li	a1,8
10002170:	8d9d                	sub	a1,a1,a5
10002172:	e0801637          	lui	a2,0xe0801
10002176:	04b64783          	lbu	a5,75(a2) # e080104b <__StackTop+0xc07fd04b>
1000217a:	0ff7f513          	zext.b	a0,a5
1000217e:	0ff00793          	li	a5,255
10002182:	00b797b3          	sll	a5,a5,a1
10002186:	fff7c793          	not	a5,a5
1000218a:	8fe9                	and	a5,a5,a0
1000218c:	4511                	li	a0,4
1000218e:	00b515b3          	sll	a1,a0,a1
10002192:	8fcd                	or	a5,a5,a1
10002194:	0ff7f793          	zext.b	a5,a5
10002198:	04f605a3          	sb	a5,75(a2)
1000219c:	04964783          	lbu	a5,73(a2)
100021a0:	0ff7f793          	zext.b	a5,a5
100021a4:	0017e793          	ori	a5,a5,1
100021a8:	04f604a3          	sb	a5,73(a2)
100021ac:	02f00613          	li	a2,47
100021b0:	0cc6a623          	sw	a2,204(a3)
100021b4:	77fd                	lui	a5,0xfffff
100021b6:	70078793          	addi	a5,a5,1792 # fffff700 <__StackTop+0xdfffb700>
100021ba:	00f69423          	sh	a5,8(a3)
100021be:	420017b7          	lui	a5,0x42001
100021c2:	b0070713          	addi	a4,a4,-1280
100021c6:	db98                	sw	a4,48(a5)
100021c8:	02c00713          	li	a4,44
100021cc:	10e7a023          	sw	a4,256(a5) # 42001100 <__StackTop+0x21ffd100>
100021d0:	1407a623          	sw	zero,332(a5)
100021d4:	8082                	ret

100021d6 <rf_get_ad_pll_counter>:
100021d6:	1131                	addi	sp,sp,-20
100021d8:	c806                	sw	ra,16(sp)
100021da:	c622                	sw	s0,12(sp)
100021dc:	c426                	sw	s1,8(sp)
100021de:	c02a                	sw	a0,0(sp)
100021e0:	c22e                	sw	a1,4(sp)
100021e2:	4415                	li	s0,5
100021e4:	4481                	li	s1,0
100021e6:	400006b7          	lui	a3,0x40000
100021ea:	1846a783          	lw	a5,388(a3) # 40000184 <__StackTop+0x1fffc184>
100021ee:	7741                	lui	a4,0xffff0
100021f0:	8ff9                	and	a5,a5,a4
100021f2:	4712                	lw	a4,4(sp)
100021f4:	8fd9                	or	a5,a5,a4
100021f6:	18f6a223          	sw	a5,388(a3)
100021fa:	4502                	lw	a0,0(sp)
100021fc:	0ffff097          	auipc	ra,0xffff
10002200:	5a4080e7          	jalr	1444(ra) # 200017a0 <_rf_kvco_read_y>
10002204:	94aa                	add	s1,s1,a0
10002206:	147d                	addi	s0,s0,-1
10002208:	fc79                	bnez	s0,100021e6 <rf_get_ad_pll_counter+0x10>
1000220a:	4515                	li	a0,5
1000220c:	02a4d533          	divu	a0,s1,a0
10002210:	40c2                	lw	ra,16(sp)
10002212:	4432                	lw	s0,12(sp)
10002214:	44a2                	lw	s1,8(sp)
10002216:	0151                	addi	sp,sp,20
10002218:	8082                	ret

1000221a <RF_OnChip_Cfg_KVCO_Cal_val_2g4>:
1000221a:	1171                	addi	sp,sp,-4
1000221c:	6785                	lui	a5,0x1
1000221e:	80478793          	addi	a5,a5,-2044 # 804 <__STACK_SIZE+0x404>
10002222:	00f11023          	sh	a5,0(sp)
10002226:	4789                	li	a5,2
10002228:	00f10123          	sb	a5,2(sp)
1000222c:	005c                	addi	a5,sp,4
1000222e:	97ae                	add	a5,a5,a1
10002230:	ffc78303          	lb	t1,-4(a5)
10002234:	47c9                	li	a5,18
10002236:	06a7e063          	bltu	a5,a0,10002296 <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x7c>
1000223a:	47a1                	li	a5,8
1000223c:	4281                	li	t0,0
1000223e:	00a7e863          	bltu	a5,a0,1000224e <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x34>
10002242:	00131793          	slli	a5,t1,0x1
10002246:	01879313          	slli	t1,a5,0x18
1000224a:	41835313          	srai	t1,t1,0x18
1000224e:	420016b7          	lui	a3,0x42001
10002252:	5290                	lw	a2,32(a3)
10002254:	77c1                	lui	a5,0xffff0
10002256:	8e7d                	and	a2,a2,a5
10002258:	00129713          	slli	a4,t0,0x1
1000225c:	005707b3          	add	a5,a4,t0
10002260:	20003737          	lui	a4,0x20003
10002264:	bcc70713          	addi	a4,a4,-1076 # 20002bcc <g_hp>
10002268:	973e                	add	a4,a4,a5
1000226a:	972e                	add	a4,a4,a1
1000226c:	00074783          	lbu	a5,0(a4)
10002270:	20003737          	lui	a4,0x20003
10002274:	bd872703          	lw	a4,-1064(a4) # 20002bd8 <g_hp_offset>
10002278:	97ba                	add	a5,a5,a4
1000227a:	979a                	add	a5,a5,t1
1000227c:	20001737          	lui	a4,0x20001
10002280:	cc070713          	addi	a4,a4,-832 # 20000cc0 <g_lp>
10002284:	95ba                	add	a1,a1,a4
10002286:	0005c703          	lbu	a4,0(a1)
1000228a:	0722                	slli	a4,a4,0x8
1000228c:	8fd9                	or	a5,a5,a4
1000228e:	8fd1                	or	a5,a5,a2
10002290:	d29c                	sw	a5,32(a3)
10002292:	0111                	addi	sp,sp,4
10002294:	8082                	ret
10002296:	03a00793          	li	a5,58
1000229a:	02a7f463          	bgeu	a5,a0,100022c2 <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0xa8>
1000229e:	04400793          	li	a5,68
100022a2:	00a7f863          	bgeu	a5,a0,100022b2 <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x98>
100022a6:	00131793          	slli	a5,t1,0x1
100022aa:	01879313          	slli	t1,a5,0x18
100022ae:	41835313          	srai	t1,t1,0x18
100022b2:	406007b3          	neg	a5,t1
100022b6:	01879313          	slli	t1,a5,0x18
100022ba:	41835313          	srai	t1,t1,0x18
100022be:	4289                	li	t0,2
100022c0:	b779                	j	1000224e <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x34>
100022c2:	1535                	addi	a0,a0,-19
100022c4:	0ff57513          	zext.b	a0,a0
100022c8:	47b5                	li	a5,13
100022ca:	00a7f963          	bgeu	a5,a0,100022dc <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0xc2>
100022ce:	47e9                	li	a5,26
100022d0:	4301                	li	t1,0
100022d2:	4285                	li	t0,1
100022d4:	f6a7fde3          	bgeu	a5,a0,1000224e <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x34>
100022d8:	4289                	li	t0,2
100022da:	bf95                	j	1000224e <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x34>
100022dc:	4301                	li	t1,0
100022de:	4281                	li	t0,0
100022e0:	b7bd                	j	1000224e <RF_OnChip_Cfg_KVCO_Cal_val_2g4+0x34>

100022e2 <omw_rf_set_tx_pwr_lvl>:
100022e2:	200037b7          	lui	a5,0x20003
100022e6:	be978783          	lb	a5,-1047(a5) # 20002be9 <g_rf_cfg+0x9>
100022ea:	953e                	add	a0,a0,a5
100022ec:	57a5                	li	a5,-23
100022ee:	00f55363          	bge	a0,a5,100022f4 <omw_rf_set_tx_pwr_lvl+0x12>
100022f2:	5525                	li	a0,-23
100022f4:	200037b7          	lui	a5,0x20003
100022f8:	be27c683          	lbu	a3,-1054(a5) # 20002be2 <g_rf_cfg+0x2>
100022fc:	01968593          	addi	a1,a3,25 # 42001019 <__StackTop+0x21ffd019>
10002300:	0ff5f593          	zext.b	a1,a1
10002304:	47b5                	li	a5,13
10002306:	00a7d363          	bge	a5,a0,1000230c <omw_rf_set_tx_pwr_lvl+0x2a>
1000230a:	4535                	li	a0,13
1000230c:	01750793          	addi	a5,a0,23
10002310:	0ff7f793          	zext.b	a5,a5
10002314:	02100713          	li	a4,33
10002318:	4601                	li	a2,0
1000231a:	00f77d63          	bgeu	a4,a5,10002334 <omw_rf_set_tx_pwr_lvl+0x52>
1000231e:	fde78713          	addi	a4,a5,-34
10002322:	00171613          	slli	a2,a4,0x1
10002326:	10004737          	lui	a4,0x10004
1000232a:	5fc70713          	addi	a4,a4,1532 # 100045fc <rf_pwr_lvl_map_1>
1000232e:	9732                	add	a4,a4,a2
10002330:	00075603          	lhu	a2,0(a4)
10002334:	00561713          	slli	a4,a2,0x5
10002338:	80077713          	andi	a4,a4,-2048
1000233c:	03f67613          	andi	a2,a2,63
10002340:	8e59                	or	a2,a2,a4
10002342:	00168713          	addi	a4,a3,1
10002346:	072e                	slli	a4,a4,0xb
10002348:	06be                	slli	a3,a3,0xf
1000234a:	8ecd                	or	a3,a3,a1
1000234c:	8ed9                	or	a3,a3,a4
1000234e:	00c68733          	add	a4,a3,a2
10002352:	00179693          	slli	a3,a5,0x1
10002356:	100047b7          	lui	a5,0x10004
1000235a:	5b078793          	addi	a5,a5,1456 # 100045b0 <rf_pwr_lvl_map_0>
1000235e:	97b6                	add	a5,a5,a3
10002360:	0007d783          	lhu	a5,0(a5)
10002364:	420026b7          	lui	a3,0x42002
10002368:	08c6a583          	lw	a1,140(a3) # 4200208c <__StackTop+0x21ffe08c>
1000236c:	03f7f613          	andi	a2,a5,63
10002370:	fffc0537          	lui	a0,0xfffc0
10002374:	7c050513          	addi	a0,a0,1984 # fffc07c0 <__StackTop+0xdffbc7c0>
10002378:	8de9                	and	a1,a1,a0
1000237a:	8e4d                	or	a2,a2,a1
1000237c:	0796                	slli	a5,a5,0x5
1000237e:	8007f793          	andi	a5,a5,-2048
10002382:	8fd1                	or	a5,a5,a2
10002384:	08f6a623          	sw	a5,140(a3)
10002388:	469c                	lw	a5,8(a3)
1000238a:	fff80637          	lui	a2,0xfff80
1000238e:	7c060613          	addi	a2,a2,1984 # fff807c0 <__StackTop+0xdff7c7c0>
10002392:	8ff1                	and	a5,a5,a2
10002394:	8fd9                	or	a5,a5,a4
10002396:	c69c                	sw	a5,8(a3)
10002398:	200017b7          	lui	a5,0x20001
1000239c:	e6478793          	addi	a5,a5,-412 # 20000e64 <rf_common_desc_tx_setfreq>
100023a0:	00b75693          	srli	a3,a4,0xb
100023a4:	8abd                	andi	a3,a3,15
100023a6:	06ce                	slli	a3,a3,0x13
100023a8:	5bcc                	lw	a1,52(a5)
100023aa:	ff010637          	lui	a2,0xff010
100023ae:	167d                	addi	a2,a2,-1 # ff00ffff <__StackTop+0xdf00bfff>
100023b0:	8df1                	and	a1,a1,a2
100023b2:	8ecd                	or	a3,a3,a1
100023b4:	dbd4                	sw	a3,52(a5)
100023b6:	00f75693          	srli	a3,a4,0xf
100023ba:	8a85                	andi	a3,a3,1
100023bc:	06de                	slli	a3,a3,0x17
100023be:	5fcc                	lw	a1,60(a5)
100023c0:	8df1                	and	a1,a1,a2
100023c2:	8ecd                	or	a3,a3,a1
100023c4:	dfd4                	sw	a3,60(a5)
100023c6:	000706b7          	lui	a3,0x70
100023ca:	8f75                	and	a4,a4,a3
100023cc:	43f4                	lw	a3,68(a5)
100023ce:	8e75                	and	a2,a2,a3
100023d0:	8f51                	or	a4,a4,a2
100023d2:	c3f8                	sw	a4,68(a5)
100023d4:	4501                	li	a0,0
100023d6:	8082                	ret

100023d8 <PMU_OnChip_Init>:
100023d8:	1151                	addi	sp,sp,-12
100023da:	c406                	sw	ra,8(sp)
100023dc:	087000ef          	jal	10002c62 <omw_rf_cal>
100023e0:	400807b7          	lui	a5,0x40080
100023e4:	1107a703          	lw	a4,272(a5) # 40080110 <__StackTop+0x2007c110>
100023e8:	00776713          	ori	a4,a4,7
100023ec:	10e7a823          	sw	a4,272(a5)
100023f0:	6725                	lui	a4,0x9
100023f2:	64270713          	addi	a4,a4,1602 # 9642 <bt_data_parse+0x5c>
100023f6:	d3b8                	sw	a4,96(a5)
100023f8:	6719                	lui	a4,0x6
100023fa:	bab70713          	addi	a4,a4,-1109 # 5bab <hci_send_cmd_le_set_adv_enable+0x4c5>
100023fe:	10e7a623          	sw	a4,268(a5)
10002402:	21290737          	lui	a4,0x21290
10002406:	177d                	addi	a4,a4,-1 # 2128ffff <__StackTop+0x128bfff>
10002408:	c798                	sw	a4,8(a5)
1000240a:	1107a703          	lw	a4,272(a5)
1000240e:	ff0386b7          	lui	a3,0xff038
10002412:	7ff68693          	addi	a3,a3,2047 # ff0387ff <__StackTop+0xdf0347ff>
10002416:	8f75                	and	a4,a4,a3
10002418:	00d046b7          	lui	a3,0xd04
1000241c:	8f55                	or	a4,a4,a3
1000241e:	10e7a823          	sw	a4,272(a5)
10002422:	40a2                	lw	ra,8(sp)
10002424:	0131                	addi	sp,sp,12
10002426:	8082                	ret

10002428 <Radio_OnChip_Set_Freq_Sw>:
10002428:	00251793          	slli	a5,a0,0x2
1000242c:	20001537          	lui	a0,0x20001
10002430:	c2050513          	addi	a0,a0,-992 # 20000c20 <freq_cfg_val>
10002434:	953e                	add	a0,a0,a5
10002436:	4118                	lw	a4,0(a0)
10002438:	800007b7          	lui	a5,0x80000
1000243c:	8fd9                	or	a5,a5,a4
1000243e:	42001737          	lui	a4,0x42001
10002442:	d35c                	sw	a5,36(a4)
10002444:	8082                	ret

10002446 <RF_OnChip_Init>:
10002446:	fcc10113          	addi	sp,sp,-52
1000244a:	d806                	sw	ra,48(sp)
1000244c:	d622                	sw	s0,44(sp)
1000244e:	d426                	sw	s1,40(sp)
10002450:	0ffff097          	auipc	ra,0xffff
10002454:	5e0080e7          	jalr	1504(ra) # 20001a30 <RF_OnChip_Base_Init>
10002458:	20003637          	lui	a2,0x20003
1000245c:	be060613          	addi	a2,a2,-1056 # 20002be0 <g_rf_cfg>
10002460:	00264703          	lbu	a4,2(a2)
10002464:	200016b7          	lui	a3,0x20001
10002468:	dac68693          	addi	a3,a3,-596 # 20000dac <rf_common_desc_rftx_on>
1000246c:	42cc                	lw	a1,4(a3)
1000246e:	ff0107b7          	lui	a5,0xff010
10002472:	17fd                	addi	a5,a5,-1 # ff00ffff <__StackTop+0xdf00bfff>
10002474:	8dfd                	and	a1,a1,a5
10002476:	01970513          	addi	a0,a4,25 # 42001019 <__StackTop+0x21ffd019>
1000247a:	0ff57513          	zext.b	a0,a0
1000247e:	0542                	slli	a0,a0,0x10
10002480:	8dc9                	or	a1,a1,a0
10002482:	c2cc                	sw	a1,4(a3)
10002484:	46cc                	lw	a1,12(a3)
10002486:	8dfd                	and	a1,a1,a5
10002488:	00470513          	addi	a0,a4,4
1000248c:	054e                	slli	a0,a0,0x13
1000248e:	8dc9                	or	a1,a1,a0
10002490:	c6cc                	sw	a1,12(a3)
10002492:	200015b7          	lui	a1,0x20001
10002496:	d8c58593          	addi	a1,a1,-628 # 20000d8c <rf_common_desc_rftx_off>
1000249a:	41d4                	lw	a3,4(a1)
1000249c:	8efd                	and	a3,a3,a5
1000249e:	00564503          	lbu	a0,5(a2)
100024a2:	0542                	slli	a0,a0,0x10
100024a4:	8ec9                	or	a3,a3,a0
100024a6:	c1d4                	sw	a3,4(a1)
100024a8:	200014b7          	lui	s1,0x20001
100024ac:	e6448413          	addi	s0,s1,-412 # 20000e64 <rf_common_desc_tx_setfreq>
100024b0:	4474                	lw	a3,76(s0)
100024b2:	8efd                	and	a3,a3,a5
100024b4:	00664583          	lbu	a1,6(a2)
100024b8:	05c2                	slli	a1,a1,0x10
100024ba:	8ecd                	or	a3,a3,a1
100024bc:	c474                	sw	a3,76(s0)
100024be:	00170313          	addi	t1,a4,1
100024c2:	0ff37693          	zext.b	a3,t1
100024c6:	584c                	lw	a1,52(s0)
100024c8:	8dfd                	and	a1,a1,a5
100024ca:	00168513          	addi	a0,a3,1
100024ce:	054e                	slli	a0,a0,0x13
100024d0:	8dc9                	or	a1,a1,a0
100024d2:	d84c                	sw	a1,52(s0)
100024d4:	5c48                	lw	a0,60(s0)
100024d6:	8d7d                	and	a0,a0,a5
100024d8:	01769293          	slli	t0,a3,0x17
100024dc:	00ff05b7          	lui	a1,0xff0
100024e0:	00b2f2b3          	and	t0,t0,a1
100024e4:	00556533          	or	a0,a0,t0
100024e8:	dc48                	sw	a0,60(s0)
100024ea:	4068                	lw	a0,68(s0)
100024ec:	8d7d                	and	a0,a0,a5
100024ee:	8285                	srli	a3,a3,0x1
100024f0:	06c2                	slli	a3,a3,0x10
100024f2:	8ec9                	or	a3,a3,a0
100024f4:	c074                	sw	a3,68(s0)
100024f6:	200016b7          	lui	a3,0x20001
100024fa:	dcc68693          	addi	a3,a3,-564 # 20000dcc <rf_common_desc_rx_setfreq>
100024fe:	5ac8                	lw	a0,52(a3)
10002500:	8d7d                	and	a0,a0,a5
10002502:	034e                	slli	t1,t1,0x13
10002504:	00656533          	or	a0,a0,t1
10002508:	dac8                	sw	a0,52(a3)
1000250a:	5ec8                	lw	a0,60(a3)
1000250c:	8d7d                	and	a0,a0,a5
1000250e:	01771313          	slli	t1,a4,0x17
10002512:	00b37333          	and	t1,t1,a1
10002516:	00656533          	or	a0,a0,t1
1000251a:	dec8                	sw	a0,60(a3)
1000251c:	42e8                	lw	a0,68(a3)
1000251e:	8d7d                	and	a0,a0,a5
10002520:	00175313          	srli	t1,a4,0x1
10002524:	0342                	slli	t1,t1,0x10
10002526:	00656533          	or	a0,a0,t1
1000252a:	c2e8                	sw	a0,68(a3)
1000252c:	1779                	addi	a4,a4,-2
1000252e:	0ff77713          	zext.b	a4,a4
10002532:	200016b7          	lui	a3,0x20001
10002536:	d6c68693          	addi	a3,a3,-660 # 20000d6c <rf_common_desc_rfrx_on>
1000253a:	46c8                	lw	a0,12(a3)
1000253c:	8d7d                	and	a0,a0,a5
1000253e:	01771313          	slli	t1,a4,0x17
10002542:	00b37333          	and	t1,t1,a1
10002546:	00656533          	or	a0,a0,t1
1000254a:	c6c8                	sw	a0,12(a3)
1000254c:	4ac8                	lw	a0,20(a3)
1000254e:	8d7d                	and	a0,a0,a5
10002550:	8305                	srli	a4,a4,0x1
10002552:	0742                	slli	a4,a4,0x10
10002554:	8f49                	or	a4,a4,a0
10002556:	cad8                	sw	a4,20(a3)
10002558:	00364703          	lbu	a4,3(a2)
1000255c:	200016b7          	lui	a3,0x20001
10002560:	d4c68693          	addi	a3,a3,-692 # 20000d4c <rf_common_desc_rfrx_off>
10002564:	42d0                	lw	a2,4(a3)
10002566:	8e7d                	and	a2,a2,a5
10002568:	01771513          	slli	a0,a4,0x17
1000256c:	8de9                	and	a1,a1,a0
1000256e:	8dd1                	or	a1,a1,a2
10002570:	c2cc                	sw	a1,4(a3)
10002572:	46d0                	lw	a2,12(a3)
10002574:	8ff1                	and	a5,a5,a2
10002576:	8305                	srli	a4,a4,0x1
10002578:	0742                	slli	a4,a4,0x10
1000257a:	8f5d                	or	a4,a4,a5
1000257c:	c6d8                	sw	a4,12(a3)
1000257e:	2965                	jal	10002a36 <omw_rf_dcoc_cal>
10002580:	6785                	lui	a5,0x1
10002582:	40778793          	addi	a5,a5,1031 # 1407 <__STACK_SIZE+0x1007>
10002586:	02f11223          	sh	a5,36(sp)
1000258a:	02100793          	li	a5,33
1000258e:	02f10323          	sb	a5,38(sp)
10002592:	420027b7          	lui	a5,0x42002
10002596:	60600713          	li	a4,1542
1000259a:	cbd8                	sw	a4,20(a5)
1000259c:	400006b7          	lui	a3,0x40000
100025a0:	1846a783          	lw	a5,388(a3) # 40000184 <__StackTop+0x1fffc184>
100025a4:	7701                	lui	a4,0xfffe0
100025a6:	8ff9                	and	a5,a5,a4
100025a8:	6741                	lui	a4,0x10
100025aa:	20070713          	addi	a4,a4,512 # 10200 <memset+0x3834>
100025ae:	8fd9                	or	a5,a5,a4
100025b0:	18f6a223          	sw	a5,388(a3)
100025b4:	8660b7b7          	lui	a5,0x8660b
100025b8:	53878793          	addi	a5,a5,1336 # 8660b538 <__StackTop+0x66607538>
100025bc:	c01c                	sw	a5,0(s0)
100025be:	e6448513          	addi	a0,s1,-412
100025c2:	0ffff097          	auipc	ra,0xffff
100025c6:	284080e7          	jalr	644(ra) # 20001846 <start_await_dma>
100025ca:	200037b7          	lui	a5,0x20003
100025ce:	bcc78793          	addi	a5,a5,-1076 # 20002bcc <g_hp>
100025d2:	cc3e                	sw	a5,24(sp)
100025d4:	105c                	addi	a5,sp,36
100025d6:	ce3e                	sw	a5,28(sp)
100025d8:	6785                	lui	a5,0x1
100025da:	80078793          	addi	a5,a5,-2048 # 800 <__STACK_SIZE+0x400>
100025de:	d03e                	sw	a5,32(sp)
100025e0:	a29d                	j	10002746 <RF_OnChip_Init+0x300>
100025e2:	4789                	li	a5,2
100025e4:	4702                	lw	a4,0(sp)
100025e6:	12e7c463          	blt	a5,a4,1000270e <RF_OnChip_Init+0x2c8>
100025ea:	47f2                	lw	a5,28(sp)
100025ec:	0007c503          	lbu	a0,0(a5)
100025f0:	3d25                	jal	10002428 <Radio_OnChip_Set_Freq_Sw>
100025f2:	42002437          	lui	s0,0x42002
100025f6:	00042c23          	sw	zero,24(s0) # 42002018 <__StackTop+0x21ffe018>
100025fa:	4785                	li	a5,1
100025fc:	cc1c                	sw	a5,24(s0)
100025fe:	470d                	li	a4,3
10002600:	cc18                	sw	a4,24(s0)
10002602:	cc1c                	sw	a5,24(s0)
10002604:	0c800513          	li	a0,200
10002608:	f000a097          	auipc	ra,0xf000a
1000260c:	2ce080e7          	jalr	718(ra) # c8d6 <delay_us>
10002610:	4c5c                	lw	a5,28(s0)
10002612:	0002c737          	lui	a4,0x2c
10002616:	8fd9                	or	a5,a5,a4
10002618:	cc5c                	sw	a5,28(s0)
1000261a:	67a5                	lui	a5,0x9
1000261c:	80278793          	addi	a5,a5,-2046 # 8802 <bt_security_err_get+0xca>
10002620:	0cf42a23          	sw	a5,212(s0)
10002624:	4c5c                	lw	a5,28(s0)
10002626:	83b9                	srli	a5,a5,0xe
10002628:	8b8d                	andi	a5,a5,3
1000262a:	5702                	lw	a4,32(sp)
1000262c:	00f714b3          	sll	s1,a4,a5
10002630:	01049713          	slli	a4,s1,0x10
10002634:	8341                	srli	a4,a4,0x10
10002636:	19c00593          	li	a1,412
1000263a:	c23a                	sw	a4,4(sp)
1000263c:	853a                	mv	a0,a4
1000263e:	3e61                	jal	100021d6 <rf_get_ad_pll_counter>
10002640:	c42a                	sw	a0,8(sp)
10002642:	26400593          	li	a1,612
10002646:	4512                	lw	a0,4(sp)
10002648:	3679                	jal	100021d6 <rf_get_ad_pll_counter>
1000264a:	4c5c                	lw	a5,28(s0)
1000264c:	7701                	lui	a4,0xfffe0
1000264e:	177d                	addi	a4,a4,-1 # fffdffff <__StackTop+0xdffdbfff>
10002650:	8ff9                	and	a5,a5,a4
10002652:	cc5c                	sw	a5,28(s0)
10002654:	67a5                	lui	a5,0x9
10002656:	81978793          	addi	a5,a5,-2023 # 8819 <bt_security_err_get+0xe1>
1000265a:	0cf42a23          	sw	a5,212(s0)
1000265e:	47a2                	lw	a5,8(sp)
10002660:	8d1d                	sub	a0,a0,a5
10002662:	00151793          	slli	a5,a0,0x1
10002666:	953e                	add	a0,a0,a5
10002668:	0506                	slli	a0,a0,0x1
1000266a:	00549713          	slli	a4,s1,0x5
1000266e:	8f05                	sub	a4,a4,s1
10002670:	070a                	slli	a4,a4,0x2
10002672:	9726                	add	a4,a4,s1
10002674:	02a75733          	divu	a4,a4,a0
10002678:	4329                	li	t1,10
1000267a:	026777b3          	remu	a5,a4,t1
1000267e:	0057b793          	sltiu	a5,a5,5
10002682:	0017c793          	xori	a5,a5,1
10002686:	02675733          	divu	a4,a4,t1
1000268a:	973e                	add	a4,a4,a5
1000268c:	0ff77713          	zext.b	a4,a4
10002690:	4462                	lw	s0,24(sp)
10002692:	85a2                	mv	a1,s0
10002694:	00e40123          	sb	a4,2(s0)
10002698:	0fa00793          	li	a5,250
1000269c:	02f487b3          	mul	a5,s1,a5
100026a0:	02a7d7b3          	divu	a5,a5,a0
100026a4:	0267f6b3          	remu	a3,a5,t1
100026a8:	0056b693          	sltiu	a3,a3,5
100026ac:	0016c693          	xori	a3,a3,1
100026b0:	0267d7b3          	divu	a5,a5,t1
100026b4:	97b6                	add	a5,a5,a3
100026b6:	0ff7f693          	zext.b	a3,a5
100026ba:	00d40023          	sb	a3,0(s0)
100026be:	1f400793          	li	a5,500
100026c2:	02f487b3          	mul	a5,s1,a5
100026c6:	02a7d7b3          	divu	a5,a5,a0
100026ca:	0267f633          	remu	a2,a5,t1
100026ce:	00563613          	sltiu	a2,a2,5
100026d2:	00164613          	xori	a2,a2,1
100026d6:	0267d7b3          	divu	a5,a5,t1
100026da:	97b2                	add	a5,a5,a2
100026dc:	0ff7f793          	zext.b	a5,a5
100026e0:	00f400a3          	sb	a5,1(s0)
100026e4:	fc068613          	addi	a2,a3,-64
100026e8:	0ff67613          	zext.b	a2,a2
100026ec:	03f00513          	li	a0,63
100026f0:	eec569e3          	bltu	a0,a2,100025e2 <RF_OnChip_Init+0x19c>
100026f4:	4632                	lw	a2,12(sp)
100026f6:	96b2                	add	a3,a3,a2
100026f8:	c636                	sw	a3,12(sp)
100026fa:	46c2                	lw	a3,16(sp)
100026fc:	97b6                	add	a5,a5,a3
100026fe:	c83e                	sw	a5,16(sp)
10002700:	47d2                	lw	a5,20(sp)
10002702:	97ba                	add	a5,a5,a4
10002704:	ca3e                	sw	a5,20(sp)
10002706:	4782                	lw	a5,0(sp)
10002708:	0785                	addi	a5,a5,1
1000270a:	c03e                	sw	a5,0(sp)
1000270c:	bdd9                	j	100025e2 <RF_OnChip_Init+0x19c>
1000270e:	478d                	li	a5,3
10002710:	4732                	lw	a4,12(sp)
10002712:	02f75733          	divu	a4,a4,a5
10002716:	00e58023          	sb	a4,0(a1) # ff0000 <__FLASH_SIZE+0xfb0000>
1000271a:	4742                	lw	a4,16(sp)
1000271c:	02f75733          	divu	a4,a4,a5
10002720:	00e580a3          	sb	a4,1(a1)
10002724:	4752                	lw	a4,20(sp)
10002726:	02f757b3          	divu	a5,a4,a5
1000272a:	00f58123          	sb	a5,2(a1)
1000272e:	47e2                	lw	a5,24(sp)
10002730:	078d                	addi	a5,a5,3
10002732:	cc3e                	sw	a5,24(sp)
10002734:	4772                	lw	a4,28(sp)
10002736:	0705                	addi	a4,a4,1
10002738:	ce3a                	sw	a4,28(sp)
1000273a:	20003737          	lui	a4,0x20003
1000273e:	bd570713          	addi	a4,a4,-1067 # 20002bd5 <g_hp+0x9>
10002742:	00e78763          	beq	a5,a4,10002750 <RF_OnChip_Init+0x30a>
10002746:	c002                	sw	zero,0(sp)
10002748:	ca02                	sw	zero,20(sp)
1000274a:	c802                	sw	zero,16(sp)
1000274c:	c602                	sw	zero,12(sp)
1000274e:	bd71                	j	100025ea <RF_OnChip_Init+0x1a4>
10002750:	20001537          	lui	a0,0x20001
10002754:	d8c50513          	addi	a0,a0,-628 # 20000d8c <rf_common_desc_rftx_off>
10002758:	0ffff097          	auipc	ra,0xffff
1000275c:	0ee080e7          	jalr	238(ra) # 20001846 <start_await_dma>
10002760:	40000737          	lui	a4,0x40000
10002764:	18472783          	lw	a5,388(a4) # 40000184 <__StackTop+0x1fffc184>
10002768:	7681                	lui	a3,0xfffe0
1000276a:	8ff5                	and	a5,a5,a3
1000276c:	2007e793          	ori	a5,a5,512
10002770:	18f72223          	sw	a5,388(a4)
10002774:	420027b7          	lui	a5,0x42002
10002778:	471d                	li	a4,7
1000277a:	cbd8                	sw	a4,20(a5)
1000277c:	0ffff097          	auipc	ra,0xffff
10002780:	078080e7          	jalr	120(ra) # 200017f4 <trigger_gpadc_temp_sampling>
10002784:	4529                	li	a0,10
10002786:	f000a097          	auipc	ra,0xf000a
1000278a:	150080e7          	jalr	336(ra) # c8d6 <delay_us>
1000278e:	400407b7          	lui	a5,0x40040
10002792:	57f8                	lw	a4,108(a5)
10002794:	200037b7          	lui	a5,0x20003
10002798:	bee78423          	sb	a4,-1048(a5) # 20002be8 <g_rf_cfg+0x8>
1000279c:	2131                	jal	10002ba8 <disable_gpadc>
1000279e:	0ffff097          	auipc	ra,0xffff
100027a2:	358080e7          	jalr	856(ra) # 20001af6 <RF_OnChip_Cali_Cfg>
100027a6:	4501                	li	a0,0
100027a8:	3e2d                	jal	100022e2 <omw_rf_set_tx_pwr_lvl>
100027aa:	50c2                	lw	ra,48(sp)
100027ac:	5432                	lw	s0,44(sp)
100027ae:	54a2                	lw	s1,40(sp)
100027b0:	03410113          	addi	sp,sp,52
100027b4:	8082                	ret

100027b6 <start_adc_cap>:
100027b6:	1161                	addi	sp,sp,-8
100027b8:	400007b7          	lui	a5,0x40000
100027bc:	4705                	li	a4,1
100027be:	16e7a223          	sw	a4,356(a5) # 40000164 <__StackTop+0x1fffc164>
100027c2:	420007b7          	lui	a5,0x42000
100027c6:	1047a783          	lw	a5,260(a5) # 42000104 <__StackTop+0x21ffc104>
100027ca:	c23e                	sw	a5,4(sp)
100027cc:	42000637          	lui	a2,0x42000
100027d0:	46cd                	li	a3,19
100027d2:	10462783          	lw	a5,260(a2) # 42000104 <__StackTop+0x21ffc104>
100027d6:	4712                	lw	a4,4(sp)
100027d8:	8f99                	sub	a5,a5,a4
100027da:	fef6fce3          	bgeu	a3,a5,100027d2 <start_adc_cap+0x1c>
100027de:	400007b7          	lui	a5,0x40000
100027e2:	470d                	li	a4,3
100027e4:	16e7a223          	sw	a4,356(a5) # 40000164 <__StackTop+0x1fffc164>
100027e8:	420007b7          	lui	a5,0x42000
100027ec:	1047a783          	lw	a5,260(a5) # 42000104 <__StackTop+0x21ffc104>
100027f0:	c03e                	sw	a5,0(sp)
100027f2:	42000637          	lui	a2,0x42000
100027f6:	46cd                	li	a3,19
100027f8:	10462783          	lw	a5,260(a2) # 42000104 <__StackTop+0x21ffc104>
100027fc:	4702                	lw	a4,0(sp)
100027fe:	8f99                	sub	a5,a5,a4
10002800:	fef6fce3          	bgeu	a3,a5,100027f8 <start_adc_cap+0x42>
10002804:	400007b7          	lui	a5,0x40000
10002808:	4705                	li	a4,1
1000280a:	16e7a223          	sw	a4,356(a5) # 40000164 <__StackTop+0x1fffc164>
1000280e:	40000737          	lui	a4,0x40000
10002812:	16872783          	lw	a5,360(a4) # 40000168 <__StackTop+0x1fffc168>
10002816:	8b9d                	andi	a5,a5,7
10002818:	ffed                	bnez	a5,10002812 <start_adc_cap+0x5c>
1000281a:	40000737          	lui	a4,0x40000
1000281e:	16072223          	sw	zero,356(a4) # 40000164 <__StackTop+0x1fffc164>
10002822:	000907b7          	lui	a5,0x90
10002826:	079d                	addi	a5,a5,7 # 90007 <__FLASH_SIZE+0x50007>
10002828:	16f72823          	sw	a5,368(a4)
1000282c:	0121                	addi	sp,sp,8
1000282e:	8082                	ret

10002830 <get_dc_info_iq>:
10002830:	fcc10113          	addi	sp,sp,-52
10002834:	d806                	sw	ra,48(sp)
10002836:	d622                	sw	s0,44(sp)
10002838:	d426                	sw	s1,40(sp)
1000283a:	200007b7          	lui	a5,0x20000
1000283e:	0007a283          	lw	t0,0(a5) # 20000000 <__etext+0xfffb894>
10002842:	0047a303          	lw	t1,4(a5)
10002846:	4788                	lw	a0,8(a5)
10002848:	47cc                	lw	a1,12(a5)
1000284a:	4b90                	lw	a2,16(a5)
1000284c:	4bd4                	lw	a3,20(a5)
1000284e:	4f98                	lw	a4,24(a5)
10002850:	4fdc                	lw	a5,28(a5)
10002852:	c416                	sw	t0,8(sp)
10002854:	c61a                	sw	t1,12(sp)
10002856:	c82a                	sw	a0,16(sp)
10002858:	ca2e                	sw	a1,20(sp)
1000285a:	cc32                	sw	a2,24(sp)
1000285c:	ce36                	sw	a3,28(sp)
1000285e:	d03a                	sw	a4,32(sp)
10002860:	d23e                	sw	a5,36(sp)
10002862:	400007b7          	lui	a5,0x40000
10002866:	00110737          	lui	a4,0x110
1000286a:	16e7a023          	sw	a4,352(a5) # 40000160 <__StackTop+0x1fffc160>
1000286e:	01090737          	lui	a4,0x1090
10002872:	071d                	addi	a4,a4,7 # 1090007 <__FLASH_SIZE+0x1050007>
10002874:	16e7a823          	sw	a4,368(a5)
10002878:	53d8                	lw	a4,36(a5)
1000287a:	6689                	lui	a3,0x2
1000287c:	8f55                	or	a4,a4,a3
1000287e:	d3d8                	sw	a4,36(a5)
10002880:	47a1                	li	a5,8
10002882:	c23e                	sw	a5,4(sp)
10002884:	4401                	li	s0,0
10002886:	4481                	li	s1,0
10002888:	200007b7          	lui	a5,0x20000
1000288c:	02078793          	addi	a5,a5,32 # 20000020 <rf_bt_call_desc_list_recv_fist+0xc>
10002890:	c03e                	sw	a5,0(sp)
10002892:	a82d                	j	100028cc <get_dc_info_iq+0x9c>
10002894:	943a                	add	s0,s0,a4
10002896:	0691                	addi	a3,a3,4 # 2004 <xrand>
10002898:	4782                	lw	a5,0(sp)
1000289a:	02f68563          	beq	a3,a5,100028c4 <get_dc_info_iq+0x94>
1000289e:	429c                	lw	a5,0(a3)
100028a0:	00a7d713          	srli	a4,a5,0xa
100028a4:	3ff77613          	andi	a2,a4,1023
100028a8:	20077713          	andi	a4,a4,512
100028ac:	c319                	beqz	a4,100028b2 <get_dc_info_iq+0x82>
100028ae:	c0060613          	addi	a2,a2,-1024
100028b2:	94b2                	add	s1,s1,a2
100028b4:	3ff7f713          	andi	a4,a5,1023
100028b8:	2007f793          	andi	a5,a5,512
100028bc:	dfe1                	beqz	a5,10002894 <get_dc_info_iq+0x64>
100028be:	c0070713          	addi	a4,a4,-1024
100028c2:	bfc9                	j	10002894 <get_dc_info_iq+0x64>
100028c4:	4792                	lw	a5,4(sp)
100028c6:	17fd                	addi	a5,a5,-1
100028c8:	c23e                	sw	a5,4(sp)
100028ca:	c789                	beqz	a5,100028d4 <get_dc_info_iq+0xa4>
100028cc:	35ed                	jal	100027b6 <start_adc_cap>
100028ce:	200006b7          	lui	a3,0x20000
100028d2:	b7f1                	j	1000289e <get_dc_info_iq+0x6e>
100028d4:	200007b7          	lui	a5,0x20000
100028d8:	42b2                	lw	t0,12(sp)
100028da:	4342                	lw	t1,16(sp)
100028dc:	4552                	lw	a0,20(sp)
100028de:	45e2                	lw	a1,24(sp)
100028e0:	4672                	lw	a2,28(sp)
100028e2:	5682                	lw	a3,32(sp)
100028e4:	5712                	lw	a4,36(sp)
100028e6:	43a2                	lw	t2,8(sp)
100028e8:	0077a023          	sw	t2,0(a5) # 20000000 <__etext+0xfffb894>
100028ec:	0057a223          	sw	t0,4(a5)
100028f0:	0067a423          	sw	t1,8(a5)
100028f4:	c7c8                	sw	a0,12(a5)
100028f6:	cb8c                	sw	a1,16(a5)
100028f8:	cbd0                	sw	a2,20(a5)
100028fa:	cf94                	sw	a3,24(a5)
100028fc:	cfd8                	sw	a4,28(a5)
100028fe:	41f4d513          	srai	a0,s1,0x1f
10002902:	0ff57513          	zext.b	a0,a0
10002906:	9526                	add	a0,a0,s1
10002908:	8521                	srai	a0,a0,0x8
1000290a:	0542                	slli	a0,a0,0x10
1000290c:	41f45793          	srai	a5,s0,0x1f
10002910:	0ff7f793          	zext.b	a5,a5
10002914:	97a2                	add	a5,a5,s0
10002916:	87a1                	srai	a5,a5,0x8
10002918:	07c2                	slli	a5,a5,0x10
1000291a:	83c1                	srli	a5,a5,0x10
1000291c:	8d5d                	or	a0,a0,a5
1000291e:	50c2                	lw	ra,48(sp)
10002920:	5432                	lw	s0,44(sp)
10002922:	54a2                	lw	s1,40(sp)
10002924:	03410113          	addi	sp,sp,52
10002928:	8082                	ret

1000292a <rf_dcoc_calib_iq_bq>:
1000292a:	1101                	addi	sp,sp,-32
1000292c:	ce06                	sw	ra,28(sp)
1000292e:	cc22                	sw	s0,24(sp)
10002930:	ca26                	sw	s1,20(sp)
10002932:	10801737          	lui	a4,0x10801
10002936:	81070713          	addi	a4,a4,-2032 # 10800810 <__etext+0x7fc0a4>
1000293a:	8f09                	sub	a4,a4,a0
1000293c:	00271793          	slli	a5,a4,0x2
10002940:	c83e                	sw	a5,16(sp)
10002942:	47a1                	li	a5,8
10002944:	8f89                	sub	a5,a5,a0
10002946:	0792                	slli	a5,a5,0x4
10002948:	42001737          	lui	a4,0x42001
1000294c:	10f72223          	sw	a5,260(a4) # 42001104 <__StackTop+0x21ffd104>
10002950:	35c5                	jal	10002830 <get_dc_info_iq>
10002952:	41055493          	srai	s1,a0,0x10
10002956:	01051413          	slli	s0,a0,0x10
1000295a:	8441                	srai	s0,s0,0x10
1000295c:	0c000793          	li	a5,192
10002960:	c23e                	sw	a5,4(sp)
10002962:	fc000793          	li	a5,-64
10002966:	c03e                	sw	a5,0(sp)
10002968:	02905163          	blez	s1,1000298a <rf_dcoc_calib_iq_bq+0x60>
1000296c:	0c000793          	li	a5,192
10002970:	c63e                	sw	a5,12(sp)
10002972:	fc000793          	li	a5,-64
10002976:	c43e                	sw	a5,8(sp)
10002978:	00805e63          	blez	s0,10002994 <rf_dcoc_calib_iq_bq+0x6a>
1000297c:	04d1                	addi	s1,s1,20
1000297e:	0294b493          	sltiu	s1,s1,41
10002982:	0451                	addi	s0,s0,20
10002984:	02943413          	sltiu	s0,s0,41
10002988:	a0b1                	j	100029d4 <rf_dcoc_calib_iq_bq+0xaa>
1000298a:	04000793          	li	a5,64
1000298e:	c23e                	sw	a5,4(sp)
10002990:	c03e                	sw	a5,0(sp)
10002992:	bfe9                	j	1000296c <rf_dcoc_calib_iq_bq+0x42>
10002994:	04000793          	li	a5,64
10002998:	c63e                	sw	a5,12(sp)
1000299a:	c43e                	sw	a5,8(sp)
1000299c:	b7c5                	j	1000297c <rf_dcoc_calib_iq_bq+0x52>
1000299e:	46c2                	lw	a3,16(sp)
100029a0:	429c                	lw	a5,0(a3)
100029a2:	fff01737          	lui	a4,0xfff01
100029a6:	177d                	addi	a4,a4,-1 # fff00fff <__StackTop+0xdfefcfff>
100029a8:	8f7d                	and	a4,a4,a5
100029aa:	4792                	lw	a5,4(sp)
100029ac:	07b2                	slli	a5,a5,0xc
100029ae:	8fd9                	or	a5,a5,a4
100029b0:	c29c                	sw	a5,0(a3)
100029b2:	ec0d                	bnez	s0,100029ec <rf_dcoc_calib_iq_bq+0xc2>
100029b4:	a01d                	j	100029da <rf_dcoc_calib_iq_bq+0xb0>
100029b6:	4592                	lw	a1,4(sp)
100029b8:	95b6                	add	a1,a1,a3
100029ba:	c22e                	sw	a1,4(sp)
100029bc:	c036                	sw	a3,0(sp)
100029be:	a8b9                	j	10002a1c <rf_dcoc_calib_iq_bq+0xf2>
100029c0:	46b2                	lw	a3,12(sp)
100029c2:	96b2                	add	a3,a3,a2
100029c4:	c636                	sw	a3,12(sp)
100029c6:	c432                	sw	a2,8(sp)
100029c8:	0751                	addi	a4,a4,20
100029ca:	02973493          	sltiu	s1,a4,41
100029ce:	07d1                	addi	a5,a5,20
100029d0:	0297b413          	sltiu	s0,a5,41
100029d4:	d4e9                	beqz	s1,1000299e <rf_dcoc_calib_iq_bq+0x74>
100029d6:	04041b63          	bnez	s0,10002a2c <rf_dcoc_calib_iq_bq+0x102>
100029da:	46c2                	lw	a3,16(sp)
100029dc:	429c                	lw	a5,0(a3)
100029de:	777d                	lui	a4,0xfffff
100029e0:	073d                	addi	a4,a4,15 # fffff00f <__StackTop+0xdfffb00f>
100029e2:	8f7d                	and	a4,a4,a5
100029e4:	47b2                	lw	a5,12(sp)
100029e6:	0792                	slli	a5,a5,0x4
100029e8:	8fd9                	or	a5,a5,a4
100029ea:	c29c                	sw	a5,0(a3)
100029ec:	3591                	jal	10002830 <get_dc_info_iq>
100029ee:	41055713          	srai	a4,a0,0x10
100029f2:	01051793          	slli	a5,a0,0x10
100029f6:	87c1                	srai	a5,a5,0x10
100029f8:	4602                	lw	a2,0(sp)
100029fa:	40165693          	srai	a3,a2,0x1
100029fe:	02c68763          	beq	a3,a2,10002a2c <rf_dcoc_calib_iq_bq+0x102>
10002a02:	45a2                	lw	a1,8(sp)
10002a04:	4015d613          	srai	a2,a1,0x1
10002a08:	02b60263          	beq	a2,a1,10002a2c <rf_dcoc_calib_iq_bq+0x102>
10002a0c:	00049863          	bnez	s1,10002a1c <rf_dcoc_calib_iq_bq+0xf2>
10002a10:	fa0743e3          	bltz	a4,100029b6 <rf_dcoc_calib_iq_bq+0x8c>
10002a14:	4592                	lw	a1,4(sp)
10002a16:	8d95                	sub	a1,a1,a3
10002a18:	c22e                	sw	a1,4(sp)
10002a1a:	c036                	sw	a3,0(sp)
10002a1c:	f455                	bnez	s0,100029c8 <rf_dcoc_calib_iq_bq+0x9e>
10002a1e:	fa07c1e3          	bltz	a5,100029c0 <rf_dcoc_calib_iq_bq+0x96>
10002a22:	46b2                	lw	a3,12(sp)
10002a24:	8e91                	sub	a3,a3,a2
10002a26:	c636                	sw	a3,12(sp)
10002a28:	c432                	sw	a2,8(sp)
10002a2a:	bf79                	j	100029c8 <rf_dcoc_calib_iq_bq+0x9e>
10002a2c:	40f2                	lw	ra,28(sp)
10002a2e:	4462                	lw	s0,24(sp)
10002a30:	44d2                	lw	s1,20(sp)
10002a32:	6105                	addi	sp,sp,32
10002a34:	8082                	ret

10002a36 <omw_rf_dcoc_cal>:
10002a36:	1151                	addi	sp,sp,-12
10002a38:	c406                	sw	ra,8(sp)
10002a3a:	c222                	sw	s0,4(sp)
10002a3c:	c026                	sw	s1,0(sp)
10002a3e:	20001737          	lui	a4,0x20001
10002a42:	8660b7b7          	lui	a5,0x8660b
10002a46:	53878793          	addi	a5,a5,1336 # 8660b538 <__StackTop+0x66607538>
10002a4a:	dcf72623          	sw	a5,-564(a4) # 20000dcc <rf_common_desc_rx_setfreq>
10002a4e:	20001537          	lui	a0,0x20001
10002a52:	f2050513          	addi	a0,a0,-224 # 20000f20 <rf_desc_dcoc_calib_rx_on>
10002a56:	0ffff097          	auipc	ra,0xffff
10002a5a:	df0080e7          	jalr	-528(ra) # 20001846 <start_await_dma>
10002a5e:	200037b7          	lui	a5,0x20003
10002a62:	4709                	li	a4,2
10002a64:	bee78623          	sb	a4,-1044(a5) # 20002bec <g_rf_cfg+0xc>
10002a68:	42002737          	lui	a4,0x42002
10002a6c:	0c472783          	lw	a5,196(a4) # 420020c4 <__StackTop+0x21ffe0c4>
10002a70:	f40006b7          	lui	a3,0xf4000
10002a74:	16fd                	addi	a3,a3,-1 # f3ffffff <__StackTop+0xd3ffbfff>
10002a76:	8ff5                	and	a5,a5,a3
10002a78:	080006b7          	lui	a3,0x8000
10002a7c:	8fd5                	or	a5,a5,a3
10002a7e:	0cf72223          	sw	a5,196(a4)
10002a82:	420016b7          	lui	a3,0x42001
10002a86:	1006a783          	lw	a5,256(a3) # 42001100 <__StackTop+0x21ffd100>
10002a8a:	0017e793          	ori	a5,a5,1
10002a8e:	10f6a023          	sw	a5,256(a3)
10002a92:	0c072783          	lw	a5,192(a4)
10002a96:	9bbd                	andi	a5,a5,-17
10002a98:	0cf72023          	sw	a5,192(a4)
10002a9c:	4401                	li	s0,0
10002a9e:	44a5                	li	s1,9
10002aa0:	0ff47513          	zext.b	a0,s0
10002aa4:	3559                	jal	1000292a <rf_dcoc_calib_iq_bq>
10002aa6:	0405                	addi	s0,s0,1
10002aa8:	fe941ce3          	bne	s0,s1,10002aa0 <omw_rf_dcoc_cal+0x6a>
10002aac:	200036b7          	lui	a3,0x20003
10002ab0:	be068693          	addi	a3,a3,-1056 # 20002be0 <g_rf_cfg>
10002ab4:	420027b7          	lui	a5,0x42002
10002ab8:	02078793          	addi	a5,a5,32 # 42002020 <__StackTop+0x21ffe020>
10002abc:	42002637          	lui	a2,0x42002
10002ac0:	04460613          	addi	a2,a2,68 # 42002044 <__StackTop+0x21ffe044>
10002ac4:	4398                	lw	a4,0(a5)
10002ac6:	8311                	srli	a4,a4,0x4
10002ac8:	00e69723          	sh	a4,14(a3)
10002acc:	0791                	addi	a5,a5,4
10002ace:	0689                	addi	a3,a3,2
10002ad0:	fec79ae3          	bne	a5,a2,10002ac4 <omw_rf_dcoc_cal+0x8e>
10002ad4:	42002737          	lui	a4,0x42002
10002ad8:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
10002adc:	0107e793          	ori	a5,a5,16
10002ae0:	0cf72023          	sw	a5,192(a4)
10002ae4:	42001737          	lui	a4,0x42001
10002ae8:	10072783          	lw	a5,256(a4) # 42001100 <__StackTop+0x21ffd100>
10002aec:	9bf9                	andi	a5,a5,-2
10002aee:	10f72023          	sw	a5,256(a4)
10002af2:	20001537          	lui	a0,0x20001
10002af6:	f0850513          	addi	a0,a0,-248 # 20000f08 <rf_desc_dcoc_calib_rx_off>
10002afa:	0ffff097          	auipc	ra,0xffff
10002afe:	d4c080e7          	jalr	-692(ra) # 20001846 <start_await_dma>
10002b02:	40a2                	lw	ra,8(sp)
10002b04:	4412                	lw	s0,4(sp)
10002b06:	4482                	lw	s1,0(sp)
10002b08:	0131                	addi	sp,sp,12
10002b0a:	8082                	ret

10002b0c <omw_clkcal_poll_corner>:
10002b0c:	1151                	addi	sp,sp,-12
10002b0e:	c406                	sw	ra,8(sp)
10002b10:	c222                	sw	s0,4(sp)
10002b12:	c026                	sw	s1,0(sp)
10002b14:	40000437          	lui	s0,0x40000
10002b18:	07044783          	lbu	a5,112(s0) # 40000070 <__StackTop+0x1fffc070>
10002b1c:	0fe7f793          	andi	a5,a5,254
10002b20:	06f40823          	sb	a5,112(s0)
10002b24:	6785                	lui	a5,0x1
10002b26:	07a1                	addi	a5,a5,8 # 1008 <__STACK_SIZE+0xc08>
10002b28:	06f41a23          	sh	a5,116(s0)
10002b2c:	47a9                	li	a5,10
10002b2e:	dc3c                	sw	a5,120(s0)
10002b30:	583c                	lw	a5,112(s0)
10002b32:	0027e793          	ori	a5,a5,2
10002b36:	d83c                	sw	a5,112(s0)
10002b38:	06400513          	li	a0,100
10002b3c:	f000a097          	auipc	ra,0xf000a
10002b40:	d9a080e7          	jalr	-614(ra) # c8d6 <delay_us>
10002b44:	583c                	lw	a5,112(s0)
10002b46:	9bf5                	andi	a5,a5,-3
10002b48:	d83c                	sw	a5,112(s0)
10002b4a:	06400513          	li	a0,100
10002b4e:	f000a097          	auipc	ra,0xf000a
10002b52:	d88080e7          	jalr	-632(ra) # c8d6 <delay_us>
10002b56:	583c                	lw	a5,112(s0)
10002b58:	0017e793          	ori	a5,a5,1
10002b5c:	d83c                	sw	a5,112(s0)
10002b5e:	40000737          	lui	a4,0x40000
10002b62:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
10002b66:	8bc1                	andi	a5,a5,16
10002b68:	dfed                	beqz	a5,10002b62 <omw_clkcal_poll_corner+0x56>
10002b6a:	40000437          	lui	s0,0x40000
10002b6e:	5c64                	lw	s1,124(s0)
10002b70:	583c                	lw	a5,112(s0)
10002b72:	9bf9                	andi	a5,a5,-2
10002b74:	d83c                	sw	a5,112(s0)
10002b76:	583c                	lw	a5,112(s0)
10002b78:	0027e793          	ori	a5,a5,2
10002b7c:	d83c                	sw	a5,112(s0)
10002b7e:	06400513          	li	a0,100
10002b82:	f000a097          	auipc	ra,0xf000a
10002b86:	d54080e7          	jalr	-684(ra) # c8d6 <delay_us>
10002b8a:	583c                	lw	a5,112(s0)
10002b8c:	9bf5                	andi	a5,a5,-3
10002b8e:	d83c                	sw	a5,112(s0)
10002b90:	06400513          	li	a0,100
10002b94:	f000a097          	auipc	ra,0xf000a
10002b98:	d42080e7          	jalr	-702(ra) # c8d6 <delay_us>
10002b9c:	8526                	mv	a0,s1
10002b9e:	40a2                	lw	ra,8(sp)
10002ba0:	4412                	lw	s0,4(sp)
10002ba2:	4482                	lw	s1,0(sp)
10002ba4:	0131                	addi	sp,sp,12
10002ba6:	8082                	ret

10002ba8 <disable_gpadc>:
10002ba8:	420027b7          	lui	a5,0x42002
10002bac:	0e87a703          	lw	a4,232(a5) # 420020e8 <__StackTop+0x21ffe0e8>
10002bb0:	9b79                	andi	a4,a4,-2
10002bb2:	0ee7a423          	sw	a4,232(a5)
10002bb6:	40040737          	lui	a4,0x40040
10002bba:	00072023          	sw	zero,0(a4) # 40040000 <__StackTop+0x2003c000>
10002bbe:	43d8                	lw	a4,4(a5)
10002bc0:	9b79                	andi	a4,a4,-2
10002bc2:	c3d8                	sw	a4,4(a5)
10002bc4:	8082                	ret

10002bc6 <get_vtrim>:
10002bc6:	c609                	beqz	a2,10002bd0 <get_vtrim+0xa>
10002bc8:	479d                	li	a5,7
10002bca:	00a7d363          	bge	a5,a0,10002bd0 <get_vtrim+0xa>
10002bce:	1541                	addi	a0,a0,-16
10002bd0:	952e                	add	a0,a0,a1
10002bd2:	00c54663          	blt	a0,a2,10002bde <get_vtrim+0x18>
10002bd6:	063d                	addi	a2,a2,15
10002bd8:	00c55363          	bge	a0,a2,10002bde <get_vtrim+0x18>
10002bdc:	862a                	mv	a2,a0
10002bde:	0641                	addi	a2,a2,16
10002be0:	41f65513          	srai	a0,a2,0x1f
10002be4:	8171                	srli	a0,a0,0x1c
10002be6:	962a                	add	a2,a2,a0
10002be8:	8a3d                	andi	a2,a2,15
10002bea:	40a60533          	sub	a0,a2,a0
10002bee:	8082                	ret

10002bf0 <get_corner_offset>:
10002bf0:	1141                	addi	sp,sp,-16
10002bf2:	c606                	sw	ra,12(sp)
10002bf4:	c422                	sw	s0,8(sp)
10002bf6:	c226                	sw	s1,4(sp)
10002bf8:	c02a                	sw	a0,0(sp)
10002bfa:	42002437          	lui	s0,0x42002
10002bfe:	4044                	lw	s1,4(s0)
10002c00:	445c                	lw	a5,12(s0)
10002c02:	1007e793          	ori	a5,a5,256
10002c06:	c45c                	sw	a5,12(s0)
10002c08:	405c                	lw	a5,4(s0)
10002c0a:	01c7e793          	ori	a5,a5,28
10002c0e:	c05c                	sw	a5,4(s0)
10002c10:	405c                	lw	a5,4(s0)
10002c12:	2007e793          	ori	a5,a5,512
10002c16:	c05c                	sw	a5,4(s0)
10002c18:	441c                	lw	a5,8(s0)
10002c1a:	87f7f793          	andi	a5,a5,-1921
10002c1e:	2807e793          	ori	a5,a5,640
10002c22:	c41c                	sw	a5,8(s0)
10002c24:	35e5                	jal	10002b0c <omw_clkcal_poll_corner>
10002c26:	445c                	lw	a5,12(s0)
10002c28:	eff7f793          	andi	a5,a5,-257
10002c2c:	c45c                	sw	a5,12(s0)
10002c2e:	c044                	sw	s1,4(s0)
10002c30:	0003b737          	lui	a4,0x3b
10002c34:	98070713          	addi	a4,a4,-1664 # 3a980 <memset+0x2dfb4>
10002c38:	02a767b3          	rem	a5,a4,a0
10002c3c:	01f55693          	srli	a3,a0,0x1f
10002c40:	96aa                	add	a3,a3,a0
10002c42:	8685                	srai	a3,a3,0x1
10002c44:	00d7a7b3          	slt	a5,a5,a3
10002c48:	0017c793          	xori	a5,a5,1
10002c4c:	02a74533          	div	a0,a4,a0
10002c50:	953e                	add	a0,a0,a5
10002c52:	4782                	lw	a5,0(sp)
10002c54:	40a78533          	sub	a0,a5,a0
10002c58:	40b2                	lw	ra,12(sp)
10002c5a:	4422                	lw	s0,8(sp)
10002c5c:	4492                	lw	s1,4(sp)
10002c5e:	0141                	addi	sp,sp,16
10002c60:	8082                	ret

10002c62 <omw_rf_cal>:
10002c62:	1131                	addi	sp,sp,-20
10002c64:	c806                	sw	ra,16(sp)
10002c66:	c622                	sw	s0,12(sp)
10002c68:	c426                	sw	s1,8(sp)
10002c6a:	14a00513          	li	a0,330
10002c6e:	3749                	jal	10002bf0 <get_corner_offset>
10002c70:	46e1                	li	a3,24
10002c72:	02d54733          	div	a4,a0,a3
10002c76:	41f55613          	srai	a2,a0,0x1f
10002c7a:	00a647b3          	xor	a5,a2,a0
10002c7e:	8f91                	sub	a5,a5,a2
10002c80:	02d7e7b3          	rem	a5,a5,a3
10002c84:	462d                	li	a2,11
10002c86:	4681                	li	a3,0
10002c88:	00f65663          	bge	a2,a5,10002c94 <omw_rf_cal+0x32>
10002c8c:	41f55693          	srai	a3,a0,0x1f
10002c90:	0016e693          	ori	a3,a3,1
10002c94:	9736                	add	a4,a4,a3
10002c96:	01871793          	slli	a5,a4,0x18
10002c9a:	87e1                	srai	a5,a5,0x18
10002c9c:	20003637          	lui	a2,0x20003
10002ca0:	be060613          	addi	a2,a2,-1056 # 20002be0 <g_rf_cfg>
10002ca4:	00f605a3          	sb	a5,11(a2)
10002ca8:	0ff77713          	zext.b	a4,a4
10002cac:	00570693          	addi	a3,a4,5
10002cb0:	0ff6f693          	zext.b	a3,a3
10002cb4:	00578593          	addi	a1,a5,5
10002cb8:	00b601a3          	sb	a1,3(a2)
10002cbc:	0f000593          	li	a1,240
10002cc0:	4601                	li	a2,0
10002cc2:	00d5e963          	bltu	a1,a3,10002cd4 <omw_rf_cal+0x72>
10002cc6:	8636                	mv	a2,a3
10002cc8:	45bd                	li	a1,15
10002cca:	00d5f363          	bgeu	a1,a3,10002cd0 <omw_rf_cal+0x6e>
10002cce:	463d                	li	a2,15
10002cd0:	0ff67613          	zext.b	a2,a2
10002cd4:	200036b7          	lui	a3,0x20003
10002cd8:	bec68123          	sb	a2,-1054(a3) # 20002be2 <g_rf_cfg+0x2>
10002cdc:	00378693          	addi	a3,a5,3
10002ce0:	0686                	slli	a3,a3,0x1
10002ce2:	0ff6f693          	zext.b	a3,a3
10002ce6:	0f000593          	li	a1,240
10002cea:	4601                	li	a2,0
10002cec:	00d5e963          	bltu	a1,a3,10002cfe <omw_rf_cal+0x9c>
10002cf0:	8636                	mv	a2,a3
10002cf2:	45fd                	li	a1,31
10002cf4:	00d5f363          	bgeu	a1,a3,10002cfa <omw_rf_cal+0x98>
10002cf8:	467d                	li	a2,31
10002cfa:	0ff67613          	zext.b	a2,a2
10002cfe:	200036b7          	lui	a3,0x20003
10002d02:	be068693          	addi	a3,a3,-1056 # 20002be0 <g_rf_cfg>
10002d06:	00c68223          	sb	a2,4(a3)
10002d0a:	0706                	slli	a4,a4,0x1
10002d0c:	0ff77713          	zext.b	a4,a4
10002d10:	00770613          	addi	a2,a4,7
10002d14:	00c682a3          	sb	a2,5(a3)
10002d18:	00c78613          	addi	a2,a5,12
10002d1c:	0606                	slli	a2,a2,0x1
10002d1e:	00c68323          	sb	a2,6(a3)
10002d22:	0715                	addi	a4,a4,5
10002d24:	00e683a3          	sb	a4,7(a3)
10002d28:	00279713          	slli	a4,a5,0x2
10002d2c:	8f99                	sub	a5,a5,a4
10002d2e:	078e                	slli	a5,a5,0x3
10002d30:	953e                	add	a0,a0,a5
10002d32:	4699                	li	a3,6
10002d34:	02d54733          	div	a4,a0,a3
10002d38:	41f55613          	srai	a2,a0,0x1f
10002d3c:	00a647b3          	xor	a5,a2,a0
10002d40:	8f91                	sub	a5,a5,a2
10002d42:	02d7e7b3          	rem	a5,a5,a3
10002d46:	4609                	li	a2,2
10002d48:	4681                	li	a3,0
10002d4a:	00f65663          	bge	a2,a5,10002d56 <omw_rf_cal+0xf4>
10002d4e:	41f55693          	srai	a3,a0,0x1f
10002d52:	0016e693          	ori	a3,a3,1
10002d56:	00d707b3          	add	a5,a4,a3
10002d5a:	01879493          	slli	s1,a5,0x18
10002d5e:	84e1                	srai	s1,s1,0x18
10002d60:	20003437          	lui	s0,0x20003
10002d64:	be040413          	addi	s0,s0,-1056 # 20002be0 <g_rf_cfg>
10002d68:	00940523          	sb	s1,10(s0)
10002d6c:	200027b7          	lui	a5,0x20002
10002d70:	29478793          	addi	a5,a5,660 # 20002294 <g_otp_cfg>
10002d74:	c03e                	sw	a5,0(sp)
10002d76:	4398                	lw	a4,0(a5)
10002d78:	4601                	li	a2,0
10002d7a:	85a6                	mv	a1,s1
10002d7c:	c23a                	sw	a4,4(sp)
10002d7e:	00f77513          	andi	a0,a4,15
10002d82:	3591                	jal	10002bc6 <get_vtrim>
10002d84:	00a40023          	sb	a0,0(s0)
10002d88:	4712                	lw	a4,4(sp)
10002d8a:	01075513          	srli	a0,a4,0x10
10002d8e:	5661                	li	a2,-8
10002d90:	85a6                	mv	a1,s1
10002d92:	893d                	andi	a0,a0,15
10002d94:	3d0d                	jal	10002bc6 <get_vtrim>
10002d96:	00a400a3          	sb	a0,1(s0)
10002d9a:	478d                	li	a5,3
10002d9c:	00f404a3          	sb	a5,9(s0)
10002da0:	4782                	lw	a5,0(sp)
10002da2:	5bd0                	lw	a2,52(a5)
10002da4:	0652                	slli	a2,a2,0x14
10002da6:	8251                	srli	a2,a2,0x14
10002da8:	100047b7          	lui	a5,0x10004
10002dac:	60478793          	addi	a5,a5,1540 # 10004604 <rssi_thresholds>
10002db0:	00c78593          	addi	a1,a5,12
10002db4:	4501                	li	a0,0
10002db6:	470d                	li	a4,3
10002db8:	4305                	li	t1,1
10002dba:	a021                	j	10002dc2 <omw_rf_cal+0x160>
10002dbc:	0789                	addi	a5,a5,2
10002dbe:	00b78b63          	beq	a5,a1,10002dd4 <omw_rf_cal+0x172>
10002dc2:	0007d683          	lhu	a3,0(a5)
10002dc6:	fed64be3          	blt	a2,a3,10002dbc <omw_rf_cal+0x15a>
10002dca:	177d                	addi	a4,a4,-1
10002dcc:	0762                	slli	a4,a4,0x18
10002dce:	8761                	srai	a4,a4,0x18
10002dd0:	851a                	mv	a0,t1
10002dd2:	b7ed                	j	10002dbc <omw_rf_cal+0x15a>
10002dd4:	c509                	beqz	a0,10002dde <omw_rf_cal+0x17c>
10002dd6:	200037b7          	lui	a5,0x20003
10002dda:	bee784a3          	sb	a4,-1047(a5) # 20002be9 <g_rf_cfg+0x9>
10002dde:	907fe0ef          	jal	100016e4 <omw_clkcal_rc24m_calibration>
10002de2:	a43fe0ef          	jal	10001824 <omw_clkcal_rc32k_calibration>
10002de6:	40c2                	lw	ra,16(sp)
10002de8:	4432                	lw	s0,12(sp)
10002dea:	44a2                	lw	s1,8(sp)
10002dec:	0151                	addi	sp,sp,20
10002dee:	8082                	ret

10002df0 <RF_2G4_DescInit_Mode>:
10002df0:	200037b7          	lui	a5,0x20003
10002df4:	c967c703          	lbu	a4,-874(a5) # 20002c96 <rf_2g4_thld+0x2>
10002df8:	420026b7          	lui	a3,0x42002
10002dfc:	0c06a783          	lw	a5,192(a3) # 420020c0 <__StackTop+0x21ffe0c0>
10002e00:	07f7f793          	andi	a5,a5,127
10002e04:	0cf6a023          	sw	a5,192(a3)
10002e08:	200037b7          	lui	a5,0x20003
10002e0c:	c0a7c783          	lbu	a5,-1014(a5) # 20002c0a <rf_2g4_mgr+0x2>
10002e10:	cf9d                	beqz	a5,10002e4e <RF_2G4_DescInit_Mode+0x5e>
10002e12:	4685                	li	a3,1
10002e14:	04d78563          	beq	a5,a3,10002e5e <RF_2G4_DescInit_Mode+0x6e>
10002e18:	08000793          	li	a5,128
10002e1c:	46c5                	li	a3,17
10002e1e:	42001637          	lui	a2,0x42001
10002e22:	00460593          	addi	a1,a2,4 # 42001004 <__StackTop+0x21ffd004>
10002e26:	c10c                	sw	a1,0(a0)
10002e28:	06c2                	slli	a3,a3,0x10
10002e2a:	6589                	lui	a1,0x2
10002e2c:	8ecd                	or	a3,a3,a1
10002e2e:	c154                	sw	a3,4(a0)
10002e30:	08c60693          	addi	a3,a2,140
10002e34:	c514                	sw	a3,8(a0)
10002e36:	0742                	slli	a4,a4,0x10
10002e38:	8f4d                	or	a4,a4,a1
10002e3a:	c558                	sw	a4,12(a0)
10002e3c:	05060613          	addi	a2,a2,80
10002e40:	c910                	sw	a2,16(a0)
10002e42:	07c2                	slli	a5,a5,0x10
10002e44:	8fcd                	or	a5,a5,a1
10002e46:	0087e793          	ori	a5,a5,8
10002e4a:	c95c                	sw	a5,20(a0)
10002e4c:	8082                	ret
10002e4e:	200037b7          	lui	a5,0x20003
10002e52:	c947c703          	lbu	a4,-876(a5) # 20002c94 <rf_2g4_thld>
10002e56:	08000793          	li	a5,128
10002e5a:	4685                	li	a3,1
10002e5c:	b7c9                	j	10002e1e <RF_2G4_DescInit_Mode+0x2e>
10002e5e:	42002737          	lui	a4,0x42002
10002e62:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
10002e66:	0807e793          	ori	a5,a5,128
10002e6a:	0cf72023          	sw	a5,192(a4)
10002e6e:	200037b7          	lui	a5,0x20003
10002e72:	c957c703          	lbu	a4,-875(a5) # 20002c95 <rf_2g4_thld+0x1>
10002e76:	08400793          	li	a5,132
10002e7a:	468d                	li	a3,3
10002e7c:	b74d                	j	10002e1e <RF_2G4_DescInit_Mode+0x2e>

10002e7e <reverse8>:
10002e7e:	00151793          	slli	a5,a0,0x1
10002e82:	8505                	srai	a0,a0,0x1
10002e84:	05557713          	andi	a4,a0,85
10002e88:	0aa7f513          	andi	a0,a5,170
10002e8c:	8d59                	or	a0,a0,a4
10002e8e:	00251793          	slli	a5,a0,0x2
10002e92:	8509                	srai	a0,a0,0x2
10002e94:	03357513          	andi	a0,a0,51
10002e98:	0cc7f793          	andi	a5,a5,204
10002e9c:	8d5d                	or	a0,a0,a5
10002e9e:	00451793          	slli	a5,a0,0x4
10002ea2:	8111                	srli	a0,a0,0x4
10002ea4:	8d5d                	or	a0,a0,a5
10002ea6:	0ff57513          	zext.b	a0,a0
10002eaa:	8082                	ret

10002eac <omw_svc_2g4_set_msb_first>:
10002eac:	c901                	beqz	a0,10002ebc <omw_svc_2g4_set_msb_first+0x10>
10002eae:	42000737          	lui	a4,0x42000
10002eb2:	4f3c                	lw	a5,88(a4)
10002eb4:	3007e793          	ori	a5,a5,768
10002eb8:	cf3c                	sw	a5,88(a4)
10002eba:	8082                	ret
10002ebc:	42000737          	lui	a4,0x42000
10002ec0:	4f3c                	lw	a5,88(a4)
10002ec2:	cff7f793          	andi	a5,a5,-769
10002ec6:	cf3c                	sw	a5,88(a4)
10002ec8:	8082                	ret

10002eca <omw_svc_2g4_set_phy_divisor>:
10002eca:	87aa                	mv	a5,a0
10002ecc:	e111                	bnez	a0,10002ed0 <omw_svc_2g4_set_phy_divisor+0x6>
10002ece:	4785                	li	a5,1
10002ed0:	0ff7f793          	zext.b	a5,a5
10002ed4:	20003737          	lui	a4,0x20003
10002ed8:	c0a74683          	lbu	a3,-1014(a4) # 20002c0a <rf_2g4_mgr+0x2>
10002edc:	4705                	li	a4,1
10002ede:	04d77163          	bgeu	a4,a3,10002f20 <omw_svc_2g4_set_phy_divisor+0x56>
10002ee2:	00279713          	slli	a4,a5,0x2
10002ee6:	973e                	add	a4,a4,a5
10002ee8:	0746                	slli	a4,a4,0x11
10002eea:	6695                	lui	a3,0x5
10002eec:	06a1                	addi	a3,a3,8 # 5008 <ll_scan_sched+0x10>
10002eee:	8f55                	or	a4,a4,a3
10002ef0:	200006b7          	lui	a3,0x20000
10002ef4:	48e6ae23          	sw	a4,1180(a3) # 2000049c <rf_common_desc_tx_end_delay+0x4>
10002ef8:	4705                	li	a4,1
10002efa:	02a77b63          	bgeu	a4,a0,10002f30 <omw_svc_2g4_set_phy_divisor+0x66>
10002efe:	0ff78693          	addi	a3,a5,255
10002f02:	42001737          	lui	a4,0x42001
10002f06:	06d71823          	sh	a3,112(a4) # 42001070 <__StackTop+0x21ffd070>
10002f0a:	42000737          	lui	a4,0x42000
10002f0e:	4685                	li	a3,1
10002f10:	0cd707a3          	sb	a3,207(a4) # 420000cf <__StackTop+0x21ffc0cf>
10002f14:	6741                	lui	a4,0x10
10002f16:	97ba                	add	a5,a5,a4
10002f18:	42000737          	lui	a4,0x42000
10002f1c:	cf7c                	sw	a5,92(a4)
10002f1e:	8082                	ret
10002f20:	00279713          	slli	a4,a5,0x2
10002f24:	973e                	add	a4,a4,a5
10002f26:	0742                	slli	a4,a4,0x10
10002f28:	6695                	lui	a3,0x5
10002f2a:	06a1                	addi	a3,a3,8 # 5008 <ll_scan_sched+0x10>
10002f2c:	8f55                	or	a4,a4,a3
10002f2e:	b7c9                	j	10002ef0 <omw_svc_2g4_set_phy_divisor+0x26>
10002f30:	42001737          	lui	a4,0x42001
10002f34:	06071823          	sh	zero,112(a4) # 42001070 <__StackTop+0x21ffd070>
10002f38:	42000737          	lui	a4,0x42000
10002f3c:	0c0707a3          	sb	zero,207(a4) # 420000cf <__StackTop+0x21ffc0cf>
10002f40:	bfd1                	j	10002f14 <omw_svc_2g4_set_phy_divisor+0x4a>

10002f42 <RF_2G4_PrepareStart>:
10002f42:	1151                	addi	sp,sp,-12
10002f44:	c406                	sw	ra,8(sp)
10002f46:	c222                	sw	s0,4(sp)
10002f48:	c026                	sw	s1,0(sp)
10002f4a:	20003437          	lui	s0,0x20003
10002f4e:	c0840413          	addi	s0,s0,-1016 # 20002c08 <rf_2g4_mgr>
10002f52:	00244703          	lbu	a4,2(s0)
10002f56:	100047b7          	lui	a5,0x10004
10002f5a:	61078793          	addi	a5,a5,1552 # 10004610 <freq_ratios>
10002f5e:	97ba                	add	a5,a5,a4
10002f60:	0007c503          	lbu	a0,0(a5)
10002f64:	379d                	jal	10002eca <omw_svc_2g4_set_phy_divisor>
10002f66:	4048                	lw	a0,4(s0)
10002f68:	0ffff097          	auipc	ra,0xffff
10002f6c:	d8a080e7          	jalr	-630(ra) # 20001cf2 <omw_svc_2g4_set_access_word>
10002f70:	01344783          	lbu	a5,19(s0)
10002f74:	420004b7          	lui	s1,0x42000
10002f78:	ccdc                	sw	a5,28(s1)
10002f7a:	485c                	lw	a5,20(s0)
10002f7c:	d09c                	sw	a5,32(s1)
10002f7e:	4c1c                	lw	a5,24(s0)
10002f80:	d0dc                	sw	a5,36(s1)
10002f82:	01c44783          	lbu	a5,28(s0)
10002f86:	04f48a23          	sb	a5,84(s1) # 42000054 <__StackTop+0x21ffc054>
10002f8a:	20000537          	lui	a0,0x20000
10002f8e:	48050513          	addi	a0,a0,1152 # 20000480 <rf_common_desc_modem_tx>
10002f92:	3db9                	jal	10002df0 <RF_2G4_DescInit_Mode>
10002f94:	20000537          	lui	a0,0x20000
10002f98:	46850513          	addi	a0,a0,1128 # 20000468 <rf_common_desc_modem_rx>
10002f9c:	3d91                	jal	10002df0 <RF_2G4_DescInit_Mode>
10002f9e:	01044783          	lbu	a5,16(s0)
10002fa2:	00f49a23          	sh	a5,20(s1)
10002fa6:	00045583          	lhu	a1,0(s0)
10002faa:	20001537          	lui	a0,0x20001
10002fae:	e6450513          	addi	a0,a0,-412 # 20000e64 <rf_common_desc_tx_setfreq>
10002fb2:	22c5                	jal	10003192 <RADIO_CommonDescInit_SetFreq_2g4>
10002fb4:	00045583          	lhu	a1,0(s0)
10002fb8:	20001537          	lui	a0,0x20001
10002fbc:	dcc50513          	addi	a0,a0,-564 # 20000dcc <rf_common_desc_rx_setfreq>
10002fc0:	2ac9                	jal	10003192 <RADIO_CommonDescInit_SetFreq_2g4>
10002fc2:	200017b7          	lui	a5,0x20001
10002fc6:	f9078793          	addi	a5,a5,-112 # 20000f90 <rf_2g4_common_desc_pll_delay>
10002fca:	0047d703          	lhu	a4,4(a5)
10002fce:	001e06b7          	lui	a3,0x1e0
10002fd2:	8f55                	or	a4,a4,a3
10002fd4:	c3d8                	sw	a4,4(a5)
10002fd6:	20000737          	lui	a4,0x20000
10002fda:	200037b7          	lui	a5,0x20003
10002fde:	c9c78793          	addi	a5,a5,-868 # 20002c9c <rf_2g4_tx_pkt_desc>
10002fe2:	1cf72e23          	sw	a5,476(a4) # 200001dc <rf_call_desc_list_tx_process+0x28>
10002fe6:	20000737          	lui	a4,0x20000
10002fea:	200037b7          	lui	a5,0x20003
10002fee:	c5478793          	addi	a5,a5,-940 # 20002c54 <rf_2g4_rx_pkt_desc>
10002ff2:	18f72a23          	sw	a5,404(a4) # 20000194 <rf_call_desc_list_rx_process+0x30>
10002ff6:	4cbc                	lw	a5,88(s1)
10002ff8:	83a1                	srli	a5,a5,0x8
10002ffa:	8b85                	andi	a5,a5,1
10002ffc:	00444703          	lbu	a4,4(s0)
10003000:	8b05                	andi	a4,a4,1
10003002:	05500613          	li	a2,85
10003006:	02e78263          	beq	a5,a4,1000302a <RF_2G4_PrepareStart+0xe8>
1000300a:	200037b7          	lui	a5,0x20003
1000300e:	c0b7c683          	lbu	a3,-1013(a5) # 20002c0b <rf_2g4_mgr+0x3>
10003012:	02d05c63          	blez	a3,1000304a <RF_2G4_PrepareStart+0x108>
10003016:	20000737          	lui	a4,0x20000
1000301a:	4a870713          	addi	a4,a4,1192 # 200004a8 <rf_tx_carrier>
1000301e:	4781                	li	a5,0
10003020:	200035b7          	lui	a1,0x20003
10003024:	c4458593          	addi	a1,a1,-956 # 20002c44 <rf_2g4_preamble>
10003028:	a811                	j	1000303c <RF_2G4_PrepareStart+0xfa>
1000302a:	0aa00613          	li	a2,170
1000302e:	bff1                	j	1000300a <RF_2G4_PrepareStart+0xc8>
10003030:	00c70023          	sb	a2,0(a4)
10003034:	0785                	addi	a5,a5,1
10003036:	0705                	addi	a4,a4,1
10003038:	00d7d963          	bge	a5,a3,1000304a <RF_2G4_PrepareStart+0x108>
1000303c:	fef05ae3          	blez	a5,10003030 <RF_2G4_PrepareStart+0xee>
10003040:	00f58533          	add	a0,a1,a5
10003044:	fec50fa3          	sb	a2,-1(a0)
10003048:	b7f5                	j	10003034 <RF_2G4_PrepareStart+0xf2>
1000304a:	200037b7          	lui	a5,0x20003
1000304e:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
10003052:	4705                	li	a4,1
10003054:	02e787a3          	sb	a4,47(a5)
10003058:	02078823          	sb	zero,48(a5)
1000305c:	40a2                	lw	ra,8(sp)
1000305e:	4412                	lw	s0,4(sp)
10003060:	4482                	lw	s1,0(sp)
10003062:	0131                	addi	sp,sp,12
10003064:	8082                	ret

10003066 <omw_svc_24g_rx_end>:
10003066:	8082                	ret

10003068 <omw_svc_24g_tx_end>:
10003068:	8082                	ret

1000306a <omw_svc_24g_sync_end>:
1000306a:	8082                	ret

1000306c <RADIO_DescInit_Freq_2g4>:
1000306c:	1141                	addi	sp,sp,-16
1000306e:	c606                	sw	ra,12(sp)
10003070:	c422                	sw	s0,8(sp)
10003072:	c226                	sw	s1,4(sp)
10003074:	84aa                	mv	s1,a0
10003076:	00b5d713          	srli	a4,a1,0xb
1000307a:	06400793          	li	a5,100
1000307e:	02f707b3          	mul	a5,a4,a5
10003082:	e399                	bnez	a5,10003088 <RADIO_DescInit_Freq_2g4+0x1c>
10003084:	3e800793          	li	a5,1000
10003088:	7ff5f593          	andi	a1,a1,2047
1000308c:	02f58533          	mul	a0,a1,a5
10003090:	670d                	lui	a4,0x3
10003092:	ee070713          	addi	a4,a4,-288 # 2ee0 <ll_create_connection+0xfc>
10003096:	02e54433          	div	s0,a0,a4
1000309a:	0c540413          	addi	s0,s0,197
1000309e:	0442                	slli	s0,s0,0x10
100030a0:	8041                	srli	s0,s0,0x10
100030a2:	02f74733          	div	a4,a4,a5
100030a6:	02e5e5b3          	rem	a1,a1,a4
100030aa:	02f585b3          	mul	a1,a1,a5
100030ae:	67d5                	lui	a5,0x15
100030b0:	55578793          	addi	a5,a5,1365 # 15555 <memset+0x8b89>
100030b4:	02f585b3          	mul	a1,a1,a5
100030b8:	3e800793          	li	a5,1000
100030bc:	02f5c7b3          	div	a5,a1,a5
100030c0:	c03e                	sw	a5,0(sp)
100030c2:	200017b7          	lui	a5,0x20001
100030c6:	dcc78793          	addi	a5,a5,-564 # 20000dcc <rf_common_desc_rx_setfreq>
100030ca:	04f48763          	beq	s1,a5,10003118 <RADIO_DescInit_Freq_2g4+0xac>
100030ce:	200037b7          	lui	a5,0x20003
100030d2:	c0a7c783          	lbu	a5,-1014(a5) # 20002c0a <rf_2g4_mgr+0x2>
100030d6:	85be                	mv	a1,a5
100030d8:	4709                	li	a4,2
100030da:	00f77363          	bgeu	a4,a5,100030e0 <RADIO_DescInit_Freq_2g4+0x74>
100030de:	4589                	li	a1,2
100030e0:	7d000793          	li	a5,2000
100030e4:	02f54533          	div	a0,a0,a5
100030e8:	0ff5f593          	zext.b	a1,a1
100030ec:	0ff57513          	zext.b	a0,a0
100030f0:	92aff0ef          	jal	1000221a <RF_OnChip_Cfg_KVCO_Cal_val_2g4>
100030f4:	4681                	li	a3,0
100030f6:	4601                	li	a2,0
100030f8:	4701                	li	a4,0
100030fa:	01441793          	slli	a5,s0,0x14
100030fe:	4582                	lw	a1,0(sp)
10003100:	8fcd                	or	a5,a5,a1
10003102:	8f99                	sub	a5,a5,a4
10003104:	00d7d7b3          	srl	a5,a5,a3
10003108:	8fd1                	or	a5,a5,a2
1000310a:	c09c                	sw	a5,0(s1)
1000310c:	8526                	mv	a0,s1
1000310e:	40b2                	lw	ra,12(sp)
10003110:	4422                	lw	s0,8(sp)
10003112:	4492                	lw	s1,4(sp)
10003114:	0141                	addi	sp,sp,16
10003116:	8082                	ret
10003118:	200037b7          	lui	a5,0x20003
1000311c:	c0a7c703          	lbu	a4,-1014(a5) # 20002c0a <rf_2g4_mgr+0x2>
10003120:	4785                	li	a5,1
10003122:	04f70063          	beq	a4,a5,10003162 <RADIO_DescInit_Freq_2g4+0xf6>
10003126:	420026b7          	lui	a3,0x42002
1000312a:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
1000312e:	ffd00737          	lui	a4,0xffd00
10003132:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
10003136:	8ff9                	and	a5,a5,a4
10003138:	00100737          	lui	a4,0x100
1000313c:	10070713          	addi	a4,a4,256 # 100100 <__FLASH_SIZE+0xc0100>
10003140:	8fd9                	or	a5,a5,a4
10003142:	0cf6a623          	sw	a5,204(a3)
10003146:	200037b7          	lui	a5,0x20003
1000314a:	c0a7c683          	lbu	a3,-1014(a5) # 20002c0a <rf_2g4_mgr+0x2>
1000314e:	4785                	li	a5,1
10003150:	02f68a63          	beq	a3,a5,10003184 <RADIO_DescInit_Freq_2g4+0x118>
10003154:	4685                	li	a3,1
10003156:	80000637          	lui	a2,0x80000
1000315a:	6755                	lui	a4,0x15
1000315c:	55570713          	addi	a4,a4,1365 # 15555 <memset+0x8b89>
10003160:	bf69                	j	100030fa <RADIO_DescInit_Freq_2g4+0x8e>
10003162:	420026b7          	lui	a3,0x42002
10003166:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
1000316a:	ffd00737          	lui	a4,0xffd00
1000316e:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
10003172:	8ff9                	and	a5,a5,a4
10003174:	00300737          	lui	a4,0x300
10003178:	30070713          	addi	a4,a4,768 # 300300 <__FLASH_SIZE+0x2c0300>
1000317c:	8fd9                	or	a5,a5,a4
1000317e:	0cf6a623          	sw	a5,204(a3)
10003182:	b7d1                	j	10003146 <RADIO_DescInit_Freq_2g4+0xda>
10003184:	80000637          	lui	a2,0x80000
10003188:	0002b737          	lui	a4,0x2b
1000318c:	aab70713          	addi	a4,a4,-1365 # 2aaab <memset+0x1e0df>
10003190:	b7ad                	j	100030fa <RADIO_DescInit_Freq_2g4+0x8e>

10003192 <RADIO_CommonDescInit_SetFreq_2g4>:
10003192:	1151                	addi	sp,sp,-12
10003194:	c406                	sw	ra,8(sp)
10003196:	4601                	li	a2,0
10003198:	3dd1                	jal	1000306c <RADIO_DescInit_Freq_2g4>
1000319a:	40a2                	lw	ra,8(sp)
1000319c:	0131                	addi	sp,sp,12
1000319e:	8082                	ret

100031a0 <bt_polling_work_ext>:
100031a0:	1151                	addi	sp,sp,-12
100031a2:	c406                	sw	ra,8(sp)
100031a4:	c222                	sw	s0,4(sp)
100031a6:	c026                	sw	s1,0(sp)
100031a8:	f0006097          	auipc	ra,0xf0006
100031ac:	406080e7          	jalr	1030(ra) # 95ae <bt_is_ready>
100031b0:	cd31                	beqz	a0,1000320c <bt_polling_work_ext+0x6c>
100031b2:	f0004097          	auipc	ra,0xf0004
100031b6:	b72080e7          	jalr	-1166(ra) # 6d24 <bt_conn_tx_polling>
100031ba:	20001537          	lui	a0,0x20001
100031be:	8e450513          	addi	a0,a0,-1820 # 200008e4 <bt_dev+0x84>
100031c2:	f0009097          	auipc	ra,0xf0009
100031c6:	31a080e7          	jalr	794(ra) # c4dc <simple_buf_get>
100031ca:	842a                	mv	s0,a0
100031cc:	c125                	beqz	a0,1000322c <bt_polling_work_ext+0x8c>
100031ce:	00c44783          	lbu	a5,12(s0)
100031d2:	4705                	li	a4,1
100031d4:	0ae78063          	beq	a5,a4,10003274 <bt_polling_work_ext+0xd4>
100031d8:	470d                	li	a4,3
100031da:	0ae79e63          	bne	a5,a4,10003296 <bt_polling_work_ext+0xf6>
100031de:	4591                	li	a1,4
100031e0:	01040513          	addi	a0,s0,16
100031e4:	f0009097          	auipc	ra,0xf0009
100031e8:	350080e7          	jalr	848(ra) # c534 <simple_buf_base_pull_mem>
100031ec:	00254683          	lbu	a3,2(a0)
100031f0:	00354783          	lbu	a5,3(a0)
100031f4:	07a2                	slli	a5,a5,0x8
100031f6:	01445703          	lhu	a4,20(s0)
100031fa:	8fd5                	or	a5,a5,a3
100031fc:	04f70363          	beq	a4,a5,10003242 <bt_polling_work_ext+0xa2>
10003200:	8522                	mv	a0,s0
10003202:	f0009097          	auipc	ra,0xf0009
10003206:	28c080e7          	jalr	652(ra) # c48e <simple_buf_free>
1000320a:	a895                	j	1000327e <bt_polling_work_ext+0xde>
1000320c:	f0006097          	auipc	ra,0xf0006
10003210:	e34080e7          	jalr	-460(ra) # 9040 <bt_init>
10003214:	200017b7          	lui	a5,0x20001
10003218:	4709                	li	a4,2
1000321a:	8ee7a623          	sw	a4,-1812(a5) # 200008ec <bt_dev+0x8c>
1000321e:	200017b7          	lui	a5,0x20001
10003222:	8f87a783          	lw	a5,-1800(a5) # 200008f8 <bt_dev+0x98>
10003226:	d7d1                	beqz	a5,100031b2 <bt_polling_work_ext+0x12>
10003228:	9782                	jalr	a5
1000322a:	b761                	j	100031b2 <bt_polling_work_ext+0x12>
1000322c:	20001537          	lui	a0,0x20001
10003230:	8dc50513          	addi	a0,a0,-1828 # 200008dc <bt_dev+0x7c>
10003234:	f0009097          	auipc	ra,0xf0009
10003238:	2a8080e7          	jalr	680(ra) # c4dc <simple_buf_get>
1000323c:	842a                	mv	s0,a0
1000323e:	f941                	bnez	a0,100031ce <bt_polling_work_ext+0x2e>
10003240:	a83d                	j	1000327e <bt_polling_work_ext+0xde>
10003242:	00054783          	lbu	a5,0(a0)
10003246:	00154483          	lbu	s1,1(a0)
1000324a:	04a2                	slli	s1,s1,0x8
1000324c:	8cdd                	or	s1,s1,a5
1000324e:	01449513          	slli	a0,s1,0x14
10003252:	8151                	srli	a0,a0,0x14
10003254:	f0004097          	auipc	ra,0xf0004
10003258:	9a0080e7          	jalr	-1632(ra) # 6bf4 <bt_conn_lookup_handle>
1000325c:	c511                	beqz	a0,10003268 <bt_polling_work_ext+0xc8>
1000325e:	00c4d613          	srli	a2,s1,0xc
10003262:	85a2                	mv	a1,s0
10003264:	283d                	jal	100032a2 <bt_conn_recv_ext>
10003266:	a821                	j	1000327e <bt_polling_work_ext+0xde>
10003268:	8522                	mv	a0,s0
1000326a:	f0009097          	auipc	ra,0xf0009
1000326e:	224080e7          	jalr	548(ra) # c48e <simple_buf_free>
10003272:	a031                	j	1000327e <bt_polling_work_ext+0xde>
10003274:	8522                	mv	a0,s0
10003276:	f0005097          	auipc	ra,0xf0005
1000327a:	6ba080e7          	jalr	1722(ra) # 8930 <hci_event>
1000327e:	200017b7          	lui	a5,0x20001
10003282:	8f47a783          	lw	a5,-1804(a5) # 200008f4 <bt_dev+0x94>
10003286:	479c                	lw	a5,8(a5)
10003288:	c391                	beqz	a5,1000328c <bt_polling_work_ext+0xec>
1000328a:	9782                	jalr	a5
1000328c:	40a2                	lw	ra,8(sp)
1000328e:	4412                	lw	s0,4(sp)
10003290:	4482                	lw	s1,0(sp)
10003292:	0131                	addi	sp,sp,12
10003294:	8082                	ret
10003296:	8522                	mv	a0,s0
10003298:	f0009097          	auipc	ra,0xf0009
1000329c:	1f6080e7          	jalr	502(ra) # c48e <simple_buf_free>
100032a0:	bff9                	j	1000327e <bt_polling_work_ext+0xde>

100032a2 <bt_conn_recv_ext>:
100032a2:	1141                	addi	sp,sp,-16
100032a4:	c606                	sw	ra,12(sp)
100032a6:	c422                	sw	s0,8(sp)
100032a8:	c226                	sw	s1,4(sp)
100032aa:	84ae                	mv	s1,a1
100032ac:	00654783          	lbu	a5,6(a0)
100032b0:	c7c1                	beqz	a5,10003338 <bt_conn_recv_ext+0x96>
100032b2:	842a                	mv	s0,a0
100032b4:	4785                	li	a5,1
100032b6:	0cf60963          	beq	a2,a5,10003388 <bt_conn_recv_ext+0xe6>
100032ba:	4789                	li	a5,2
100032bc:	14f61263          	bne	a2,a5,10003400 <bt_conn_recv_ext+0x15e>
100032c0:	455c                	lw	a5,12(a0)
100032c2:	c789                	beqz	a5,100032cc <bt_conn_recv_ext+0x2a>
100032c4:	f0003097          	auipc	ra,0xf0003
100032c8:	7ba080e7          	jalr	1978(ra) # 6a7e <bt_conn_reset_rx_state>
100032cc:	4894                	lw	a3,16(s1)
100032ce:	0016c583          	lbu	a1,1(a3)
100032d2:	05a2                	slli	a1,a1,0x8
100032d4:	0006c783          	lbu	a5,0(a3)
100032d8:	8ddd                	or	a1,a1,a5
100032da:	0144d603          	lhu	a2,20(s1)
100032de:	00458713          	addi	a4,a1,4
100032e2:	0742                	slli	a4,a4,0x10
100032e4:	8341                	srli	a4,a4,0x10
100032e6:	8f11                	sub	a4,a4,a2
100032e8:	0164d783          	lhu	a5,22(s1)
100032ec:	8f91                	sub	a5,a5,a2
100032ee:	4c90                	lw	a2,24(s1)
100032f0:	8e91                	sub	a3,a3,a2
100032f2:	8f95                	sub	a5,a5,a3
100032f4:	07c2                	slli	a5,a5,0x10
100032f6:	83c1                	srli	a5,a5,0x10
100032f8:	04e7ca63          	blt	a5,a4,1000334c <bt_conn_recv_ext+0xaa>
100032fc:	c444                	sw	s1,12(s0)
100032fe:	444c                	lw	a1,12(s0)
10003300:	0145d703          	lhu	a4,20(a1)
10003304:	4785                	li	a5,1
10003306:	02e7fe63          	bgeu	a5,a4,10003342 <bt_conn_recv_ext+0xa0>
1000330a:	4994                	lw	a3,16(a1)
1000330c:	0016c783          	lbu	a5,1(a3)
10003310:	07a2                	slli	a5,a5,0x8
10003312:	0006c683          	lbu	a3,0(a3)
10003316:	8fd5                	or	a5,a5,a3
10003318:	0791                	addi	a5,a5,4
1000331a:	07c2                	slli	a5,a5,0x10
1000331c:	83c1                	srli	a5,a5,0x10
1000331e:	02f76263          	bltu	a4,a5,10003342 <bt_conn_recv_ext+0xa0>
10003322:	0ee7e963          	bltu	a5,a4,10003414 <bt_conn_recv_ext+0x172>
10003326:	00042623          	sw	zero,12(s0)
1000332a:	4605                	li	a2,1
1000332c:	8522                	mv	a0,s0
1000332e:	f0006097          	auipc	ra,0xf0006
10003332:	554080e7          	jalr	1364(ra) # 9882 <bt_l2cap_recv>
10003336:	a031                	j	10003342 <bt_conn_recv_ext+0xa0>
10003338:	852e                	mv	a0,a1
1000333a:	f0009097          	auipc	ra,0xf0009
1000333e:	154080e7          	jalr	340(ra) # c48e <simple_buf_free>
10003342:	40b2                	lw	ra,12(sp)
10003344:	4422                	lw	s0,8(sp)
10003346:	4492                	lw	s1,4(sp)
10003348:	0141                	addi	sp,sp,16
1000334a:	8082                	ret
1000334c:	05b1                	addi	a1,a1,12
1000334e:	05c2                	slli	a1,a1,0x10
10003350:	81c1                	srli	a1,a1,0x10
10003352:	450d                	li	a0,3
10003354:	f0007097          	auipc	ra,0xf0007
10003358:	99e080e7          	jalr	-1634(ra) # 9cf2 <bt_buf_get>
1000335c:	d145                	beqz	a0,100032fc <bt_conn_recv_ext+0x5a>
1000335e:	0144d603          	lhu	a2,20(s1)
10003362:	488c                	lw	a1,16(s1)
10003364:	c02a                	sw	a0,0(sp)
10003366:	4908                	lw	a0,16(a0)
10003368:	f0009097          	auipc	ra,0xf0009
1000336c:	64c080e7          	jalr	1612(ra) # c9b4 <memcpy>
10003370:	0144d783          	lhu	a5,20(s1)
10003374:	4702                	lw	a4,0(sp)
10003376:	00f71a23          	sh	a5,20(a4)
1000337a:	8526                	mv	a0,s1
1000337c:	f0009097          	auipc	ra,0xf0009
10003380:	112080e7          	jalr	274(ra) # c48e <simple_buf_free>
10003384:	4482                	lw	s1,0(sp)
10003386:	bf9d                	j	100032fc <bt_conn_recv_ext+0x5a>
10003388:	4548                	lw	a0,12(a0)
1000338a:	c91d                	beqz	a0,100033c0 <bt_conn_recv_ext+0x11e>
1000338c:	0145d603          	lhu	a2,20(a1)
10003390:	c239                	beqz	a2,100033d6 <bt_conn_recv_ext+0x134>
10003392:	01655783          	lhu	a5,22(a0)
10003396:	01455703          	lhu	a4,20(a0)
1000339a:	8f99                	sub	a5,a5,a4
1000339c:	4918                	lw	a4,16(a0)
1000339e:	4d14                	lw	a3,24(a0)
100033a0:	8f15                	sub	a4,a4,a3
100033a2:	8f99                	sub	a5,a5,a4
100033a4:	02c7ef63          	bltu	a5,a2,100033e2 <bt_conn_recv_ext+0x140>
100033a8:	498c                	lw	a1,16(a1)
100033aa:	0541                	addi	a0,a0,16
100033ac:	f0009097          	auipc	ra,0xf0009
100033b0:	1d4080e7          	jalr	468(ra) # c580 <simple_buf_base_add_mem>
100033b4:	8526                	mv	a0,s1
100033b6:	f0009097          	auipc	ra,0xf0009
100033ba:	0d8080e7          	jalr	216(ra) # c48e <simple_buf_free>
100033be:	b781                	j	100032fe <bt_conn_recv_ext+0x5c>
100033c0:	8522                	mv	a0,s0
100033c2:	f0003097          	auipc	ra,0xf0003
100033c6:	6bc080e7          	jalr	1724(ra) # 6a7e <bt_conn_reset_rx_state>
100033ca:	8526                	mv	a0,s1
100033cc:	f0009097          	auipc	ra,0xf0009
100033d0:	0c2080e7          	jalr	194(ra) # c48e <simple_buf_free>
100033d4:	b7bd                	j	10003342 <bt_conn_recv_ext+0xa0>
100033d6:	852e                	mv	a0,a1
100033d8:	f0009097          	auipc	ra,0xf0009
100033dc:	0b6080e7          	jalr	182(ra) # c48e <simple_buf_free>
100033e0:	b78d                	j	10003342 <bt_conn_recv_ext+0xa0>
100033e2:	4601                	li	a2,0
100033e4:	85aa                	mv	a1,a0
100033e6:	8522                	mv	a0,s0
100033e8:	f0006097          	auipc	ra,0xf0006
100033ec:	49a080e7          	jalr	1178(ra) # 9882 <bt_l2cap_recv>
100033f0:	00042623          	sw	zero,12(s0)
100033f4:	8526                	mv	a0,s1
100033f6:	f0009097          	auipc	ra,0xf0009
100033fa:	098080e7          	jalr	152(ra) # c48e <simple_buf_free>
100033fe:	b791                	j	10003342 <bt_conn_recv_ext+0xa0>
10003400:	f0003097          	auipc	ra,0xf0003
10003404:	67e080e7          	jalr	1662(ra) # 6a7e <bt_conn_reset_rx_state>
10003408:	8526                	mv	a0,s1
1000340a:	f0009097          	auipc	ra,0xf0009
1000340e:	084080e7          	jalr	132(ra) # c48e <simple_buf_free>
10003412:	bf05                	j	10003342 <bt_conn_recv_ext+0xa0>
10003414:	8522                	mv	a0,s0
10003416:	f0003097          	auipc	ra,0xf0003
1000341a:	668080e7          	jalr	1640(ra) # 6a7e <bt_conn_reset_rx_state>
1000341e:	b715                	j	10003342 <bt_conn_recv_ext+0xa0>

10003420 <__divdf3>:
10003420:	fdc10113          	addi	sp,sp,-36
10003424:	872a                	mv	a4,a0
10003426:	852e                	mv	a0,a1
10003428:	cc26                	sw	s1,24(sp)
1000342a:	82b6                	mv	t0,a3
1000342c:	00c59493          	slli	s1,a1,0xc
10003430:	01f55693          	srli	a3,a0,0x1f
10003434:	81d1                	srli	a1,a1,0x14
10003436:	d006                	sw	ra,32(sp)
10003438:	ce22                	sw	s0,28(sp)
1000343a:	7ff5f593          	andi	a1,a1,2047
1000343e:	c436                	sw	a3,8(sp)
10003440:	80b1                	srli	s1,s1,0xc
10003442:	c5c1                	beqz	a1,100034ca <__divdf3+0xaa>
10003444:	7ff00693          	li	a3,2047
10003448:	0ed58463          	beq	a1,a3,10003530 <__divdf3+0x110>
1000344c:	01d75413          	srli	s0,a4,0x1d
10003450:	048e                	slli	s1,s1,0x3
10003452:	008007b7          	lui	a5,0x800
10003456:	8c45                	or	s0,s0,s1
10003458:	8c5d                	or	s0,s0,a5
1000345a:	c0158593          	addi	a1,a1,-1023
1000345e:	00371793          	slli	a5,a4,0x3
10003462:	4301                	li	t1,0
10003464:	0142d693          	srli	a3,t0,0x14
10003468:	00c29713          	slli	a4,t0,0xc
1000346c:	7ff6f693          	andi	a3,a3,2047
10003470:	00c75393          	srli	t2,a4,0xc
10003474:	01f2d493          	srli	s1,t0,0x1f
10003478:	caf1                	beqz	a3,1000354c <__divdf3+0x12c>
1000347a:	7ff00713          	li	a4,2047
1000347e:	14e68863          	beq	a3,a4,100035ce <__divdf3+0x1ae>
10003482:	00339513          	slli	a0,t2,0x3
10003486:	01d65713          	srli	a4,a2,0x1d
1000348a:	8f49                	or	a4,a4,a0
1000348c:	00800537          	lui	a0,0x800
10003490:	00a763b3          	or	t2,a4,a0
10003494:	c0168693          	addi	a3,a3,-1023
10003498:	00361513          	slli	a0,a2,0x3
1000349c:	4701                	li	a4,0
1000349e:	4622                	lw	a2,8(sp)
100034a0:	40d586b3          	sub	a3,a1,a3
100034a4:	c036                	sw	a3,0(sp)
100034a6:	00231693          	slli	a3,t1,0x2
100034aa:	8e25                	xor	a2,a2,s1
100034ac:	8ed9                	or	a3,a3,a4
100034ae:	c232                	sw	a2,4(sp)
100034b0:	16fd                	addi	a3,a3,-1
100034b2:	4639                	li	a2,14
100034b4:	12d66a63          	bltu	a2,a3,100035e8 <__divdf3+0x1c8>
100034b8:	00001617          	auipc	a2,0x1
100034bc:	16460613          	addi	a2,a2,356 # 1000461c <freq_ratios+0xc>
100034c0:	068a                	slli	a3,a3,0x2
100034c2:	96b2                	add	a3,a3,a2
100034c4:	4294                	lw	a3,0(a3)
100034c6:	96b2                	add	a3,a3,a2
100034c8:	8682                	jr	a3
100034ca:	00e4e433          	or	s0,s1,a4
100034ce:	c43d                	beqz	s0,1000353c <__divdf3+0x11c>
100034d0:	c616                	sw	t0,12(sp)
100034d2:	c232                	sw	a2,4(sp)
100034d4:	c89d                	beqz	s1,1000350a <__divdf3+0xea>
100034d6:	8526                	mv	a0,s1
100034d8:	c03a                	sw	a4,0(sp)
100034da:	34d000ef          	jal	10004026 <__clzsi2>
100034de:	4702                	lw	a4,0(sp)
100034e0:	4612                	lw	a2,4(sp)
100034e2:	42b2                	lw	t0,12(sp)
100034e4:	87aa                	mv	a5,a0
100034e6:	ff550593          	addi	a1,a0,-11 # 7ffff5 <__FLASH_SIZE+0x7bfff5>
100034ea:	4475                	li	s0,29
100034ec:	ff878693          	addi	a3,a5,-8 # 7ffff8 <__FLASH_SIZE+0x7bfff8>
100034f0:	8c0d                	sub	s0,s0,a1
100034f2:	00d494b3          	sll	s1,s1,a3
100034f6:	00875433          	srl	s0,a4,s0
100034fa:	8c45                	or	s0,s0,s1
100034fc:	00d714b3          	sll	s1,a4,a3
10003500:	c0d00593          	li	a1,-1011
10003504:	8d9d                	sub	a1,a1,a5
10003506:	87a6                	mv	a5,s1
10003508:	bfa9                	j	10003462 <__divdf3+0x42>
1000350a:	853a                	mv	a0,a4
1000350c:	c03a                	sw	a4,0(sp)
1000350e:	319000ef          	jal	10004026 <__clzsi2>
10003512:	01550593          	addi	a1,a0,21
10003516:	46f1                	li	a3,28
10003518:	4702                	lw	a4,0(sp)
1000351a:	4612                	lw	a2,4(sp)
1000351c:	42b2                	lw	t0,12(sp)
1000351e:	02050793          	addi	a5,a0,32
10003522:	fcb6d4e3          	bge	a3,a1,100034ea <__divdf3+0xca>
10003526:	ff850413          	addi	s0,a0,-8
1000352a:	00871433          	sll	s0,a4,s0
1000352e:	bfc9                	j	10003500 <__divdf3+0xe0>
10003530:	00e4e433          	or	s0,s1,a4
10003534:	e801                	bnez	s0,10003544 <__divdf3+0x124>
10003536:	4781                	li	a5,0
10003538:	4309                	li	t1,2
1000353a:	b72d                	j	10003464 <__divdf3+0x44>
1000353c:	4781                	li	a5,0
1000353e:	4581                	li	a1,0
10003540:	4305                	li	t1,1
10003542:	b70d                	j	10003464 <__divdf3+0x44>
10003544:	87ba                	mv	a5,a4
10003546:	8426                	mv	s0,s1
10003548:	430d                	li	t1,3
1000354a:	bf29                	j	10003464 <__divdf3+0x44>
1000354c:	00c3e533          	or	a0,t2,a2
10003550:	c549                	beqz	a0,100035da <__divdf3+0x1ba>
10003552:	04038663          	beqz	t2,1000359e <__divdf3+0x17e>
10003556:	851e                	mv	a0,t2
10003558:	ca32                	sw	a2,20(sp)
1000355a:	c81a                	sw	t1,16(sp)
1000355c:	c62e                	sw	a1,12(sp)
1000355e:	c23e                	sw	a5,4(sp)
10003560:	c01e                	sw	t2,0(sp)
10003562:	2c5000ef          	jal	10004026 <__clzsi2>
10003566:	4382                	lw	t2,0(sp)
10003568:	4792                	lw	a5,4(sp)
1000356a:	45b2                	lw	a1,12(sp)
1000356c:	4342                	lw	t1,16(sp)
1000356e:	4652                	lw	a2,20(sp)
10003570:	86aa                	mv	a3,a0
10003572:	ff550293          	addi	t0,a0,-11
10003576:	4775                	li	a4,29
10003578:	ff868513          	addi	a0,a3,-8
1000357c:	40570733          	sub	a4,a4,t0
10003580:	00a393b3          	sll	t2,t2,a0
10003584:	00e65733          	srl	a4,a2,a4
10003588:	00776733          	or	a4,a4,t2
1000358c:	00a613b3          	sll	t2,a2,a0
10003590:	c0d00613          	li	a2,-1011
10003594:	851e                	mv	a0,t2
10003596:	40d606b3          	sub	a3,a2,a3
1000359a:	83ba                	mv	t2,a4
1000359c:	b701                	j	1000349c <__divdf3+0x7c>
1000359e:	8532                	mv	a0,a2
100035a0:	ca1e                	sw	t2,20(sp)
100035a2:	c81a                	sw	t1,16(sp)
100035a4:	c62e                	sw	a1,12(sp)
100035a6:	c23e                	sw	a5,4(sp)
100035a8:	c032                	sw	a2,0(sp)
100035aa:	27d000ef          	jal	10004026 <__clzsi2>
100035ae:	01550293          	addi	t0,a0,21
100035b2:	4771                	li	a4,28
100035b4:	4602                	lw	a2,0(sp)
100035b6:	4792                	lw	a5,4(sp)
100035b8:	45b2                	lw	a1,12(sp)
100035ba:	4342                	lw	t1,16(sp)
100035bc:	43d2                	lw	t2,20(sp)
100035be:	02050693          	addi	a3,a0,32
100035c2:	fa575ae3          	bge	a4,t0,10003576 <__divdf3+0x156>
100035c6:	1561                	addi	a0,a0,-8
100035c8:	00a61733          	sll	a4,a2,a0
100035cc:	b7d1                	j	10003590 <__divdf3+0x170>
100035ce:	00c3e533          	or	a0,t2,a2
100035d2:	e901                	bnez	a0,100035e2 <__divdf3+0x1c2>
100035d4:	4381                	li	t2,0
100035d6:	4709                	li	a4,2
100035d8:	b5d9                	j	1000349e <__divdf3+0x7e>
100035da:	4381                	li	t2,0
100035dc:	4681                	li	a3,0
100035de:	4705                	li	a4,1
100035e0:	bd7d                	j	1000349e <__divdf3+0x7e>
100035e2:	8532                	mv	a0,a2
100035e4:	470d                	li	a4,3
100035e6:	bd65                	j	1000349e <__divdf3+0x7e>
100035e8:	0083e663          	bltu	t2,s0,100035f4 <__divdf3+0x1d4>
100035ec:	2a741d63          	bne	s0,t2,100038a6 <__divdf3+0x486>
100035f0:	2aa7eb63          	bltu	a5,a0,100038a6 <__divdf3+0x486>
100035f4:	01f41693          	slli	a3,s0,0x1f
100035f8:	0017d713          	srli	a4,a5,0x1
100035fc:	01f79313          	slli	t1,a5,0x1f
10003600:	8005                	srli	s0,s0,0x1
10003602:	00e6e7b3          	or	a5,a3,a4
10003606:	00839713          	slli	a4,t2,0x8
1000360a:	01075493          	srli	s1,a4,0x10
1000360e:	029456b3          	divu	a3,s0,s1
10003612:	01855613          	srli	a2,a0,0x18
10003616:	8e59                	or	a2,a2,a4
10003618:	01061713          	slli	a4,a2,0x10
1000361c:	8341                	srli	a4,a4,0x10
1000361e:	c43a                	sw	a4,8(sp)
10003620:	0107d593          	srli	a1,a5,0x10
10003624:	00851293          	slli	t0,a0,0x8
10003628:	02947433          	remu	s0,s0,s1
1000362c:	02d70733          	mul	a4,a4,a3
10003630:	0442                	slli	s0,s0,0x10
10003632:	8c4d                	or	s0,s0,a1
10003634:	85b6                	mv	a1,a3
10003636:	00e47c63          	bgeu	s0,a4,1000364e <__divdf3+0x22e>
1000363a:	9432                	add	s0,s0,a2
1000363c:	fff68593          	addi	a1,a3,-1
10003640:	00c46763          	bltu	s0,a2,1000364e <__divdf3+0x22e>
10003644:	00e47563          	bgeu	s0,a4,1000364e <__divdf3+0x22e>
10003648:	ffe68593          	addi	a1,a3,-2
1000364c:	9432                	add	s0,s0,a2
1000364e:	8c19                	sub	s0,s0,a4
10003650:	029456b3          	divu	a3,s0,s1
10003654:	01061713          	slli	a4,a2,0x10
10003658:	8341                	srli	a4,a4,0x10
1000365a:	07c2                	slli	a5,a5,0x10
1000365c:	83c1                	srli	a5,a5,0x10
1000365e:	02947433          	remu	s0,s0,s1
10003662:	8536                	mv	a0,a3
10003664:	02d70733          	mul	a4,a4,a3
10003668:	0442                	slli	s0,s0,0x10
1000366a:	8fc1                	or	a5,a5,s0
1000366c:	00e7fc63          	bgeu	a5,a4,10003684 <__divdf3+0x264>
10003670:	97b2                	add	a5,a5,a2
10003672:	fff68513          	addi	a0,a3,-1
10003676:	00c7e763          	bltu	a5,a2,10003684 <__divdf3+0x264>
1000367a:	00e7f563          	bgeu	a5,a4,10003684 <__divdf3+0x264>
1000367e:	ffe68513          	addi	a0,a3,-2
10003682:	97b2                	add	a5,a5,a2
10003684:	05c2                	slli	a1,a1,0x10
10003686:	8dc9                	or	a1,a1,a0
10003688:	8f99                	sub	a5,a5,a4
1000368a:	01029693          	slli	a3,t0,0x10
1000368e:	01059713          	slli	a4,a1,0x10
10003692:	82c1                	srli	a3,a3,0x10
10003694:	0102d413          	srli	s0,t0,0x10
10003698:	0105d513          	srli	a0,a1,0x10
1000369c:	8341                	srli	a4,a4,0x10
1000369e:	02d703b3          	mul	t2,a4,a3
100036a2:	c436                	sw	a3,8(sp)
100036a4:	02e40733          	mul	a4,s0,a4
100036a8:	02d506b3          	mul	a3,a0,a3
100036ac:	02850533          	mul	a0,a0,s0
100036b0:	9736                	add	a4,a4,a3
100036b2:	0103d413          	srli	s0,t2,0x10
100036b6:	9722                	add	a4,a4,s0
100036b8:	00d77463          	bgeu	a4,a3,100036c0 <__divdf3+0x2a0>
100036bc:	66c1                	lui	a3,0x10
100036be:	9536                	add	a0,a0,a3
100036c0:	03c2                	slli	t2,t2,0x10
100036c2:	01075693          	srli	a3,a4,0x10
100036c6:	0103d393          	srli	t2,t2,0x10
100036ca:	0742                	slli	a4,a4,0x10
100036cc:	971e                	add	a4,a4,t2
100036ce:	96aa                	add	a3,a3,a0
100036d0:	c43a                	sw	a4,8(sp)
100036d2:	00d7e763          	bltu	a5,a3,100036e0 <__divdf3+0x2c0>
100036d6:	83ae                	mv	t2,a1
100036d8:	04d79263          	bne	a5,a3,1000371c <__divdf3+0x2fc>
100036dc:	04e37063          	bgeu	t1,a4,1000371c <__divdf3+0x2fc>
100036e0:	00530533          	add	a0,t1,t0
100036e4:	00653433          	sltu	s0,a0,t1
100036e8:	00c40733          	add	a4,s0,a2
100036ec:	97ba                	add	a5,a5,a4
100036ee:	fff58393          	addi	t2,a1,-1
100036f2:	832a                	mv	t1,a0
100036f4:	00f66563          	bltu	a2,a5,100036fe <__divdf3+0x2de>
100036f8:	02f61263          	bne	a2,a5,1000371c <__divdf3+0x2fc>
100036fc:	e005                	bnez	s0,1000371c <__divdf3+0x2fc>
100036fe:	00d7e763          	bltu	a5,a3,1000370c <__divdf3+0x2ec>
10003702:	00f69d63          	bne	a3,a5,1000371c <__divdf3+0x2fc>
10003706:	4722                	lw	a4,8(sp)
10003708:	00e57a63          	bgeu	a0,a4,1000371c <__divdf3+0x2fc>
1000370c:	9516                	add	a0,a0,t0
1000370e:	ffe58393          	addi	t2,a1,-2
10003712:	005535b3          	sltu	a1,a0,t0
10003716:	95b2                	add	a1,a1,a2
10003718:	832a                	mv	t1,a0
1000371a:	97ae                	add	a5,a5,a1
1000371c:	4722                	lw	a4,8(sp)
1000371e:	40d786b3          	sub	a3,a5,a3
10003722:	557d                	li	a0,-1
10003724:	40e30733          	sub	a4,t1,a4
10003728:	00e33333          	sltu	t1,t1,a4
1000372c:	406686b3          	sub	a3,a3,t1
10003730:	10d60063          	beq	a2,a3,10003830 <__divdf3+0x410>
10003734:	0296d533          	divu	a0,a3,s1
10003738:	01061793          	slli	a5,a2,0x10
1000373c:	83c1                	srli	a5,a5,0x10
1000373e:	02a785b3          	mul	a1,a5,a0
10003742:	0296f7b3          	remu	a5,a3,s1
10003746:	01075693          	srli	a3,a4,0x10
1000374a:	07c2                	slli	a5,a5,0x10
1000374c:	8fd5                	or	a5,a5,a3
1000374e:	86aa                	mv	a3,a0
10003750:	00b7fc63          	bgeu	a5,a1,10003768 <__divdf3+0x348>
10003754:	97b2                	add	a5,a5,a2
10003756:	fff50693          	addi	a3,a0,-1
1000375a:	00c7e763          	bltu	a5,a2,10003768 <__divdf3+0x348>
1000375e:	00b7f563          	bgeu	a5,a1,10003768 <__divdf3+0x348>
10003762:	ffe50693          	addi	a3,a0,-2
10003766:	97b2                	add	a5,a5,a2
10003768:	8f8d                	sub	a5,a5,a1
1000376a:	0297d533          	divu	a0,a5,s1
1000376e:	01061593          	slli	a1,a2,0x10
10003772:	81c1                	srli	a1,a1,0x10
10003774:	0742                	slli	a4,a4,0x10
10003776:	8341                	srli	a4,a4,0x10
10003778:	0297f7b3          	remu	a5,a5,s1
1000377c:	832a                	mv	t1,a0
1000377e:	02a585b3          	mul	a1,a1,a0
10003782:	07c2                	slli	a5,a5,0x10
10003784:	8f5d                	or	a4,a4,a5
10003786:	00b77c63          	bgeu	a4,a1,1000379e <__divdf3+0x37e>
1000378a:	9732                	add	a4,a4,a2
1000378c:	fff50313          	addi	t1,a0,-1
10003790:	00c76763          	bltu	a4,a2,1000379e <__divdf3+0x37e>
10003794:	00b77563          	bgeu	a4,a1,1000379e <__divdf3+0x37e>
10003798:	ffe50313          	addi	t1,a0,-2
1000379c:	9732                	add	a4,a4,a2
1000379e:	06c2                	slli	a3,a3,0x10
100037a0:	0066e6b3          	or	a3,a3,t1
100037a4:	01029413          	slli	s0,t0,0x10
100037a8:	0106d793          	srli	a5,a3,0x10
100037ac:	8041                	srli	s0,s0,0x10
100037ae:	8f0d                	sub	a4,a4,a1
100037b0:	01069513          	slli	a0,a3,0x10
100037b4:	01029593          	slli	a1,t0,0x10
100037b8:	02878333          	mul	t1,a5,s0
100037bc:	8141                	srli	a0,a0,0x10
100037be:	0102d413          	srli	s0,t0,0x10
100037c2:	81c1                	srli	a1,a1,0x10
100037c4:	02a585b3          	mul	a1,a1,a0
100037c8:	02a40533          	mul	a0,s0,a0
100037cc:	02f407b3          	mul	a5,s0,a5
100037d0:	951a                	add	a0,a0,t1
100037d2:	0105d413          	srli	s0,a1,0x10
100037d6:	9522                	add	a0,a0,s0
100037d8:	00657463          	bgeu	a0,t1,100037e0 <__divdf3+0x3c0>
100037dc:	6341                	lui	t1,0x10
100037de:	979a                	add	a5,a5,t1
100037e0:	01055313          	srli	t1,a0,0x10
100037e4:	05c2                	slli	a1,a1,0x10
100037e6:	0542                	slli	a0,a0,0x10
100037e8:	81c1                	srli	a1,a1,0x10
100037ea:	979a                	add	a5,a5,t1
100037ec:	95aa                	add	a1,a1,a0
100037ee:	00f76663          	bltu	a4,a5,100037fa <__divdf3+0x3da>
100037f2:	8536                	mv	a0,a3
100037f4:	02f71c63          	bne	a4,a5,1000382c <__divdf3+0x40c>
100037f8:	cd85                	beqz	a1,10003830 <__divdf3+0x410>
100037fa:	9732                	add	a4,a4,a2
100037fc:	fff68513          	addi	a0,a3,-1 # ffff <memset+0x3633>
10003800:	833a                	mv	t1,a4
10003802:	02c76163          	bltu	a4,a2,10003824 <__divdf3+0x404>
10003806:	00f76663          	bltu	a4,a5,10003812 <__divdf3+0x3f2>
1000380a:	02f71163          	bne	a4,a5,1000382c <__divdf3+0x40c>
1000380e:	00b2fd63          	bgeu	t0,a1,10003828 <__divdf3+0x408>
10003812:	ffe68513          	addi	a0,a3,-2
10003816:	00129693          	slli	a3,t0,0x1
1000381a:	0056b333          	sltu	t1,a3,t0
1000381e:	9332                	add	t1,t1,a2
10003820:	933a                	add	t1,t1,a4
10003822:	82b6                	mv	t0,a3
10003824:	00f31463          	bne	t1,a5,1000382c <__divdf3+0x40c>
10003828:	00558463          	beq	a1,t0,10003830 <__divdf3+0x410>
1000382c:	00156513          	ori	a0,a0,1
10003830:	4782                	lw	a5,0(sp)
10003832:	3ff78793          	addi	a5,a5,1023
10003836:	0af05063          	blez	a5,100038d6 <__divdf3+0x4b6>
1000383a:	00757713          	andi	a4,a0,7
1000383e:	cf01                	beqz	a4,10003856 <__divdf3+0x436>
10003840:	00f57713          	andi	a4,a0,15
10003844:	4691                	li	a3,4
10003846:	00d70863          	beq	a4,a3,10003856 <__divdf3+0x436>
1000384a:	00d50733          	add	a4,a0,a3
1000384e:	00a736b3          	sltu	a3,a4,a0
10003852:	93b6                	add	t2,t2,a3
10003854:	853a                	mv	a0,a4
10003856:	00739713          	slli	a4,t2,0x7
1000385a:	00075a63          	bgez	a4,1000386e <__divdf3+0x44e>
1000385e:	ff0007b7          	lui	a5,0xff000
10003862:	17fd                	addi	a5,a5,-1 # feffffff <__StackTop+0xdeffbfff>
10003864:	00f3f3b3          	and	t2,t2,a5
10003868:	4782                	lw	a5,0(sp)
1000386a:	40078793          	addi	a5,a5,1024
1000386e:	7fe00713          	li	a4,2046
10003872:	10f74163          	blt	a4,a5,10003974 <__divdf3+0x554>
10003876:	00355713          	srli	a4,a0,0x3
1000387a:	01d39513          	slli	a0,t2,0x1d
1000387e:	8d59                	or	a0,a0,a4
10003880:	0033d393          	srli	t2,t2,0x3
10003884:	4712                	lw	a4,4(sp)
10003886:	03b2                	slli	t2,t2,0xc
10003888:	5082                	lw	ra,32(sp)
1000388a:	4472                	lw	s0,28(sp)
1000388c:	07d2                	slli	a5,a5,0x14
1000388e:	00c3d393          	srli	t2,t2,0xc
10003892:	0077e7b3          	or	a5,a5,t2
10003896:	077e                	slli	a4,a4,0x1f
10003898:	00e7e6b3          	or	a3,a5,a4
1000389c:	44e2                	lw	s1,24(sp)
1000389e:	85b6                	mv	a1,a3
100038a0:	02410113          	addi	sp,sp,36
100038a4:	8082                	ret
100038a6:	4702                	lw	a4,0(sp)
100038a8:	4301                	li	t1,0
100038aa:	177d                	addi	a4,a4,-1
100038ac:	c03a                	sw	a4,0(sp)
100038ae:	bba1                	j	10003606 <__divdf3+0x1e6>
100038b0:	c226                	sw	s1,4(sp)
100038b2:	833a                	mv	t1,a4
100038b4:	4789                	li	a5,2
100038b6:	0af30f63          	beq	t1,a5,10003974 <__divdf3+0x554>
100038ba:	478d                	li	a5,3
100038bc:	0af30563          	beq	t1,a5,10003966 <__divdf3+0x546>
100038c0:	4785                	li	a5,1
100038c2:	f6f317e3          	bne	t1,a5,10003830 <__divdf3+0x410>
100038c6:	4381                	li	t2,0
100038c8:	4501                	li	a0,0
100038ca:	a0bd                	j	10003938 <__divdf3+0x518>
100038cc:	4722                	lw	a4,8(sp)
100038ce:	83a2                	mv	t2,s0
100038d0:	853e                	mv	a0,a5
100038d2:	c23a                	sw	a4,4(sp)
100038d4:	b7c5                	j	100038b4 <__divdf3+0x494>
100038d6:	4685                	li	a3,1
100038d8:	cb89                	beqz	a5,100038ea <__divdf3+0x4ca>
100038da:	8e9d                	sub	a3,a3,a5
100038dc:	03800713          	li	a4,56
100038e0:	fed743e3          	blt	a4,a3,100038c6 <__divdf3+0x4a6>
100038e4:	477d                	li	a4,31
100038e6:	04d74b63          	blt	a4,a3,1000393c <__divdf3+0x51c>
100038ea:	4782                	lw	a5,0(sp)
100038ec:	41e78713          	addi	a4,a5,1054
100038f0:	00d557b3          	srl	a5,a0,a3
100038f4:	00e51533          	sll	a0,a0,a4
100038f8:	00a03533          	snez	a0,a0
100038fc:	00e39733          	sll	a4,t2,a4
10003900:	8d59                	or	a0,a0,a4
10003902:	8fc9                	or	a5,a5,a0
10003904:	00d3d3b3          	srl	t2,t2,a3
10003908:	0077f713          	andi	a4,a5,7
1000390c:	cf01                	beqz	a4,10003924 <__divdf3+0x504>
1000390e:	00f7f713          	andi	a4,a5,15
10003912:	4691                	li	a3,4
10003914:	00d70863          	beq	a4,a3,10003924 <__divdf3+0x504>
10003918:	00d78733          	add	a4,a5,a3
1000391c:	00f736b3          	sltu	a3,a4,a5
10003920:	93b6                	add	t2,t2,a3
10003922:	87ba                	mv	a5,a4
10003924:	00839713          	slli	a4,t2,0x8
10003928:	04074b63          	bltz	a4,1000397e <__divdf3+0x55e>
1000392c:	01d39513          	slli	a0,t2,0x1d
10003930:	838d                	srli	a5,a5,0x3
10003932:	8d5d                	or	a0,a0,a5
10003934:	0033d393          	srli	t2,t2,0x3
10003938:	4781                	li	a5,0
1000393a:	b7a9                	j	10003884 <__divdf3+0x464>
1000393c:	5705                	li	a4,-31
1000393e:	40f707b3          	sub	a5,a4,a5
10003942:	02000613          	li	a2,32
10003946:	00f3d7b3          	srl	a5,t2,a5
1000394a:	4701                	li	a4,0
1000394c:	00c68763          	beq	a3,a2,1000395a <__divdf3+0x53a>
10003950:	4702                	lw	a4,0(sp)
10003952:	43e70713          	addi	a4,a4,1086
10003956:	00e39733          	sll	a4,t2,a4
1000395a:	8f49                	or	a4,a4,a0
1000395c:	00e03733          	snez	a4,a4
10003960:	8fd9                	or	a5,a5,a4
10003962:	4381                	li	t2,0
10003964:	b755                	j	10003908 <__divdf3+0x4e8>
10003966:	000803b7          	lui	t2,0x80
1000396a:	4501                	li	a0,0
1000396c:	7ff00793          	li	a5,2047
10003970:	c202                	sw	zero,4(sp)
10003972:	bf09                	j	10003884 <__divdf3+0x464>
10003974:	4381                	li	t2,0
10003976:	4501                	li	a0,0
10003978:	7ff00793          	li	a5,2047
1000397c:	b721                	j	10003884 <__divdf3+0x464>
1000397e:	4381                	li	t2,0
10003980:	4501                	li	a0,0
10003982:	4785                	li	a5,1
10003984:	b701                	j	10003884 <__divdf3+0x464>

10003986 <__subdf3>:
10003986:	00100337          	lui	t1,0x100
1000398a:	137d                	addi	t1,t1,-1 # fffff <__FLASH_SIZE+0xbffff>
1000398c:	1131                	addi	sp,sp,-20
1000398e:	8732                	mv	a4,a2
10003990:	00b37633          	and	a2,t1,a1
10003994:	0145d793          	srli	a5,a1,0x14
10003998:	c622                	sw	s0,12(sp)
1000399a:	01f5d413          	srli	s0,a1,0x1f
1000399e:	00361593          	slli	a1,a2,0x3
100039a2:	01d55613          	srli	a2,a0,0x1d
100039a6:	00d37333          	and	t1,t1,a3
100039aa:	c426                	sw	s1,8(sp)
100039ac:	7ff7f493          	andi	s1,a5,2047
100039b0:	00b667b3          	or	a5,a2,a1
100039b4:	0146d593          	srli	a1,a3,0x14
100039b8:	00331293          	slli	t0,t1,0x3
100039bc:	c806                	sw	ra,16(sp)
100039be:	01d75313          	srli	t1,a4,0x1d
100039c2:	7ff5f593          	andi	a1,a1,2047
100039c6:	7ff00613          	li	a2,2047
100039ca:	050e                	slli	a0,a0,0x3
100039cc:	82fd                	srli	a3,a3,0x1f
100039ce:	00536333          	or	t1,t1,t0
100039d2:	070e                	slli	a4,a4,0x3
100039d4:	00c59563          	bne	a1,a2,100039de <__subdf3+0x58>
100039d8:	00e36633          	or	a2,t1,a4
100039dc:	e219                	bnez	a2,100039e2 <__subdf3+0x5c>
100039de:	0016c693          	xori	a3,a3,1
100039e2:	40b48633          	sub	a2,s1,a1
100039e6:	7ff00293          	li	t0,2047
100039ea:	26869263          	bne	a3,s0,10003c4e <__subdf3+0x2c8>
100039ee:	10c05963          	blez	a2,10003b00 <__subdf3+0x17a>
100039f2:	e5ad                	bnez	a1,10003a5c <__subdf3+0xd6>
100039f4:	00e366b3          	or	a3,t1,a4
100039f8:	ce99                	beqz	a3,10003a16 <__subdf3+0x90>
100039fa:	fff48613          	addi	a2,s1,-1
100039fe:	ea11                	bnez	a2,10003a12 <__subdf3+0x8c>
10003a00:	972a                	add	a4,a4,a0
10003a02:	00a736b3          	sltu	a3,a4,a0
10003a06:	933e                	add	t1,t1,a5
10003a08:	853a                	mv	a0,a4
10003a0a:	00d307b3          	add	a5,t1,a3
10003a0e:	4485                	li	s1,1
10003a10:	a851                	j	10003aa4 <__subdf3+0x11e>
10003a12:	04549b63          	bne	s1,t0,10003a68 <__subdf3+0xe2>
10003a16:	01d79713          	slli	a4,a5,0x1d
10003a1a:	810d                	srli	a0,a0,0x3
10003a1c:	0037d613          	srli	a2,a5,0x3
10003a20:	7ff00793          	li	a5,2047
10003a24:	8f49                	or	a4,a4,a0
10003a26:	00f49963          	bne	s1,a5,10003a38 <__subdf3+0xb2>
10003a2a:	8f51                	or	a4,a4,a2
10003a2c:	4601                	li	a2,0
10003a2e:	c709                	beqz	a4,10003a38 <__subdf3+0xb2>
10003a30:	00080637          	lui	a2,0x80
10003a34:	4701                	li	a4,0
10003a36:	4401                	li	s0,0
10003a38:	01449793          	slli	a5,s1,0x14
10003a3c:	7ff006b7          	lui	a3,0x7ff00
10003a40:	0632                	slli	a2,a2,0xc
10003a42:	8ff5                	and	a5,a5,a3
10003a44:	8231                	srli	a2,a2,0xc
10003a46:	047e                	slli	s0,s0,0x1f
10003a48:	8fd1                	or	a5,a5,a2
10003a4a:	40c2                	lw	ra,16(sp)
10003a4c:	0087e6b3          	or	a3,a5,s0
10003a50:	4432                	lw	s0,12(sp)
10003a52:	44a2                	lw	s1,8(sp)
10003a54:	853a                	mv	a0,a4
10003a56:	85b6                	mv	a1,a3
10003a58:	0151                	addi	sp,sp,20
10003a5a:	8082                	ret
10003a5c:	fa548de3          	beq	s1,t0,10003a16 <__subdf3+0x90>
10003a60:	008006b7          	lui	a3,0x800
10003a64:	00d36333          	or	t1,t1,a3
10003a68:	03800693          	li	a3,56
10003a6c:	08c6c563          	blt	a3,a2,10003af6 <__subdf3+0x170>
10003a70:	46fd                	li	a3,31
10003a72:	02000293          	li	t0,32
10003a76:	04c6cd63          	blt	a3,a2,10003ad0 <__subdf3+0x14a>
10003a7a:	40c282b3          	sub	t0,t0,a2
10003a7e:	00c755b3          	srl	a1,a4,a2
10003a82:	005316b3          	sll	a3,t1,t0
10003a86:	005712b3          	sll	t0,a4,t0
10003a8a:	8ecd                	or	a3,a3,a1
10003a8c:	005032b3          	snez	t0,t0
10003a90:	0056e733          	or	a4,a3,t0
10003a94:	00c35633          	srl	a2,t1,a2
10003a98:	953a                	add	a0,a0,a4
10003a9a:	963e                	add	a2,a2,a5
10003a9c:	00e53733          	sltu	a4,a0,a4
10003aa0:	00e607b3          	add	a5,a2,a4
10003aa4:	00879713          	slli	a4,a5,0x8
10003aa8:	16075763          	bgez	a4,10003c16 <__subdf3+0x290>
10003aac:	0485                	addi	s1,s1,1
10003aae:	7ff00713          	li	a4,2047
10003ab2:	48e48963          	beq	s1,a4,10003f44 <__subdf3+0x5be>
10003ab6:	ff800737          	lui	a4,0xff800
10003aba:	177d                	addi	a4,a4,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003abc:	8ff9                	and	a5,a5,a4
10003abe:	00155713          	srli	a4,a0,0x1
10003ac2:	8905                	andi	a0,a0,1
10003ac4:	8f49                	or	a4,a4,a0
10003ac6:	01f79513          	slli	a0,a5,0x1f
10003aca:	8d59                	or	a0,a0,a4
10003acc:	8385                	srli	a5,a5,0x1
10003ace:	a2a1                	j	10003c16 <__subdf3+0x290>
10003ad0:	fe060693          	addi	a3,a2,-32 # 7ffe0 <__FLASH_SIZE+0x3ffe0>
10003ad4:	00d356b3          	srl	a3,t1,a3
10003ad8:	4581                	li	a1,0
10003ada:	00560763          	beq	a2,t0,10003ae8 <__subdf3+0x162>
10003ade:	04000593          	li	a1,64
10003ae2:	8d91                	sub	a1,a1,a2
10003ae4:	00b315b3          	sll	a1,t1,a1
10003ae8:	8dd9                	or	a1,a1,a4
10003aea:	00b035b3          	snez	a1,a1
10003aee:	00b6e733          	or	a4,a3,a1
10003af2:	4601                	li	a2,0
10003af4:	b755                	j	10003a98 <__subdf3+0x112>
10003af6:	00e36733          	or	a4,t1,a4
10003afa:	00e03733          	snez	a4,a4
10003afe:	bfd5                	j	10003af2 <__subdf3+0x16c>
10003b00:	c255                	beqz	a2,10003ba4 <__subdf3+0x21e>
10003b02:	409586b3          	sub	a3,a1,s1
10003b06:	ec91                	bnez	s1,10003b22 <__subdf3+0x19c>
10003b08:	00a7e633          	or	a2,a5,a0
10003b0c:	c619                	beqz	a2,10003b1a <__subdf3+0x194>
10003b0e:	fff68613          	addi	a2,a3,-1 # 7fffff <__FLASH_SIZE+0x7bffff>
10003b12:	ee0607e3          	beqz	a2,10003a00 <__subdf3+0x7a>
10003b16:	00569c63          	bne	a3,t0,10003b2e <__subdf3+0x1a8>
10003b1a:	879a                	mv	a5,t1
10003b1c:	853a                	mv	a0,a4
10003b1e:	84b6                	mv	s1,a3
10003b20:	bddd                	j	10003a16 <__subdf3+0x90>
10003b22:	42558463          	beq	a1,t0,10003f4a <__subdf3+0x5c4>
10003b26:	00800637          	lui	a2,0x800
10003b2a:	8fd1                	or	a5,a5,a2
10003b2c:	8636                	mv	a2,a3
10003b2e:	03800693          	li	a3,56
10003b32:	06c6c463          	blt	a3,a2,10003b9a <__subdf3+0x214>
10003b36:	46fd                	li	a3,31
10003b38:	02000393          	li	t2,32
10003b3c:	02c6ca63          	blt	a3,a2,10003b70 <__subdf3+0x1ea>
10003b40:	40c383b3          	sub	t2,t2,a2
10003b44:	007796b3          	sll	a3,a5,t2
10003b48:	00c552b3          	srl	t0,a0,a2
10003b4c:	007513b3          	sll	t2,a0,t2
10003b50:	0056e6b3          	or	a3,a3,t0
10003b54:	007033b3          	snez	t2,t2
10003b58:	0076e6b3          	or	a3,a3,t2
10003b5c:	00c7d7b3          	srl	a5,a5,a2
10003b60:	00e68533          	add	a0,a3,a4
10003b64:	979a                	add	a5,a5,t1
10003b66:	00d536b3          	sltu	a3,a0,a3
10003b6a:	97b6                	add	a5,a5,a3
10003b6c:	84ae                	mv	s1,a1
10003b6e:	bf1d                	j	10003aa4 <__subdf3+0x11e>
10003b70:	fe060693          	addi	a3,a2,-32 # 7fffe0 <__FLASH_SIZE+0x7bffe0>
10003b74:	00d7d6b3          	srl	a3,a5,a3
10003b78:	4281                	li	t0,0
10003b7a:	00760863          	beq	a2,t2,10003b8a <__subdf3+0x204>
10003b7e:	04000293          	li	t0,64
10003b82:	40c282b3          	sub	t0,t0,a2
10003b86:	005792b3          	sll	t0,a5,t0
10003b8a:	00a2e2b3          	or	t0,t0,a0
10003b8e:	005032b3          	snez	t0,t0
10003b92:	0056e6b3          	or	a3,a3,t0
10003b96:	4781                	li	a5,0
10003b98:	b7e1                	j	10003b60 <__subdf3+0x1da>
10003b9a:	00a7e6b3          	or	a3,a5,a0
10003b9e:	00d036b3          	snez	a3,a3
10003ba2:	bfd5                	j	10003b96 <__subdf3+0x210>
10003ba4:	00148693          	addi	a3,s1,1
10003ba8:	7fe6f613          	andi	a2,a3,2046
10003bac:	e639                	bnez	a2,10003bfa <__subdf3+0x274>
10003bae:	00a7e6b3          	or	a3,a5,a0
10003bb2:	e885                	bnez	s1,10003be2 <__subdf3+0x25c>
10003bb4:	22068963          	beqz	a3,10003de6 <__subdf3+0x460>
10003bb8:	00e366b3          	or	a3,t1,a4
10003bbc:	36068c63          	beqz	a3,10003f34 <__subdf3+0x5ae>
10003bc0:	972a                	add	a4,a4,a0
10003bc2:	933e                	add	t1,t1,a5
10003bc4:	00a73533          	sltu	a0,a4,a0
10003bc8:	932a                	add	t1,t1,a0
10003bca:	00831793          	slli	a5,t1,0x8
10003bce:	2007dc63          	bgez	a5,10003de6 <__subdf3+0x460>
10003bd2:	ff800637          	lui	a2,0xff800
10003bd6:	167d                	addi	a2,a2,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003bd8:	00c377b3          	and	a5,t1,a2
10003bdc:	853a                	mv	a0,a4
10003bde:	4485                	li	s1,1
10003be0:	bd1d                	j	10003a16 <__subdf3+0x90>
10003be2:	34068c63          	beqz	a3,10003f3a <__subdf3+0x5b4>
10003be6:	00e36333          	or	t1,t1,a4
10003bea:	8496                	mv	s1,t0
10003bec:	e20305e3          	beqz	t1,10003a16 <__subdf3+0x90>
10003bf0:	4401                	li	s0,0
10003bf2:	004007b7          	lui	a5,0x400
10003bf6:	4501                	li	a0,0
10003bf8:	bd39                	j	10003a16 <__subdf3+0x90>
10003bfa:	34568463          	beq	a3,t0,10003f42 <__subdf3+0x5bc>
10003bfe:	972a                	add	a4,a4,a0
10003c00:	00a73533          	sltu	a0,a4,a0
10003c04:	933e                	add	t1,t1,a5
10003c06:	932a                	add	t1,t1,a0
10003c08:	01f31513          	slli	a0,t1,0x1f
10003c0c:	8305                	srli	a4,a4,0x1
10003c0e:	8d59                	or	a0,a0,a4
10003c10:	00135793          	srli	a5,t1,0x1
10003c14:	84b6                	mv	s1,a3
10003c16:	00757713          	andi	a4,a0,7
10003c1a:	cf01                	beqz	a4,10003c32 <__subdf3+0x2ac>
10003c1c:	00f57713          	andi	a4,a0,15
10003c20:	4691                	li	a3,4
10003c22:	00d70863          	beq	a4,a3,10003c32 <__subdf3+0x2ac>
10003c26:	00d50733          	add	a4,a0,a3
10003c2a:	00a736b3          	sltu	a3,a4,a0
10003c2e:	97b6                	add	a5,a5,a3
10003c30:	853a                	mv	a0,a4
10003c32:	00879713          	slli	a4,a5,0x8
10003c36:	de0750e3          	bgez	a4,10003a16 <__subdf3+0x90>
10003c3a:	0485                	addi	s1,s1,1
10003c3c:	7ff00713          	li	a4,2047
10003c40:	30e48263          	beq	s1,a4,10003f44 <__subdf3+0x5be>
10003c44:	ff800737          	lui	a4,0xff800
10003c48:	177d                	addi	a4,a4,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003c4a:	8ff9                	and	a5,a5,a4
10003c4c:	b3e9                	j	10003a16 <__subdf3+0x90>
10003c4e:	0cc05163          	blez	a2,10003d10 <__subdf3+0x38a>
10003c52:	e1c1                	bnez	a1,10003cd2 <__subdf3+0x34c>
10003c54:	00e366b3          	or	a3,t1,a4
10003c58:	da068fe3          	beqz	a3,10003a16 <__subdf3+0x90>
10003c5c:	fff48613          	addi	a2,s1,-1
10003c60:	ee01                	bnez	a2,10003c78 <__subdf3+0x2f2>
10003c62:	40e50733          	sub	a4,a0,a4
10003c66:	00e536b3          	sltu	a3,a0,a4
10003c6a:	40678333          	sub	t1,a5,t1
10003c6e:	853a                	mv	a0,a4
10003c70:	40d307b3          	sub	a5,t1,a3
10003c74:	4485                	li	s1,1
10003c76:	a0a1                	j	10003cbe <__subdf3+0x338>
10003c78:	d8548fe3          	beq	s1,t0,10003a16 <__subdf3+0x90>
10003c7c:	03800693          	li	a3,56
10003c80:	08c6c363          	blt	a3,a2,10003d06 <__subdf3+0x380>
10003c84:	46fd                	li	a3,31
10003c86:	02000293          	li	t0,32
10003c8a:	04c6cb63          	blt	a3,a2,10003ce0 <__subdf3+0x35a>
10003c8e:	40c282b3          	sub	t0,t0,a2
10003c92:	00c755b3          	srl	a1,a4,a2
10003c96:	005316b3          	sll	a3,t1,t0
10003c9a:	005712b3          	sll	t0,a4,t0
10003c9e:	8ecd                	or	a3,a3,a1
10003ca0:	005032b3          	snez	t0,t0
10003ca4:	0056e733          	or	a4,a3,t0
10003ca8:	00c35633          	srl	a2,t1,a2
10003cac:	40e50733          	sub	a4,a0,a4
10003cb0:	00e536b3          	sltu	a3,a0,a4
10003cb4:	40c78633          	sub	a2,a5,a2
10003cb8:	853a                	mv	a0,a4
10003cba:	40d607b3          	sub	a5,a2,a3
10003cbe:	00879713          	slli	a4,a5,0x8
10003cc2:	f4075ae3          	bgez	a4,10003c16 <__subdf3+0x290>
10003cc6:	008005b7          	lui	a1,0x800
10003cca:	15fd                	addi	a1,a1,-1 # 7fffff <__FLASH_SIZE+0x7bffff>
10003ccc:	8dfd                	and	a1,a1,a5
10003cce:	862a                	mv	a2,a0
10003cd0:	a26d                	j	10003e7a <__subdf3+0x4f4>
10003cd2:	d45482e3          	beq	s1,t0,10003a16 <__subdf3+0x90>
10003cd6:	008006b7          	lui	a3,0x800
10003cda:	00d36333          	or	t1,t1,a3
10003cde:	bf79                	j	10003c7c <__subdf3+0x2f6>
10003ce0:	fe060693          	addi	a3,a2,-32
10003ce4:	00d356b3          	srl	a3,t1,a3
10003ce8:	4581                	li	a1,0
10003cea:	00560763          	beq	a2,t0,10003cf8 <__subdf3+0x372>
10003cee:	04000593          	li	a1,64
10003cf2:	8d91                	sub	a1,a1,a2
10003cf4:	00b315b3          	sll	a1,t1,a1
10003cf8:	8dd9                	or	a1,a1,a4
10003cfa:	00b035b3          	snez	a1,a1
10003cfe:	00b6e733          	or	a4,a3,a1
10003d02:	4601                	li	a2,0
10003d04:	b765                	j	10003cac <__subdf3+0x326>
10003d06:	00e36733          	or	a4,t1,a4
10003d0a:	00e03733          	snez	a4,a4
10003d0e:	bfd5                	j	10003d02 <__subdf3+0x37c>
10003d10:	ce4d                	beqz	a2,10003dca <__subdf3+0x444>
10003d12:	409583b3          	sub	t2,a1,s1
10003d16:	e885                	bnez	s1,10003d46 <__subdf3+0x3c0>
10003d18:	00a7e633          	or	a2,a5,a0
10003d1c:	c205                	beqz	a2,10003d3c <__subdf3+0x3b6>
10003d1e:	fff38613          	addi	a2,t2,-1 # 7ffff <__FLASH_SIZE+0x3ffff>
10003d22:	ea19                	bnez	a2,10003d38 <__subdf3+0x3b2>
10003d24:	40a70533          	sub	a0,a4,a0
10003d28:	40f30333          	sub	t1,t1,a5
10003d2c:	00a73633          	sltu	a2,a4,a0
10003d30:	40c307b3          	sub	a5,t1,a2
10003d34:	8436                	mv	s0,a3
10003d36:	bf3d                	j	10003c74 <__subdf3+0x2ee>
10003d38:	00539d63          	bne	t2,t0,10003d52 <__subdf3+0x3cc>
10003d3c:	8436                	mv	s0,a3
10003d3e:	879a                	mv	a5,t1
10003d40:	853a                	mv	a0,a4
10003d42:	849e                	mv	s1,t2
10003d44:	b9c9                	j	10003a16 <__subdf3+0x90>
10003d46:	20558163          	beq	a1,t0,10003f48 <__subdf3+0x5c2>
10003d4a:	00800637          	lui	a2,0x800
10003d4e:	8fd1                	or	a5,a5,a2
10003d50:	861e                	mv	a2,t2
10003d52:	03800293          	li	t0,56
10003d56:	06c2c663          	blt	t0,a2,10003dc2 <__subdf3+0x43c>
10003d5a:	42fd                	li	t0,31
10003d5c:	02000413          	li	s0,32
10003d60:	02c2cc63          	blt	t0,a2,10003d98 <__subdf3+0x412>
10003d64:	8c11                	sub	s0,s0,a2
10003d66:	00c553b3          	srl	t2,a0,a2
10003d6a:	008792b3          	sll	t0,a5,s0
10003d6e:	00851433          	sll	s0,a0,s0
10003d72:	0072e2b3          	or	t0,t0,t2
10003d76:	00803433          	snez	s0,s0
10003d7a:	0082e533          	or	a0,t0,s0
10003d7e:	00c7d633          	srl	a2,a5,a2
10003d82:	40a70533          	sub	a0,a4,a0
10003d86:	40c30633          	sub	a2,t1,a2
10003d8a:	00a737b3          	sltu	a5,a4,a0
10003d8e:	40f607b3          	sub	a5,a2,a5
10003d92:	84ae                	mv	s1,a1
10003d94:	8436                	mv	s0,a3
10003d96:	b725                	j	10003cbe <__subdf3+0x338>
10003d98:	fe060293          	addi	t0,a2,-32 # 7fffe0 <__FLASH_SIZE+0x7bffe0>
10003d9c:	0057d2b3          	srl	t0,a5,t0
10003da0:	4381                	li	t2,0
10003da2:	00860863          	beq	a2,s0,10003db2 <__subdf3+0x42c>
10003da6:	04000393          	li	t2,64
10003daa:	40c383b3          	sub	t2,t2,a2
10003dae:	007793b3          	sll	t2,a5,t2
10003db2:	00a3e3b3          	or	t2,t2,a0
10003db6:	007033b3          	snez	t2,t2
10003dba:	0072e533          	or	a0,t0,t2
10003dbe:	4601                	li	a2,0
10003dc0:	b7c9                	j	10003d82 <__subdf3+0x3fc>
10003dc2:	8d5d                	or	a0,a0,a5
10003dc4:	00a03533          	snez	a0,a0
10003dc8:	bfdd                	j	10003dbe <__subdf3+0x438>
10003dca:	00148613          	addi	a2,s1,1
10003dce:	7fe67613          	andi	a2,a2,2046
10003dd2:	ee2d                	bnez	a2,10003e4c <__subdf3+0x4c6>
10003dd4:	00e36633          	or	a2,t1,a4
10003dd8:	00a7e5b3          	or	a1,a5,a0
10003ddc:	e8b9                	bnez	s1,10003e32 <__subdf3+0x4ac>
10003dde:	e999                	bnez	a1,10003df4 <__subdf3+0x46e>
10003de0:	16060963          	beqz	a2,10003f52 <__subdf3+0x5cc>
10003de4:	8436                	mv	s0,a3
10003de6:	00676533          	or	a0,a4,t1
10003dea:	c96d                	beqz	a0,10003edc <__subdf3+0x556>
10003dec:	879a                	mv	a5,t1
10003dee:	853a                	mv	a0,a4
10003df0:	4481                	li	s1,0
10003df2:	b515                	j	10003c16 <__subdf3+0x290>
10003df4:	14060063          	beqz	a2,10003f34 <__subdf3+0x5ae>
10003df8:	40e505b3          	sub	a1,a0,a4
10003dfc:	00b532b3          	sltu	t0,a0,a1
10003e00:	40678633          	sub	a2,a5,t1
10003e04:	40560633          	sub	a2,a2,t0
10003e08:	00861293          	slli	t0,a2,0x8
10003e0c:	0002dc63          	bgez	t0,10003e24 <__subdf3+0x49e>
10003e10:	40a70533          	sub	a0,a4,a0
10003e14:	00a73633          	sltu	a2,a4,a0
10003e18:	40f30333          	sub	t1,t1,a5
10003e1c:	872a                	mv	a4,a0
10003e1e:	40c30333          	sub	t1,t1,a2
10003e22:	b7c9                	j	10003de4 <__subdf3+0x45e>
10003e24:	00c5e533          	or	a0,a1,a2
10003e28:	12050763          	beqz	a0,10003f56 <__subdf3+0x5d0>
10003e2c:	8332                	mv	t1,a2
10003e2e:	872e                	mv	a4,a1
10003e30:	bf5d                	j	10003de6 <__subdf3+0x460>
10003e32:	e989                	bnez	a1,10003e44 <__subdf3+0x4be>
10003e34:	8436                	mv	s0,a3
10003e36:	10061263          	bnez	a2,10003f3a <__subdf3+0x5b4>
10003e3a:	4401                	li	s0,0
10003e3c:	004007b7          	lui	a5,0x400
10003e40:	4501                	li	a0,0
10003e42:	a8f5                	j	10003f3e <__subdf3+0x5b8>
10003e44:	8496                	mv	s1,t0
10003e46:	bc0608e3          	beqz	a2,10003a16 <__subdf3+0x90>
10003e4a:	b35d                	j	10003bf0 <__subdf3+0x26a>
10003e4c:	40e502b3          	sub	t0,a0,a4
10003e50:	005533b3          	sltu	t2,a0,t0
10003e54:	406785b3          	sub	a1,a5,t1
10003e58:	407585b3          	sub	a1,a1,t2
10003e5c:	00859393          	slli	t2,a1,0x8
10003e60:	8616                	mv	a2,t0
10003e62:	0603d963          	bgez	t2,10003ed4 <__subdf3+0x54e>
10003e66:	40a70533          	sub	a0,a4,a0
10003e6a:	40f30333          	sub	t1,t1,a5
10003e6e:	00a73733          	sltu	a4,a4,a0
10003e72:	862a                	mv	a2,a0
10003e74:	40e305b3          	sub	a1,t1,a4
10003e78:	8436                	mv	s0,a3
10003e7a:	c5a5                	beqz	a1,10003ee2 <__subdf3+0x55c>
10003e7c:	852e                	mv	a0,a1
10003e7e:	c232                	sw	a2,4(sp)
10003e80:	c02e                	sw	a1,0(sp)
10003e82:	2255                	jal	10004026 <__clzsi2>
10003e84:	4582                	lw	a1,0(sp)
10003e86:	4612                	lw	a2,4(sp)
10003e88:	ff850713          	addi	a4,a0,-8
10003e8c:	02000313          	li	t1,32
10003e90:	40e30333          	sub	t1,t1,a4
10003e94:	00e595b3          	sll	a1,a1,a4
10003e98:	00665333          	srl	t1,a2,t1
10003e9c:	00b36333          	or	t1,t1,a1
10003ea0:	00e615b3          	sll	a1,a2,a4
10003ea4:	08974063          	blt	a4,s1,10003f24 <__subdf3+0x59e>
10003ea8:	8f05                	sub	a4,a4,s1
10003eaa:	00170613          	addi	a2,a4,1
10003eae:	47fd                	li	a5,31
10003eb0:	02000693          	li	a3,32
10003eb4:	04c7c763          	blt	a5,a2,10003f02 <__subdf3+0x57c>
10003eb8:	8e91                	sub	a3,a3,a2
10003eba:	00d31733          	sll	a4,t1,a3
10003ebe:	00c5d7b3          	srl	a5,a1,a2
10003ec2:	00d596b3          	sll	a3,a1,a3
10003ec6:	8f5d                	or	a4,a4,a5
10003ec8:	00d036b3          	snez	a3,a3
10003ecc:	8f55                	or	a4,a4,a3
10003ece:	00c35333          	srl	t1,t1,a2
10003ed2:	bf11                	j	10003de6 <__subdf3+0x460>
10003ed4:	00b2e533          	or	a0,t0,a1
10003ed8:	f14d                	bnez	a0,10003e7a <__subdf3+0x4f4>
10003eda:	4401                	li	s0,0
10003edc:	4781                	li	a5,0
10003ede:	4481                	li	s1,0
10003ee0:	be1d                	j	10003a16 <__subdf3+0x90>
10003ee2:	8532                	mv	a0,a2
10003ee4:	c22e                	sw	a1,4(sp)
10003ee6:	c032                	sw	a2,0(sp)
10003ee8:	2a3d                	jal	10004026 <__clzsi2>
10003eea:	01850713          	addi	a4,a0,24
10003eee:	47fd                	li	a5,31
10003ef0:	4602                	lw	a2,0(sp)
10003ef2:	4592                	lw	a1,4(sp)
10003ef4:	f8e7dce3          	bge	a5,a4,10003e8c <__subdf3+0x506>
10003ef8:	ff850313          	addi	t1,a0,-8
10003efc:	00661333          	sll	t1,a2,t1
10003f00:	b755                	j	10003ea4 <__subdf3+0x51e>
10003f02:	1705                	addi	a4,a4,-31
10003f04:	00e35733          	srl	a4,t1,a4
10003f08:	4781                	li	a5,0
10003f0a:	00d60763          	beq	a2,a3,10003f18 <__subdf3+0x592>
10003f0e:	04000793          	li	a5,64
10003f12:	8f91                	sub	a5,a5,a2
10003f14:	00f317b3          	sll	a5,t1,a5
10003f18:	8fcd                	or	a5,a5,a1
10003f1a:	00f037b3          	snez	a5,a5
10003f1e:	8f5d                	or	a4,a4,a5
10003f20:	4301                	li	t1,0
10003f22:	b5d1                	j	10003de6 <__subdf3+0x460>
10003f24:	ff800637          	lui	a2,0xff800
10003f28:	167d                	addi	a2,a2,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003f2a:	8c99                	sub	s1,s1,a4
10003f2c:	00c377b3          	and	a5,t1,a2
10003f30:	852e                	mv	a0,a1
10003f32:	b1d5                	j	10003c16 <__subdf3+0x290>
10003f34:	833e                	mv	t1,a5
10003f36:	872a                	mv	a4,a0
10003f38:	b57d                	j	10003de6 <__subdf3+0x460>
10003f3a:	879a                	mv	a5,t1
10003f3c:	853a                	mv	a0,a4
10003f3e:	8496                	mv	s1,t0
10003f40:	bcd9                	j	10003a16 <__subdf3+0x90>
10003f42:	84b6                	mv	s1,a3
10003f44:	4781                	li	a5,0
10003f46:	b945                	j	10003bf6 <__subdf3+0x270>
10003f48:	8436                	mv	s0,a3
10003f4a:	879a                	mv	a5,t1
10003f4c:	853a                	mv	a0,a4
10003f4e:	84ae                	mv	s1,a1
10003f50:	b4d9                	j	10003a16 <__subdf3+0x90>
10003f52:	4401                	li	s0,0
10003f54:	bfc5                	j	10003f44 <__subdf3+0x5be>
10003f56:	4401                	li	s0,0
10003f58:	4781                	li	a5,0
10003f5a:	bc75                	j	10003a16 <__subdf3+0x90>

10003f5c <__fixdfsi>:
10003f5c:	0145d713          	srli	a4,a1,0x14
10003f60:	00100637          	lui	a2,0x100
10003f64:	86aa                	mv	a3,a0
10003f66:	fff60793          	addi	a5,a2,-1 # fffff <__FLASH_SIZE+0xbffff>
10003f6a:	7ff77713          	andi	a4,a4,2047
10003f6e:	3fe00513          	li	a0,1022
10003f72:	8fed                	and	a5,a5,a1
10003f74:	81fd                	srli	a1,a1,0x1f
10003f76:	04e55463          	bge	a0,a4,10003fbe <__fixdfsi+0x62>
10003f7a:	41d00513          	li	a0,1053
10003f7e:	00e55763          	bge	a0,a4,10003f8c <__fixdfsi+0x30>
10003f82:	80000537          	lui	a0,0x80000
10003f86:	157d                	addi	a0,a0,-1 # 7fffffff <__StackTop+0x5fffbfff>
10003f88:	952e                	add	a0,a0,a1
10003f8a:	8082                	ret
10003f8c:	8fd1                	or	a5,a5,a2
10003f8e:	43300613          	li	a2,1075
10003f92:	8e19                	sub	a2,a2,a4
10003f94:	457d                	li	a0,31
10003f96:	00c54d63          	blt	a0,a2,10003fb0 <__fixdfsi+0x54>
10003f9a:	bed70713          	addi	a4,a4,-1043
10003f9e:	00e79533          	sll	a0,a5,a4
10003fa2:	00c6d6b3          	srl	a3,a3,a2
10003fa6:	8d55                	or	a0,a0,a3
10003fa8:	cd81                	beqz	a1,10003fc0 <__fixdfsi+0x64>
10003faa:	40a00533          	neg	a0,a0
10003fae:	8082                	ret
10003fb0:	41300693          	li	a3,1043
10003fb4:	40e68733          	sub	a4,a3,a4
10003fb8:	00e7d533          	srl	a0,a5,a4
10003fbc:	b7f5                	j	10003fa8 <__fixdfsi+0x4c>
10003fbe:	4501                	li	a0,0
10003fc0:	8082                	ret

10003fc2 <__floatsidf>:
10003fc2:	1151                	addi	sp,sp,-12
10003fc4:	c406                	sw	ra,8(sp)
10003fc6:	c222                	sw	s0,4(sp)
10003fc8:	c026                	sw	s1,0(sp)
10003fca:	87aa                	mv	a5,a0
10003fcc:	c931                	beqz	a0,10004020 <__floatsidf+0x5e>
10003fce:	41f55713          	srai	a4,a0,0x1f
10003fd2:	00a744b3          	xor	s1,a4,a0
10003fd6:	8c99                	sub	s1,s1,a4
10003fd8:	01f55413          	srli	s0,a0,0x1f
10003fdc:	8526                	mv	a0,s1
10003fde:	20a1                	jal	10004026 <__clzsi2>
10003fe0:	41e00793          	li	a5,1054
10003fe4:	4729                	li	a4,10
10003fe6:	8f89                	sub	a5,a5,a0
10003fe8:	02a74763          	blt	a4,a0,10004016 <__floatsidf+0x54>
10003fec:	472d                	li	a4,11
10003fee:	8f09                	sub	a4,a4,a0
10003ff0:	0555                	addi	a0,a0,21
10003ff2:	00e4d733          	srl	a4,s1,a4
10003ff6:	00a494b3          	sll	s1,s1,a0
10003ffa:	0732                	slli	a4,a4,0xc
10003ffc:	8331                	srli	a4,a4,0xc
10003ffe:	07d2                	slli	a5,a5,0x14
10004000:	047e                	slli	s0,s0,0x1f
10004002:	8fd9                	or	a5,a5,a4
10004004:	40a2                	lw	ra,8(sp)
10004006:	0087e733          	or	a4,a5,s0
1000400a:	4412                	lw	s0,4(sp)
1000400c:	8526                	mv	a0,s1
1000400e:	85ba                	mv	a1,a4
10004010:	4482                	lw	s1,0(sp)
10004012:	0131                	addi	sp,sp,12
10004014:	8082                	ret
10004016:	1555                	addi	a0,a0,-11
10004018:	00a49733          	sll	a4,s1,a0
1000401c:	4481                	li	s1,0
1000401e:	bff1                	j	10003ffa <__floatsidf+0x38>
10004020:	4401                	li	s0,0
10004022:	4701                	li	a4,0
10004024:	bfe5                	j	1000401c <__floatsidf+0x5a>

10004026 <__clzsi2>:
10004026:	67c1                	lui	a5,0x10
10004028:	02f57663          	bgeu	a0,a5,10004054 <__clzsi2+0x2e>
1000402c:	10053793          	sltiu	a5,a0,256
10004030:	0017b793          	seqz	a5,a5
10004034:	078e                	slli	a5,a5,0x3
10004036:	02000713          	li	a4,32
1000403a:	8f1d                	sub	a4,a4,a5
1000403c:	00f55533          	srl	a0,a0,a5
10004040:	00000797          	auipc	a5,0x0
10004044:	61878793          	addi	a5,a5,1560 # 10004658 <__clz_tab>
10004048:	97aa                	add	a5,a5,a0
1000404a:	0007c503          	lbu	a0,0(a5)
1000404e:	40a70533          	sub	a0,a4,a0
10004052:	8082                	ret
10004054:	01000737          	lui	a4,0x1000
10004058:	47e1                	li	a5,24
1000405a:	fce57ee3          	bgeu	a0,a4,10004036 <__clzsi2+0x10>
1000405e:	47c1                	li	a5,16
10004060:	bfd9                	j	10004036 <__clzsi2+0x10>

10004062 <__thead_uread4>:
10004062:	00154703          	lbu	a4,1(a0)
10004066:	00054783          	lbu	a5,0(a0)
1000406a:	0722                	slli	a4,a4,0x8
1000406c:	8f5d                	or	a4,a4,a5
1000406e:	00254783          	lbu	a5,2(a0)
10004072:	00354503          	lbu	a0,3(a0)
10004076:	07c2                	slli	a5,a5,0x10
10004078:	8fd9                	or	a5,a5,a4
1000407a:	0562                	slli	a0,a0,0x18
1000407c:	8d5d                	or	a0,a0,a5
1000407e:	8082                	ret

10004080 <__thead_uwrite4>:
10004080:	00855793          	srli	a5,a0,0x8
10004084:	00a58023          	sb	a0,0(a1)
10004088:	00f580a3          	sb	a5,1(a1)
1000408c:	01055793          	srli	a5,a0,0x10
10004090:	8161                	srli	a0,a0,0x18
10004092:	00f58123          	sb	a5,2(a1)
10004096:	00a581a3          	sb	a0,3(a1)
1000409a:	8082                	ret

1000409c <__thead_uread8>:
1000409c:	00154703          	lbu	a4,1(a0)
100040a0:	00054683          	lbu	a3,0(a0)
100040a4:	87aa                	mv	a5,a0
100040a6:	0722                	slli	a4,a4,0x8
100040a8:	8f55                	or	a4,a4,a3
100040aa:	00254683          	lbu	a3,2(a0)
100040ae:	0057c603          	lbu	a2,5(a5)
100040b2:	00354503          	lbu	a0,3(a0)
100040b6:	06c2                	slli	a3,a3,0x10
100040b8:	8ed9                	or	a3,a3,a4
100040ba:	0047c703          	lbu	a4,4(a5)
100040be:	0622                	slli	a2,a2,0x8
100040c0:	0077c583          	lbu	a1,7(a5)
100040c4:	8e59                	or	a2,a2,a4
100040c6:	0067c703          	lbu	a4,6(a5)
100040ca:	0562                	slli	a0,a0,0x18
100040cc:	05e2                	slli	a1,a1,0x18
100040ce:	0742                	slli	a4,a4,0x10
100040d0:	8f51                	or	a4,a4,a2
100040d2:	8d55                	or	a0,a0,a3
100040d4:	8dd9                	or	a1,a1,a4
100040d6:	8082                	ret

100040d8 <__thead_uwrite8>:
100040d8:	00855793          	srli	a5,a0,0x8
100040dc:	00f600a3          	sb	a5,1(a2)
100040e0:	01055793          	srli	a5,a0,0x10
100040e4:	00f60123          	sb	a5,2(a2)
100040e8:	0085d793          	srli	a5,a1,0x8
100040ec:	00a60023          	sb	a0,0(a2)
100040f0:	00b60223          	sb	a1,4(a2)
100040f4:	8161                	srli	a0,a0,0x18
100040f6:	00f602a3          	sb	a5,5(a2)
100040fa:	0105d793          	srli	a5,a1,0x10
100040fe:	81e1                	srli	a1,a1,0x18
10004100:	00a601a3          	sb	a0,3(a2)
10004104:	00f60323          	sb	a5,6(a2)
10004108:	00b603a3          	sb	a1,7(a2)
1000410c:	8082                	ret
1000410e:	0000                	unimp
10004110:	0020                	addi	s0,sp,8
10004112:	0000                	unimp
10004114:	3130                	.insn	2, 0x3130
10004116:	3332                	.insn	2, 0x3332
10004118:	3534                	.insn	2, 0x3534
1000411a:	3736                	.insn	2, 0x3736
1000411c:	3938                	.insn	2, 0x3938
1000411e:	6261                	lui	tp,0x18
10004120:	66656463          	bltu	a0,t1,10004788 <__etext+0x1c>
10004124:	0000                	unimp
10004126:	0000                	unimp
10004128:	3130                	.insn	2, 0x3130
1000412a:	3332                	.insn	2, 0x3332
1000412c:	3534                	.insn	2, 0x3534
1000412e:	3736                	.insn	2, 0x3736
10004130:	3938                	.insn	2, 0x3938
10004132:	4241                	li	tp,16
10004134:	46454443          	.insn	4, 0x46454443
10004138:	0000                	unimp
1000413a:	0000                	unimp
1000413c:	5245                	li	tp,-15
1000413e:	4f52                	lw	t5,20(sp)
10004140:	0052                	c.slli	zero,0x14
10004142:	0000                	unimp
10004144:	6e6e6f43          	.insn	4, 0x6e6e6f43
10004148:	6365                	lui	t1,0x19
1000414a:	6974                	.insn	2, 0x6974
1000414c:	66206e6f          	jal	t3,1000a7ae <__etext+0x6042>
10004150:	6961                	lui	s2,0x18
10004152:	656c                	.insn	2, 0x656c
10004154:	2064                	.insn	2, 0x2064
10004156:	6528                	.insn	2, 0x6528
10004158:	7272                	.insn	2, 0x7272
1000415a:	3020                	.insn	2, 0x3020
1000415c:	2578                	.insn	2, 0x2578
1000415e:	3230                	.insn	2, 0x3230
10004160:	2978                	.insn	2, 0x2978
10004162:	000a                	c.slli	zero,0x2
10004164:	6e6e6f43          	.insn	4, 0x6e6e6f43
10004168:	6365                	lui	t1,0x19
1000416a:	6574                	.insn	2, 0x6574
1000416c:	2064                	.insn	2, 0x2064
1000416e:	63637573          	.insn	4, 0x63637573
10004172:	7365                	lui	t1,0xffff9
10004174:	21646573          	.insn	4, 0x21646573
10004178:	2820                	.insn	2, 0x2820
1000417a:	6e6e6f63          	bltu	t3,t1,10004878 <__etext+0x10c>
1000417e:	3e2d                	jal	10003cb8 <__subdf3+0x332>
10004180:	6168                	.insn	2, 0x6168
10004182:	646e                	.insn	2, 0x646e
10004184:	656c                	.insn	2, 0x656c
10004186:	3020                	.insn	2, 0x3020
10004188:	2578                	.insn	2, 0x2578
1000418a:	3230                	.insn	2, 0x3230
1000418c:	2978                	.insn	2, 0x2978
1000418e:	000a                	c.slli	zero,0x2
10004190:	6c62                	.insn	2, 0x6c62
10004192:	5f65                	li	t5,-7
10004194:	6170                	.insn	2, 0x6170
10004196:	6172                	.insn	2, 0x6172
10004198:	5f6d                	li	t5,-5
1000419a:	6572                	.insn	2, 0x6572
1000419c:	2171                	jal	10004628 <freq_ratios+0x18>
1000419e:	2820                	.insn	2, 0x2820
100041a0:	6e6e6f63          	bltu	t3,t1,1000489e <__etext+0x132>
100041a4:	3e2d                	jal	10003cde <__subdf3+0x358>
100041a6:	6168                	.insn	2, 0x6168
100041a8:	646e                	.insn	2, 0x646e
100041aa:	656c                	.insn	2, 0x656c
100041ac:	3020                	.insn	2, 0x3020
100041ae:	2578                	.insn	2, 0x2578
100041b0:	3230                	.insn	2, 0x3230
100041b2:	2978                	.insn	2, 0x2978
100041b4:	000a                	c.slli	zero,0x2
100041b6:	0000                	unimp
100041b8:	6c62                	.insn	2, 0x6c62
100041ba:	5f65                	li	t5,-7
100041bc:	6170                	.insn	2, 0x6170
100041be:	6172                	.insn	2, 0x6172
100041c0:	5f6d                	li	t5,-5
100041c2:	7075                	c.lui	zero,0xffffd
100041c4:	6164                	.insn	2, 0x6164
100041c6:	6574                	.insn	2, 0x6574
100041c8:	2021                	jal	100041d0 <__thead_uwrite8+0xf8>
100041ca:	6328                	.insn	2, 0x6328
100041cc:	2d6e6e6f          	jal	t3,100ea4a2 <__etext+0xe5d36>
100041d0:	683e                	.insn	2, 0x683e
100041d2:	6e61                	lui	t3,0x18
100041d4:	6c64                	.insn	2, 0x6c64
100041d6:	2065                	jal	1000427e <__thead_uwrite8+0x1a6>
100041d8:	7830                	.insn	2, 0x7830
100041da:	3025                	jal	10003a02 <__subdf3+0x7c>
100041dc:	7832                	.insn	2, 0x7832
100041de:	0a29                	addi	s4,s4,10
100041e0:	0000                	unimp
100041e2:	0000                	unimp
100041e4:	6c62                	.insn	2, 0x6c62
100041e6:	5f65                	li	t5,-7
100041e8:	6870                	.insn	2, 0x6870
100041ea:	5f79                	li	t5,-2
100041ec:	7075                	c.lui	zero,0xffffd
100041ee:	6164                	.insn	2, 0x6164
100041f0:	6574                	.insn	2, 0x6574
100041f2:	2021                	jal	100041fa <__thead_uwrite8+0x122>
100041f4:	5854                	lw	a3,52(s0)
100041f6:	505f 5948 253d      	.insn	6, 0x253d5948505f
100041fc:	2c78                	.insn	2, 0x2c78
100041fe:	5852                	lw	a6,52(sp)
10004200:	505f 5948 253d      	.insn	6, 0x253d5948505f
10004206:	2078                	.insn	2, 0x2078
10004208:	000a                	c.slli	zero,0x2
1000420a:	0000                	unimp
1000420c:	74746167          	.insn	4, 0x74746167
10004210:	645f 7461 5f61      	.insn	6, 0x5f617461645f
10004216:	74697277          	.insn	4, 0x74697277
1000421a:	2065                	jal	100042c2 <__thead_uwrite8+0x1ea>
1000421c:	000a                	c.slli	zero,0x2
1000421e:	0000                	unimp
10004220:	3025                	jal	10003a48 <__subdf3+0xc2>
10004222:	7832                	.insn	2, 0x7832
10004224:	0020                	addi	s0,sp,8
10004226:	0000                	unimp
10004228:	200a                	.insn	2, 0x200a
1000422a:	0000                	unimp
1000422c:	5f636363          	bltu	t1,s6,10004812 <__etext+0xa6>
10004230:	5f676663          	bltu	a4,s6,1000481c <__etext+0xb0>
10004234:	6e65                	lui	t3,0x19
10004236:	6261                	lui	tp,0x18
10004238:	656c                	.insn	2, 0x656c
1000423a:	3a20                	.insn	2, 0x3a20
1000423c:	6425                	lui	s0,0x9
1000423e:	0a20                	addi	s0,sp,280
10004240:	0000                	unimp
10004242:	0000                	unimp
10004244:	6944                	.insn	2, 0x6944
10004246:	6e6f6373          	.insn	4, 0x6e6f6373
1000424a:	656e                	.insn	2, 0x656e
1000424c:	6f697463          	bgeu	s2,s6,10004934 <__etext+0x1c8>
10004250:	206e                	.insn	2, 0x206e
10004252:	6572                	.insn	2, 0x6572
10004254:	7361                	lui	t1,0xffff8
10004256:	28206e6f          	jal	t3,1000a4d8 <__etext+0x5d6c>
1000425a:	7265                	lui	tp,0xffff9
1000425c:	2072                	.insn	2, 0x2072
1000425e:	7830                	.insn	2, 0x7830
10004260:	3025                	jal	10003a88 <__subdf3+0x102>
10004262:	7832                	.insn	2, 0x7832
10004264:	0a29                	addi	s4,s4,10
10004266:	0000                	unimp
10004268:	6c42                	.insn	2, 0x6c42
1000426a:	6575                	lui	a0,0x1d
1000426c:	6f74                	.insn	2, 0x6f74
1000426e:	2068746f          	jal	s0,1008b474 <__etext+0x86d08>
10004272:	6e69                	lui	t3,0x1a
10004274:	7469                	lui	s0,0xffffa
10004276:	6620                	.insn	2, 0x6620
10004278:	6961                	lui	s2,0x18
1000427a:	656c                	.insn	2, 0x656c
1000427c:	2064                	.insn	2, 0x2064
1000427e:	6528                	.insn	2, 0x6528
10004280:	7272                	.insn	2, 0x7272
10004282:	2520                	.insn	2, 0x2520
10004284:	2964                	.insn	2, 0x2964
10004286:	000a                	c.slli	zero,0x2
10004288:	6c62                	.insn	2, 0x6c62
1000428a:	5f65                	li	t5,-7
1000428c:	7375                	lui	t1,0xffffd
1000428e:	7265                	lui	tp,0xffff9
10004290:	735f 7265 6976      	.insn	6, 0x69767265735f
10004296:	695f6563          	bltu	t5,s5,10004920 <__etext+0x1b4>
1000429a:	696e                	.insn	2, 0x696e
1000429c:	2074                	.insn	2, 0x2074
1000429e:	000a                	c.slli	zero,0x2
100042a0:	6441                	lui	s0,0x10
100042a2:	6576                	.insn	2, 0x6576
100042a4:	7472                	.insn	2, 0x7472
100042a6:	7369                	lui	t1,0xffffa
100042a8:	6e69                	lui	t3,0x1a
100042aa:	75732067          	.insn	4, 0x75732067
100042ae:	73656363          	bltu	a0,s6,100049d4 <__etext+0x268>
100042b2:	6c756673          	.insn	4, 0x6c756673
100042b6:	796c                	.insn	2, 0x796c
100042b8:	7320                	.insn	2, 0x7320
100042ba:	6174                	.insn	2, 0x6174
100042bc:	7472                	.insn	2, 0x7472
100042be:	6465                	lui	s0,0x19
100042c0:	0a21                	addi	s4,s4,8
100042c2:	0000                	unimp
100042c4:	74746167          	.insn	4, 0x74746167
100042c8:	645f 7461 5f61      	.insn	6, 0x5f617461645f
100042ce:	6572                	.insn	2, 0x6572
100042d0:	6461                	lui	s0,0x18
100042d2:	0a20                	addi	s0,sp,280
100042d4:	0000                	unimp
100042d6:	0000                	unimp
100042d8:	72617473          	.insn	4, 0x72617473
100042dc:	5f74                	lw	a3,124(a4)
100042de:	6461                	lui	s0,0x18
100042e0:	7264                	.insn	2, 0x7264
100042e2:	3a20                	.insn	2, 0x3a20
100042e4:	7825                	lui	a6,0xfffe9
100042e6:	2c20                	.insn	2, 0x2c20
100042e8:	6425                	lui	s0,0x9
100042ea:	000a                	c.slli	zero,0x2
100042ec:	2041544f          	.insn	4, 0x2041544f
100042f0:	20444d43          	.insn	4, 0x20444d43
100042f4:	7825                	lui	a6,0xfffe9
100042f6:	0a20                	addi	s0,sp,280
100042f8:	0020                	addi	s0,sp,8
100042fa:	0000                	unimp
100042fc:	7825                	lui	a6,0xfffe9
100042fe:	0020                	addi	s0,sp,8
10004300:	0a20                	addi	s0,sp,280
10004302:	0020                	addi	s0,sp,8
10004304:	6d676573          	.insn	4, 0x6d676573
10004308:	6e65                	lui	t3,0x19
1000430a:	5f74                	lw	a3,124(a4)
1000430c:	6164                	.insn	2, 0x6164
1000430e:	6174                	.insn	2, 0x6174
10004310:	6d5f 7861 6c5f      	.insn	6, 0x6c5f78616d5f
10004316:	6e65                	lui	t3,0x19
10004318:	3a687467          	.insn	4, 0x3a687467
1000431c:	6425                	lui	s0,0x9
1000431e:	0a20                	addi	s0,sp,280
10004320:	0000                	unimp
10004322:	0000                	unimp
10004324:	6162                	.insn	2, 0x6162
10004326:	61206573          	.insn	4, 0x61206573
1000432a:	6464                	.insn	2, 0x6464
1000432c:	3a72                	.insn	2, 0x3a72
1000432e:	7825                	lui	a6,0xfffe9
10004330:	2020                	.insn	2, 0x2020
10004332:	657a6973          	.insn	4, 0x657a6973
10004336:	253a                	.insn	2, 0x253a
10004338:	0a64                	addi	s1,sp,284
1000433a:	0000                	unimp
1000433c:	72617473          	.insn	4, 0x72617473
10004340:	2074                	.insn	2, 0x2074
10004342:	6572                	.insn	2, 0x6572
10004344:	2071                	jal	100043d0 <__thead_uwrite8+0x2f8>
10004346:	74617473          	.insn	4, 0x74617473
1000434a:	7375                	lui	t1,0xffffd
1000434c:	253a                	.insn	2, 0x253a
1000434e:	2064                	.insn	2, 0x2064
10004350:	000a                	c.slli	zero,0x2
10004352:	0000                	unimp
10004354:	5f4b4453          	.insn	4, 0x5f4b4453
10004358:	4556                	lw	a0,84(sp)
1000435a:	5352                	lw	t1,52(sp)
1000435c:	4f49                	li	t5,18
1000435e:	3a4e                	.insn	2, 0x3a4e
10004360:	7825                	lui	a6,0xfffe9
10004362:	0a20                	addi	s0,sp,280
10004364:	0000                	unimp
10004366:	0000                	unimp
10004368:	5f4b4453          	.insn	4, 0x5f4b4453
1000436c:	4144                	lw	s1,4(a0)
1000436e:	4554                	lw	a3,12(a0)
10004370:	253a                	.insn	2, 0x253a
10004372:	2078                	.insn	2, 0x2078
10004374:	000a                	c.slli	zero,0x2
10004376:	0000                	unimp
10004378:	7061                	c.lui	zero,0xffff8
1000437a:	2070                	.insn	2, 0x2070
1000437c:	6c62                	.insn	2, 0x6c62
1000437e:	2065                	jal	10004426 <user_ble_ota_service+0x6>
10004380:	6e69                	lui	t3,0x1a
10004382:	7469                	lui	s0,0xffffa
10004384:	200a                	.insn	2, 0x200a
10004386:	0000                	unimp
10004388:	2031                	jal	10004394 <__thead_uwrite8+0x2bc>
1000438a:	0000                	unimp
1000438c:	000a                	c.slli	zero,0x2
1000438e:	0000                	unimp
10004390:	50494843          	.insn	4, 0x50494843
10004394:	505f 4d55 0050      	.insn	6, 0x00504d55505f
1000439a:	0000                	unimp
1000439c:	0258                	addi	a4,sp,260
1000439e:	1000                	addi	s0,sp,32
100043a0:	026e                	slli	tp,tp,0x1b
100043a2:	1000                	addi	s0,sp,32
100043a4:	035a                	slli	t1,t1,0x16
100043a6:	1000                	addi	s0,sp,32
100043a8:	035a                	slli	t1,t1,0x16
100043aa:	1000                	addi	s0,sp,32
100043ac:	035a                	slli	t1,t1,0x16
100043ae:	1000                	addi	s0,sp,32
100043b0:	035a                	slli	t1,t1,0x16
100043b2:	1000                	addi	s0,sp,32
100043b4:	035a                	slli	t1,t1,0x16
100043b6:	1000                	addi	s0,sp,32
100043b8:	035a                	slli	t1,t1,0x16
100043ba:	1000                	addi	s0,sp,32
100043bc:	035a                	slli	t1,t1,0x16
100043be:	1000                	addi	s0,sp,32
100043c0:	0254                	addi	a3,sp,260
100043c2:	1000                	addi	s0,sp,32
100043c4:	035a                	slli	t1,t1,0x16
100043c6:	1000                	addi	s0,sp,32
100043c8:	035a                	slli	t1,t1,0x16
100043ca:	1000                	addi	s0,sp,32
100043cc:	035a                	slli	t1,t1,0x16
100043ce:	1000                	addi	s0,sp,32
100043d0:	02ce                	slli	t0,t0,0x13
100043d2:	1000                	addi	s0,sp,32
100043d4:	035a                	slli	t1,t1,0x16
100043d6:	1000                	addi	s0,sp,32
100043d8:	035a                	slli	t1,t1,0x16
100043da:	1000                	addi	s0,sp,32
100043dc:	0282                	c.slli64	t0
100043de:	1000                	addi	s0,sp,32
100043e0:	035a                	slli	t1,t1,0x16
100043e2:	1000                	addi	s0,sp,32
100043e4:	02c4                	addi	s1,sp,324
100043e6:	1000                	addi	s0,sp,32
100043e8:	035a                	slli	t1,t1,0x16
100043ea:	1000                	addi	s0,sp,32
100043ec:	035a                	slli	t1,t1,0x16
100043ee:	1000                	addi	s0,sp,32
100043f0:	02ce                	slli	t0,t0,0x13
100043f2:	1000                	addi	s0,sp,32
100043f4:	035a                	slli	t1,t1,0x16
100043f6:	1000                	addi	s0,sp,32
100043f8:	026e                	slli	tp,tp,0x1b
100043fa:	1000                	addi	s0,sp,32
100043fc:	0828                	addi	a0,sp,24
100043fe:	1000                	addi	s0,sp,32
10004400:	0860                	addi	s0,sp,28
10004402:	1000                	addi	s0,sp,32
10004404:	0850                	addi	a2,sp,20
10004406:	1000                	addi	s0,sp,32
10004408:	0904                	addi	s1,sp,144
1000440a:	1000                	addi	s0,sp,32
1000440c:	092e                	slli	s2,s2,0xb
1000440e:	1000                	addi	s0,sp,32
10004410:	0850                	addi	a2,sp,20
10004412:	1000                	addi	s0,sp,32
10004414:	0940                	addi	s0,sp,148
10004416:	1000                	addi	s0,sp,32

10004418 <user_ble_service>:
10004418:	44d0 1000 0006 0000                         .D......

10004420 <user_ble_ota_service>:
10004420:	4458 1000 0006 0000                         XD......

10004428 <adv_data>:
10004428:	0101 0000 0ad0 2000 05aa 0000 0ac8 2000     ....... ....... 

10004438 <scan_rsp_data>:
10004438:	0909 0000 4390 1000 0101 0000 0ac4 2000     .....C......... 
10004448:	0203 0000 0ac0 2000 0100 0302 0504 0006     ....... ........

10004458 <attr_user_ble_ota_service>:
10004458:	0a7c 2000 77ba 0000 0000 0000 0a78 2000     |.. .w......x.. 
10004468:	0000 0001 0a74 2000 78a4 0000 0000 0000     ....t.. .x......
10004478:	0a6c 2000 0000 0001 0a68 2000 055a 1000     l.. ....h.. Z...
10004488:	0600 1000 0000 0000 0000 0003 0a64 2000     ............d.. 
10004498:	78a4 0000 0000 0000 0a5c 2000 0000 0001     .x......\.. ....
100044a8:	0a58 2000 0504 1000 07bc 1000 0000 0000     X.. ............
100044b8:	0000 0002 0a54 2000 7a86 0000 74da 0000     ....T.. .z...t..
100044c8:	0a40 2000 0000 0003                         @.. ....

100044d0 <attr_user_ble_service>:
100044d0:	0abc 2000 77ba 0000 0000 0000 0ab8 2000     ... .w......... 
100044e0:	0000 0001 0ab4 2000 78a4 0000 0000 0000     ....... .x......
100044f0:	0aac 2000 0000 0001 0aa8 2000 0000 0000     ... ....... ....
10004500:	03ca 1000 0000 0000 0000 0002 0aa4 2000     ............... 
10004510:	78a4 0000 0000 0000 0a9c 2000 0000 0001     .x......... ....
10004520:	0a98 2000 0578 1000 0000 0000 0000 0000     ... x...........
10004530:	0000 0001 0a94 2000 7a86 0000 74da 0000     ....... .z...t..
10004540:	0a80 2000 0000 0003 0000 0000 8000 4056     ... ..........V@
10004550:	0000 0000 4000 4065                         .....@e@

10004558 <drv>:
10004558:	ba22 0000 b9c8 0000 b9b6 0000               "...........

10004564 <coe_bak_regs_list>:
10004564:	001c 4200 0024 4200 0054 4200 1070 4200     ...B$..BT..Bp..B
10004574:	005c 4200 049c 2000 0194 2000 20c0 4200     \..B... ... . .B
10004584:	20cc 4200 1064 4200 00cc 4200 0058 4200     . .Bd..B...BX..B

10004594 <time_info>:
10004594:	e214 3c4a 0028 0018 0150 0320 0096 012c     ..J<(...P. ...,.
100045a4:	0000 012c 0001 0000                         ..,.....

100045ac <time_info>:
100045ac:	1e77 0000                                   w...

100045b0 <rf_pwr_lvl_map_0>:
100045b0:	100e 101a 101d 1029 102b 102d 1039 103a     ......).+.-.9.:.
100045c0:	103b 103d 184d 1888 1889 188a 188b 188c     ;.=.M...........
100045d0:	188d 18ca 18cb 18cc 18ce 190c 190d 194c     ..............L.
100045e0:	194d 198d 19cd 1a0d 1a4d 1a8d 1acd 1b4d     M.......M.....M.
100045f0:	1bcd 1ccd 1e4d 1fce 1fce 0000               ....M.......

100045fc <rf_pwr_lvl_map_1>:
100045fc:	0080 0082 008a 0000                         ........

10004604 <rssi_thresholds>:
10004604:	0309 0368 03d2 0449 04cf 0566               ..h...I...f.

10004610 <freq_ratios>:
10004610:	0101 0101 0201 0a04 3214 00fa f358 ffff     .........2..X...
10004620:	f2aa ffff f294 ffff f2aa ffff f34a ffff     ............J...
10004630:	f2aa ffff f294 ffff f358 ffff f358 ffff     ........X...X...
10004640:	f34a ffff f294 ffff f2b0 ffff f2b0 ffff     J...............
10004650:	f2b0 ffff f34a ffff                         ....J...

10004658 <__clz_tab>:
10004658:	0100 0202 0303 0303 0404 0404 0404 0404     ................
10004668:	0505 0505 0505 0505 0505 0505 0505 0505     ................
10004678:	0606 0606 0606 0606 0606 0606 0606 0606     ................
10004688:	0606 0606 0606 0606 0606 0606 0606 0606     ................
10004698:	0707 0707 0707 0707 0707 0707 0707 0707     ................
100046a8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
100046b8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
100046c8:	0707 0707 0707 0707 0707 0707 0707 0707     ................
100046d8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100046e8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100046f8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
10004708:	0808 0808 0808 0808 0808 0808 0808 0808     ................
10004718:	0808 0808 0808 0808 0808 0808 0808 0808     ................
10004728:	0808 0808 0808 0808 0808 0808 0808 0808     ................
10004738:	0808 0808 0808 0808 0808 0808 0808 0808     ................
10004748:	0808 0808 0808 0808 0808 0808 0808 0808     ................

Disassembly of section .data:

20000a00 <ble_conn_callbacks>:
20000a00:	0368 1000 0438 1000 0390 1000 03aa 1000     h...8...........
	...
20000a1c:	03b8 1000 0000 0000 0000 0000               ............

20000a28 <ble_mac_addr>:
20000a28:	0100 0302 0504 0000                         ........

20000a30 <__compound_literal.7.lto_priv.0>:
20000a30:	0000 7000                                   ...p

20000a34 <__compound_literal.3.lto_priv.1>:
20000a34:	0000 7001                                   ...p

20000a38 <__compound_literal.7.lto_priv.1>:
20000a38:	0000 ff02                                   ....

20000a3c <__compound_literal.3.lto_priv.2>:
20000a3c:	0000 ff01                                   ....

20000a40 <__compound_literal.11.lto_priv.0>:
20000a40:	226c 2000 0000 0000 0000 0000 0000 0000     l". ............
20000a50:	0000 0000                                   ....

20000a54 <__compound_literal.10.lto_priv.0>:
20000a54:	0000 2902                                   ...)

20000a58 <__compound_literal.9.lto_priv.0>:
20000a58:	0000 7000                                   ...p

20000a5c <__compound_literal.8.lto_priv.0>:
20000a5c:	0a30 2000 0000 0028                         0.. ..(.

20000a64 <__compound_literal.6.lto_priv.0>:
20000a64:	0000 2803                                   ...(

20000a68 <__compound_literal.5.lto_priv.1>:
20000a68:	0000 7001                                   ...p

20000a6c <__compound_literal.4.lto_priv.0>:
20000a6c:	0a34 2000 0000 0006                         4.. ....

20000a74 <__compound_literal.2.lto_priv.0>:
20000a74:	0000 2803                                   ...(

20000a78 <__compound_literal.1.lto_priv.1>:
20000a78:	0000 2600                                   ...&

20000a7c <__compound_literal.0.lto_priv.1>:
20000a7c:	0000 2800                                   ...(

20000a80 <__compound_literal.11.lto_priv.1>:
20000a80:	2280 2000 0000 0000 041a 1000 0000 0000     .". ............
20000a90:	0000 0000                                   ....

20000a94 <__compound_literal.10.lto_priv.1>:
20000a94:	0000 2902                                   ...)

20000a98 <__compound_literal.9.lto_priv.1>:
20000a98:	0000 ff02                                   ....

20000a9c <__compound_literal.8.lto_priv.1>:
20000a9c:	0a38 2000 0000 0012                         8.. ....

20000aa4 <__compound_literal.6.lto_priv.1>:
20000aa4:	0000 2803                                   ...(

20000aa8 <__compound_literal.5.lto_priv.2>:
20000aa8:	0000 ff01                                   ....

20000aac <__compound_literal.4.lto_priv.1>:
20000aac:	0a3c 2000 0000 0004                         <.. ....

20000ab4 <__compound_literal.2.lto_priv.1>:
20000ab4:	0000 2803                                   ...(

20000ab8 <__compound_literal.1.lto_priv.2>:
20000ab8:	0000 ff00                                   ....

20000abc <__compound_literal.0.lto_priv.2>:
20000abc:	0000 2800                                   ...(

20000ac0 <__compound_literal.5.lto_priv.0>:
20000ac0:	ff00 0000                                   ....

20000ac4 <__compound_literal.3.lto_priv.0>:
20000ac4:	0006 0000                                   ....

20000ac8 <__compound_literal.1.lto_priv.0>:
20000ac8:	9f78 4304 0008 0000                         x..C....

20000ad0 <__compound_literal.0.lto_priv.0>:
20000ad0:	0006 0000 0000 0000 0000 0000 0000 0000     ................
	...

20000b00 <__VECTOR_TABLE>:
	...
20000b0c:	0c22 1000 0000 0000 0000 0000 0000 0000     "...............
20000b1c:	0c22 1000 0000 0000 0000 0000 0000 0000     "...............
20000b2c:	0c22 1000 0000 0000 0000 0000 0000 0000     "...............
20000b3c:	0000 0000 09b4 1000 0c22 1000 1178 2000     ........"...x.. 
20000b4c:	11b0 2000 0c22 1000 0c22 1000 0c22 1000     ... "..."..."...
20000b5c:	0c22 1000 0c22 1000 0c22 1000 0c22 1000     "..."..."..."...
20000b6c:	0c22 1000 0c22 1000 0c22 1000 0c22 1000     "..."..."..."...
20000b7c:	0c22 1000 09b8 1000 0c22 1000 0c22 1000     "......."..."...
20000b8c:	0c22 1000 0c22 1000 11ee 2000 0c22 1000     "..."...... "...
20000b9c:	0c22 1000 09bc 1000 09c0 1000 09c4 1000     "...............
20000bac:	09c8 1000 09cc 1000 09d0 1000 09d4 1000     ................
20000bbc:	09d8 1000                                   ....

20000bc0 <bdaddr>:
20000bc0:	1518 62e8 3473 0000                         ...bs4..

20000bc8 <bt_tmr_hdl>:
20000bc8:	03e0 2000                                   ... 

20000bcc <ll_sch_mgr_ptr>:
20000bcc:	07f8 2000                                   ... 

20000bd0 <rf_common_desc_mdm_txon_v0_2_0_ext>:
20000bd0:	0000 0000 5080 0013 0084 4200 3040 0202     .....P.....B@0..
20000be0:	2015 4200 3040 0101 1000 4200 2000 0003     . .B@0.....B. ..
20000bf0:	0000 0000 5080 0002 1027 4200 3048 8000     .....P..'..BH0..

20000c00 <rf_common_desc_rf_tx_dac_off_ext>:
20000c00:	2015 4200 3040 4200 0084 4200 3048 0200     . .B@0.B...BH0..

20000c10 <rf_common_desc_rf_tx_pa_off_ext>:
20000c10:	2015 4200 3048 0500                         . .BH0..

20000c18 <ble_tx_end>:
20000c18:	0505 1405                                   ....

20000c1c <dynamic_agc_ctrl_status>:
20000c1c:	0001 0000                                   ....

20000c20 <freq_cfg_val>:
20000c20:	aaab 0c82 5555 0c85 0000 0c88 aaab 0c8a     ....UU..........
20000c30:	5555 0c8d 0000 0c90 aaab 0c92 5555 0c95     UU..........UU..
20000c40:	0000 0c98 aaab 0c9a 5555 0c9d 0000 0ca0     ........UU......
20000c50:	aaab 0ca2 5555 0ca5 0000 0ca8 aaab 0caa     ....UU..........
20000c60:	5555 0cad 0000 0cb0 aaab 0cb2 5555 0cb5     UU..........UU..
20000c70:	0000 0cb8 aaab 0cba 5555 0cbd 0000 0cc0     ........UU......
20000c80:	aaab 0cc2 5555 0cc5 0000 0cc8 aaab 0cca     ....UU..........
20000c90:	5555 0ccd 0000 0cd0 aaab 0cd2 5555 0cd5     UU..........UU..
20000ca0:	0000 0cd8 aaab 0cda 5555 0cdd 0000 0ce0     ........UU......
20000cb0:	aaab 0ce2 5555 0ce5 0000 0ce8 aaab 0cea     ....UU..........

20000cc0 <g_lp>:
20000cc0:	562b 0016                                   +V..

20000cc4 <rf_common_desc_pll_on_3>:
20000cc4:	0000 0000 5000 000a 2004 4200 3040 0400     .....P... .B@0..
20000cd4:	200c 4200 3040 0100 2018 4200 3040 0100     . .B@0... .B@0..
20000ce4:	2018 4200 3040 0101 2018 4200 3040 0200     . .B@0... .B@0..
20000cf4:	2018 4200 3040 0202 2018 4200 3040 0200     . .B@0... .B@0..
20000d04:	0008 4200 2080 f700 029c 2000 6008 0000     ...B. ..... .`..

20000d14 <rf_common_desc_rfpll_off>:
20000d14:	2018 4200 3040 0100 2000 4200 3040 0100     . .B@0... .B@0..
20000d24:	200c 4200 2080 0000 2004 4200 3040 0100     . .B. ... .B@0..
20000d34:	2004 4200 3040 0200 2004 4200 3040 fce0     . .B@0... .B@0..
20000d44:	2005 4200 3048 0100                         . .BH0..

20000d4c <rf_common_desc_rfrx_off>:
20000d4c:	2008 4200 3040 8080 2009 4200 3040 0702     . .B@0... .B@0..
20000d5c:	2010 4200 2080 00ab 0d14 2000 6008 0000     . .B. ..... .`..

20000d6c <rf_common_desc_rfrx_on>:
20000d6c:	20d2 4200 3040 0f0f 2008 4200 3040 8080     . .B@0... .B@0..
20000d7c:	2009 4200 3040 0701 2010 4200 2088 01ff     . .B@0... .B. ..

20000d8c <rf_common_desc_rftx_off>:
20000d8c:	0105 4008 3040 1f05 2008 4200 3040 3f00     ...@@0... .B@0.?
20000d9c:	2010 4200 2080 00ab 0d14 2000 6008 0000     . .B. ..... .`..

20000dac <rf_common_desc_rftx_on>:
20000dac:	2008 4200 3040 3f1e 2009 4200 3040 7878     . .B@0.?. .B@0xx
20000dbc:	2010 4200 2080 0000 20d2 4200 3048 0f03     . .B. ... .BH0..

20000dcc <rf_common_desc_rx_setfreq>:
20000dcc:	0000 0000 2020 1024 20dc 4200 3040 c080     ....  $.. .B@0..
20000ddc:	20dd 4200 3040 0701 20dc 4200 3040 3c3c     . .B@0... .B@0<<
20000dec:	20e4 4200 3040 1c0c 20de 4200 3040 0404     . .B@0... .B@0..
20000dfc:	2009 4200 3040 7820 2009 4200 3040 8000     . .B@0 x. .B@0..
20000e0c:	200a 4200 3040 0702 20dd 4200 3040 0800     . .B@0... .B@0..
20000e1c:	20e2 4200 3040 8000 20e3 4200 3040 0300     . .B@0... .B@0..
20000e2c:	2000 4200 3040 0101 2004 4200 3040 0101     . .B@0... .B@0..
20000e3c:	2004 4200 3040 fcfc 2005 4200 3040 0101     . .B@0... .B@0..
20000e4c:	201c 4200 3040 1000 200c 4200 2080 00ff     . .B@0... .B. ..
20000e5c:	0cc4 2000 6008 0000                         ... .`..

20000e64 <rf_common_desc_tx_setfreq>:
20000e64:	0000 0000 2020 1024 20dc 4200 3040 c0c0     ....  $.. .B@0..
20000e74:	20dd 4200 3040 0702 20dc 4200 3040 3c20     . .B@0... .B@0 <
20000e84:	20e4 4200 3040 1c14 20de 4200 3040 0400     . .B@0... .B@0..
20000e94:	2009 4200 3040 7830 2009 4200 3040 8080     . .B@00x. .B@0..
20000ea4:	200a 4200 3040 0702 0105 4008 3040 1f10     . .B@0.....@@0..
20000eb4:	20dd 4200 3040 0808 20e2 4200 3040 8080     . .B@0... .B@0..
20000ec4:	20e3 4200 3040 0303 2000 4200 3040 0101     . .B@0... .B@0..
20000ed4:	2004 4200 2080 03ff 2015 4200 3040 0606     . .B. ... .B@0..
20000ee4:	201c 4200 3040 1010 1027 4200 3040 8080     . .B@0..'..B@0..
20000ef4:	200c 4200 2080 00f7 0cc4 2000 6008 0000     . .B. ..... .`..

20000f04 <rf_wb_sat_th>:
20000f04:	0070 0000                                   p...

20000f08 <rf_desc_dcoc_calib_rx_off>:
20000f08:	0224 2000 6000 0000 027c 2000 6000 0000     $.. .`..|.. .`..
20000f18:	0d4c 2000 6008 0000                         L.. .`..

20000f20 <rf_desc_dcoc_calib_rx_on>:
20000f20:	0dcc 2000 6000 0000 0000 0000 5000 0032     ... .`.......P2.
20000f30:	0274 2000 6000 0000 0d6c 2000 6000 0000     t.. .`..l.. .`..
20000f40:	1004 4200 2000 0001 0284 2000 6000 0000     ...B. ..... .`..
20000f50:	022c 2000 6008 0000                         ,.. .`..

20000f58 <is_rx>:
20000f58:	0001 0000                                   ....

20000f5c <reversed_access>:
20000f5c:	2c10 2000                                   .,. 

20000f60 <rf_2g4_call_desc_list_rx>:
20000f60:	0000 0000 6000 0000 0f90 2000 6000 0000     .....`..... .`..
20000f70:	0164 2000 6008 0000                         d.. .`..

20000f78 <rf_2g4_call_desc_list_tx>:
20000f78:	0000 0000 6000 0000 0f90 2000 6000 0000     .....`..... .`..
20000f88:	01b4 2000 6008 0000                         ... .`..

20000f90 <rf_2g4_common_desc_pll_delay>:
20000f90:	0000 0000 5008 001e                         .....P..

20000f98 <flash_read_status>:
}

__FLASH_RAM_CODE_SECTION int flash_read_status(void)
{
    int status;
    *(reg32_t*)(REG_CMD_TYPE) = CMD_READ;
20000f98:	1f0007b7          	lui	a5,0x1f000
20000f9c:	4705                	li	a4,1
20000f9e:	c398                	sw	a4,0(a5)
    *(reg32_t*)(REG_CMD_CODE) = 5;
20000fa0:	4695                	li	a3,5
20000fa2:	c3d4                	sw	a3,4(a5)
    *(reg32_t*)(REG_CMD_LEN ) = 1;
20000fa4:	c7d8                	sw	a4,12(a5)
    *(reg32_t*)(REG_CMD_REQ ) = 1;
20000fa6:	cfd8                	sw	a4,28(a5)

    status = *(reg32_t*)(REG_CMD_REQ);
20000fa8:	4fc8                	lw	a0,28(a5)
    return status;
}
20000faa:	8082                	ret

20000fac <flash_sector_erase>:
 * 2. Send SE (Sector Erase) command
 * 3. Poll status register until completion
 */
__FLASH_RAM_CODE_SECTION
void flash_sector_erase(int addr)
{
20000fac:	1171                	addi	sp,sp,-4
20000fae:	c006                	sw	ra,0(sp)
	ATOMIC_SECTION_BEGIN();
20000fb0:	300477f3          	csrrci	a5,mstatus,8
    *(reg32_t*)(REG_CMD_TYPE) = CMD_ONLY;
20000fb4:	1f0007b7          	lui	a5,0x1f000
20000fb8:	0007a023          	sw	zero,0(a5) # 1f000000 <__etext+0xeffb894>
    *(reg32_t*)(REG_CMD_CODE) = 6;
20000fbc:	4719                	li	a4,6
20000fbe:	c3d8                	sw	a4,4(a5)
    *(reg32_t*)(REG_CMD_REQ ) = 1;
20000fc0:	4705                	li	a4,1
20000fc2:	cfd8                	sw	a4,28(a5)

    flash_write_enable();

    *(reg32_t*)(REG_CMD_TYPE) = CMD_ADDR;
20000fc4:	468d                	li	a3,3
20000fc6:	c394                	sw	a3,0(a5)
    *(reg32_t*)(REG_CMD_CODE) = 0x20;
20000fc8:	02000693          	li	a3,32
20000fcc:	c3d4                	sw	a3,4(a5)
    *(reg32_t*)(REG_CMD_ADDR) = addr;
20000fce:	c788                	sw	a0,8(a5)
    *(reg32_t*)(REG_CMD_REQ ) = 1;
20000fd0:	cfd8                	sw	a4,28(a5)

    while(1 == (0x1 & flash_read_status())){}
20000fd2:	37d9                	jal	20000f98 <flash_read_status>
20000fd4:	8905                	andi	a0,a0,1
20000fd6:	fd75                	bnez	a0,20000fd2 <flash_sector_erase+0x26>

	ATOMIC_SECTION_END();
20000fd8:	300467f3          	csrrsi	a5,mstatus,8
}
20000fdc:	4082                	lw	ra,0(sp)
20000fde:	0111                	addi	sp,sp,4
20000fe0:	8082                	ret

20000fe2 <flash_page_program>:
 * 3. Write data to flash buffer
 * 4. Wait for completion
 */
__FLASH_RAM_CODE_SECTION
void flash_page_program(int addr, int * data, int len)
{
20000fe2:	1171                	addi	sp,sp,-4
20000fe4:	c006                	sw	ra,0(sp)
    int len_word;
    int i;

	ATOMIC_SECTION_BEGIN();
20000fe6:	300477f3          	csrrci	a5,mstatus,8
    *(reg32_t*)(REG_CMD_TYPE) = CMD_ONLY;
20000fea:	1f000737          	lui	a4,0x1f000
20000fee:	00072023          	sw	zero,0(a4) # 1f000000 <__etext+0xeffb894>
    *(reg32_t*)(REG_CMD_CODE) = 6;
20000ff2:	4799                	li	a5,6
20000ff4:	c35c                	sw	a5,4(a4)
    *(reg32_t*)(REG_CMD_REQ ) = 1;
20000ff6:	4785                	li	a5,1
20000ff8:	cf5c                	sw	a5,28(a4)

    flash_write_enable();

    *(reg32_t*)(REG_CMD_TYPE) = wt_cmd;
20000ffa:	4795                	li	a5,5
20000ffc:	c31c                	sw	a5,0(a4)
    *(reg32_t*)(REG_CMD_CODE) = wt_code;
20000ffe:	4789                	li	a5,2
20001000:	c35c                	sw	a5,4(a4)

    *(reg32_t*)(REG_CMD_ADDR) = addr;
    *(reg32_t*)(REG_CMD_LEN ) = len; // byte

    len_word = (len >> 2);
20001002:	ffc60793          	addi	a5,a2,-4
20001006:	00f037b3          	snez	a5,a5
2000100a:	40f007b3          	neg	a5,a5
    *(reg32_t*)(REG_CMD_ADDR) = addr;
2000100e:	c708                	sw	a0,8(a4)
    len_word = (len >> 2);
20001010:	8b9d                	andi	a5,a5,7
    *(reg32_t*)(REG_CMD_LEN ) = len; // byte
20001012:	c750                	sw	a2,12(a4)
    len_word = (len >> 2);
20001014:	0785                	addi	a5,a5,1

    for(i=0;i<len_word;i++)
20001016:	4681                	li	a3,0
    {
        *(volatile reg32_t*)(REG_CMD_DATA) = data[i];
20001018:	01070613          	addi	a2,a4,16
2000101c:	00269513          	slli	a0,a3,0x2
20001020:	952e                	add	a0,a0,a1
20001022:	4108                	lw	a0,0(a0)
    for(i=0;i<len_word;i++)
20001024:	0685                	addi	a3,a3,1 # 800001 <__FLASH_SIZE+0x7c0001>
        *(volatile reg32_t*)(REG_CMD_DATA) = data[i];
20001026:	c208                	sw	a0,0(a2)
    for(i=0;i<len_word;i++)
20001028:	fed79ae3          	bne	a5,a3,2000101c <flash_page_program+0x3a>
    }

    *(reg32_t*)(REG_CMD_REQ) = 1;
2000102c:	4785                	li	a5,1
2000102e:	cf5c                	sw	a5,28(a4)

    while(1 == (0x1 & flash_read_status())){}
20001030:	37a5                	jal	20000f98 <flash_read_status>
20001032:	8905                	andi	a0,a0,1
20001034:	fd75                	bnez	a0,20001030 <flash_page_program+0x4e>

	ATOMIC_SECTION_END();
20001036:	300467f3          	csrrsi	a5,mstatus,8
	
}
2000103a:	4082                	lw	ra,0(sp)
2000103c:	0111                	addi	sp,sp,4
2000103e:	8082                	ret

20001040 <flash_page_read.constprop.0>:
    *(reg32_t*)(REG_CMD_TYPE) = rd_cmd;
20001040:	1f0007b7          	lui	a5,0x1f000
20001044:	4719                	li	a4,6
20001046:	c398                	sw	a4,0(a5)
    *(reg32_t*)(REG_CMD_CODE) = rd_code;
20001048:	03b00713          	li	a4,59
2000104c:	c3d8                	sw	a4,4(a5)
    *(reg32_t*)(REG_CMD_ADDR) = addr;
2000104e:	c788                	sw	a0,8(a5)
    *(reg32_t*)(REG_CMD_LEN ) = len; // byte
20001050:	4711                	li	a4,4
20001052:	c7d8                	sw	a4,12(a5)
    *(reg32_t*)(REG_CMD_REQ ) = 1;
20001054:	4705                	li	a4,1
20001056:	cfd8                	sw	a4,28(a5)
        data[i] = *(reg32_t*)(REG_CMD_DATA);
20001058:	4b98                	lw	a4,16(a5)
2000105a:	200027b7          	lui	a5,0x20002
2000105e:	1ae7a023          	sw	a4,416(a5) # 200021a0 <__data_end__>
}
20001062:	8082                	ret

20001064 <flash_write_less_one_word>:

__RAM_CODE_SECTION
static void flash_write_less_one_word(int addr, int off, char * pdata, int len)
{
20001064:	1131                	addi	sp,sp,-20
20001066:	c622                	sw	s0,12(sp)
20001068:	c426                	sw	s1,8(sp)
2000106a:	842e                	mv	s0,a1
2000106c:	c232                	sw	a2,4(sp)
2000106e:	c806                	sw	ra,16(sp)
20001070:	c02a                	sw	a0,0(sp)
20001072:	84b6                	mv	s1,a3
	char * ptmp = (char *)wdalignbuf;
	flash_page_read(addr, wdalignbuf, 4);
20001074:	37f1                	jal	20001040 <flash_page_read.constprop.0>

	for (int i = 0; i < len; i++)
20001076:	4612                	lw	a2,4(sp)
20001078:	20002737          	lui	a4,0x20002
2000107c:	4781                	li	a5,0
2000107e:	1a070593          	addi	a1,a4,416 # 200021a0 <__data_end__>
20001082:	0097c963          	blt	a5,s1,20001094 <flash_write_less_one_word+0x30>
	{
		ptmp[off + i] = pdata[i];
	}

	flash_page_program(addr, wdalignbuf, 4);
}
20001086:	4432                	lw	s0,12(sp)
	flash_page_program(addr, wdalignbuf, 4);
20001088:	4502                	lw	a0,0(sp)
}
2000108a:	40c2                	lw	ra,16(sp)
2000108c:	44a2                	lw	s1,8(sp)
	flash_page_program(addr, wdalignbuf, 4);
2000108e:	4611                	li	a2,4
}
20001090:	0151                	addi	sp,sp,20
	flash_page_program(addr, wdalignbuf, 4);
20001092:	bf81                	j	20000fe2 <flash_page_program>
		ptmp[off + i] = pdata[i];
20001094:	00f60733          	add	a4,a2,a5
20001098:	00074683          	lbu	a3,0(a4)
2000109c:	00f40733          	add	a4,s0,a5
200010a0:	972e                	add	a4,a4,a1
200010a2:	00d70023          	sb	a3,0(a4)
	for (int i = 0; i < len; i++)
200010a6:	0785                	addi	a5,a5,1
200010a8:	bfe9                	j	20001082 <flash_write_less_one_word+0x1e>

200010aa <flashProgram.isra.0>:

__RAM_CODE_SECTION
static int flashProgram(char* dst, char *src, int length)
200010aa:	1101                	addi	sp,sp,-32
200010ac:	cc22                	sw	s0,24(sp)
200010ae:	ca26                	sw	s1,20(sp)
200010b0:	872e                	mv	a4,a1
	int dst_addr, src_addr, ua_off, ua_len;

	cur_len_bits = 5;
	rm_len = length;
	dst_addr = (int)dst;
	src_addr = (int)src;
200010b2:	842e                	mv	s0,a1
static int flashProgram(char* dst, char *src, int length)
200010b4:	ce06                	sw	ra,28(sp)
	ua_off = dst_addr & 0x3;
200010b6:	00357593          	andi	a1,a0,3
static int flashProgram(char* dst, char *src, int length)
200010ba:	84b2                	mv	s1,a2
200010bc:	832a                	mv	t1,a0
	ua_len = 4 - ua_off;
	ua_len = (ua_len > rm_len) ? rm_len:ua_len;

	if (ua_off > 0)
200010be:	c19d                	beqz	a1,200010e4 <flashProgram.isra.0+0x3a>
	ua_len = 4 - ua_off;
200010c0:	4791                	li	a5,4
200010c2:	40b78433          	sub	s0,a5,a1
	ua_len = (ua_len > rm_len) ? rm_len:ua_len;
200010c6:	00865363          	bge	a2,s0,200010cc <flashProgram.isra.0+0x22>
200010ca:	8432                	mv	s0,a2
	{
		dst_addr = dst_addr & (~0x3);
200010cc:	9971                	andi	a0,a0,-4
		flash_write_less_one_word(dst_addr, ua_off, src, ua_len);
200010ce:	86a2                	mv	a3,s0
200010d0:	863a                	mv	a2,a4
200010d2:	c23a                	sw	a4,4(sp)
200010d4:	c02a                	sw	a0,0(sp)
200010d6:	3779                	jal	20001064 <flash_write_less_one_word>
		rm_len -= ua_len;
		dst_addr += 4; //word aligned
200010d8:	4502                	lw	a0,0(sp)
		src_addr += ua_len;
200010da:	4712                	lw	a4,4(sp)
		rm_len -= ua_len;
200010dc:	8c81                	sub	s1,s1,s0
		dst_addr += 4; //word aligned
200010de:	00450313          	addi	t1,a0,4 # 1d004 <memset+0x10638>
		src_addr += ua_len;
200010e2:	943a                	add	s0,s0,a4
	}

	while(rm_len >= 4)
	{
		int cur_tms = (rm_len >> cur_len_bits);
		for (int i = 0; i < cur_tms; i++)
200010e4:	c002                	sw	zero,0(sp)
200010e6:	4615                	li	a2,5
	while(rm_len >= 4)
200010e8:	468d                	li	a3,3
200010ea:	0296d663          	bge	a3,s1,20001116 <flashProgram.isra.0+0x6c>
		int cur_tms = (rm_len >> cur_len_bits);
200010ee:	40c4d7b3          	sra	a5,s1,a2
		{
			int cur_src = src_addr;
			if (0 != (cur_src & 0x3))
			{//not word aligned
				memcpy(wdalignbuf, (void *)src_addr, (1 << cur_len_bits));
200010f2:	4685                	li	a3,1
		int cur_tms = (rm_len >> cur_len_bits);
200010f4:	c23e                	sw	a5,4(sp)
				memcpy(wdalignbuf, (void *)src_addr, (1 << cur_len_bits));
200010f6:	00c69633          	sll	a2,a3,a2
		for (int i = 0; i < cur_tms; i++)
200010fa:	4281                	li	t0,0
200010fc:	4792                	lw	a5,4(sp)
200010fe:	02579763          	bne	a5,t0,2000112c <flashProgram.isra.0+0x82>
20001102:	4782                	lw	a5,0(sp)
			flash_page_program(dst_addr, (int *)cur_src, (1 << cur_len_bits));

			src_addr += (1 << cur_len_bits);
			dst_addr += (1 << cur_len_bits);
		}
	    rm_len = (rm_len & ((1 << cur_len_bits) - 1));
20001104:	167d                	addi	a2,a2,-1
20001106:	8cf1                	and	s1,s1,a2
20001108:	00178693          	addi	a3,a5,1
2000110c:	4785                	li	a5,1
		if (5 == cur_len_bits)
		{
			cur_len_bits = 2;
2000110e:	4609                	li	a2,2
20001110:	c03e                	sw	a5,0(sp)
		if (5 == cur_len_bits)
20001112:	fcc69be3          	bne	a3,a2,200010e8 <flashProgram.isra.0+0x3e>
		{
			break;
		}
	}

	if (rm_len > 0)
20001116:	04905b63          	blez	s1,2000116c <flashProgram.isra.0+0xc2>
	{
		flash_write_less_one_word(dst_addr, 0, (char *)src_addr, rm_len);
2000111a:	8622                	mv	a2,s0
	}

	return 0;
}
2000111c:	4462                	lw	s0,24(sp)
2000111e:	40f2                	lw	ra,28(sp)
		flash_write_less_one_word(dst_addr, 0, (char *)src_addr, rm_len);
20001120:	86a6                	mv	a3,s1
}
20001122:	44d2                	lw	s1,20(sp)
		flash_write_less_one_word(dst_addr, 0, (char *)src_addr, rm_len);
20001124:	4581                	li	a1,0
20001126:	851a                	mv	a0,t1
}
20001128:	6105                	addi	sp,sp,32
		flash_write_less_one_word(dst_addr, 0, (char *)src_addr, rm_len);
2000112a:	bf2d                	j	20001064 <flash_write_less_one_word>
			if (0 != (cur_src & 0x3))
2000112c:	00347693          	andi	a3,s0,3
			int cur_src = src_addr;
20001130:	85a2                	mv	a1,s0
			if (0 != (cur_src & 0x3))
20001132:	c28d                	beqz	a3,20001154 <flashProgram.isra.0+0xaa>
				memcpy(wdalignbuf, (void *)src_addr, (1 << cur_len_bits));
20001134:	200026b7          	lui	a3,0x20002
20001138:	1a068693          	addi	a3,a3,416 # 200021a0 <__data_end__>
2000113c:	8536                	mv	a0,a3
2000113e:	c816                	sw	t0,16(sp)
20001140:	c61a                	sw	t1,12(sp)
20001142:	c432                	sw	a2,8(sp)
20001144:	e000c097          	auipc	ra,0xe000c
20001148:	870080e7          	jalr	-1936(ra) # c9b4 <memcpy>
				cur_src = (int)wdalignbuf;
2000114c:	42c2                	lw	t0,16(sp)
2000114e:	4332                	lw	t1,12(sp)
20001150:	4622                	lw	a2,8(sp)
20001152:	85aa                	mv	a1,a0
			flash_page_program(dst_addr, (int *)cur_src, (1 << cur_len_bits));
20001154:	851a                	mv	a0,t1
20001156:	c816                	sw	t0,16(sp)
20001158:	c632                	sw	a2,12(sp)
2000115a:	c41a                	sw	t1,8(sp)
2000115c:	3559                	jal	20000fe2 <flash_page_program>
			src_addr += (1 << cur_len_bits);
2000115e:	4632                	lw	a2,12(sp)
			dst_addr += (1 << cur_len_bits);
20001160:	4322                	lw	t1,8(sp)
		for (int i = 0; i < cur_tms; i++)
20001162:	42c2                	lw	t0,16(sp)
			src_addr += (1 << cur_len_bits);
20001164:	9432                	add	s0,s0,a2
			dst_addr += (1 << cur_len_bits);
20001166:	9332                	add	t1,t1,a2
		for (int i = 0; i < cur_tms; i++)
20001168:	0285                	addi	t0,t0,1
2000116a:	bf49                	j	200010fc <flashProgram.isra.0+0x52>
}
2000116c:	40f2                	lw	ra,28(sp)
2000116e:	4462                	lw	s0,24(sp)
20001170:	44d2                	lw	s1,20(sp)
20001172:	6105                	addi	sp,sp,32
20001174:	8082                	ret

20001176 <flash_write>:

__RAM_CODE_SECTION
void flash_write(uint32_t addr, uint8_t * buf, uint32_t len)
{
	#ifndef FAKE_FLASH
	flashProgram((char *)addr, (char *)buf,  len);
20001176:	bf15                	j	200010aa <flashProgram.isra.0>

20001178 <RADIO_DMA_Handler>:
{
20001178:	fd810113          	addi	sp,sp,-40
2000117c:	d206                	sw	ra,36(sp)
2000117e:	d016                	sw	t0,32(sp)
20001180:	ce1a                	sw	t1,28(sp)
20001182:	cc1e                	sw	t2,24(sp)
20001184:	ca2a                	sw	a0,20(sp)
20001186:	c82e                	sw	a1,16(sp)
20001188:	c632                	sw	a2,12(sp)
2000118a:	c436                	sw	a3,8(sp)
2000118c:	c23a                	sw	a4,4(sp)
2000118e:	c03e                	sw	a5,0(sp)
    RF_BT_IRQHandler_RAM();
20001190:	24a9                	jal	200013da <RF_BT_IRQHandler_RAM>
	rf_cali_period_temp();
20001192:	2af1                	jal	2000136e <rf_cali_period_temp>
}
20001194:	5092                	lw	ra,36(sp)
20001196:	5282                	lw	t0,32(sp)
20001198:	4372                	lw	t1,28(sp)
2000119a:	43e2                	lw	t2,24(sp)
2000119c:	4552                	lw	a0,20(sp)
2000119e:	45c2                	lw	a1,16(sp)
200011a0:	4632                	lw	a2,12(sp)
200011a2:	46a2                	lw	a3,8(sp)
200011a4:	4712                	lw	a4,4(sp)
200011a6:	4782                	lw	a5,0(sp)
200011a8:	02810113          	addi	sp,sp,40
200011ac:	30200073          	mret

200011b0 <RADIO_TICK_Handler>:
{
200011b0:	fd810113          	addi	sp,sp,-40
200011b4:	d206                	sw	ra,36(sp)
200011b6:	d016                	sw	t0,32(sp)
200011b8:	ce1a                	sw	t1,28(sp)
200011ba:	cc1e                	sw	t2,24(sp)
200011bc:	ca2a                	sw	a0,20(sp)
200011be:	c82e                	sw	a1,16(sp)
200011c0:	c632                	sw	a2,12(sp)
200011c2:	c436                	sw	a3,8(sp)
200011c4:	c23a                	sw	a4,4(sp)
200011c6:	c03e                	sw	a5,0(sp)
    BT_TIMER_IRQHandler(); //rom api
200011c8:	e000b097          	auipc	ra,0xe000b
200011cc:	a3c080e7          	jalr	-1476(ra) # bc04 <BT_TIMER_IRQHandler>
    rf_cali_period_temp();
200011d0:	2a79                	jal	2000136e <rf_cali_period_temp>
}
200011d2:	5092                	lw	ra,36(sp)
200011d4:	5282                	lw	t0,32(sp)
200011d6:	4372                	lw	t1,28(sp)
200011d8:	43e2                	lw	t2,24(sp)
200011da:	4552                	lw	a0,20(sp)
200011dc:	45c2                	lw	a1,16(sp)
200011de:	4632                	lw	a2,12(sp)
200011e0:	46a2                	lw	a3,8(sp)
200011e2:	4712                	lw	a4,4(sp)
200011e4:	4782                	lw	a5,0(sp)
200011e6:	02810113          	addi	sp,sp,40
200011ea:	30200073          	mret

200011ee <RTC_Handler>:
{
200011ee:	fd810113          	addi	sp,sp,-40
200011f2:	d206                	sw	ra,36(sp)
200011f4:	d016                	sw	t0,32(sp)
200011f6:	ce1a                	sw	t1,28(sp)
200011f8:	cc1e                	sw	t2,24(sp)
200011fa:	ca2a                	sw	a0,20(sp)
200011fc:	c82e                	sw	a1,16(sp)
200011fe:	c632                	sw	a2,12(sp)
20001200:	c436                	sw	a3,8(sp)
20001202:	c23a                	sw	a4,4(sp)
20001204:	c03e                	sw	a5,0(sp)
    VTIMER_IRQHandler();
20001206:	f0000097          	auipc	ra,0xf0000
2000120a:	142080e7          	jalr	322(ra) # 10001348 <VTIMER_IRQHandler>
}
2000120e:	5092                	lw	ra,36(sp)
20001210:	5282                	lw	t0,32(sp)
20001212:	4372                	lw	t1,28(sp)
20001214:	43e2                	lw	t2,24(sp)
20001216:	4552                	lw	a0,20(sp)
20001218:	45c2                	lw	a1,16(sp)
2000121a:	4632                	lw	a2,12(sp)
2000121c:	46a2                	lw	a3,8(sp)
2000121e:	4712                	lw	a4,4(sp)
20001220:	4782                	lw	a5,0(sp)
20001222:	02810113          	addi	sp,sp,40
20001226:	30200073          	mret

2000122a <poweron_unused_gpio_mask_parse_and_set>:
2000122a:	1171                	addi	sp,sp,-4
2000122c:	c022                	sw	s0,0(sp)
2000122e:	40010337          	lui	t1,0x40010
20001232:	03032703          	lw	a4,48(t1) # 40010030 <__StackTop+0x2000c030>
20001236:	fff54793          	not	a5,a0
2000123a:	8ff9                	and	a5,a5,a4
2000123c:	02f32823          	sw	a5,48(t1)
20001240:	20030313          	addi	t1,t1,512
20001244:	4291                	li	t0,4
20001246:	40010437          	lui	s0,0x40010
2000124a:	21840413          	addi	s0,s0,536 # 40010218 <__StackTop+0x2000c218>
2000124e:	a025                	j	20001276 <poweron_unused_gpio_mask_parse_and_set+0x4c>
20001250:	8105                	srli	a0,a0,0x1
20001252:	0722                	slli	a4,a4,0x8
20001254:	06a2                	slli	a3,a3,0x8
20001256:	0785                	addi	a5,a5,1
20001258:	00578a63          	beq	a5,t0,2000126c <poweron_unused_gpio_mask_parse_and_set+0x42>
2000125c:	00157593          	andi	a1,a0,1
20001260:	d9e5                	beqz	a1,20001250 <poweron_unused_gpio_mask_parse_and_set+0x26>
20001262:	fff74593          	not	a1,a4
20001266:	8e6d                	and	a2,a2,a1
20001268:	8e55                	or	a2,a2,a3
2000126a:	b7dd                	j	20001250 <poweron_unused_gpio_mask_parse_and_set+0x26>
2000126c:	00c3a023          	sw	a2,0(t2)
20001270:	0311                	addi	t1,t1,4
20001272:	00830b63          	beq	t1,s0,20001288 <poweron_unused_gpio_mask_parse_and_set+0x5e>
20001276:	839a                	mv	t2,t1
20001278:	00032603          	lw	a2,0(t1)
2000127c:	0a000693          	li	a3,160
20001280:	0ff00713          	li	a4,255
20001284:	4781                	li	a5,0
20001286:	bfd9                	j	2000125c <poweron_unused_gpio_mask_parse_and_set+0x32>
20001288:	4402                	lw	s0,0(sp)
2000128a:	0111                	addi	sp,sp,4
2000128c:	8082                	ret
2000128e:	1171                	addi	sp,sp,-4
20001290:	420007b7          	lui	a5,0x42000
20001294:	1047a783          	lw	a5,260(a5) # 42000104 <__StackTop+0x21ffc104>
20001298:	c03e                	sw	a5,0(sp)
2000129a:	420006b7          	lui	a3,0x42000
2000129e:	1046a783          	lw	a5,260(a3) # 42000104 <__StackTop+0x21ffc104>
200012a2:	4702                	lw	a4,0(sp)
200012a4:	8f99                	sub	a5,a5,a4
200012a6:	fea7ece3          	bltu	a5,a0,2000129e <poweron_unused_gpio_mask_parse_and_set+0x74>
200012aa:	0111                	addi	sp,sp,4
200012ac:	8082                	ret

200012ae <delay_ms>:
200012ae:	1171                	addi	sp,sp,-4
200012b0:	c006                	sw	ra,0(sp)
200012b2:	3e800793          	li	a5,1000
200012b6:	02f50533          	mul	a0,a0,a5
200012ba:	e000b097          	auipc	ra,0xe000b
200012be:	61c080e7          	jalr	1564(ra) # c8d6 <delay_us>
200012c2:	4082                	lw	ra,0(sp)
200012c4:	0111                	addi	sp,sp,4
200012c6:	8082                	ret

200012c8 <VTIMER_ClkCali_Trigger>:
200012c8:	40000737          	lui	a4,0x40000
200012cc:	10800793          	li	a5,264
200012d0:	06f71a23          	sh	a5,116(a4) # 40000074 <__StackTop+0x1fffc074>
200012d4:	4785                	li	a5,1
200012d6:	00a797b3          	sll	a5,a5,a0
200012da:	df3c                	sw	a5,120(a4)
200012dc:	156d                	addi	a0,a0,-5
200012de:	0ff57513          	zext.b	a0,a0
200012e2:	200027b7          	lui	a5,0x20002
200012e6:	2dc78793          	addi	a5,a5,732 # 200022dc <VTIMER_Context>
200012ea:	00a782a3          	sb	a0,5(a5)
200012ee:	8082                	ret

200012f0 <VTIMER_ClkCali_Wait>:
200012f0:	40000737          	lui	a4,0x40000
200012f4:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
200012f8:	8bc1                	andi	a5,a5,16
200012fa:	dfed                	beqz	a5,200012f4 <VTIMER_ClkCali_Wait+0x4>
200012fc:	200027b7          	lui	a5,0x20002
20001300:	2dc78793          	addi	a5,a5,732 # 200022dc <VTIMER_Context>
20001304:	00a7c703          	lbu	a4,10(a5)
20001308:	0ff77713          	zext.b	a4,a4
2000130c:	00171693          	slli	a3,a4,0x1
20001310:	96be                	add	a3,a3,a5
20001312:	00c6d603          	lhu	a2,12(a3)
20001316:	01061593          	slli	a1,a2,0x10
2000131a:	81c1                	srli	a1,a1,0x10
2000131c:	4fd0                	lw	a2,28(a5)
2000131e:	8e0d                	sub	a2,a2,a1
20001320:	cfd0                	sw	a2,28(a5)
20001322:	40000637          	lui	a2,0x40000
20001326:	5e70                	lw	a2,124(a2)
20001328:	0057c583          	lbu	a1,5(a5)
2000132c:	00b65633          	srl	a2,a2,a1
20001330:	0642                	slli	a2,a2,0x10
20001332:	8241                	srli	a2,a2,0x10
20001334:	00c69623          	sh	a2,12(a3)
20001338:	00c6d683          	lhu	a3,12(a3)
2000133c:	06c2                	slli	a3,a3,0x10
2000133e:	82c1                	srli	a3,a3,0x10
20001340:	4fd0                	lw	a2,28(a5)
20001342:	96b2                	add	a3,a3,a2
20001344:	cfd4                	sw	a3,28(a5)
20001346:	0705                	addi	a4,a4,1
20001348:	8b1d                	andi	a4,a4,7
2000134a:	00e78523          	sb	a4,10(a5)
2000134e:	01a7d783          	lhu	a5,26(a5)
20001352:	07c2                	slli	a5,a5,0x10
20001354:	83c1                	srli	a5,a5,0x10
20001356:	cb99                	beqz	a5,2000136c <VTIMER_ClkCali_Wait+0x7c>
20001358:	20002737          	lui	a4,0x20002
2000135c:	2dc70713          	addi	a4,a4,732 # 200022dc <VTIMER_Context>
20001360:	4f5c                	lw	a5,28(a4)
20001362:	838d                	srli	a5,a5,0x3
20001364:	07c2                	slli	a5,a5,0x10
20001366:	83c1                	srli	a5,a5,0x10
20001368:	00f71423          	sh	a5,8(a4)
2000136c:	8082                	ret

2000136e <rf_cali_period_temp>:
2000136e:	1151                	addi	sp,sp,-12
20001370:	c406                	sw	ra,8(sp)
20001372:	2881                	jal	200013c2 <omw_cali_period_temp>
20001374:	40a2                	lw	ra,8(sp)
20001376:	0131                	addi	sp,sp,12
20001378:	8082                	ret

2000137a <RADIO_CommonDescInit_SetFreq>:
2000137a:	1151                	addi	sp,sp,-12
2000137c:	c406                	sw	ra,8(sp)
2000137e:	2a81                	jal	200014ce <RADIO_DescInit_Freq>
20001380:	40a2                	lw	ra,8(sp)
20001382:	0131                	addi	sp,sp,12
20001384:	8082                	ret

20001386 <sys_timeout_tick_get_hook>:
20001386:	420007b7          	lui	a5,0x42000
2000138a:	1047a503          	lw	a0,260(a5) # 42000104 <__StackTop+0x21ffc104>
2000138e:	3e800793          	li	a5,1000
20001392:	02f55533          	divu	a0,a0,a5
20001396:	8082                	ret

20001398 <ll_conn_process_wake_up_pre_chk>:
20001398:	1151                	addi	sp,sp,-12
2000139a:	c406                	sw	ra,8(sp)
2000139c:	4501                	li	a0,0
2000139e:	e0001097          	auipc	ra,0xe0001
200013a2:	7f6080e7          	jalr	2038(ra) # 2b94 <ll_conn_set_get>
200013a6:	00054783          	lbu	a5,0(a0)
200013aa:	cb89                	beqz	a5,200013bc <ll_conn_process_wake_up_pre_chk+0x24>
200013ac:	00654783          	lbu	a5,6(a0)
200013b0:	c791                	beqz	a5,200013bc <ll_conn_process_wake_up_pre_chk+0x24>
200013b2:	200037b7          	lui	a5,0x20003
200013b6:	4705                	li	a4,1
200013b8:	c0e78023          	sb	a4,-1024(a5) # 20002c00 <need_pwr_on>
200013bc:	40a2                	lw	ra,8(sp)
200013be:	0131                	addi	sp,sp,12
200013c0:	8082                	ret

200013c2 <omw_cali_period_temp>:
200013c2:	200007b7          	lui	a5,0x20000
200013c6:	4257c783          	lbu	a5,1061(a5) # 20000425 <rf_bt_mgr+0x5>
200013ca:	e391                	bnez	a5,200013ce <omw_cali_period_temp+0xc>
200013cc:	8082                	ret
200013ce:	1151                	addi	sp,sp,-12
200013d0:	c406                	sw	ra,8(sp)
200013d2:	2145                	jal	20001872 <calc_hp_offset_at_curr_temp>
200013d4:	40a2                	lw	ra,8(sp)
200013d6:	0131                	addi	sp,sp,12
200013d8:	8082                	ret

200013da <RF_BT_IRQHandler_RAM>:
200013da:	1141                	addi	sp,sp,-16
200013dc:	c606                	sw	ra,12(sp)
200013de:	c422                	sw	s0,8(sp)
200013e0:	c226                	sw	s1,4(sp)
200013e2:	200007b7          	lui	a5,0x20000
200013e6:	4287a403          	lw	s0,1064(a5) # 20000428 <rf_bt_mgr+0x8>
200013ea:	420007b7          	lui	a5,0x42000
200013ee:	43dc                	lw	a5,4(a5)
200013f0:	c859                	beqz	s0,20001486 <RF_BT_IRQHandler_RAM+0xac>
200013f2:	20000737          	lui	a4,0x20000
200013f6:	42070713          	addi	a4,a4,1056 # 20000420 <rf_bt_mgr>
200013fa:	00674683          	lbu	a3,6(a4)
200013fe:	00d40023          	sb	a3,0(s0)
20001402:	00774703          	lbu	a4,7(a4)
20001406:	00e400a3          	sb	a4,1(s0)
2000140a:	01079713          	slli	a4,a5,0x10
2000140e:	8341                	srli	a4,a4,0x10
20001410:	8ba1                	andi	a5,a5,8
20001412:	00f03533          	snez	a0,a5
20001416:	c02a                	sw	a0,0(sp)
20001418:	c789                	beqz	a5,20001422 <RF_BT_IRQHandler_RAM+0x48>
2000141a:	00477793          	andi	a5,a4,4
2000141e:	0017b793          	seqz	a5,a5
20001422:	0ff7f493          	zext.b	s1,a5
20001426:	420017b7          	lui	a5,0x42001
2000142a:	1e07c703          	lbu	a4,480(a5) # 420011e0 <__StackTop+0x21ffd1e0>
2000142e:	1c078793          	addi	a5,a5,448
20001432:	0ff77713          	zext.b	a4,a4
20001436:	200036b7          	lui	a3,0x20003
2000143a:	cee6a223          	sw	a4,-796(a3) # 20002ce4 <rssi>
2000143e:	02c7c783          	lbu	a5,44(a5)
20001442:	0ff7f793          	zext.b	a5,a5
20001446:	20003737          	lui	a4,0x20003
2000144a:	cef72623          	sw	a5,-788(a4) # 20002cec <rx_gain>
2000144e:	2d5d                	jal	20001b04 <dynamic_agc_info_get2>
20001450:	420007b7          	lui	a5,0x42000
20001454:	4705                	li	a4,1
20001456:	06e78223          	sb	a4,100(a5) # 42000064 <__StackTop+0x21ffc064>
2000145a:	200007b7          	lui	a5,0x20000
2000145e:	420782a3          	sb	zero,1061(a5) # 20000425 <rf_bt_mgr+0x5>
20001462:	200037b7          	lui	a5,0x20003
20001466:	ce47a603          	lw	a2,-796(a5) # 20002ce4 <rssi>
2000146a:	86a2                	mv	a3,s0
2000146c:	0662                	slli	a2,a2,0x18
2000146e:	8661                	srai	a2,a2,0x18
20001470:	85a6                	mv	a1,s1
20001472:	4502                	lw	a0,0(sp)
20001474:	e0004097          	auipc	ra,0xe0004
20001478:	dc2080e7          	jalr	-574(ra) # 5236 <RF_BT_DoneHandler>
2000147c:	40b2                	lw	ra,12(sp)
2000147e:	4422                	lw	s0,8(sp)
20001480:	4492                	lw	s1,4(sp)
20001482:	0141                	addi	sp,sp,16
20001484:	8082                	ret
20001486:	4481                	li	s1,0
20001488:	c002                	sw	zero,0(sp)
2000148a:	b7d9                	j	20001450 <RF_BT_IRQHandler_RAM+0x76>

2000148c <bt_fast_chk_sleep>:
2000148c:	200017b7          	lui	a5,0x20001
20001490:	bcc7a783          	lw	a5,-1076(a5) # 20000bcc <ll_sch_mgr_ptr>
20001494:	0007d783          	lhu	a5,0(a5)
20001498:	4501                	li	a0,0
2000149a:	eb8d                	bnez	a5,200014cc <bt_fast_chk_sleep+0x40>
2000149c:	200017b7          	lui	a5,0x20001
200014a0:	bc87a783          	lw	a5,-1080(a5) # 20000bc8 <bt_tmr_hdl>
200014a4:	439c                	lw	a5,0(a5)
200014a6:	4505                	li	a0,1
200014a8:	c395                	beqz	a5,200014cc <bt_fast_chk_sleep+0x40>
200014aa:	420007b7          	lui	a5,0x42000
200014ae:	1147a503          	lw	a0,276(a5) # 42000114 <__StackTop+0x21ffc114>
200014b2:	1047a703          	lw	a4,260(a5)
200014b6:	77d1                	lui	a5,0xffff4
200014b8:	cb078793          	addi	a5,a5,-848 # ffff3cb0 <__StackTop+0xdffefcb0>
200014bc:	953e                	add	a0,a0,a5
200014be:	8d19                	sub	a0,a0,a4
200014c0:	7fff47b7          	lui	a5,0x7fff4
200014c4:	cb078793          	addi	a5,a5,-848 # 7fff3cb0 <__StackTop+0x5ffefcb0>
200014c8:	00f53533          	sltu	a0,a0,a5
200014cc:	8082                	ret

200014ce <RADIO_DescInit_Freq>:
200014ce:	1151                	addi	sp,sp,-12
200014d0:	c406                	sw	ra,8(sp)
200014d2:	c222                	sw	s0,4(sp)
200014d4:	c026                	sw	s1,0(sp)
200014d6:	84aa                	mv	s1,a0
200014d8:	200017b7          	lui	a5,0x20001
200014dc:	dcc78793          	addi	a5,a5,-564 # 20000dcc <rf_common_desc_rx_setfreq>
200014e0:	06f50b63          	beq	a0,a5,20001556 <RADIO_DescInit_Freq+0x88>
200014e4:	200007b7          	lui	a5,0x20000
200014e8:	4207c703          	lbu	a4,1056(a5) # 20000420 <rf_bt_mgr>
200014ec:	200017b7          	lui	a5,0x20001
200014f0:	c1878793          	addi	a5,a5,-1000 # 20000c18 <ble_tx_end>
200014f4:	97ba                	add	a5,a5,a4
200014f6:	0007c783          	lbu	a5,0(a5)
200014fa:	07c2                	slli	a5,a5,0x10
200014fc:	6695                	lui	a3,0x5
200014fe:	06a1                	addi	a3,a3,8 # 5008 <ll_scan_sched+0x10>
20001500:	8fd5                	or	a5,a5,a3
20001502:	200006b7          	lui	a3,0x20000
20001506:	48f6ae23          	sw	a5,1180(a3) # 2000049c <rf_common_desc_tx_end_delay+0x4>
2000150a:	747d                	lui	s0,0xfffff
2000150c:	69e40413          	addi	s0,s0,1694 # fffff69e <__StackTop+0xdfffb69e>
20001510:	942e                	add	s0,s0,a1
20001512:	8405                	srai	s0,s0,0x1
20001514:	0ff47413          	zext.b	s0,s0
20001518:	85ba                	mv	a1,a4
2000151a:	4789                	li	a5,2
2000151c:	00e7f363          	bgeu	a5,a4,20001522 <RADIO_DescInit_Freq+0x54>
20001520:	4589                	li	a1,2
20001522:	0ff5f593          	zext.b	a1,a1
20001526:	8522                	mv	a0,s0
20001528:	2935                	jal	20001964 <RF_OnChip_Cfg_KVCO_Cal_val>
2000152a:	4501                	li	a0,0
2000152c:	4601                	li	a2,0
2000152e:	4681                	li	a3,0
20001530:	20001737          	lui	a4,0x20001
20001534:	00241593          	slli	a1,s0,0x2
20001538:	c2070413          	addi	s0,a4,-992 # 20000c20 <freq_cfg_val>
2000153c:	942e                	add	s0,s0,a1
2000153e:	401c                	lw	a5,0(s0)
20001540:	8f95                	sub	a5,a5,a3
20001542:	00a7d7b3          	srl	a5,a5,a0
20001546:	8fd1                	or	a5,a5,a2
20001548:	c09c                	sw	a5,0(s1)
2000154a:	8526                	mv	a0,s1
2000154c:	40a2                	lw	ra,8(sp)
2000154e:	4412                	lw	s0,4(sp)
20001550:	4482                	lw	s1,0(sp)
20001552:	0131                	addi	sp,sp,12
20001554:	8082                	ret
20001556:	200037b7          	lui	a5,0x20003
2000155a:	bdd7c783          	lbu	a5,-1059(a5) # 20002bdd <is_high_perf>
2000155e:	0ff7f793          	zext.b	a5,a5
20001562:	c38d                	beqz	a5,20001584 <RADIO_DescInit_Freq+0xb6>
20001564:	420026b7          	lui	a3,0x42002
20001568:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
2000156c:	ffd00737          	lui	a4,0xffd00
20001570:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
20001574:	8ff9                	and	a5,a5,a4
20001576:	00100737          	lui	a4,0x100
2000157a:	10070713          	addi	a4,a4,256 # 100100 <__FLASH_SIZE+0xc0100>
2000157e:	8fd9                	or	a5,a5,a4
20001580:	0cf6a623          	sw	a5,204(a3)
20001584:	0015f793          	andi	a5,a1,1
20001588:	cba5                	beqz	a5,200015f8 <RADIO_DescInit_Freq+0x12a>
2000158a:	200037b7          	lui	a5,0x20003
2000158e:	b587d703          	lhu	a4,-1192(a5) # 20002b58 <ll_gap_time_1m>
20001592:	200007b7          	lui	a5,0x20000
20001596:	4ae79b23          	sh	a4,1206(a5) # 200004b6 <ll_gap_time>
2000159a:	747d                	lui	s0,0xfffff
2000159c:	69f40413          	addi	s0,s0,1695 # fffff69f <__StackTop+0xdfffb69f>
200015a0:	942e                	add	s0,s0,a1
200015a2:	8405                	srai	s0,s0,0x1
200015a4:	0ff47413          	zext.b	s0,s0
200015a8:	42002737          	lui	a4,0x42002
200015ac:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
200015b0:	f7f7f793          	andi	a5,a5,-129
200015b4:	0cf72023          	sw	a5,192(a4)
200015b8:	200037b7          	lui	a5,0x20003
200015bc:	bdd7c783          	lbu	a5,-1059(a5) # 20002bdd <is_high_perf>
200015c0:	0ff7f793          	zext.b	a5,a5
200015c4:	e38d                	bnez	a5,200015e6 <RADIO_DescInit_Freq+0x118>
200015c6:	420026b7          	lui	a3,0x42002
200015ca:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
200015ce:	ffd00737          	lui	a4,0xffd00
200015d2:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
200015d6:	8ff9                	and	a5,a5,a4
200015d8:	00100737          	lui	a4,0x100
200015dc:	10070713          	addi	a4,a4,256 # 100100 <__FLASH_SIZE+0xc0100>
200015e0:	8fd9                	or	a5,a5,a4
200015e2:	0cf6a623          	sw	a5,204(a3)
200015e6:	4501                	li	a0,0
200015e8:	2ee9                	jal	200019c2 <RF_OnChip_DCOC_Cal_Bw_Cfg>
200015ea:	4505                	li	a0,1
200015ec:	80000637          	lui	a2,0x80000
200015f0:	67d5                	lui	a5,0x15
200015f2:	55578693          	addi	a3,a5,1365 # 15555 <memset+0x8b89>
200015f6:	bf2d                	j	20001530 <RADIO_DescInit_Freq+0x62>
200015f8:	200037b7          	lui	a5,0x20003
200015fc:	b587d783          	lhu	a5,-1192(a5) # 20002b58 <ll_gap_time_1m>
20001600:	0799                	addi	a5,a5,6
20001602:	20000737          	lui	a4,0x20000
20001606:	4af71b23          	sh	a5,1206(a4) # 200004b6 <ll_gap_time>
2000160a:	747d                	lui	s0,0xfffff
2000160c:	6a040413          	addi	s0,s0,1696 # fffff6a0 <__StackTop+0xdfffb6a0>
20001610:	942e                	add	s0,s0,a1
20001612:	8405                	srai	s0,s0,0x1
20001614:	0ff47413          	zext.b	s0,s0
20001618:	42002737          	lui	a4,0x42002
2000161c:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
20001620:	0807e793          	ori	a5,a5,128
20001624:	0cf72023          	sw	a5,192(a4)
20001628:	200037b7          	lui	a5,0x20003
2000162c:	bdd7c783          	lbu	a5,-1059(a5) # 20002bdd <is_high_perf>
20001630:	0ff7f793          	zext.b	a5,a5
20001634:	e38d                	bnez	a5,20001656 <RADIO_DescInit_Freq+0x188>
20001636:	420026b7          	lui	a3,0x42002
2000163a:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
2000163e:	ffd00737          	lui	a4,0xffd00
20001642:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
20001646:	8ff9                	and	a5,a5,a4
20001648:	00200737          	lui	a4,0x200
2000164c:	20070713          	addi	a4,a4,512 # 200200 <__FLASH_SIZE+0x1c0200>
20001650:	8fd9                	or	a5,a5,a4
20001652:	0cf6a623          	sw	a5,204(a3)
20001656:	4505                	li	a0,1
20001658:	26ad                	jal	200019c2 <RF_OnChip_DCOC_Cal_Bw_Cfg>
2000165a:	4505                	li	a0,1
2000165c:	80000637          	lui	a2,0x80000
20001660:	0002b7b7          	lui	a5,0x2b
20001664:	aab78693          	addi	a3,a5,-1365 # 2aaab <memset+0x1e0df>
20001668:	b5e1                	j	20001530 <RADIO_DescInit_Freq+0x62>

2000166a <omw_rf_set_high_perf_apply>:
2000166a:	200037b7          	lui	a5,0x20003
2000166e:	bdd7c783          	lbu	a5,-1059(a5) # 20002bdd <is_high_perf>
20001672:	0ff7f793          	zext.b	a5,a5
20001676:	c7c5                	beqz	a5,2000171e <omw_rf_set_high_perf_apply+0xb4>
20001678:	200037b7          	lui	a5,0x20003
2000167c:	bdc7c783          	lbu	a5,-1060(a5) # 20002bdc <is_add_rf_aon_adda_vc>
20001680:	ef99                	bnez	a5,2000169e <omw_rf_set_high_perf_apply+0x34>
20001682:	200037b7          	lui	a5,0x20003
20001686:	be078793          	addi	a5,a5,-1056 # 20002be0 <g_rf_cfg>
2000168a:	0057c703          	lbu	a4,5(a5)
2000168e:	0709                	addi	a4,a4,2
20001690:	00e782a3          	sb	a4,5(a5)
20001694:	200037b7          	lui	a5,0x20003
20001698:	4705                	li	a4,1
2000169a:	bce78e23          	sb	a4,-1060(a5) # 20002bdc <is_add_rf_aon_adda_vc>
2000169e:	420027b7          	lui	a5,0x42002
200016a2:	57b8                	lw	a4,104(a5)
200016a4:	9b41                	andi	a4,a4,-16
200016a6:	00476713          	ori	a4,a4,4
200016aa:	d7b8                	sw	a4,104(a5)
200016ac:	57f8                	lw	a4,108(a5)
200016ae:	9b41                	andi	a4,a4,-16
200016b0:	00776713          	ori	a4,a4,7
200016b4:	d7f8                	sw	a4,108(a5)
200016b6:	5bb8                	lw	a4,112(a5)
200016b8:	9b41                	andi	a4,a4,-16
200016ba:	00776713          	ori	a4,a4,7
200016be:	dbb8                	sw	a4,112(a5)
200016c0:	5bf8                	lw	a4,116(a5)
200016c2:	9b41                	andi	a4,a4,-16
200016c4:	00776713          	ori	a4,a4,7
200016c8:	dbf8                	sw	a4,116(a5)
200016ca:	5fb8                	lw	a4,120(a5)
200016cc:	9b41                	andi	a4,a4,-16
200016ce:	00776713          	ori	a4,a4,7
200016d2:	dfb8                	sw	a4,120(a5)
200016d4:	5ff0                	lw	a2,124(a5)
200016d6:	76fd                	lui	a3,0xfffff
200016d8:	0ff68693          	addi	a3,a3,255 # fffff0ff <__StackTop+0xdfffb0ff>
200016dc:	8e75                	and	a2,a2,a3
200016de:	6705                	lui	a4,0x1
200016e0:	80070713          	addi	a4,a4,-2048 # 800 <__STACK_SIZE+0x400>
200016e4:	8e59                	or	a2,a2,a4
200016e6:	dff0                	sw	a2,124(a5)
200016e8:	0807a603          	lw	a2,128(a5) # 42002080 <__StackTop+0x21ffe080>
200016ec:	8e75                	and	a2,a2,a3
200016ee:	8e59                	or	a2,a2,a4
200016f0:	08c7a023          	sw	a2,128(a5)
200016f4:	0847a603          	lw	a2,132(a5)
200016f8:	8e75                	and	a2,a2,a3
200016fa:	8e59                	or	a2,a2,a4
200016fc:	08c7a223          	sw	a2,132(a5)
20001700:	0887a603          	lw	a2,136(a5)
20001704:	8ef1                	and	a3,a3,a2
20001706:	8f55                	or	a4,a4,a3
20001708:	08e7a423          	sw	a4,136(a5)
2000170c:	0c87a703          	lw	a4,200(a5)
20001710:	8ff77713          	andi	a4,a4,-1793
20001714:	20076713          	ori	a4,a4,512
20001718:	0ce7a423          	sw	a4,200(a5)
2000171c:	8082                	ret
2000171e:	420027b7          	lui	a5,0x42002
20001722:	57b8                	lw	a4,104(a5)
20001724:	9b41                	andi	a4,a4,-16
20001726:	00476713          	ori	a4,a4,4
2000172a:	d7b8                	sw	a4,104(a5)
2000172c:	57f8                	lw	a4,108(a5)
2000172e:	9b41                	andi	a4,a4,-16
20001730:	00776713          	ori	a4,a4,7
20001734:	d7f8                	sw	a4,108(a5)
20001736:	5bb8                	lw	a4,112(a5)
20001738:	9b41                	andi	a4,a4,-16
2000173a:	00776713          	ori	a4,a4,7
2000173e:	dbb8                	sw	a4,112(a5)
20001740:	5bf8                	lw	a4,116(a5)
20001742:	9b41                	andi	a4,a4,-16
20001744:	00776713          	ori	a4,a4,7
20001748:	dbf8                	sw	a4,116(a5)
2000174a:	5fb8                	lw	a4,120(a5)
2000174c:	9b41                	andi	a4,a4,-16
2000174e:	00776713          	ori	a4,a4,7
20001752:	dfb8                	sw	a4,120(a5)
20001754:	5ff4                	lw	a3,124(a5)
20001756:	777d                	lui	a4,0xfffff
20001758:	0ff70713          	addi	a4,a4,255 # fffff0ff <__StackTop+0xdfffb0ff>
2000175c:	8ef9                	and	a3,a3,a4
2000175e:	2006e693          	ori	a3,a3,512
20001762:	dff4                	sw	a3,124(a5)
20001764:	0807a683          	lw	a3,128(a5) # 42002080 <__StackTop+0x21ffe080>
20001768:	8ef9                	and	a3,a3,a4
2000176a:	2006e693          	ori	a3,a3,512
2000176e:	08d7a023          	sw	a3,128(a5)
20001772:	0847a683          	lw	a3,132(a5)
20001776:	8ef9                	and	a3,a3,a4
20001778:	2006e693          	ori	a3,a3,512
2000177c:	08d7a223          	sw	a3,132(a5)
20001780:	0887a683          	lw	a3,136(a5)
20001784:	8f75                	and	a4,a4,a3
20001786:	20076713          	ori	a4,a4,512
2000178a:	08e7a423          	sw	a4,136(a5)
2000178e:	0c87a703          	lw	a4,200(a5)
20001792:	8ff77713          	andi	a4,a4,-1793
20001796:	20076713          	ori	a4,a4,512
2000179a:	0ce7a423          	sw	a4,200(a5)
2000179e:	8082                	ret

200017a0 <_rf_kvco_read_y>:
200017a0:	1151                	addi	sp,sp,-12
200017a2:	c406                	sw	ra,8(sp)
200017a4:	c222                	sw	s0,4(sp)
200017a6:	42002437          	lui	s0,0x42002
200017aa:	0cc42783          	lw	a5,204(s0) # 420020cc <__StackTop+0x21ffe0cc>
200017ae:	10000737          	lui	a4,0x10000
200017b2:	8fd9                	or	a5,a5,a4
200017b4:	0cf42623          	sw	a5,204(s0)
200017b8:	0cc42783          	lw	a5,204(s0)
200017bc:	f0000737          	lui	a4,0xf0000
200017c0:	177d                	addi	a4,a4,-1 # efffffff <__StackTop+0xcfffbfff>
200017c2:	8ff9                	and	a5,a5,a4
200017c4:	0cf42623          	sw	a5,204(s0)
200017c8:	4785                	li	a5,1
200017ca:	cc1c                	sw	a5,24(s0)
200017cc:	4795                	li	a5,5
200017ce:	cc1c                	sw	a5,24(s0)
200017d0:	47e1                	li	a5,24
200017d2:	02f55533          	divu	a0,a0,a5
200017d6:	0515                	addi	a0,a0,5
200017d8:	0542                	slli	a0,a0,0x10
200017da:	8141                	srli	a0,a0,0x10
200017dc:	e000b097          	auipc	ra,0xe000b
200017e0:	0fa080e7          	jalr	250(ra) # c8d6 <delay_us>
200017e4:	0f042503          	lw	a0,240(s0)
200017e8:	052e                	slli	a0,a0,0xb
200017ea:	812d                	srli	a0,a0,0xb
200017ec:	40a2                	lw	ra,8(sp)
200017ee:	4412                	lw	s0,4(sp)
200017f0:	0131                	addi	sp,sp,12
200017f2:	8082                	ret

200017f4 <trigger_gpadc_temp_sampling>:
200017f4:	1151                	addi	sp,sp,-12
200017f6:	c406                	sw	ra,8(sp)
200017f8:	c222                	sw	s0,4(sp)
200017fa:	420027b7          	lui	a5,0x42002
200017fe:	43d8                	lw	a4,4(a5)
20001800:	00176713          	ori	a4,a4,1
20001804:	c3d8                	sw	a4,4(a5)
20001806:	40040437          	lui	s0,0x40040
2000180a:	4709                	li	a4,2
2000180c:	c018                	sw	a4,0(s0)
2000180e:	0e87a703          	lw	a4,232(a5) # 420020e8 <__StackTop+0x21ffe0e8>
20001812:	00176713          	ori	a4,a4,1
20001816:	0ee7a423          	sw	a4,232(a5)
2000181a:	08800793          	li	a5,136
2000181e:	c05c                	sw	a5,4(s0)
20001820:	6791                	lui	a5,0x4
20001822:	0789                	addi	a5,a5,2 # 4002 <ll_conn_update+0x96>
20001824:	d03c                	sw	a5,96(s0)
20001826:	30f00793          	li	a5,783
2000182a:	d83c                	sw	a5,112(s0)
2000182c:	4511                	li	a0,4
2000182e:	e000b097          	auipc	ra,0xe000b
20001832:	0a8080e7          	jalr	168(ra) # c8d6 <delay_us>
20001836:	800047b7          	lui	a5,0x80004
2000183a:	0789                	addi	a5,a5,2 # 80004002 <__StackTop+0x60000002>
2000183c:	d03c                	sw	a5,96(s0)
2000183e:	40a2                	lw	ra,8(sp)
20001840:	4412                	lw	s0,4(sp)
20001842:	0131                	addi	sp,sp,12
20001844:	8082                	ret

20001846 <start_await_dma>:
20001846:	420007b7          	lui	a5,0x42000
2000184a:	06078023          	sb	zero,96(a5) # 42000060 <__StackTop+0x21ffc060>
2000184e:	c7c8                	sw	a0,12(a5)
20001850:	4705                	li	a4,1
20001852:	c398                	sw	a4,0(a5)
20001854:	42000737          	lui	a4,0x42000
20001858:	06474783          	lbu	a5,100(a4) # 42000064 <__StackTop+0x21ffc064>
2000185c:	0ff7f793          	zext.b	a5,a5
20001860:	dfe5                	beqz	a5,20001858 <start_await_dma+0x12>
20001862:	420007b7          	lui	a5,0x42000
20001866:	4705                	li	a4,1
20001868:	06e78223          	sb	a4,100(a5) # 42000064 <__StackTop+0x21ffc064>
2000186c:	06e78023          	sb	a4,96(a5)
20001870:	8082                	ret

20001872 <calc_hp_offset_at_curr_temp>:
20001872:	200037b7          	lui	a5,0x20003
20001876:	bc47a783          	lw	a5,-1084(a5) # 20002bc4 <aon_tick.0>
2000187a:	cb99                	beqz	a5,20001890 <calc_hp_offset_at_curr_temp+0x1e>
2000187c:	40000737          	lui	a4,0x40000
20001880:	0b072703          	lw	a4,176(a4) # 400000b0 <__StackTop+0x1fffc0b0>
20001884:	8f1d                	sub	a4,a4,a5
20001886:	000287b7          	lui	a5,0x28
2000188a:	17ed                	addi	a5,a5,-5 # 27ffb <memset+0x1b62f>
2000188c:	0ce7fb63          	bgeu	a5,a4,20001962 <calc_hp_offset_at_curr_temp+0xf0>
20001890:	1101                	addi	sp,sp,-32
20001892:	ce06                	sw	ra,28(sp)
20001894:	cc22                	sw	s0,24(sp)
20001896:	ca26                	sw	s1,20(sp)
20001898:	400807b7          	lui	a5,0x40080
2000189c:	47d4                	lw	a3,12(a5)
2000189e:	40040437          	lui	s0,0x40040
200018a2:	4018                	lw	a4,0(s0)
200018a4:	c03a                	sw	a4,0(sp)
200018a6:	4050                	lw	a2,4(s0)
200018a8:	c232                	sw	a2,4(sp)
200018aa:	502c                	lw	a1,96(s0)
200018ac:	c42e                	sw	a1,8(sp)
200018ae:	47d8                	lw	a4,12(a5)
200018b0:	00876713          	ori	a4,a4,8
200018b4:	c7d8                	sw	a4,12(a5)
200018b6:	5828                	lw	a0,112(s0)
200018b8:	c62a                	sw	a0,12(sp)
200018ba:	40000637          	lui	a2,0x40000
200018be:	560c                	lw	a1,40(a2)
200018c0:	5838                	lw	a4,112(s0)
200018c2:	00176713          	ori	a4,a4,1
200018c6:	d838                	sw	a4,112(s0)
200018c8:	420024b7          	lui	s1,0x42002
200018cc:	3ff00713          	li	a4,1023
200018d0:	c0d8                	sw	a4,4(s1)
200018d2:	6721                	lui	a4,0x8
200018d4:	c82e                	sw	a1,16(sp)
200018d6:	8f4d                	or	a4,a4,a1
200018d8:	d618                	sw	a4,40(a2)
200018da:	c7d4                	sw	a3,12(a5)
200018dc:	3f21                	jal	200017f4 <trigger_gpadc_temp_sampling>
200018de:	4521                	li	a0,8
200018e0:	e000b097          	auipc	ra,0xe000b
200018e4:	ff6080e7          	jalr	-10(ra) # c8d6 <delay_us>
200018e8:	547c                	lw	a5,108(s0)
200018ea:	20003737          	lui	a4,0x20003
200018ee:	be874703          	lbu	a4,-1048(a4) # 20002be8 <g_rf_cfg+0x8>
200018f2:	8f99                	sub	a5,a5,a4
200018f4:	0791                	addi	a5,a5,4 # 40080004 <__StackTop+0x2007c004>
200018f6:	4037d713          	srai	a4,a5,0x3
200018fa:	200027b7          	lui	a5,0x20002
200018fe:	2c07a783          	lw	a5,704(a5) # 200022c0 <g_otp_cfg+0x2c>
20001902:	83bd                	srli	a5,a5,0xf
20001904:	8bfd                	andi	a5,a5,31
20001906:	02e787b3          	mul	a5,a5,a4
2000190a:	0795                	addi	a5,a5,5
2000190c:	4729                	li	a4,10
2000190e:	02e7c7b3          	div	a5,a5,a4
20001912:	20003737          	lui	a4,0x20003
20001916:	bcf72c23          	sw	a5,-1064(a4) # 20002bd8 <g_hp_offset>
2000191a:	400006b7          	lui	a3,0x40000
2000191e:	0b06a703          	lw	a4,176(a3) # 400000b0 <__StackTop+0x1fffc0b0>
20001922:	200037b7          	lui	a5,0x20003
20001926:	bce7a223          	sw	a4,-1084(a5) # 20002bc4 <aon_tick.0>
2000192a:	0e84a783          	lw	a5,232(s1) # 420020e8 <__StackTop+0x21ffe0e8>
2000192e:	9bf9                	andi	a5,a5,-2
20001930:	0ef4a423          	sw	a5,232(s1)
20001934:	06042023          	sw	zero,96(s0) # 40040060 <__StackTop+0x2003c060>
20001938:	06042823          	sw	zero,112(s0)
2000193c:	40dc                	lw	a5,4(s1)
2000193e:	9bf9                	andi	a5,a5,-2
20001940:	c0dc                	sw	a5,4(s1)
20001942:	4702                	lw	a4,0(sp)
20001944:	c018                	sw	a4,0(s0)
20001946:	4612                	lw	a2,4(sp)
20001948:	c050                	sw	a2,4(s0)
2000194a:	47a2                	lw	a5,8(sp)
2000194c:	d03c                	sw	a5,96(s0)
2000194e:	4532                	lw	a0,12(sp)
20001950:	d828                	sw	a0,112(s0)
20001952:	45c2                	lw	a1,16(sp)
20001954:	d68c                	sw	a1,40(a3)
20001956:	547c                	lw	a5,108(s0)
20001958:	40f2                	lw	ra,28(sp)
2000195a:	4462                	lw	s0,24(sp)
2000195c:	44d2                	lw	s1,20(sp)
2000195e:	6105                	addi	sp,sp,32
20001960:	8082                	ret
20001962:	8082                	ret

20001964 <RF_OnChip_Cfg_KVCO_Cal_val>:
20001964:	47b5                	li	a5,13
20001966:	4701                	li	a4,0
20001968:	00a7f663          	bgeu	a5,a0,20001974 <RF_OnChip_Cfg_KVCO_Cal_val+0x10>
2000196c:	4769                	li	a4,26
2000196e:	00a73733          	sltu	a4,a4,a0
20001972:	0705                	addi	a4,a4,1
20001974:	420016b7          	lui	a3,0x42001
20001978:	5290                	lw	a2,32(a3)
2000197a:	77c1                	lui	a5,0xffff0
2000197c:	8e7d                	and	a2,a2,a5
2000197e:	00171793          	slli	a5,a4,0x1
20001982:	97ba                	add	a5,a5,a4
20001984:	20003737          	lui	a4,0x20003
20001988:	bcc70713          	addi	a4,a4,-1076 # 20002bcc <g_hp>
2000198c:	973e                	add	a4,a4,a5
2000198e:	972e                	add	a4,a4,a1
20001990:	00074783          	lbu	a5,0(a4)
20001994:	20003737          	lui	a4,0x20003
20001998:	bd872703          	lw	a4,-1064(a4) # 20002bd8 <g_hp_offset>
2000199c:	97ba                	add	a5,a5,a4
2000199e:	20001737          	lui	a4,0x20001
200019a2:	cc070713          	addi	a4,a4,-832 # 20000cc0 <g_lp>
200019a6:	972e                	add	a4,a4,a1
200019a8:	00074703          	lbu	a4,0(a4)
200019ac:	0722                	slli	a4,a4,0x8
200019ae:	8fd9                	or	a5,a5,a4
200019b0:	8fd1                	or	a5,a5,a2
200019b2:	d29c                	sw	a5,32(a3)
200019b4:	8082                	ret

200019b6 <RF_OnChip_Corner_Cal_Cfg>:
200019b6:	1151                	addi	sp,sp,-12
200019b8:	c406                	sw	ra,8(sp)
200019ba:	2c9d                	jal	20001c30 <omw_rf_cal_apply_core>
200019bc:	40a2                	lw	ra,8(sp)
200019be:	0131                	addi	sp,sp,12
200019c0:	8082                	ret

200019c2 <RF_OnChip_DCOC_Cal_Bw_Cfg>:
200019c2:	200037b7          	lui	a5,0x20003
200019c6:	bc87c783          	lbu	a5,-1080(a5) # 20002bc8 <cur_bw>
200019ca:	00a78663          	beq	a5,a0,200019d6 <RF_OnChip_DCOC_Cal_Bw_Cfg+0x14>
200019ce:	200037b7          	lui	a5,0x20003
200019d2:	bca78423          	sb	a0,-1080(a5) # 20002bc8 <cur_bw>
200019d6:	8082                	ret

200019d8 <RF_OnChip_DCOC_Cal_Cfg>:
200019d8:	200037b7          	lui	a5,0x20003
200019dc:	577d                	li	a4,-1
200019de:	bce78423          	sb	a4,-1080(a5) # 20002bc8 <cur_bw>
200019e2:	20003637          	lui	a2,0x20003
200019e6:	be060613          	addi	a2,a2,-1056 # 20002be0 <g_rf_cfg>
200019ea:	420026b7          	lui	a3,0x42002
200019ee:	02068693          	addi	a3,a3,32 # 42002020 <__StackTop+0x21ffe020>
200019f2:	4701                	li	a4,0
200019f4:	45a5                	li	a1,9
200019f6:	00e65783          	lhu	a5,14(a2)
200019fa:	0792                	slli	a5,a5,0x4
200019fc:	97ba                	add	a5,a5,a4
200019fe:	c29c                	sw	a5,0(a3)
20001a00:	0705                	addi	a4,a4,1
20001a02:	0609                	addi	a2,a2,2
20001a04:	0691                	addi	a3,a3,4
20001a06:	feb718e3          	bne	a4,a1,200019f6 <RF_OnChip_DCOC_Cal_Cfg+0x1e>
20001a0a:	420026b7          	lui	a3,0x42002
20001a0e:	0c46a783          	lw	a5,196(a3) # 420020c4 <__StackTop+0x21ffe0c4>
20001a12:	f4000737          	lui	a4,0xf4000
20001a16:	177d                	addi	a4,a4,-1 # f3ffffff <__StackTop+0xd3ffbfff>
20001a18:	8f7d                	and	a4,a4,a5
20001a1a:	200037b7          	lui	a5,0x20003
20001a1e:	bec7c783          	lbu	a5,-1044(a5) # 20002bec <g_rf_cfg+0xc>
20001a22:	07ea                	slli	a5,a5,0x1a
20001a24:	8fd9                	or	a5,a5,a4
20001a26:	0cf6a223          	sw	a5,196(a3)
20001a2a:	8082                	ret

20001a2c <RF_OnChip_RC_Cal_Cfg>:
20001a2c:	8082                	ret

20001a2e <RF_OnChip_KVCO_Cal_Cfg>:
20001a2e:	8082                	ret

20001a30 <RF_OnChip_Base_Init>:
20001a30:	1151                	addi	sp,sp,-12
20001a32:	c406                	sw	ra,8(sp)
20001a34:	c222                	sw	s0,4(sp)
20001a36:	c026                	sw	s1,0(sp)
20001a38:	42002437          	lui	s0,0x42002
20001a3c:	441c                	lw	a5,8(s0)
20001a3e:	fc07f793          	andi	a5,a5,-64
20001a42:	c41c                	sw	a5,8(s0)
20001a44:	479d                	li	a5,7
20001a46:	c85c                	sw	a5,20(s0)
20001a48:	4c5c                	lw	a5,28(s0)
20001a4a:	7771                	lui	a4,0xffffc
20001a4c:	0741                	addi	a4,a4,16 # ffffc010 <__StackTop+0xdfff8010>
20001a4e:	8ff9                	and	a5,a5,a4
20001a50:	6711                	lui	a4,0x4
20001a52:	ce870713          	addi	a4,a4,-792 # 3ce8 <ll_reject_ind_send+0x8e>
20001a56:	8fd9                	or	a5,a5,a4
20001a58:	cc5c                	sw	a5,28(s0)
20001a5a:	420014b7          	lui	s1,0x42001
20001a5e:	509c                	lw	a5,32(s1)
20001a60:	ff010737          	lui	a4,0xff010
20001a64:	177d                	addi	a4,a4,-1 # ff00ffff <__StackTop+0xdf00bfff>
20001a66:	8ff9                	and	a5,a5,a4
20001a68:	00140737          	lui	a4,0x140
20001a6c:	8fd9                	or	a5,a5,a4
20001a6e:	d09c                	sw	a5,32(s1)
20001a70:	47b1                	li	a5,12
20001a72:	14f4a823          	sw	a5,336(s1) # 42001150 <__StackTop+0x21ffd150>
20001a76:	405c                	lw	a5,4(s0)
20001a78:	2007e793          	ori	a5,a5,512
20001a7c:	c05c                	sw	a5,4(s0)
20001a7e:	400007b7          	lui	a5,0x40000
20001a82:	470d                	li	a4,3
20001a84:	30e7a023          	sw	a4,768(a5) # 40000300 <__StackTop+0x1fffc300>
20001a88:	405c                	lw	a5,4(s0)
20001a8a:	0e07e793          	ori	a5,a5,224
20001a8e:	c05c                	sw	a5,4(s0)
20001a90:	481c                	lw	a5,16(s0)
20001a92:	0ab7e793          	ori	a5,a5,171
20001a96:	c81c                	sw	a5,16(s0)
20001a98:	0e042783          	lw	a5,224(s0) # 420020e0 <__StackTop+0x21ffe0e0>
20001a9c:	e3f7f793          	andi	a5,a5,-449
20001aa0:	0c07e793          	ori	a5,a5,192
20001aa4:	0ef42023          	sw	a5,224(s0)
20001aa8:	0e442783          	lw	a5,228(s0)
20001aac:	e1f7f793          	andi	a5,a5,-481
20001ab0:	1607e793          	ori	a5,a5,352
20001ab4:	0ef42223          	sw	a5,228(s0)
20001ab8:	0d442783          	lw	a5,212(s0)
20001abc:	6705                	lui	a4,0x1
20001abe:	80070713          	addi	a4,a4,-2048 # 800 <__STACK_SIZE+0x400>
20001ac2:	8fd9                	or	a5,a5,a4
20001ac4:	0cf42a23          	sw	a5,212(s0)
20001ac8:	364d                	jal	2000166a <omw_rf_set_high_perf_apply>
20001aca:	0ac42783          	lw	a5,172(s0)
20001ace:	eff7f793          	andi	a5,a5,-257
20001ad2:	0af42623          	sw	a5,172(s0)
20001ad6:	200017b7          	lui	a5,0x20001
20001ada:	f047c783          	lbu	a5,-252(a5) # 20000f04 <rf_wb_sat_th>
20001ade:	10f4ac23          	sw	a5,280(s1)
20001ae2:	6711                	lui	a4,0x4
20001ae4:	fff70793          	addi	a5,a4,-1 # 3fff <ll_conn_update+0x93>
20001ae8:	12f4a823          	sw	a5,304(s1)
20001aec:	40a2                	lw	ra,8(sp)
20001aee:	4412                	lw	s0,4(sp)
20001af0:	4482                	lw	s1,0(sp)
20001af2:	0131                	addi	sp,sp,12
20001af4:	8082                	ret

20001af6 <RF_OnChip_Cali_Cfg>:
20001af6:	1151                	addi	sp,sp,-12
20001af8:	c406                	sw	ra,8(sp)
20001afa:	3d75                	jal	200019b6 <RF_OnChip_Corner_Cal_Cfg>
20001afc:	3df1                	jal	200019d8 <RF_OnChip_DCOC_Cal_Cfg>
20001afe:	40a2                	lw	ra,8(sp)
20001b00:	0131                	addi	sp,sp,12
20001b02:	8082                	ret

20001b04 <dynamic_agc_info_get2>:
20001b04:	200017b7          	lui	a5,0x20001
20001b08:	c1c7c783          	lbu	a5,-996(a5) # 20000c1c <dynamic_agc_ctrl_status>
20001b0c:	cb9d                	beqz	a5,20001b42 <dynamic_agc_info_get2+0x3e>
20001b0e:	0a050a63          	beqz	a0,20001bc2 <dynamic_agc_info_get2+0xbe>
20001b12:	42001737          	lui	a4,0x42001
20001b16:	10072703          	lw	a4,256(a4) # 42001100 <__StackTop+0x21ffd100>
20001b1a:	8b05                	andi	a4,a4,1
20001b1c:	e305                	bnez	a4,20001b3c <dynamic_agc_info_get2+0x38>
20001b1e:	420017b7          	lui	a5,0x42001
20001b22:	1ec7a703          	lw	a4,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001b26:	1007a683          	lw	a3,256(a5)
20001b2a:	0016e693          	ori	a3,a3,1
20001b2e:	10d7a023          	sw	a3,256(a5)
20001b32:	0ff77713          	zext.b	a4,a4
20001b36:	10e7a223          	sw	a4,260(a5)
20001b3a:	8082                	ret
20001b3c:	4705                	li	a4,1
20001b3e:	00e78363          	beq	a5,a4,20001b44 <dynamic_agc_info_get2+0x40>
20001b42:	8082                	ret
20001b44:	420017b7          	lui	a5,0x42001
20001b48:	1e07a683          	lw	a3,480(a5) # 420011e0 <__StackTop+0x21ffd1e0>
20001b4c:	0ff6f713          	zext.b	a4,a3
20001b50:	1e47a783          	lw	a5,484(a5)
20001b54:	0ff7f593          	zext.b	a1,a5
20001b58:	07f6f613          	andi	a2,a3,127
20001b5c:	0407f793          	andi	a5,a5,64
20001b60:	c3cd                	beqz	a5,20001c02 <dynamic_agc_info_get2+0xfe>
20001b62:	04077713          	andi	a4,a4,64
20001b66:	e319                	bnez	a4,20001b6c <dynamic_agc_info_get2+0x68>
20001b68:	07f00613          	li	a2,127
20001b6c:	420017b7          	lui	a5,0x42001
20001b70:	1ec7a683          	lw	a3,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001b74:	0ff6f693          	zext.b	a3,a3
20001b78:	0046d793          	srli	a5,a3,0x4
20001b7c:	00f6f713          	andi	a4,a3,15
20001b80:	07600513          	li	a0,118
20001b84:	08b56b63          	bltu	a0,a1,20001c1a <dynamic_agc_info_get2+0x116>
20001b88:	06b00513          	li	a0,107
20001b8c:	00b56c63          	bltu	a0,a1,20001ba4 <dynamic_agc_info_get2+0xa0>
20001b90:	8aa1                	andi	a3,a3,8
20001b92:	ea89                	bnez	a3,20001ba4 <dynamic_agc_info_get2+0xa0>
20001b94:	0705                	addi	a4,a4,1
20001b96:	0ff77713          	zext.b	a4,a4
20001b9a:	cbb9                	beqz	a5,20001bf0 <dynamic_agc_info_get2+0xec>
20001b9c:	17fd                	addi	a5,a5,-1
20001b9e:	0ff7f793          	zext.b	a5,a5
20001ba2:	a0b9                	j	20001bf0 <dynamic_agc_info_get2+0xec>
20001ba4:	07600693          	li	a3,118
20001ba8:	02c6ef63          	bltu	a3,a2,20001be6 <dynamic_agc_info_get2+0xe2>
20001bac:	06b00693          	li	a3,107
20001bb0:	04c6e063          	bltu	a3,a2,20001bf0 <dynamic_agc_info_get2+0xec>
20001bb4:	469d                	li	a3,7
20001bb6:	02f6ed63          	bltu	a3,a5,20001bf0 <dynamic_agc_info_get2+0xec>
20001bba:	0785                	addi	a5,a5,1
20001bbc:	0ff7f793          	zext.b	a5,a5
20001bc0:	a805                	j	20001bf0 <dynamic_agc_info_get2+0xec>
20001bc2:	42001737          	lui	a4,0x42001
20001bc6:	10072783          	lw	a5,256(a4) # 42001100 <__StackTop+0x21ffd100>
20001bca:	9bf9                	andi	a5,a5,-2
20001bcc:	10f72023          	sw	a5,256(a4)
20001bd0:	8082                	ret
20001bd2:	420017b7          	lui	a5,0x42001
20001bd6:	1ec7a703          	lw	a4,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001bda:	0ff77713          	zext.b	a4,a4
20001bde:	00475793          	srli	a5,a4,0x4
20001be2:	8b3d                	andi	a4,a4,15
20001be4:	ef05                	bnez	a4,20001c1c <dynamic_agc_info_get2+0x118>
20001be6:	00078563          	beqz	a5,20001bf0 <dynamic_agc_info_get2+0xec>
20001bea:	17fd                	addi	a5,a5,-1
20001bec:	0ff7f793          	zext.b	a5,a5
20001bf0:	0792                	slli	a5,a5,0x4
20001bf2:	973e                	add	a4,a4,a5
20001bf4:	0ff77713          	zext.b	a4,a4
20001bf8:	420017b7          	lui	a5,0x42001
20001bfc:	10e7a223          	sw	a4,260(a5) # 42001104 <__StackTop+0x21ffd104>
20001c00:	8082                	ret
20001c02:	04077713          	andi	a4,a4,64
20001c06:	d771                	beqz	a4,20001bd2 <dynamic_agc_info_get2+0xce>
20001c08:	420017b7          	lui	a5,0x42001
20001c0c:	1ec7a703          	lw	a4,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001c10:	0ff77713          	zext.b	a4,a4
20001c14:	00475793          	srli	a5,a4,0x4
20001c18:	8b3d                	andi	a4,a4,15
20001c1a:	d749                	beqz	a4,20001ba4 <dynamic_agc_info_get2+0xa0>
20001c1c:	177d                	addi	a4,a4,-1
20001c1e:	0ff77713          	zext.b	a4,a4
20001c22:	469d                	li	a3,7
20001c24:	fcf6e6e3          	bltu	a3,a5,20001bf0 <dynamic_agc_info_get2+0xec>
20001c28:	0785                	addi	a5,a5,1
20001c2a:	0ff7f793          	zext.b	a5,a5
20001c2e:	b7c9                	j	20001bf0 <dynamic_agc_info_get2+0xec>

20001c30 <omw_rf_cal_apply_core>:
20001c30:	400806b7          	lui	a3,0x40080
20001c34:	1046a603          	lw	a2,260(a3) # 40080104 <__StackTop+0x2007c104>
20001c38:	20003737          	lui	a4,0x20003
20001c3c:	be070713          	addi	a4,a4,-1056 # 20002be0 <g_rf_cfg>
20001c40:	00474783          	lbu	a5,4(a4)
20001c44:	078e                	slli	a5,a5,0x3
20001c46:	00574583          	lbu	a1,5(a4)
20001c4a:	05a2                	slli	a1,a1,0x8
20001c4c:	8fcd                	or	a5,a5,a1
20001c4e:	00174583          	lbu	a1,1(a4)
20001c52:	05ba                	slli	a1,a1,0xe
20001c54:	8fcd                	or	a5,a5,a1
20001c56:	fffc05b7          	lui	a1,0xfffc0
20001c5a:	8e6d                	and	a2,a2,a1
20001c5c:	8fd1                	or	a5,a5,a2
20001c5e:	6609                	lui	a2,0x2
20001c60:	0609                	addi	a2,a2,2 # 2002 <otp_invalid_flag+0x2>
20001c62:	8fd1                	or	a5,a5,a2
20001c64:	10f6a223          	sw	a5,260(a3)
20001c68:	1106a783          	lw	a5,272(a3)
20001c6c:	87f7f613          	andi	a2,a5,-1921
20001c70:	00774783          	lbu	a5,7(a4)
20001c74:	17f9                	addi	a5,a5,-2
20001c76:	079e                	slli	a5,a5,0x7
20001c78:	8fd1                	or	a5,a5,a2
20001c7a:	10f6a823          	sw	a5,272(a3)
20001c7e:	42002637          	lui	a2,0x42002
20001c82:	460c                	lw	a1,8(a2)
20001c84:	800807b7          	lui	a5,0x80080
20001c88:	87f78793          	addi	a5,a5,-1921 # 8007f87f <__StackTop+0x6007b87f>
20001c8c:	8dfd                	and	a1,a1,a5
20001c8e:	00274683          	lbu	a3,2(a4)
20001c92:	0685                	addi	a3,a3,1
20001c94:	00374783          	lbu	a5,3(a4)
20001c98:	079e                	slli	a5,a5,0x7
20001c9a:	00074703          	lbu	a4,0(a4)
20001c9e:	076e                	slli	a4,a4,0x1b
20001ca0:	8fd9                	or	a5,a5,a4
20001ca2:	01369713          	slli	a4,a3,0x13
20001ca6:	8fd9                	or	a5,a5,a4
20001ca8:	06de                	slli	a3,a3,0x17
20001caa:	8fd5                	or	a5,a5,a3
20001cac:	8fcd                	or	a5,a5,a1
20001cae:	c61c                	sw	a5,8(a2)
20001cb0:	8082                	ret

20001cb2 <omw_svc_2g4_mdf_whiten_desc>:
20001cb2:	00359793          	slli	a5,a1,0x3
20001cb6:	953e                	add	a0,a0,a5
20001cb8:	00b67c63          	bgeu	a2,a1,20001cd0 <omw_svc_2g4_mdf_whiten_desc+0x1e>
20001cbc:	8082                	ret
20001cbe:	0407e793          	ori	a5,a5,64
20001cc2:	c15c                	sw	a5,4(a0)
20001cc4:	0521                	addi	a0,a0,8
20001cc6:	0585                	addi	a1,a1,1 # fffc0001 <__StackTop+0xdffbc001>
20001cc8:	0ff5f593          	zext.b	a1,a1
20001ccc:	feb668e3          	bltu	a2,a1,20001cbc <omw_svc_2g4_mdf_whiten_desc+0xa>
20001cd0:	415c                	lw	a5,4(a0)
20001cd2:	fbf7f793          	andi	a5,a5,-65
20001cd6:	f6e5                	bnez	a3,20001cbe <omw_svc_2g4_mdf_whiten_desc+0xc>
20001cd8:	c15c                	sw	a5,4(a0)
20001cda:	b7ed                	j	20001cc4 <omw_svc_2g4_mdf_whiten_desc+0x12>

20001cdc <omw_svc_2g4_update_rx_to>:
20001cdc:	200037b7          	lui	a5,0x20003
20001ce0:	c5478793          	addi	a5,a5,-940 # 20002c54 <rf_2g4_rx_pkt_desc>
20001ce4:	0007a023          	sw	zero,0(a5)
20001ce8:	0542                	slli	a0,a0,0x10
20001cea:	09056513          	ori	a0,a0,144
20001cee:	c3c8                	sw	a0,4(a5)
20001cf0:	8082                	ret

20001cf2 <omw_svc_2g4_set_access_word>:
20001cf2:	1131                	addi	sp,sp,-20
20001cf4:	c806                	sw	ra,16(sp)
20001cf6:	c622                	sw	s0,12(sp)
20001cf8:	c426                	sw	s1,8(sp)
20001cfa:	200037b7          	lui	a5,0x20003
20001cfe:	c0a7a623          	sw	a0,-1012(a5) # 20002c0c <rf_2g4_mgr+0x4>
20001d02:	420007b7          	lui	a5,0x42000
20001d06:	4fbc                	lw	a5,88(a5)
20001d08:	83a1                	srli	a5,a5,0x8
20001d0a:	8b85                	andi	a5,a5,1
20001d0c:	c7d1                	beqz	a5,20001d98 <omw_svc_2g4_set_access_word+0xa6>
20001d0e:	4401                	li	s0,0
20001d10:	200014b7          	lui	s1,0x20001
20001d14:	200037b7          	lui	a5,0x20003
20001d18:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20001d1c:	c23e                	sw	a5,4(sp)
20001d1e:	f5c4a783          	lw	a5,-164(s1) # 20000f5c <reversed_access>
20001d22:	97a2                	add	a5,a5,s0
20001d24:	c03e                	sw	a5,0(sp)
20001d26:	4712                	lw	a4,4(sp)
20001d28:	008707b3          	add	a5,a4,s0
20001d2c:	0047c503          	lbu	a0,4(a5)
20001d30:	f0001097          	auipc	ra,0xf0001
20001d34:	14e080e7          	jalr	334(ra) # 10002e7e <reverse8>
20001d38:	4782                	lw	a5,0(sp)
20001d3a:	00a78023          	sb	a0,0(a5)
20001d3e:	0405                	addi	s0,s0,1
20001d40:	4791                	li	a5,4
20001d42:	fcf41ee3          	bne	s0,a5,20001d1e <omw_svc_2g4_set_access_word+0x2c>
20001d46:	200017b7          	lui	a5,0x20001
20001d4a:	f5c7a783          	lw	a5,-164(a5) # 20000f5c <reversed_access>
20001d4e:	4398                	lw	a4,0(a5)
20001d50:	420007b7          	lui	a5,0x42000
20001d54:	08e7a023          	sw	a4,128(a5) # 42000080 <__StackTop+0x21ffc080>
20001d58:	200037b7          	lui	a5,0x20003
20001d5c:	c0c7c783          	lbu	a5,-1012(a5) # 20002c0c <rf_2g4_mgr+0x4>
20001d60:	8b85                	andi	a5,a5,1
20001d62:	40f007b3          	neg	a5,a5
20001d66:	fab7f793          	andi	a5,a5,-85
20001d6a:	0aa78793          	addi	a5,a5,170
20001d6e:	200036b7          	lui	a3,0x20003
20001d72:	c4468693          	addi	a3,a3,-956 # 20002c44 <rf_2g4_preamble>
20001d76:	0ff7f793          	zext.b	a5,a5
20001d7a:	00879713          	slli	a4,a5,0x8
20001d7e:	97ba                	add	a5,a5,a4
20001d80:	01079713          	slli	a4,a5,0x10
20001d84:	97ba                	add	a5,a5,a4
20001d86:	c29c                	sw	a5,0(a3)
20001d88:	c2dc                	sw	a5,4(a3)
20001d8a:	c69c                	sw	a5,8(a3)
20001d8c:	c6dc                	sw	a5,12(a3)
20001d8e:	40c2                	lw	ra,16(sp)
20001d90:	4432                	lw	s0,12(sp)
20001d92:	44a2                	lw	s1,8(sp)
20001d94:	0151                	addi	sp,sp,20
20001d96:	8082                	ret
20001d98:	420007b7          	lui	a5,0x42000
20001d9c:	08a7a023          	sw	a0,128(a5) # 42000080 <__StackTop+0x21ffc080>
20001da0:	bf65                	j	20001d58 <omw_svc_2g4_set_access_word+0x66>

20001da2 <omw_svc_24g_is_txrx_idle>:
20001da2:	420007b7          	lui	a5,0x42000
20001da6:	43c8                	lw	a0,4(a5)
20001da8:	8909                	andi	a0,a0,2
20001daa:	8082                	ret

20001dac <RF_2G4_RADIO_Handler>:
20001dac:	1131                	addi	sp,sp,-20
20001dae:	c806                	sw	ra,16(sp)
20001db0:	c622                	sw	s0,12(sp)
20001db2:	c426                	sw	s1,8(sp)
20001db4:	420007b7          	lui	a5,0x42000
20001db8:	4705                	li	a4,1
20001dba:	06e78223          	sb	a4,100(a5) # 42000064 <__StackTop+0x21ffc064>
20001dbe:	43c0                	lw	s0,4(a5)
20001dc0:	01041793          	slli	a5,s0,0x10
20001dc4:	83c1                	srli	a5,a5,0x10
20001dc6:	c23e                	sw	a5,4(sp)
20001dc8:	00847493          	andi	s1,s0,8
20001dcc:	00447793          	andi	a5,s0,4
20001dd0:	c03e                	sw	a5,0(sp)
20001dd2:	200017b7          	lui	a5,0x20001
20001dd6:	f587c783          	lbu	a5,-168(a5) # 20000f58 <is_rx>
20001dda:	0ff7f793          	zext.b	a5,a5
20001dde:	c3f9                	beqz	a5,20001ea4 <RF_2G4_RADIO_Handler+0xf8>
20001de0:	200037b7          	lui	a5,0x20003
20001de4:	c067c783          	lbu	a5,-1018(a5) # 20002c06 <is_sync>
20001de8:	0ff7f793          	zext.b	a5,a5
20001dec:	efc5                	bnez	a5,20001ea4 <RF_2G4_RADIO_Handler+0xf8>
20001dee:	04049a63          	bnez	s1,20001e42 <RF_2G4_RADIO_Handler+0x96>
20001df2:	200037b7          	lui	a5,0x20003
20001df6:	ce07a023          	sw	zero,-800(a5) # 20002ce0 <rf_stop_desc>
20001dfa:	42001737          	lui	a4,0x42001
20001dfe:	1e074783          	lbu	a5,480(a4) # 420011e0 <__StackTop+0x21ffd1e0>
20001e02:	0ff7f793          	zext.b	a5,a5
20001e06:	20003637          	lui	a2,0x20003
20001e0a:	cef62223          	sw	a5,-796(a2) # 20002ce4 <rssi>
20001e0e:	1ec74783          	lbu	a5,492(a4)
20001e12:	0ff7f793          	zext.b	a5,a5
20001e16:	200036b7          	lui	a3,0x20003
20001e1a:	cef6a623          	sw	a5,-788(a3) # 20002cec <rx_gain>
20001e1e:	00070023          	sb	zero,0(a4)
20001e22:	420007b7          	lui	a5,0x42000
20001e26:	08078223          	sb	zero,132(a5) # 42000084 <__StackTop+0x21ffc084>
20001e2a:	200037b7          	lui	a5,0x20003
20001e2e:	cdc7c783          	lbu	a5,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001e32:	4705                	li	a4,1
20001e34:	0ae79b63          	bne	a5,a4,20001eea <RF_2G4_RADIO_Handler+0x13e>
20001e38:	200037b7          	lui	a5,0x20003
20001e3c:	cc078e23          	sb	zero,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001e40:	a0cd                	j	20001f22 <RF_2G4_RADIO_Handler+0x176>
20001e42:	f0001097          	auipc	ra,0xf0001
20001e46:	228080e7          	jalr	552(ra) # 1000306a <omw_svc_24g_sync_end>
20001e4a:	200037b7          	lui	a5,0x20003
20001e4e:	4705                	li	a4,1
20001e50:	c0e78323          	sb	a4,-1018(a5) # 20002c06 <is_sync>
20001e54:	4792                	lw	a5,4(sp)
20001e56:	8b89                	andi	a5,a5,2
20001e58:	10078263          	beqz	a5,20001f5c <RF_2G4_RADIO_Handler+0x1b0>
20001e5c:	200037b7          	lui	a5,0x20003
20001e60:	ce07a023          	sw	zero,-800(a5) # 20002ce0 <rf_stop_desc>
20001e64:	42001737          	lui	a4,0x42001
20001e68:	1e074783          	lbu	a5,480(a4) # 420011e0 <__StackTop+0x21ffd1e0>
20001e6c:	0ff7f793          	zext.b	a5,a5
20001e70:	20003637          	lui	a2,0x20003
20001e74:	cef62223          	sw	a5,-796(a2) # 20002ce4 <rssi>
20001e78:	1ec74783          	lbu	a5,492(a4)
20001e7c:	0ff7f793          	zext.b	a5,a5
20001e80:	200036b7          	lui	a3,0x20003
20001e84:	cef6a623          	sw	a5,-788(a3) # 20002cec <rx_gain>
20001e88:	00070023          	sb	zero,0(a4)
20001e8c:	420007b7          	lui	a5,0x42000
20001e90:	08078223          	sb	zero,132(a5) # 42000084 <__StackTop+0x21ffc084>
20001e94:	200037b7          	lui	a5,0x20003
20001e98:	cdc7c783          	lbu	a5,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001e9c:	4705                	li	a4,1
20001e9e:	04e79663          	bne	a5,a4,20001eea <RF_2G4_RADIO_Handler+0x13e>
20001ea2:	a0ad                	j	20001f0c <RF_2G4_RADIO_Handler+0x160>
20001ea4:	200037b7          	lui	a5,0x20003
20001ea8:	ce07a023          	sw	zero,-800(a5) # 20002ce0 <rf_stop_desc>
20001eac:	42001737          	lui	a4,0x42001
20001eb0:	1e074783          	lbu	a5,480(a4) # 420011e0 <__StackTop+0x21ffd1e0>
20001eb4:	0ff7f793          	zext.b	a5,a5
20001eb8:	20003637          	lui	a2,0x20003
20001ebc:	cef62223          	sw	a5,-796(a2) # 20002ce4 <rssi>
20001ec0:	1ec74783          	lbu	a5,492(a4)
20001ec4:	0ff7f793          	zext.b	a5,a5
20001ec8:	200036b7          	lui	a3,0x20003
20001ecc:	cef6a623          	sw	a5,-788(a3) # 20002cec <rx_gain>
20001ed0:	00070023          	sb	zero,0(a4)
20001ed4:	420007b7          	lui	a5,0x42000
20001ed8:	08078223          	sb	zero,132(a5) # 42000084 <__StackTop+0x21ffc084>
20001edc:	200037b7          	lui	a5,0x20003
20001ee0:	cdc7c783          	lbu	a5,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001ee4:	4705                	li	a4,1
20001ee6:	02e78263          	beq	a5,a4,20001f0a <RF_2G4_RADIO_Handler+0x15e>
20001eea:	4709                	li	a4,2
20001eec:	06e78d63          	beq	a5,a4,20001f66 <RF_2G4_RADIO_Handler+0x1ba>
20001ef0:	470d                	li	a4,3
20001ef2:	08e78863          	beq	a5,a4,20001f82 <RF_2G4_RADIO_Handler+0x1d6>
20001ef6:	200037b7          	lui	a5,0x20003
20001efa:	c1a7c783          	lbu	a5,-998(a5) # 20002c1a <rf_2g4_mgr+0x12>
20001efe:	cbd5                	beqz	a5,20001fb2 <RF_2G4_RADIO_Handler+0x206>
20001f00:	0c048163          	beqz	s1,20001fc2 <RF_2G4_RADIO_Handler+0x216>
20001f04:	4782                	lw	a5,0(sp)
20001f06:	efd5                	bnez	a5,20001fc2 <RF_2G4_RADIO_Handler+0x216>
20001f08:	a075                	j	20001fb4 <RF_2G4_RADIO_Handler+0x208>
20001f0a:	d49d                	beqz	s1,20001e38 <RF_2G4_RADIO_Handler+0x8c>
20001f0c:	200037b7          	lui	a5,0x20003
20001f10:	cc078e23          	sb	zero,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001f14:	200037b7          	lui	a5,0x20003
20001f18:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20001f1c:	4705                	li	a4,1
20001f1e:	02e78823          	sb	a4,48(a5)
20001f22:	200037b7          	lui	a5,0x20003
20001f26:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20001f2a:	020787a3          	sb	zero,47(a5)
20001f2e:	200017b7          	lui	a5,0x20001
20001f32:	f587c783          	lbu	a5,-168(a5) # 20000f58 <is_rx>
20001f36:	0ff7f793          	zext.b	a5,a5
20001f3a:	cba9                	beqz	a5,20001f8c <RF_2G4_RADIO_Handler+0x1e0>
20001f3c:	200017b7          	lui	a5,0x20001
20001f40:	f4078c23          	sb	zero,-168(a5) # 20000f58 <is_rx>
20001f44:	00847513          	andi	a0,s0,8
20001f48:	3e75                	jal	20001b04 <dynamic_agc_info_get2>
20001f4a:	4505                	li	a0,1
20001f4c:	c481                	beqz	s1,20001f54 <RF_2G4_RADIO_Handler+0x1a8>
20001f4e:	4782                	lw	a5,0(sp)
20001f50:	00f03533          	snez	a0,a5
20001f54:	f0001097          	auipc	ra,0xf0001
20001f58:	112080e7          	jalr	274(ra) # 10003066 <omw_svc_24g_rx_end>
20001f5c:	40c2                	lw	ra,16(sp)
20001f5e:	4432                	lw	s0,12(sp)
20001f60:	44a2                	lw	s1,8(sp)
20001f62:	0151                	addi	sp,sp,20
20001f64:	8082                	ret
20001f66:	200037b7          	lui	a5,0x20003
20001f6a:	c1a7c783          	lbu	a5,-998(a5) # 20002c1a <rf_2g4_mgr+0x12>
20001f6e:	c785                	beqz	a5,20001f96 <RF_2G4_RADIO_Handler+0x1ea>
20001f70:	00048463          	beqz	s1,20001f78 <RF_2G4_RADIO_Handler+0x1cc>
20001f74:	4782                	lw	a5,0(sp)
20001f76:	c38d                	beqz	a5,20001f98 <RF_2G4_RADIO_Handler+0x1ec>
20001f78:	200037b7          	lui	a5,0x20003
20001f7c:	cc078e23          	sb	zero,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001f80:	b74d                	j	20001f22 <RF_2G4_RADIO_Handler+0x176>
20001f82:	200037b7          	lui	a5,0x20003
20001f86:	cc078e23          	sb	zero,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001f8a:	bf61                	j	20001f22 <RF_2G4_RADIO_Handler+0x176>
20001f8c:	f0001097          	auipc	ra,0xf0001
20001f90:	0dc080e7          	jalr	220(ra) # 10003068 <omw_svc_24g_tx_end>
20001f94:	b7e1                	j	20001f5c <RF_2G4_RADIO_Handler+0x1b0>
20001f96:	d0ed                	beqz	s1,20001f78 <RF_2G4_RADIO_Handler+0x1cc>
20001f98:	200037b7          	lui	a5,0x20003
20001f9c:	470d                	li	a4,3
20001f9e:	cce78e23          	sb	a4,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001fa2:	200037b7          	lui	a5,0x20003
20001fa6:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20001faa:	4705                	li	a4,1
20001fac:	02e78823          	sb	a4,48(a5)
20001fb0:	bfbd                	j	20001f2e <RF_2G4_RADIO_Handler+0x182>
20001fb2:	c881                	beqz	s1,20001fc2 <RF_2G4_RADIO_Handler+0x216>
20001fb4:	200037b7          	lui	a5,0x20003
20001fb8:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20001fbc:	4705                	li	a4,1
20001fbe:	02e78823          	sb	a4,48(a5)
20001fc2:	200037b7          	lui	a5,0x20003
20001fc6:	cdc7c783          	lbu	a5,-804(a5) # 20002cdc <rf_2g4_wait_ack>
20001fca:	f3b5                	bnez	a5,20001f2e <RF_2G4_RADIO_Handler+0x182>
20001fcc:	bf99                	j	20001f22 <RF_2G4_RADIO_Handler+0x176>

20001fce <omw_svc_2g4_rx_data>:
20001fce:	1151                	addi	sp,sp,-12
20001fd0:	c406                	sw	ra,8(sp)
20001fd2:	c222                	sw	s0,4(sp)
20001fd4:	c026                	sw	s1,0(sp)
20001fd6:	87ae                	mv	a5,a1
20001fd8:	4405                	li	s0,1
20001fda:	20003737          	lui	a4,0x20003
20001fde:	c0870713          	addi	a4,a4,-1016 # 20002c08 <rf_2g4_mgr>
20001fe2:	028707a3          	sb	s0,47(a4)
20001fe6:	20001737          	lui	a4,0x20001
20001fea:	f4870c23          	sb	s0,-168(a4) # 20000f58 <is_rx>
20001fee:	20003737          	lui	a4,0x20003
20001ff2:	c0070323          	sb	zero,-1018(a4) # 20002c06 <is_sync>
20001ff6:	20003737          	lui	a4,0x20003
20001ffa:	c0174703          	lbu	a4,-1023(a4) # 20002c01 <autolen_pkt_desc_offset>
20001ffe:	0709                	addi	a4,a4,2
20002000:	0ff77713          	zext.b	a4,a4
20002004:	00371593          	slli	a1,a4,0x3
20002008:	20003737          	lui	a4,0x20003
2000200c:	c5470713          	addi	a4,a4,-940 # 20002c54 <rf_2g4_rx_pkt_desc>
20002010:	972e                	add	a4,a4,a1
20002012:	c308                	sw	a0,0(a4)
20002014:	078e                	slli	a5,a5,0x3
20002016:	17fd                	addi	a5,a5,-1
20002018:	07c2                	slli	a5,a5,0x10
2000201a:	00475583          	lhu	a1,4(a4)
2000201e:	8fcd                	or	a5,a5,a1
20002020:	c35c                	sw	a5,4(a4)
20002022:	06c2                	slli	a3,a3,0x10
20002024:	82c1                	srli	a3,a3,0x10
20002026:	420004b7          	lui	s1,0x42000
2000202a:	00d49a23          	sh	a3,20(s1) # 42000014 <__StackTop+0x21ffc014>
2000202e:	85b2                	mv	a1,a2
20002030:	20001537          	lui	a0,0x20001
20002034:	dcc50513          	addi	a0,a0,-564 # 20000dcc <rf_common_desc_rx_setfreq>
20002038:	f0001097          	auipc	ra,0xf0001
2000203c:	15a080e7          	jalr	346(ra) # 10003192 <RADIO_CommonDescInit_SetFreq_2g4>
20002040:	20003737          	lui	a4,0x20003
20002044:	200007b7          	lui	a5,0x20000
20002048:	19c78793          	addi	a5,a5,412 # 2000019c <rf_call_desc_list_rx_process+0x38>
2000204c:	cef72023          	sw	a5,-800(a4) # 20002ce0 <rf_stop_desc>
20002050:	200017b7          	lui	a5,0x20001
20002054:	f6078793          	addi	a5,a5,-160 # 20000f60 <rf_2g4_call_desc_list_rx>
20002058:	c4dc                	sw	a5,12(s1)
2000205a:	c080                	sw	s0,0(s1)
2000205c:	40a2                	lw	ra,8(sp)
2000205e:	4412                	lw	s0,4(sp)
20002060:	4482                	lw	s1,0(sp)
20002062:	0131                	addi	sp,sp,12
20002064:	8082                	ret

20002066 <omw_svc_2g4_tx_data>:
20002066:	1151                	addi	sp,sp,-12
20002068:	c406                	sw	ra,8(sp)
2000206a:	c222                	sw	s0,4(sp)
2000206c:	87ae                	mv	a5,a1
2000206e:	8436                	mv	s0,a3
20002070:	200036b7          	lui	a3,0x20003
20002074:	c0868693          	addi	a3,a3,-1016 # 20002c08 <rf_2g4_mgr>
20002078:	4305                	li	t1,1
2000207a:	026687a3          	sb	t1,47(a3)
2000207e:	20001737          	lui	a4,0x20001
20002082:	f4070c23          	sb	zero,-168(a4) # 20000f58 <is_rx>
20002086:	20003737          	lui	a4,0x20003
2000208a:	c0174583          	lbu	a1,-1023(a4) # 20002c01 <autolen_pkt_desc_offset>
2000208e:	0036c683          	lbu	a3,3(a3)
20002092:	00258713          	addi	a4,a1,2
20002096:	0ff77713          	zext.b	a4,a4
2000209a:	06d37763          	bgeu	t1,a3,20002108 <omw_svc_2g4_tx_data+0xa2>
2000209e:	200036b7          	lui	a3,0x20003
200020a2:	c8f69c23          	sh	a5,-872(a3) # 20002c98 <rf_2g4_trans_len>
200020a6:	00371693          	slli	a3,a4,0x3
200020aa:	20003737          	lui	a4,0x20003
200020ae:	c9c70713          	addi	a4,a4,-868 # 20002c9c <rf_2g4_tx_pkt_desc>
200020b2:	9736                	add	a4,a4,a3
200020b4:	c308                	sw	a0,0(a4)
200020b6:	078e                	slli	a5,a5,0x3
200020b8:	17fd                	addi	a5,a5,-1
200020ba:	07c2                	slli	a5,a5,0x10
200020bc:	00475683          	lhu	a3,4(a4)
200020c0:	8fd5                	or	a5,a5,a3
200020c2:	c35c                	sw	a5,4(a4)
200020c4:	85b2                	mv	a1,a2
200020c6:	20001537          	lui	a0,0x20001
200020ca:	e6450513          	addi	a0,a0,-412 # 20000e64 <rf_common_desc_tx_setfreq>
200020ce:	f0001097          	auipc	ra,0xf0001
200020d2:	0c4080e7          	jalr	196(ra) # 10003192 <RADIO_CommonDescInit_SetFreq_2g4>
200020d6:	20003737          	lui	a4,0x20003
200020da:	200007b7          	lui	a5,0x20000
200020de:	1ec78793          	addi	a5,a5,492 # 200001ec <rf_call_desc_list_tx_process+0x38>
200020e2:	cef72023          	sw	a5,-800(a4) # 20002ce0 <rf_stop_desc>
200020e6:	0442                	slli	s0,s0,0x10
200020e8:	8041                	srli	s0,s0,0x10
200020ea:	420007b7          	lui	a5,0x42000
200020ee:	00879a23          	sh	s0,20(a5) # 42000014 <__StackTop+0x21ffc014>
200020f2:	20001737          	lui	a4,0x20001
200020f6:	f7870713          	addi	a4,a4,-136 # 20000f78 <rf_2g4_call_desc_list_tx>
200020fa:	c7d8                	sw	a4,12(a5)
200020fc:	4705                	li	a4,1
200020fe:	c398                	sw	a4,0(a5)
20002100:	40a2                	lw	ra,8(sp)
20002102:	4412                	lw	s0,4(sp)
20002104:	0131                	addi	sp,sp,12
20002106:	8082                	ret
20002108:	00158713          	addi	a4,a1,1
2000210c:	0ff77713          	zext.b	a4,a4
20002110:	b779                	j	2000209e <omw_svc_2g4_tx_data+0x38>

20002112 <omw_svc_2g4_en_whiten_tx>:
20002112:	1151                	addi	sp,sp,-12
20002114:	c406                	sw	ra,8(sp)
20002116:	86aa                	mv	a3,a0
20002118:	200037b7          	lui	a5,0x20003
2000211c:	c047c603          	lbu	a2,-1020(a5) # 20002c04 <cur_whiten_desc_tx_ed>
20002120:	200037b7          	lui	a5,0x20003
20002124:	c057c583          	lbu	a1,-1019(a5) # 20002c05 <cur_whiten_desc_tx_st>
20002128:	20003537          	lui	a0,0x20003
2000212c:	c9c50513          	addi	a0,a0,-868 # 20002c9c <rf_2g4_tx_pkt_desc>
20002130:	3649                	jal	20001cb2 <omw_svc_2g4_mdf_whiten_desc>
20002132:	40a2                	lw	ra,8(sp)
20002134:	0131                	addi	sp,sp,12
20002136:	8082                	ret

20002138 <omw_svc_2g4_en_whiten_rx>:
20002138:	1151                	addi	sp,sp,-12
2000213a:	c406                	sw	ra,8(sp)
2000213c:	86aa                	mv	a3,a0
2000213e:	200037b7          	lui	a5,0x20003
20002142:	c027c603          	lbu	a2,-1022(a5) # 20002c02 <cur_whiten_desc_rx_ed>
20002146:	200037b7          	lui	a5,0x20003
2000214a:	c037c583          	lbu	a1,-1021(a5) # 20002c03 <cur_whiten_desc_rx_st>
2000214e:	20003537          	lui	a0,0x20003
20002152:	c5450513          	addi	a0,a0,-940 # 20002c54 <rf_2g4_rx_pkt_desc>
20002156:	3eb1                	jal	20001cb2 <omw_svc_2g4_mdf_whiten_desc>
20002158:	40a2                	lw	ra,8(sp)
2000215a:	0131                	addi	sp,sp,12
2000215c:	8082                	ret

2000215e <omw_svc_2g4_set_idle>:
2000215e:	420007b7          	lui	a5,0x42000
20002162:	4709                	li	a4,2
20002164:	c398                	sw	a4,0(a5)
20002166:	200037b7          	lui	a5,0x20003
2000216a:	ce07a503          	lw	a0,-800(a5) # 20002ce0 <rf_stop_desc>
2000216e:	c105                	beqz	a0,2000218e <omw_svc_2g4_set_idle+0x30>
20002170:	1151                	addi	sp,sp,-12
20002172:	c406                	sw	ra,8(sp)
20002174:	ed2ff0ef          	jal	20001846 <start_await_dma>
20002178:	200037b7          	lui	a5,0x20003
2000217c:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20002180:	020787a3          	sb	zero,47(a5)
20002184:	02078823          	sb	zero,48(a5)
20002188:	40a2                	lw	ra,8(sp)
2000218a:	0131                	addi	sp,sp,12
2000218c:	8082                	ret
2000218e:	200037b7          	lui	a5,0x20003
20002192:	c0878793          	addi	a5,a5,-1016 # 20002c08 <rf_2g4_mgr>
20002196:	020787a3          	sb	zero,47(a5)
2000219a:	02078823          	sb	zero,48(a5)
2000219e:	8082                	ret
