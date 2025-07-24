
.//Obj/BLE_peripheral.elf:     file format elf32-littleriscv


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
10000048:	5bf000ef          	jal	10000e06 <sys_entry>

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
100000b4:	4781                	li	a5,0
100000b6:	0c700313          	li	t1,199
100000ba:	00d7c363          	blt	a5,a3,100000c0 <print_string_to_buf+0xc>
100000be:	8082                	ret
100000c0:	0005c703          	lbu	a4,0(a1)
100000c4:	fee36de3          	bltu	t1,a4,100000be <print_string_to_buf+0xa>
100000c8:	00f602b3          	add	t0,a2,a5
100000cc:	0002c283          	lbu	t0,0(t0)
100000d0:	972a                	add	a4,a4,a0
100000d2:	0785                	addi	a5,a5,1
100000d4:	00570023          	sb	t0,0(a4)
100000d8:	0005c703          	lbu	a4,0(a1)
100000dc:	0ff7f793          	zext.b	a5,a5
100000e0:	0705                	addi	a4,a4,1
100000e2:	00e58023          	sb	a4,0(a1)
100000e6:	bfd1                	j	100000ba <print_string_to_buf+0x6>

100000e8 <uart_send.constprop.0>:
100000e8:	95aa                	add	a1,a1,a0
100000ea:	41001737          	lui	a4,0x41001
100000ee:	00b51363          	bne	a0,a1,100000f4 <uart_send.constprop.0+0xc>
100000f2:	8082                	ret
100000f4:	01475783          	lhu	a5,20(a4) # 41001014 <__StackTop+0x20ffd014>
100000f8:	0207f793          	andi	a5,a5,32
100000fc:	dfe5                	beqz	a5,100000f4 <uart_send.constprop.0+0xc>
100000fe:	00054783          	lbu	a5,0(a0)
10000102:	0505                	addi	a0,a0,1
10000104:	00f71023          	sh	a5,0(a4)
10000108:	b7dd                	j	100000ee <uart_send.constprop.0+0x6>

1000010a <log_printf>:
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
10000122:	021c                	addi	a5,sp,256
10000124:	ca3e                	sw	a5,20(sp)
10000126:	000109a3          	sb	zero,19(sp)
1000012a:	c202                	sw	zero,4(sp)
1000012c:	4702                	lw	a4,0(sp)
1000012e:	00074703          	lbu	a4,0(a4)
10000132:	e721                	bnez	a4,1000017a <log_printf+0x70>
10000134:	01314583          	lbu	a1,19(sp)
10000138:	1068                	addi	a0,sp,44
1000013a:	377d                	jal	100000e8 <uart_send.constprop.0>
1000013c:	50fe                	lw	ra,252(sp)
1000013e:	546e                	lw	s0,248(sp)
10000140:	54de                	lw	s1,244(sp)
10000142:	11410113          	addi	sp,sp,276
10000146:	8082                	ret
10000148:	0685                	addi	a3,a3,1
1000014a:	4702                	lw	a4,0(sp)
1000014c:	00d70433          	add	s0,a4,a3
10000150:	00044703          	lbu	a4,0(s0)
10000154:	1cc70363          	beq	a4,a2,1000031a <log_printf+0x210>
10000158:	fb65                	bnez	a4,10000148 <log_printf+0x3e>
1000015a:	ce91                	beqz	a3,10000176 <log_printf+0x6c>
1000015c:	4602                	lw	a2,0(sp)
1000015e:	01310593          	addi	a1,sp,19
10000162:	1068                	addi	a0,sp,44
10000164:	c63e                	sw	a5,12(sp)
10000166:	c43a                	sw	a4,8(sp)
10000168:	37b1                	jal	100000b4 <print_string_to_buf>
1000016a:	4722                	lw	a4,8(sp)
1000016c:	02500693          	li	a3,37
10000170:	47b2                	lw	a5,12(sp)
10000172:	1ad70663          	beq	a4,a3,1000031e <log_printf+0x214>
10000176:	c022                	sw	s0,0(sp)
10000178:	bf55                	j	1000012c <log_printf+0x22>
1000017a:	4681                	li	a3,0
1000017c:	02500613          	li	a2,37
10000180:	b7e9                	j	1000014a <log_printf+0x40>
10000182:	f9d70713          	addi	a4,a4,-99
10000186:	0ff77713          	zext.b	a4,a4
1000018a:	465d                	li	a2,23
1000018c:	1ce66763          	bltu	a2,a4,1000035a <log_printf+0x250>
10000190:	10004637          	lui	a2,0x10004
10000194:	070a                	slli	a4,a4,0x2
10000196:	26460613          	addi	a2,a2,612 # 10004264 <__thead_uwrite8+0x2f0>
1000019a:	9732                	add	a4,a4,a2
1000019c:	4318                	lw	a4,0(a4)
1000019e:	8702                	jr	a4
100001a0:	05800693          	li	a3,88
100001a4:	1ad71b63          	bne	a4,a3,1000035a <log_printf+0x250>
100001a8:	00478493          	addi	s1,a5,4
100001ac:	439c                	lw	a5,0(a5)
100001ae:	c23a                	sw	a4,4(sp)
100001b0:	4601                	li	a2,0
100001b2:	4741                	li	a4,16
100001b4:	cc3e                	sw	a5,24(sp)
100001b6:	4585                	li	a1,1
100001b8:	02e5b6b3          	mulhu	a3,a1,a4
100001bc:	02e58533          	mul	a0,a1,a4
100001c0:	00d036b3          	snez	a3,a3
100001c4:	00a7e463          	bltu	a5,a0,100001cc <log_printf+0xc2>
100001c8:	10068963          	beqz	a3,100002da <log_printf+0x1d0>
100001cc:	4681                	li	a3,0
100001ce:	ce01                	beqz	a2,100001e6 <log_printf+0xdc>
100001d0:	03000513          	li	a0,48
100001d4:	147d                	addi	s0,s0,-1
100001d6:	00a39863          	bne	t2,a0,100001e6 <log_printf+0xdc>
100001da:	02d00693          	li	a3,45
100001de:	00d10e23          	sb	a3,28(sp)
100001e2:	86b2                	mv	a3,a2
100001e4:	4601                	li	a2,0
100001e6:	ffe40513          	addi	a0,s0,-2
100001ea:	42b5                	li	t0,13
100001ec:	01c10313          	addi	t1,sp,28
100001f0:	00a2ee63          	bltu	t0,a0,1000020c <log_printf+0x102>
100001f4:	fff40513          	addi	a0,s0,-1
100001f8:	00d302b3          	add	t0,t1,a3
100001fc:	00728023          	sb	t2,0(t0)
10000200:	157d                	addi	a0,a0,-1
10000202:	0285                	addi	t0,t0,1
10000204:	fd65                	bnez	a0,100001fc <log_printf+0xf2>
10000206:	9436                	add	s0,s0,a3
10000208:	fff40693          	addi	a3,s0,-1
1000020c:	ca11                	beqz	a2,10000220 <log_printf+0x116>
1000020e:	0e468613          	addi	a2,a3,228
10000212:	0808                	addi	a0,sp,16
10000214:	962a                	add	a2,a2,a0
10000216:	02d00513          	li	a0,45
1000021a:	f2a60423          	sb	a0,-216(a2)
1000021e:	0685                	addi	a3,a3,1
10000220:	10004637          	lui	a2,0x10004
10000224:	fc460393          	addi	t2,a2,-60 # 10003fc4 <__thead_uwrite8+0x50>
10000228:	10004637          	lui	a2,0x10004
1000022c:	07800413          	li	s0,120
10000230:	fb060613          	addi	a2,a2,-80 # 10003fb0 <__thead_uwrite8+0x3c>
10000234:	e5d5                	bnez	a1,100002e0 <log_printf+0x1d6>
10000236:	861a                	mv	a2,t1
10000238:	a035                	j	10000264 <log_printf+0x15a>
1000023a:	03000613          	li	a2,48
1000023e:	00c71463          	bne	a4,a2,10000246 <log_printf+0x13c>
10000242:	e011                	bnez	s0,10000246 <log_printf+0x13c>
10000244:	83ba                	mv	t2,a4
10000246:	4629                	li	a2,10
10000248:	02c40633          	mul	a2,s0,a2
1000024c:	fd060613          	addi	a2,a2,-48
10000250:	00c70433          	add	s0,a4,a2
10000254:	4602                	lw	a2,0(sp)
10000256:	a8e9                	j	10000330 <log_printf+0x226>
10000258:	00478493          	addi	s1,a5,4
1000025c:	439c                	lw	a5,0(a5)
1000025e:	4685                	li	a3,1
10000260:	0830                	addi	a2,sp,24
10000262:	cc3e                	sw	a5,24(sp)
10000264:	01310593          	addi	a1,sp,19
10000268:	1068                	addi	a0,sp,44
1000026a:	35a9                	jal	100000b4 <print_string_to_buf>
1000026c:	a881                	j	100002bc <log_printf+0x1b2>
1000026e:	00478493          	addi	s1,a5,4
10000272:	439c                	lw	a5,0(a5)
10000274:	0407db63          	bgez	a5,100002ca <log_printf+0x1c0>
10000278:	40f007b3          	neg	a5,a5
1000027c:	4605                	li	a2,1
1000027e:	4729                	li	a4,10
10000280:	bf15                	j	100001b4 <log_printf+0xaa>
10000282:	4390                	lw	a2,0(a5)
10000284:	00478493          	addi	s1,a5,4
10000288:	4681                	li	a3,0
1000028a:	00d607b3          	add	a5,a2,a3
1000028e:	0007c783          	lbu	a5,0(a5)
10000292:	e79d                	bnez	a5,100002c0 <log_printf+0x1b6>
10000294:	01310593          	addi	a1,sp,19
10000298:	1068                	addi	a0,sp,44
1000029a:	c436                	sw	a3,8(sp)
1000029c:	3d21                	jal	100000b4 <print_string_to_buf>
1000029e:	46a2                	lw	a3,8(sp)
100002a0:	0086fe63          	bgeu	a3,s0,100002bc <log_printf+0x1b2>
100002a4:	8c15                	sub	s0,s0,a3
100002a6:	10004637          	lui	a2,0x10004
100002aa:	4685                	li	a3,1
100002ac:	fac60613          	addi	a2,a2,-84 # 10003fac <__thead_uwrite8+0x38>
100002b0:	01310593          	addi	a1,sp,19
100002b4:	1068                	addi	a0,sp,44
100002b6:	147d                	addi	s0,s0,-1
100002b8:	3bf5                	jal	100000b4 <print_string_to_buf>
100002ba:	f475                	bnez	s0,100002a6 <log_printf+0x19c>
100002bc:	87a6                	mv	a5,s1
100002be:	b5bd                	j	1000012c <log_printf+0x22>
100002c0:	0685                	addi	a3,a3,1
100002c2:	b7e1                	j	1000028a <log_printf+0x180>
100002c4:	00478493          	addi	s1,a5,4
100002c8:	439c                	lw	a5,0(a5)
100002ca:	4601                	li	a2,0
100002cc:	bf4d                	j	1000027e <log_printf+0x174>
100002ce:	00478493          	addi	s1,a5,4
100002d2:	07800713          	li	a4,120
100002d6:	439c                	lw	a5,0(a5)
100002d8:	bdd9                	j	100001ae <log_printf+0xa4>
100002da:	147d                	addi	s0,s0,-1
100002dc:	85aa                	mv	a1,a0
100002de:	bde9                	j	100001b8 <log_printf+0xae>
100002e0:	02b7d533          	divu	a0,a5,a1
100002e4:	4292                	lw	t0,4(sp)
100002e6:	02e57533          	remu	a0,a0,a4
100002ea:	00829d63          	bne	t0,s0,10000304 <log_printf+0x1fa>
100002ee:	9532                	add	a0,a0,a2
100002f0:	00054503          	lbu	a0,0(a0)
100002f4:	00d302b3          	add	t0,t1,a3
100002f8:	0685                	addi	a3,a3,1
100002fa:	00a28023          	sb	a0,0(t0)
100002fe:	02e5d5b3          	divu	a1,a1,a4
10000302:	bf0d                	j	10000234 <log_printf+0x12a>
10000304:	951e                	add	a0,a0,t2
10000306:	b7ed                	j	100002f0 <log_printf+0x1e6>
10000308:	c43e                	sw	a5,8(sp)
1000030a:	4685                	li	a3,1
1000030c:	01310593          	addi	a1,sp,19
10000310:	1068                	addi	a0,sp,44
10000312:	334d                	jal	100000b4 <print_string_to_buf>
10000314:	47a2                	lw	a5,8(sp)
10000316:	84be                	mv	s1,a5
10000318:	b755                	j	100002bc <log_printf+0x1b2>
1000031a:	e40691e3          	bnez	a3,1000015c <log_printf+0x52>
1000031e:	00140613          	addi	a2,s0,1
10000322:	02000393          	li	t2,32
10000326:	4401                	li	s0,0
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
1000035a:	10004637          	lui	a2,0x10004
1000035e:	c43e                	sw	a5,8(sp)
10000360:	4695                	li	a3,5
10000362:	fd860613          	addi	a2,a2,-40 # 10003fd8 <__thead_uwrite8+0x64>
10000366:	b75d                	j	1000030c <log_printf+0x202>

10000368 <gatt_data_write>:
10000368:	10004537          	lui	a0,0x10004
1000036c:	1141                	addi	sp,sp,-16
1000036e:	fe050513          	addi	a0,a0,-32 # 10003fe0 <__thead_uwrite8+0x6c>
10000372:	c422                	sw	s0,8(sp)
10000374:	c226                	sw	s1,4(sp)
10000376:	c606                	sw	ra,12(sp)
10000378:	84b2                	mv	s1,a2
1000037a:	8436                	mv	s0,a3
1000037c:	3379                	jal	1000010a <log_printf>
1000037e:	4781                	li	a5,0
10000380:	0087ed63          	bltu	a5,s0,1000039a <gatt_data_write+0x32>
10000384:	10004537          	lui	a0,0x10004
10000388:	ffc50513          	addi	a0,a0,-4 # 10003ffc <__thead_uwrite8+0x88>
1000038c:	3bbd                	jal	1000010a <log_printf>
1000038e:	40b2                	lw	ra,12(sp)
10000390:	8522                	mv	a0,s0
10000392:	4422                	lw	s0,8(sp)
10000394:	4492                	lw	s1,4(sp)
10000396:	0141                	addi	sp,sp,16
10000398:	8082                	ret
1000039a:	00f48733          	add	a4,s1,a5
1000039e:	00074583          	lbu	a1,0(a4)
100003a2:	10004537          	lui	a0,0x10004
100003a6:	ff450513          	addi	a0,a0,-12 # 10003ff4 <__thead_uwrite8+0x80>
100003aa:	c03e                	sw	a5,0(sp)
100003ac:	3bb9                	jal	1000010a <log_printf>
100003ae:	4782                	lw	a5,0(sp)
100003b0:	0785                	addi	a5,a5,1
100003b2:	0ff7f793          	zext.b	a5,a5
100003b6:	b7e9                	j	10000380 <gatt_data_write+0x18>

100003b8 <svc_ccc_cfg_changed>:
100003b8:	200027b7          	lui	a5,0x20002
100003bc:	0ff5f593          	zext.b	a1,a1
100003c0:	52878793          	addi	a5,a5,1320 # 20002528 <wdalignbuf>
100003c4:	02b78023          	sb	a1,32(a5)
100003c8:	0207c583          	lbu	a1,32(a5)
100003cc:	10004537          	lui	a0,0x10004
100003d0:	00050513          	mv	a0,a0
100003d4:	bb1d                	j	1000010a <log_printf>

100003d6 <ble_connected>:
100003d6:	1161                	addi	sp,sp,-8
100003d8:	c022                	sw	s0,0(sp)
100003da:	c206                	sw	ra,4(sp)
100003dc:	842a                	mv	s0,a0
100003de:	c591                	beqz	a1,100003ea <ble_connected+0x14>
100003e0:	10004537          	lui	a0,0x10004
100003e4:	01850513          	addi	a0,a0,24 # 10004018 <__thead_uwrite8+0xa4>
100003e8:	330d                	jal	1000010a <log_printf>
100003ea:	200027b7          	lui	a5,0x20002
100003ee:	00045583          	lhu	a1,0(s0)
100003f2:	5487a623          	sw	s0,1356(a5) # 2000254c <deft_conn>
100003f6:	4402                	lw	s0,0(sp)
100003f8:	4092                	lw	ra,4(sp)
100003fa:	10004537          	lui	a0,0x10004
100003fe:	03850513          	addi	a0,a0,56 # 10004038 <__thead_uwrite8+0xc4>
10000402:	0121                	addi	sp,sp,8
10000404:	b319                	j	1000010a <log_printf>

10000406 <ble_param_req>:
10000406:	00055583          	lhu	a1,0(a0)
1000040a:	10004537          	lui	a0,0x10004
1000040e:	1171                	addi	sp,sp,-4
10000410:	06450513          	addi	a0,a0,100 # 10004064 <__thead_uwrite8+0xf0>
10000414:	c006                	sw	ra,0(sp)
10000416:	39d5                	jal	1000010a <log_printf>
10000418:	4082                	lw	ra,0(sp)
1000041a:	4501                	li	a0,0
1000041c:	0111                	addi	sp,sp,4
1000041e:	8082                	ret

10000420 <ble_param_update>:
10000420:	00055583          	lhu	a1,0(a0)
10000424:	10004537          	lui	a0,0x10004
10000428:	08c50513          	addi	a0,a0,140 # 1000408c <__thead_uwrite8+0x118>
1000042c:	b9f9                	j	1000010a <log_printf>

1000042e <ble_phy_update>:
1000042e:	0015c603          	lbu	a2,1(a1)
10000432:	0005c583          	lbu	a1,0(a1)
10000436:	10004537          	lui	a0,0x10004
1000043a:	0b850513          	addi	a0,a0,184 # 100040b8 <__thead_uwrite8+0x144>
1000043e:	b1f1                	j	1000010a <log_printf>

10000440 <ota_data_send>:
10000440:	fdc10113          	addi	sp,sp,-36
10000444:	ce22                	sw	s0,28(sp)
10000446:	842e                	mv	s0,a1
10000448:	100045b7          	lui	a1,0x10004
1000044c:	cc26                	sw	s1,24(sp)
1000044e:	c22a                	sw	a0,4(sp)
10000450:	84b2                	mv	s1,a2
10000452:	2e058593          	addi	a1,a1,736 # 100042e0 <__thead_uwrite8+0x36c>
10000456:	461d                	li	a2,7
10000458:	0808                	addi	a0,sp,16
1000045a:	d006                	sw	ra,32(sp)
1000045c:	c636                	sw	a3,12(sp)
1000045e:	c43a                	sw	a4,8(sp)
10000460:	f000c097          	auipc	ra,0xf000c
10000464:	554080e7          	jalr	1364(ra) # c9b4 <memcpy>
10000468:	10004537          	lui	a0,0x10004
1000046c:	0e050513          	addi	a0,a0,224 # 100040e0 <__thead_uwrite8+0x16c>
10000470:	3969                	jal	1000010a <log_printf>
10000472:	4722                	lw	a4,8(sp)
10000474:	46b2                	lw	a3,12(sp)
10000476:	4512                	lw	a0,4(sp)
10000478:	461d                	li	a2,7
1000047a:	c032                	sw	a2,0(sp)
1000047c:	081c                	addi	a5,sp,16
1000047e:	8626                	mv	a2,s1
10000480:	85a2                	mv	a1,s0
10000482:	f0007097          	auipc	ra,0xf0007
10000486:	304080e7          	jalr	772(ra) # 7786 <bt_gatt_attr_read>
1000048a:	5082                	lw	ra,32(sp)
1000048c:	4472                	lw	s0,28(sp)
1000048e:	44e2                	lw	s1,24(sp)
10000490:	02410113          	addi	sp,sp,36
10000494:	8082                	ret

10000496 <ota_svc_data_send>:
10000496:	1161                	addi	sp,sp,-8
10000498:	47ed                	li	a5,27
1000049a:	c03e                	sw	a5,0(sp)
1000049c:	200027b7          	lui	a5,0x20002
100004a0:	5c878793          	addi	a5,a5,1480 # 200025c8 <ota_params+0x78>
100004a4:	c206                	sw	ra,4(sp)
100004a6:	f0007097          	auipc	ra,0xf0007
100004aa:	2e0080e7          	jalr	736(ra) # 7786 <bt_gatt_attr_read>
100004ae:	4092                	lw	ra,4(sp)
100004b0:	0121                	addi	sp,sp,8
100004b2:	8082                	ret

100004b4 <gatt_data_read>:
100004b4:	030207b7          	lui	a5,0x3020
100004b8:	ee410113          	addi	sp,sp,-284
100004bc:	10078793          	addi	a5,a5,256 # 3020100 <__FLASH_SIZE+0x2fe0100>
100004c0:	c83e                	sw	a5,16(sp)
100004c2:	000607b7          	lui	a5,0x60
100004c6:	50478793          	addi	a5,a5,1284 # 60504 <__FLASH_SIZE+0x20504>
100004ca:	10812a23          	sw	s0,276(sp)
100004ce:	10912823          	sw	s1,272(sp)
100004d2:	c22a                	sw	a0,4(sp)
100004d4:	842e                	mv	s0,a1
100004d6:	84b2                	mv	s1,a2
100004d8:	4581                	li	a1,0
100004da:	0f800613          	li	a2,248
100004de:	0828                	addi	a0,sp,24
100004e0:	c436                	sw	a3,8(sp)
100004e2:	c63a                	sw	a4,12(sp)
100004e4:	ca3e                	sw	a5,20(sp)
100004e6:	10112c23          	sw	ra,280(sp)
100004ea:	f000c097          	auipc	ra,0xf000c
100004ee:	4e2080e7          	jalr	1250(ra) # c9cc <memset>
100004f2:	4701                	li	a4,0
100004f4:	081c                	addi	a5,sp,16
100004f6:	0ff00693          	li	a3,255
100004fa:	00e78633          	add	a2,a5,a4
100004fe:	00e60023          	sb	a4,0(a2)
10000502:	0705                	addi	a4,a4,1
10000504:	fed71be3          	bne	a4,a3,100004fa <gatt_data_read+0x46>
10000508:	10004537          	lui	a0,0x10004
1000050c:	0e050513          	addi	a0,a0,224 # 100040e0 <__thead_uwrite8+0x16c>
10000510:	3eed                	jal	1000010a <log_printf>
10000512:	4751                	li	a4,20
10000514:	c03a                	sw	a4,0(sp)
10000516:	46a2                	lw	a3,8(sp)
10000518:	4732                	lw	a4,12(sp)
1000051a:	4512                	lw	a0,4(sp)
1000051c:	081c                	addi	a5,sp,16
1000051e:	8626                	mv	a2,s1
10000520:	85a2                	mv	a1,s0
10000522:	f0007097          	auipc	ra,0xf0007
10000526:	264080e7          	jalr	612(ra) # 7786 <bt_gatt_attr_read>
1000052a:	11812083          	lw	ra,280(sp)
1000052e:	11412403          	lw	s0,276(sp)
10000532:	11012483          	lw	s1,272(sp)
10000536:	11c10113          	addi	sp,sp,284
1000053a:	8082                	ret

1000053c <ota_svc_data_rcv>:
1000053c:	fd810113          	addi	sp,sp,-40
10000540:	d022                	sw	s0,32(sp)
10000542:	20002437          	lui	s0,0x20002
10000546:	52840413          	addi	s0,s0,1320 # 20002528 <wdalignbuf>
1000054a:	09845703          	lhu	a4,152(s0)
1000054e:	6505                	lui	a0,0x1
10000550:	fff50793          	addi	a5,a0,-1 # fff <__STACK_SIZE+0xbff>
10000554:	97ba                	add	a5,a5,a4
10000556:	02e7c7b3          	div	a5,a5,a4
1000055a:	d206                	sw	ra,36(sp)
1000055c:	ce26                	sw	s1,28(sp)
1000055e:	c436                	sw	a3,8(sp)
10000560:	00064683          	lbu	a3,0(a2)
10000564:	c232                	sw	a2,4(sp)
10000566:	85ba                	mv	a1,a4
10000568:	863a                	mv	a2,a4
1000056a:	17fd                	addi	a5,a5,-1
1000056c:	00f69963          	bne	a3,a5,1000057e <ota_svc_data_rcv+0x42>
10000570:	02e56633          	rem	a2,a0,a4
10000574:	10060163          	beqz	a2,10000676 <ota_svc_data_rcv+0x13a>
10000578:	01061713          	slli	a4,a2,0x10
1000057c:	8341                	srli	a4,a4,0x10
1000057e:	02b686b3          	mul	a3,a3,a1
10000582:	4792                	lw	a5,4(sp)
10000584:	08c42503          	lw	a0,140(s0)
10000588:	ca3a                	sw	a4,20(sp)
1000058a:	0785                	addi	a5,a5,1
1000058c:	c03e                	sw	a5,0(sp)
1000058e:	09c45783          	lhu	a5,156(s0)
10000592:	07b2                	slli	a5,a5,0xc
10000594:	97aa                	add	a5,a5,a0
10000596:	00d784b3          	add	s1,a5,a3
1000059a:	10048313          	addi	t1,s1,256
1000059e:	10004537          	lui	a0,0x10004
100005a2:	009706b3          	add	a3,a4,s1
100005a6:	f0037313          	andi	t1,t1,-256
100005aa:	85a6                	mv	a1,s1
100005ac:	0f450513          	addi	a0,a0,244 # 100040f4 <__thead_uwrite8+0x180>
100005b0:	c836                	sw	a3,16(sp)
100005b2:	c61a                	sw	t1,12(sp)
100005b4:	3e99                	jal	1000010a <log_printf>
100005b6:	4332                	lw	t1,12(sp)
100005b8:	46c2                	lw	a3,16(sp)
100005ba:	4752                	lw	a4,20(sp)
100005bc:	0cd37e63          	bgeu	t1,a3,10000698 <ota_svc_data_rcv+0x15c>
100005c0:	01049293          	slli	t0,s1,0x10
100005c4:	0342                	slli	t1,t1,0x10
100005c6:	01035313          	srli	t1,t1,0x10
100005ca:	0102d293          	srli	t0,t0,0x10
100005ce:	405306b3          	sub	a3,t1,t0
100005d2:	4582                	lw	a1,0(sp)
100005d4:	01069613          	slli	a2,a3,0x10
100005d8:	8241                	srli	a2,a2,0x10
100005da:	8526                	mv	a0,s1
100005dc:	cc3a                	sw	a4,24(sp)
100005de:	ca16                	sw	t0,20(sp)
100005e0:	c81a                	sw	t1,16(sp)
100005e2:	c632                	sw	a2,12(sp)
100005e4:	10001097          	auipc	ra,0x10001
100005e8:	bc2080e7          	jalr	-1086(ra) # 200011a6 <flash_write>
100005ec:	4632                	lw	a2,12(sp)
100005ee:	4702                	lw	a4,0(sp)
100005f0:	4342                	lw	t1,16(sp)
100005f2:	42d2                	lw	t0,20(sp)
100005f4:	00c706b3          	add	a3,a4,a2
100005f8:	4762                	lw	a4,24(sp)
100005fa:	009607b3          	add	a5,a2,s1
100005fe:	406284b3          	sub	s1,t0,t1
10000602:	94ba                	add	s1,s1,a4
10000604:	04c2                	slli	s1,s1,0x10
10000606:	80c1                	srli	s1,s1,0x10
10000608:	853e                	mv	a0,a5
1000060a:	00f48733          	add	a4,s1,a5
1000060e:	8f09                	sub	a4,a4,a0
10000610:	0742                	slli	a4,a4,0x10
10000612:	40f685b3          	sub	a1,a3,a5
10000616:	8341                	srli	a4,a4,0x10
10000618:	0ff00613          	li	a2,255
1000061c:	95aa                	add	a1,a1,a0
1000061e:	04e66e63          	bltu	a2,a4,1000067a <ota_svc_data_rcv+0x13e>
10000622:	0084d513          	srli	a0,s1,0x8
10000626:	f0000713          	li	a4,-256
1000062a:	02e50733          	mul	a4,a0,a4
1000062e:	00e48633          	add	a2,s1,a4
10000632:	0642                	slli	a2,a2,0x10
10000634:	8241                	srli	a2,a2,0x10
10000636:	ca09                	beqz	a2,10000648 <ota_svc_data_rcv+0x10c>
10000638:	0522                	slli	a0,a0,0x8
1000063a:	00a685b3          	add	a1,a3,a0
1000063e:	953e                	add	a0,a0,a5
10000640:	10001097          	auipc	ra,0x10001
10000644:	b66080e7          	jalr	-1178(ra) # 200011a6 <flash_write>
10000648:	4792                	lw	a5,4(sp)
1000064a:	4522                	lw	a0,8(sp)
1000064c:	0007c783          	lbu	a5,0(a5)
10000650:	0037d713          	srli	a4,a5,0x3
10000654:	943a                	add	s0,s0,a4
10000656:	0077f713          	andi	a4,a5,7
1000065a:	4785                	li	a5,1
1000065c:	00e797b3          	sll	a5,a5,a4
10000660:	0a044703          	lbu	a4,160(s0)
10000664:	8fd9                	or	a5,a5,a4
10000666:	0af40023          	sb	a5,160(s0)
1000066a:	5092                	lw	ra,36(sp)
1000066c:	5402                	lw	s0,32(sp)
1000066e:	44f2                	lw	s1,28(sp)
10000670:	02810113          	addi	sp,sp,40
10000674:	8082                	ret
10000676:	863a                	mv	a2,a4
10000678:	b719                	j	1000057e <ota_svc_data_rcv+0x42>
1000067a:	10000613          	li	a2,256
1000067e:	c836                	sw	a3,16(sp)
10000680:	c63e                	sw	a5,12(sp)
10000682:	c02a                	sw	a0,0(sp)
10000684:	10001097          	auipc	ra,0x10001
10000688:	b22080e7          	jalr	-1246(ra) # 200011a6 <flash_write>
1000068c:	4502                	lw	a0,0(sp)
1000068e:	46c2                	lw	a3,16(sp)
10000690:	47b2                	lw	a5,12(sp)
10000692:	10050513          	addi	a0,a0,256
10000696:	bf95                	j	1000060a <ota_svc_data_rcv+0xce>
10000698:	4582                	lw	a1,0(sp)
1000069a:	863a                	mv	a2,a4
1000069c:	8526                	mv	a0,s1
1000069e:	b74d                	j	10000640 <ota_svc_data_rcv+0x104>

100006a0 <ble_disconnected>:
100006a0:	10004537          	lui	a0,0x10004
100006a4:	1171                	addi	sp,sp,-4
100006a6:	10850513          	addi	a0,a0,264 # 10004108 <__thead_uwrite8+0x194>
100006aa:	c006                	sw	ra,0(sp)
100006ac:	3cb9                	jal	1000010a <log_printf>
100006ae:	701000ef          	jal	100015ae <ble_adv_enable>
100006b2:	4082                	lw	ra,0(sp)
100006b4:	0111                	addi	sp,sp,4
100006b6:	1260106f          	j	100017dc <app_sleep_enable>

100006ba <ble_periph_init>:
100006ba:	c519                	beqz	a0,100006c8 <ble_periph_init+0xe>
100006bc:	85aa                	mv	a1,a0
100006be:	10004537          	lui	a0,0x10004
100006c2:	12c50513          	addi	a0,a0,300 # 1000412c <__thead_uwrite8+0x1b8>
100006c6:	b491                	j	1000010a <log_printf>
100006c8:	1101                	addi	sp,sp,-32
100006ca:	ce06                	sw	ra,28(sp)
100006cc:	cc22                	sw	s0,24(sp)
100006ce:	f0007097          	auipc	ra,0xf0007
100006d2:	046080e7          	jalr	70(ra) # 7714 <bt_gatt_init>
100006d6:	10004537          	lui	a0,0x10004
100006da:	14c50513          	addi	a0,a0,332 # 1000414c <__thead_uwrite8+0x1d8>
100006de:	10004437          	lui	s0,0x10004
100006e2:	3425                	jal	1000010a <log_printf>
100006e4:	2e040413          	addi	s0,s0,736 # 100042e0 <__thead_uwrite8+0x36c>
100006e8:	00840513          	addi	a0,s0,8
100006ec:	71f000ef          	jal	1000160a <ble_user_service_add>
100006f0:	01040513          	addi	a0,s0,16
100006f4:	717000ef          	jal	1000160a <ble_user_service_add>
100006f8:	20001537          	lui	a0,0x20001
100006fc:	a0050513          	addi	a0,a0,-1536 # 20000a00 <ble_conn_callbacks>
10000700:	789000ef          	jal	10001688 <ble_event_callback>
10000704:	f0002097          	auipc	ra,0xf0002
10000708:	f2e080e7          	jalr	-210(ra) # 2632 <ll_adv_reset>
1000070c:	d8e2c7b7          	lui	a5,0xd8e2c
10000710:	33478793          	addi	a5,a5,820 # d8e2c334 <__StackTop+0xb8e28334>
10000714:	c03e                	sw	a5,0(sp)
10000716:	6789                	lui	a5,0x2
10000718:	05578793          	addi	a5,a5,85 # 2055 <aes_encrypt+0x17>
1000071c:	850a                	mv	a0,sp
1000071e:	00f11223          	sh	a5,4(sp)
10000722:	63b000ef          	jal	1000155c <ble_set_adv_addr>
10000726:	01840513          	addi	a0,s0,24
1000072a:	4589                	li	a1,2
1000072c:	697000ef          	jal	100015c2 <ble_set_adv_data>
10000730:	458d                	li	a1,3
10000732:	02840513          	addi	a0,s0,40
10000736:	69f000ef          	jal	100015d4 <ble_set_scan_rsp_data>
1000073a:	00a007b7          	lui	a5,0xa00
1000073e:	0a078793          	addi	a5,a5,160 # a000a0 <__FLASH_SIZE+0x9c00a0>
10000742:	0028                	addi	a0,sp,8
10000744:	00011a23          	sh	zero,20(sp)
10000748:	c43e                	sw	a5,8(sp)
1000074a:	479d                	li	a5,7
1000074c:	00f10aa3          	sb	a5,21(sp)
10000750:	c602                	sw	zero,12(sp)
10000752:	c802                	sw	zero,16(sp)
10000754:	00010b23          	sb	zero,22(sp)
10000758:	613000ef          	jal	1000156a <ble_set_adv_param>
1000075c:	653000ef          	jal	100015ae <ble_adv_enable>
10000760:	10004537          	lui	a0,0x10004
10000764:	16450513          	addi	a0,a0,356 # 10004164 <__thead_uwrite8+0x1f0>
10000768:	324d                	jal	1000010a <log_printf>
1000076a:	40f2                	lw	ra,28(sp)
1000076c:	4462                	lw	s0,24(sp)
1000076e:	6105                	addi	sp,sp,32
10000770:	8082                	ret

10000772 <ota_svc_indication.constprop.0>:
10000772:	fdc10113          	addi	sp,sp,-36
10000776:	ce22                	sw	s0,28(sp)
10000778:	cc26                	sw	s1,24(sp)
1000077a:	842a                	mv	s0,a0
1000077c:	84ae                	mv	s1,a1
1000077e:	4661                	li	a2,24
10000780:	4581                	li	a1,0
10000782:	850a                	mv	a0,sp
10000784:	d006                	sw	ra,32(sp)
10000786:	f000c097          	auipc	ra,0xf000c
1000078a:	246080e7          	jalr	582(ra) # c9cc <memset>
1000078e:	100047b7          	lui	a5,0x10004
10000792:	35c78793          	addi	a5,a5,860 # 1000435c <attr_user_ble_ota_service+0x3c>
10000796:	c23e                	sw	a5,4(sp)
10000798:	858a                	mv	a1,sp
1000079a:	47c9                	li	a5,18
1000079c:	8522                	mv	a0,s0
1000079e:	c826                	sw	s1,16(sp)
100007a0:	00f11a23          	sh	a5,20(sp)
100007a4:	f0007097          	auipc	ra,0xf0007
100007a8:	5aa080e7          	jalr	1450(ra) # 7d4e <bt_gatt_indicate>
100007ac:	200027b7          	lui	a5,0x20002
100007b0:	52878793          	addi	a5,a5,1320 # 20002528 <wdalignbuf>
100007b4:	0c07d703          	lhu	a4,192(a5)
100007b8:	5082                	lw	ra,32(sp)
100007ba:	4472                	lw	s0,28(sp)
100007bc:	0705                	addi	a4,a4,1
100007be:	0ce79023          	sh	a4,192(a5)
100007c2:	44e2                	lw	s1,24(sp)
100007c4:	02410113          	addi	sp,sp,36
100007c8:	8082                	ret

100007ca <ota_svc_ctrl_rcv>:
100007ca:	fcc10113          	addi	sp,sp,-52
100007ce:	d622                	sw	s0,44(sp)
100007d0:	d426                	sw	s1,40(sp)
100007d2:	d806                	sw	ra,48(sp)
100007d4:	00064583          	lbu	a1,0(a2)
100007d8:	c02a                	sw	a0,0(sp)
100007da:	10004537          	lui	a0,0x10004
100007de:	18850513          	addi	a0,a0,392 # 10004188 <__thead_uwrite8+0x214>
100007e2:	84b2                	mv	s1,a2
100007e4:	c236                	sw	a3,4(sp)
100007e6:	4401                	li	s0,0
100007e8:	320d                	jal	1000010a <log_printf>
100007ea:	4792                	lw	a5,4(sp)
100007ec:	02f46763          	bltu	s0,a5,1000081a <ota_svc_ctrl_rcv+0x50>
100007f0:	10004537          	lui	a0,0x10004
100007f4:	19c50513          	addi	a0,a0,412 # 1000419c <__thead_uwrite8+0x228>
100007f8:	3a09                	jal	1000010a <log_printf>
100007fa:	0004c703          	lbu	a4,0(s1)
100007fe:	4699                	li	a3,6
10000800:	177d                	addi	a4,a4,-1
10000802:	0ff77713          	zext.b	a4,a4
10000806:	04e6ec63          	bltu	a3,a4,1000085e <ota_svc_ctrl_rcv+0x94>
1000080a:	100046b7          	lui	a3,0x10004
1000080e:	070a                	slli	a4,a4,0x2
10000810:	2c468693          	addi	a3,a3,708 # 100042c4 <__thead_uwrite8+0x350>
10000814:	9736                	add	a4,a4,a3
10000816:	4318                	lw	a4,0(a4)
10000818:	8702                	jr	a4
1000081a:	008486b3          	add	a3,s1,s0
1000081e:	0006c583          	lbu	a1,0(a3)
10000822:	10004537          	lui	a0,0x10004
10000826:	19850513          	addi	a0,a0,408 # 10004198 <__thead_uwrite8+0x224>
1000082a:	30c5                	jal	1000010a <log_printf>
1000082c:	00140713          	addi	a4,s0,1
10000830:	0ff77413          	zext.b	s0,a4
10000834:	bf5d                	j	100007ea <ota_svc_ctrl_rcv+0x20>
10000836:	0014c703          	lbu	a4,1(s1)
1000083a:	20002437          	lui	s0,0x20002
1000083e:	52840413          	addi	s0,s0,1320 # 20002528 <wdalignbuf>
10000842:	00248593          	addi	a1,s1,2
10000846:	4641                	li	a2,16
10000848:	06940513          	addi	a0,s0,105
1000084c:	e319                	bnez	a4,10000852 <ota_svc_ctrl_rcv+0x88>
1000084e:	02940513          	addi	a0,s0,41
10000852:	f000c097          	auipc	ra,0xf000c
10000856:	162080e7          	jalr	354(ra) # c9b4 <memcpy>
1000085a:	02040423          	sb	zero,40(s0)
1000085e:	00414503          	lbu	a0,4(sp)
10000862:	50c2                	lw	ra,48(sp)
10000864:	5432                	lw	s0,44(sp)
10000866:	54a2                	lw	s1,40(sp)
10000868:	03410113          	addi	sp,sp,52
1000086c:	8082                	ret
1000086e:	20002737          	lui	a4,0x20002
10000872:	52870413          	addi	s0,a4,1320 # 20002528 <wdalignbuf>
10000876:	02844603          	lbu	a2,40(s0)
1000087a:	4685                	li	a3,1
1000087c:	8536                	mv	a0,a3
1000087e:	f275                	bnez	a2,10000862 <ota_svc_ctrl_rcv+0x98>
10000880:	4782                	lw	a5,0(sp)
10000882:	02d40423          	sb	a3,40(s0)
10000886:	1001f6b7          	lui	a3,0x1001f
1000088a:	08d42623          	sw	a3,140(s0)
1000088e:	00548513          	addi	a0,s1,5
10000892:	0af42e23          	sw	a5,188(s0)
10000896:	668030ef          	jal	10003efe <__thead_uread4>
1000089a:	08a42823          	sw	a0,144(s0)
1000089e:	00a4c583          	lbu	a1,10(s1)
100008a2:	0094c603          	lbu	a2,9(s1)
100008a6:	86aa                	mv	a3,a0
100008a8:	05a2                	slli	a1,a1,0x8
100008aa:	8dd1                	or	a1,a1,a2
100008ac:	08b41c23          	sh	a1,152(s0)
100008b0:	84aa                	mv	s1,a0
100008b2:	c085                	beqz	s1,100008d2 <ota_svc_ctrl_rcv+0x108>
100008b4:	1001f537          	lui	a0,0x1001f
100008b8:	9536                	add	a0,a0,a3
100008ba:	8d05                	sub	a0,a0,s1
100008bc:	c62e                	sw	a1,12(sp)
100008be:	c436                	sw	a3,8(sp)
100008c0:	10000097          	auipc	ra,0x10000
100008c4:	71c080e7          	jalr	1820(ra) # 20000fdc <flash_sector_erase>
100008c8:	6605                	lui	a2,0x1
100008ca:	46a2                	lw	a3,8(sp)
100008cc:	45b2                	lw	a1,12(sp)
100008ce:	04966063          	bltu	a2,s1,1000090e <ota_svc_ctrl_rcv+0x144>
100008d2:	10004537          	lui	a0,0x10004
100008d6:	1a050513          	addi	a0,a0,416 # 100041a0 <__thead_uwrite8+0x22c>
100008da:	831ff0ef          	jal	1000010a <log_printf>
100008de:	09042603          	lw	a2,144(s0)
100008e2:	08c42583          	lw	a1,140(s0)
100008e6:	10004537          	lui	a0,0x10004
100008ea:	1c050513          	addi	a0,a0,448 # 100041c0 <__thead_uwrite8+0x24c>
100008ee:	81dff0ef          	jal	1000010a <log_printf>
100008f2:	10004537          	lui	a0,0x10004
100008f6:	4581                	li	a1,0
100008f8:	1d850513          	addi	a0,a0,472 # 100041d8 <__thead_uwrite8+0x264>
100008fc:	80fff0ef          	jal	1000010a <log_printf>
10000900:	478d                	li	a5,3
10000902:	4502                	lw	a0,0(sp)
10000904:	080c                	addi	a1,sp,16
10000906:	00f11823          	sh	a5,16(sp)
1000090a:	35a5                	jal	10000772 <ota_svc_indication.constprop.0>
1000090c:	bf89                	j	1000085e <ota_svc_ctrl_rcv+0x94>
1000090e:	8c91                	sub	s1,s1,a2
10000910:	b74d                	j	100008b2 <ota_svc_ctrl_rcv+0xe8>
10000912:	0024c783          	lbu	a5,2(s1)
10000916:	0014c703          	lbu	a4,1(s1)
1000091a:	20002537          	lui	a0,0x20002
1000091e:	07a2                	slli	a5,a5,0x8
10000920:	52850513          	addi	a0,a0,1320 # 20002528 <wdalignbuf>
10000924:	8fd9                	or	a5,a5,a4
10000926:	08f51e23          	sh	a5,156(a0)
1000092a:	466d                	li	a2,27
1000092c:	4581                	li	a1,0
1000092e:	0a050513          	addi	a0,a0,160
10000932:	f000c097          	auipc	ra,0xf000c
10000936:	09a080e7          	jalr	154(ra) # c9cc <memset>
1000093a:	b715                	j	1000085e <ota_svc_ctrl_rcv+0x94>
1000093c:	200027b7          	lui	a5,0x20002
10000940:	5bc7a783          	lw	a5,1468(a5) # 200025bc <ota_params+0x6c>
10000944:	4705                	li	a4,1
10000946:	00e78223          	sb	a4,4(a5)
1000094a:	4799                	li	a5,6
1000094c:	bf5d                	j	10000902 <ota_svc_ctrl_rcv+0x138>
1000094e:	0014c703          	lbu	a4,1(s1)
10000952:	20002437          	lui	s0,0x20002
10000956:	52840413          	addi	s0,s0,1320 # 20002528 <wdalignbuf>
1000095a:	00177693          	andi	a3,a4,1
1000095e:	ee068ee3          	beqz	a3,1000085a <ota_svc_ctrl_rcv+0x90>
10000962:	8709                	srai	a4,a4,0x2
10000964:	8b05                	andi	a4,a4,1
10000966:	ca3a                	sw	a4,20(sp)
10000968:	10000737          	lui	a4,0x10000
1000096c:	cc3a                	sw	a4,24(sp)
1000096e:	1001f737          	lui	a4,0x1001f
10000972:	ce3a                	sw	a4,28(sp)
10000974:	10001737          	lui	a4,0x10001
10000978:	d03a                	sw	a4,32(sp)
1000097a:	09042703          	lw	a4,144(s0)
1000097e:	acbdf6b7          	lui	a3,0xacbdf
10000982:	faf68693          	addi	a3,a3,-81 # acbdefaf <__StackTop+0x8cbdafaf>
10000986:	1003d537          	lui	a0,0x1003d
1000098a:	c836                	sw	a3,16(sp)
1000098c:	d23a                	sw	a4,36(sp)
1000098e:	10000097          	auipc	ra,0x10000
10000992:	64e080e7          	jalr	1614(ra) # 20000fdc <flash_sector_erase>
10000996:	4661                	li	a2,24
10000998:	080c                	addi	a1,sp,16
1000099a:	1003d537          	lui	a0,0x1003d
1000099e:	10001097          	auipc	ra,0x10001
100009a2:	808080e7          	jalr	-2040(ra) # 200011a6 <flash_write>
100009a6:	0014c783          	lbu	a5,1(s1)
100009aa:	8b89                	andi	a5,a5,2
100009ac:	ea0787e3          	beqz	a5,1000085a <ota_svc_ctrl_rcv+0x90>
100009b0:	400007b7          	lui	a5,0x40000
100009b4:	4705                	li	a4,1
100009b6:	c798                	sw	a4,8(a5)
100009b8:	10500073          	wfi
100009bc:	bd79                	j	1000085a <ota_svc_ctrl_rcv+0x90>

100009be <WDT_Handler>:
100009be:	30200073          	mret

100009c2 <GPIO_Handler>:
100009c2:	30200073          	mret

100009c6 <TIMER0_Handler>:
100009c6:	30200073          	mret

100009ca <TIMER1_Handler>:
100009ca:	30200073          	mret

100009ce <TIMER2_Handler>:
100009ce:	30200073          	mret

100009d2 <TIMER3_Handler>:
100009d2:	30200073          	mret

100009d6 <TIMER4_Handler>:
100009d6:	30200073          	mret

100009da <TIMER5_Handler>:
100009da:	30200073          	mret

100009de <TIMER6_Handler>:
100009de:	30200073          	mret

100009e2 <TIMER7_Handler>:
100009e2:	30200073          	mret
100009e6:	872a                	mv	a4,a0
100009e8:	4781                	li	a5,0
100009ea:	853e                	mv	a0,a5
100009ec:	0785                	addi	a5,a5,1 # 40000001 <__StackTop+0x1fffc001>
100009ee:	00f706b3          	add	a3,a4,a5
100009f2:	fff6c683          	lbu	a3,-1(a3)
100009f6:	faf5                	bnez	a3,100009ea <TIMER7_Handler+0x8>
100009f8:	8082                	ret

100009fa <puts>:
100009fa:	1161                	addi	sp,sp,-8
100009fc:	c206                	sw	ra,4(sp)
100009fe:	c022                	sw	s0,0(sp)
10000a00:	842a                	mv	s0,a0
10000a02:	f000c097          	auipc	ra,0xf000c
10000a06:	f9e080e7          	jalr	-98(ra) # c9a0 <strlen>
10000a0a:	85aa                	mv	a1,a0
10000a0c:	8522                	mv	a0,s0
10000a0e:	edaff0ef          	jal	100000e8 <uart_send.constprop.0>
10000a12:	10004537          	lui	a0,0x10004
10000a16:	25450513          	addi	a0,a0,596 # 10004254 <__thead_uwrite8+0x2e0>
10000a1a:	4585                	li	a1,1
10000a1c:	eccff0ef          	jal	100000e8 <uart_send.constprop.0>
10000a20:	4092                	lw	ra,4(sp)
10000a22:	4402                	lw	s0,0(sp)
10000a24:	4501                	li	a0,0
10000a26:	0121                	addi	sp,sp,8
10000a28:	8082                	ret

10000a2a <clkcal_reset>:
10000a2a:	400007b7          	lui	a5,0x40000
10000a2e:	0707c703          	lbu	a4,112(a5) # 40000070 <__StackTop+0x1fffc070>
10000a32:	00276713          	ori	a4,a4,2
10000a36:	06e78823          	sb	a4,112(a5)
10000a3a:	0b07a703          	lw	a4,176(a5)
10000a3e:	070d                	addi	a4,a4,3 # 10001003 <otp_load_cfg+0x145>
10000a40:	0b07a683          	lw	a3,176(a5)
10000a44:	fee6eee3          	bltu	a3,a4,10000a40 <clkcal_reset+0x16>
10000a48:	0707c703          	lbu	a4,112(a5)
10000a4c:	400006b7          	lui	a3,0x40000
10000a50:	0fd77713          	andi	a4,a4,253
10000a54:	06e78823          	sb	a4,112(a5)
10000a58:	0b07a783          	lw	a5,176(a5)
10000a5c:	078d                	addi	a5,a5,3
10000a5e:	0b06a703          	lw	a4,176(a3) # 400000b0 <__StackTop+0x1fffc0b0>
10000a62:	fef76ee3          	bltu	a4,a5,10000a5e <clkcal_reset+0x34>
10000a66:	8082                	ret

10000a68 <main>:
10000a68:	7139                	addi	sp,sp,-64
10000a6a:	de06                	sw	ra,60(sp)
10000a6c:	dc22                	sw	s0,56(sp)
10000a6e:	da26                	sw	s1,52(sp)
10000a70:	40010737          	lui	a4,0x40010
10000a74:	02800793          	li	a5,40
10000a78:	20f70423          	sb	a5,520(a4) # 40010208 <__StackTop+0x2000c208>
10000a7c:	47a5                	li	a5,9
10000a7e:	20f704a3          	sb	a5,521(a4)
10000a82:	40000693          	li	a3,1024
10000a86:	40000737          	lui	a4,0x40000
10000a8a:	c714                	sw	a3,8(a4)
10000a8c:	c002                	sw	zero,0(sp)
10000a8e:	4702                	lw	a4,0(sp)
10000a90:	1ee7d863          	bge	a5,a4,10000c80 <main+0x218>
10000a94:	400006b7          	lui	a3,0x40000
10000a98:	0006a423          	sw	zero,8(a3) # 40000008 <__StackTop+0x1fffc008>
10000a9c:	52dc                	lw	a5,36(a3)
10000a9e:	4709                	li	a4,2
10000aa0:	83a9                	srli	a5,a5,0xa
10000aa2:	8b8d                	andi	a5,a5,3
10000aa4:	1ee79263          	bne	a5,a4,10000c88 <main+0x220>
10000aa8:	02dc7737          	lui	a4,0x2dc7
10000aac:	c0070713          	addi	a4,a4,-1024 # 2dc6c00 <__FLASH_SIZE+0x2d86c00>
10000ab0:	52dc                	lw	a5,36(a3)
10000ab2:	4621                	li	a2,8
10000ab4:	410017b7          	lui	a5,0x41001
10000ab8:	00c7c683          	lbu	a3,12(a5) # 4100100c <__StackTop+0x20ffd00c>
10000abc:	65c1                	lui	a1,0x10
10000abe:	10004537          	lui	a0,0x10004
10000ac2:	f806e693          	ori	a3,a3,-128
10000ac6:	00d78623          	sb	a3,12(a5)
10000aca:	66f1                	lui	a3,0x1c
10000acc:	20068693          	addi	a3,a3,512 # 1c200 <memset+0xf834>
10000ad0:	02d75733          	divu	a4,a4,a3
10000ad4:	e08016b7          	lui	a3,0xe0801
10000ad8:	05a1                	addi	a1,a1,8 # 10008 <memset+0x363c>
10000ada:	1f050513          	addi	a0,a0,496 # 100041f0 <__thead_uwrite8+0x27c>
10000ade:	4481                	li	s1,0
10000ae0:	8311                	srli	a4,a4,0x4
10000ae2:	0ff77713          	zext.b	a4,a4
10000ae6:	00e78023          	sb	a4,0(a5)
10000aea:	00078223          	sb	zero,4(a5)
10000aee:	0c078023          	sb	zero,192(a5)
10000af2:	00c7c703          	lbu	a4,12(a5)
10000af6:	07f77713          	andi	a4,a4,127
10000afa:	00e78623          	sb	a4,12(a5)
10000afe:	00c7c703          	lbu	a4,12(a5)
10000b02:	0f777713          	andi	a4,a4,247
10000b06:	00e78623          	sb	a4,12(a5)
10000b0a:	00c7c703          	lbu	a4,12(a5)
10000b0e:	00376713          	ori	a4,a4,3
10000b12:	00e78623          	sb	a4,12(a5)
10000b16:	00c7c703          	lbu	a4,12(a5)
10000b1a:	0fb77713          	andi	a4,a4,251
10000b1e:	00e78623          	sb	a4,12(a5)
10000b22:	0047c703          	lbu	a4,4(a5)
10000b26:	9b79                	andi	a4,a4,-2
10000b28:	00e78223          	sb	a4,4(a5)
10000b2c:	0047c703          	lbu	a4,4(a5)
10000b30:	9b75                	andi	a4,a4,-3
10000b32:	00e78223          	sb	a4,4(a5)
10000b36:	0087c703          	lbu	a4,8(a5)
10000b3a:	00176713          	ori	a4,a4,1
10000b3e:	00e78423          	sb	a4,8(a5)
10000b42:	0087c703          	lbu	a4,8(a5)
10000b46:	03f77713          	andi	a4,a4,63
10000b4a:	04076713          	ori	a4,a4,64
10000b4e:	00e78423          	sb	a4,8(a5)
10000b52:	e08007b7          	lui	a5,0xe0800
10000b56:	43dc                	lw	a5,4(a5)
10000b58:	0ff00713          	li	a4,255
10000b5c:	83d5                	srli	a5,a5,0x15
10000b5e:	8bbd                	andi	a5,a5,15
10000b60:	8e1d                	sub	a2,a2,a5
10000b62:	0636c783          	lbu	a5,99(a3) # e0801063 <__StackTop+0xc07fd063>
10000b66:	00c71733          	sll	a4,a4,a2
10000b6a:	fff74713          	not	a4,a4
10000b6e:	8ff9                	and	a5,a5,a4
10000b70:	470d                	li	a4,3
10000b72:	00c71733          	sll	a4,a4,a2
10000b76:	8fd9                	or	a5,a5,a4
10000b78:	0ff7f793          	zext.b	a5,a5
10000b7c:	06f681a3          	sb	a5,99(a3)
10000b80:	0616c783          	lbu	a5,97(a3)
10000b84:	0017e793          	ori	a5,a5,1
10000b88:	06f680a3          	sb	a5,97(a3)
10000b8c:	d7eff0ef          	jal	1000010a <log_printf>
10000b90:	202505b7          	lui	a1,0x20250
10000b94:	10004537          	lui	a0,0x10004
10000b98:	62758593          	addi	a1,a1,1575 # 20250627 <__StackTop+0x24c627>
10000b9c:	20450513          	addi	a0,a0,516 # 10004204 <__thead_uwrite8+0x290>
10000ba0:	d6aff0ef          	jal	1000010a <log_printf>
10000ba4:	10004537          	lui	a0,0x10004
10000ba8:	21450513          	addi	a0,a0,532 # 10004214 <__thead_uwrite8+0x2a0>
10000bac:	d5eff0ef          	jal	1000010a <log_printf>
10000bb0:	087000ef          	jal	10001436 <VTIMER_Init>
10000bb4:	20001537          	lui	a0,0x20001
10000bb8:	a2850513          	addi	a0,a0,-1496 # 20000a28 <ble_mac_addr>
10000bbc:	1a1000ef          	jal	1000155c <ble_set_adv_addr>
10000bc0:	10002537          	lui	a0,0x10002
10000bc4:	01c50513          	addi	a0,a0,28 # 1000201c <bt_buf_init_ext>
10000bc8:	502010ef          	jal	100020ca <bt_base_init>
10000bcc:	20001537          	lui	a0,0x20001
10000bd0:	4ce50513          	addi	a0,a0,1230 # 200014ce <sys_timeout_tick_get_hook>
10000bd4:	f000c097          	auipc	ra,0xf000c
10000bd8:	a98080e7          	jalr	-1384(ra) # c66c <sys_timeout_init>
10000bdc:	2bf000ef          	jal	1000169a <ble_host_init>
10000be0:	10000537          	lui	a0,0x10000
10000be4:	6ba50513          	addi	a0,a0,1722 # 100006ba <ble_periph_init>
10000be8:	f0009097          	auipc	ra,0xf0009
10000bec:	952080e7          	jalr	-1710(ra) # 953a <bt_enable>
10000bf0:	475000ef          	jal	10001864 <ble_sleep_init>
10000bf4:	400007b7          	lui	a5,0x40000
10000bf8:	0d800713          	li	a4,216
10000bfc:	10e7a023          	sw	a4,256(a5) # 40000100 <__StackTop+0x1fffc100>
10000c00:	33f000ef          	jal	1000173e <ble_host_work_polling>
10000c04:	20002437          	lui	s0,0x20002
10000c08:	349000ef          	jal	10001750 <ble_sleep_check>
10000c0c:	52840413          	addi	s0,s0,1320 # 20002528 <wdalignbuf>
10000c10:	420007b7          	lui	a5,0x42000
10000c14:	1047a683          	lw	a3,260(a5) # 42000104 <__StackTop+0x21ffc104>
10000c18:	0c442703          	lw	a4,196(s0)
10000c1c:	0c842783          	lw	a5,200(s0)
10000c20:	0cc42603          	lw	a2,204(s0)
10000c24:	06e6e763          	bltu	a3,a4,10000c92 <main+0x22a>
10000c28:	40e68733          	sub	a4,a3,a4
10000c2c:	97ba                	add	a5,a5,a4
10000c2e:	00e7b733          	sltu	a4,a5,a4
10000c32:	0cd42223          	sw	a3,196(s0)
10000c36:	02844683          	lbu	a3,40(s0)
10000c3a:	9732                	add	a4,a4,a2
10000c3c:	0cf42423          	sw	a5,200(s0)
10000c40:	0ce42623          	sw	a4,204(s0)
10000c44:	e2c9                	bnez	a3,10000cc6 <main+0x25e>
10000c46:	e319                	bnez	a4,10000c4c <main+0x1e4>
10000c48:	0497ea63          	bltu	a5,s1,10000c9c <main+0x234>
10000c4c:	409786b3          	sub	a3,a5,s1
10000c50:	00d7b633          	sltu	a2,a5,a3
10000c54:	00c71863          	bne	a4,a2,10000c64 <main+0x1fc>
10000c58:	000f4737          	lui	a4,0xf4
10000c5c:	24070713          	addi	a4,a4,576 # f4240 <__FLASH_SIZE+0xb4240>
10000c60:	04d77e63          	bgeu	a4,a3,10000cbc <main+0x254>
10000c64:	84be                	mv	s1,a5
10000c66:	0d042783          	lw	a5,208(s0)
10000c6a:	10004537          	lui	a0,0x10004
10000c6e:	85a6                	mv	a1,s1
10000c70:	0785                	addi	a5,a5,1
10000c72:	22450513          	addi	a0,a0,548 # 10004224 <__thead_uwrite8+0x2b0>
10000c76:	0cf42823          	sw	a5,208(s0)
10000c7a:	c90ff0ef          	jal	1000010a <log_printf>
10000c7e:	a83d                	j	10000cbc <main+0x254>
10000c80:	4702                	lw	a4,0(sp)
10000c82:	0705                	addi	a4,a4,1
10000c84:	c03a                	sw	a4,0(sp)
10000c86:	b521                	j	10000a8e <main+0x26>
10000c88:	016e3737          	lui	a4,0x16e3
10000c8c:	60070713          	addi	a4,a4,1536 # 16e3600 <__FLASH_SIZE+0x16a3600>
10000c90:	b505                	j	10000ab0 <main+0x48>
10000c92:	fff68593          	addi	a1,a3,-1
10000c96:	40e58733          	sub	a4,a1,a4
10000c9a:	bf49                	j	10000c2c <main+0x1c4>
10000c9c:	fff78713          	addi	a4,a5,-1
10000ca0:	40970633          	sub	a2,a4,s1
10000ca4:	00f036b3          	snez	a3,a5
10000ca8:	00c73733          	sltu	a4,a4,a2
10000cac:	fae69ce3          	bne	a3,a4,10000c64 <main+0x1fc>
10000cb0:	000f4737          	lui	a4,0xf4
10000cb4:	24070713          	addi	a4,a4,576 # f4240 <__FLASH_SIZE+0xb4240>
10000cb8:	fac766e3          	bltu	a4,a2,10000c64 <main+0x1fc>
10000cbc:	0d442783          	lw	a5,212(s0)
10000cc0:	0785                	addi	a5,a5,1
10000cc2:	0cf42a23          	sw	a5,212(s0)
10000cc6:	0d042703          	lw	a4,208(s0)
10000cca:	4789                	li	a5,2
10000ccc:	00f71463          	bne	a4,a5,10000cd4 <main+0x26c>
10000cd0:	30d000ef          	jal	100017dc <app_sleep_enable>
10000cd4:	5048                	lw	a0,36(s0)
10000cd6:	dd19                	beqz	a0,10000bf4 <main+0x18c>
10000cd8:	004c                	addi	a1,sp,4
10000cda:	f0006097          	auipc	ra,0xf0006
10000cde:	52e080e7          	jalr	1326(ra) # 7208 <bt_conn_get_info>
10000ce2:	01815703          	lhu	a4,24(sp)
10000ce6:	31f00793          	li	a5,799
10000cea:	02e7eb63          	bltu	a5,a4,10000d20 <main+0x2b8>
10000cee:	2fb000ef          	jal	100017e8 <app_sleep_disable>
10000cf2:	0d445783          	lhu	a5,212(s0)
10000cf6:	ee079fe3          	bnez	a5,10000bf4 <main+0x18c>
10000cfa:	5048                	lw	a0,36(s0)
10000cfc:	32000613          	li	a2,800
10000d00:	85b2                	mv	a1,a2
10000d02:	3e800713          	li	a4,1000
10000d06:	4681                	li	a3,0
10000d08:	0df000ef          	jal	100015e6 <ble_update_conn_param>
10000d0c:	85aa                	mv	a1,a0
10000d0e:	ee0503e3          	beqz	a0,10000bf4 <main+0x18c>
10000d12:	10004537          	lui	a0,0x10004
10000d16:	23450513          	addi	a0,a0,564 # 10004234 <__thead_uwrite8+0x2c0>
10000d1a:	bf0ff0ef          	jal	1000010a <log_printf>
10000d1e:	bdd9                	j	10000bf4 <main+0x18c>
10000d20:	2bd000ef          	jal	100017dc <app_sleep_enable>
10000d24:	bdc1                	j	10000bf4 <main+0x18c>

10000d26 <Default_Handler>:
10000d26:	400007b7          	lui	a5,0x40000
10000d2a:	0f800713          	li	a4,248
10000d2e:	10e7a023          	sw	a4,256(a5) # 40000100 <__StackTop+0x1fffc100>
10000d32:	a001                	j	10000d32 <Default_Handler+0xc>

10000d34 <clic_init>:
10000d34:	e0800737          	lui	a4,0xe0800
10000d38:	435c                	lw	a5,4(a4)
10000d3a:	83d1                	srli	a5,a5,0x14
10000d3c:	8bf9                	andi	a5,a5,30
10000d3e:	00f70023          	sb	a5,0(a4) # e0800000 <__StackTop+0xc07fc000>
10000d42:	4701                	li	a4,0
10000d44:	e0800537          	lui	a0,0xe0800
10000d48:	6585                	lui	a1,0x1
10000d4a:	4685                	li	a3,1
10000d4c:	03000613          	li	a2,48
10000d50:	00271793          	slli	a5,a4,0x2
10000d54:	97aa                	add	a5,a5,a0
10000d56:	97ae                	add	a5,a5,a1
10000d58:	00d78023          	sb	a3,0(a5)
10000d5c:	000780a3          	sb	zero,1(a5)
10000d60:	00d78123          	sb	a3,2(a5)
10000d64:	0705                	addi	a4,a4,1
10000d66:	fec715e3          	bne	a4,a2,10000d50 <clic_init+0x1c>
10000d6a:	8082                	ret

10000d6c <ram_init>:
10000d6c:	1171                	addi	sp,sp,-4
10000d6e:	c006                	sw	ra,0(sp)
10000d70:	10004737          	lui	a4,0x10004
10000d74:	62c70713          	addi	a4,a4,1580 # 1000462c <__exidx_end>
10000d78:	100047b7          	lui	a5,0x10004
10000d7c:	63878793          	addi	a5,a5,1592 # 10004638 <__copy_table_end__>
10000d80:	86ba                	mv	a3,a4
10000d82:	853e                	mv	a0,a5
10000d84:	04f76563          	bltu	a4,a5,10000dce <ram_init+0x62>
10000d88:	10004737          	lui	a4,0x10004
10000d8c:	63870713          	addi	a4,a4,1592 # 10004638 <__copy_table_end__>
10000d90:	100047b7          	lui	a5,0x10004
10000d94:	64078793          	addi	a5,a5,1600 # 10004640 <__etext>
10000d98:	06f77063          	bgeu	a4,a5,10000df8 <ram_init+0x8c>
10000d9c:	86ba                	mv	a3,a4
10000d9e:	100045b7          	lui	a1,0x10004
10000da2:	63f58593          	addi	a1,a1,1599 # 1000463f <__copy_table_end__+0x7>
10000da6:	8d99                	sub	a1,a1,a4
10000da8:	99e1                	andi	a1,a1,-8
10000daa:	05a1                	addi	a1,a1,8
10000dac:	95ba                	add	a1,a1,a4
10000dae:	a089                	j	10000df0 <ram_init+0x84>
10000db0:	00279613          	slli	a2,a5,0x2
10000db4:	4298                	lw	a4,0(a3)
10000db6:	9732                	add	a4,a4,a2
10000db8:	430c                	lw	a1,0(a4)
10000dba:	42d8                	lw	a4,4(a3)
10000dbc:	9732                	add	a4,a4,a2
10000dbe:	c30c                	sw	a1,0(a4)
10000dc0:	0785                	addi	a5,a5,1
10000dc2:	4698                	lw	a4,8(a3)
10000dc4:	fee7e6e3          	bltu	a5,a4,10000db0 <ram_init+0x44>
10000dc8:	06b1                	addi	a3,a3,12
10000dca:	faa6ffe3          	bgeu	a3,a0,10000d88 <ram_init+0x1c>
10000dce:	4698                	lw	a4,8(a3)
10000dd0:	4781                	li	a5,0
10000dd2:	ff79                	bnez	a4,10000db0 <ram_init+0x44>
10000dd4:	bfd5                	j	10000dc8 <ram_init+0x5c>
10000dd6:	4298                	lw	a4,0(a3)
10000dd8:	00279613          	slli	a2,a5,0x2
10000ddc:	9732                	add	a4,a4,a2
10000dde:	00072023          	sw	zero,0(a4)
10000de2:	0785                	addi	a5,a5,1
10000de4:	42d8                	lw	a4,4(a3)
10000de6:	fee7e8e3          	bltu	a5,a4,10000dd6 <ram_init+0x6a>
10000dea:	06a1                	addi	a3,a3,8
10000dec:	00b68663          	beq	a3,a1,10000df8 <ram_init+0x8c>
10000df0:	42d8                	lw	a4,4(a3)
10000df2:	4781                	li	a5,0
10000df4:	f36d                	bnez	a4,10000dd6 <ram_init+0x6a>
10000df6:	bfd5                	j	10000dea <ram_init+0x7e>
10000df8:	f000c097          	auipc	ra,0xf000c
10000dfc:	a4e080e7          	jalr	-1458(ra) # c846 <t1100_rom_init>
10000e00:	4082                	lw	ra,0(sp)
10000e02:	0111                	addi	sp,sp,4
10000e04:	8082                	ret

10000e06 <sys_entry>:
10000e06:	400007b7          	lui	a5,0x40000
10000e0a:	4398                	lw	a4,0(a5)
10000e0c:	6785                	lui	a5,0x1
10000e0e:	10178793          	addi	a5,a5,257 # 1101 <__STACK_SIZE+0xd01>
10000e12:	00f70363          	beq	a4,a5,10000e18 <sys_entry+0x12>
10000e16:	8082                	ret
10000e18:	1141                	addi	sp,sp,-16
10000e1a:	c606                	sw	ra,12(sp)
10000e1c:	c422                	sw	s0,8(sp)
10000e1e:	c226                	sw	s1,4(sp)
10000e20:	37b1                	jal	10000d6c <ram_init>
10000e22:	3f09                	jal	10000d34 <clic_init>
10000e24:	40080437          	lui	s0,0x40080
10000e28:	4785                	li	a5,1
10000e2a:	c83c                	sw	a5,80(s0)
10000e2c:	42000737          	lui	a4,0x42000
10000e30:	6785                	lui	a5,0x1
10000e32:	70178793          	addi	a5,a5,1793 # 1701 <__STACK_SIZE+0x1301>
10000e36:	10f72023          	sw	a5,256(a4) # 42000100 <__StackTop+0x21ffc100>
10000e3a:	2051                	jal	10000ebe <otp_load_cfg>
10000e3c:	218d                	jal	1000129e <otp_apply_cfg>
10000e3e:	766010ef          	jal	100025a4 <PMU_OnChip_Init>
10000e42:	400004b7          	lui	s1,0x40000
10000e46:	50dc                	lw	a5,36(s1)
10000e48:	001007b7          	lui	a5,0x100
10000e4c:	40078793          	addi	a5,a5,1024 # 100400 <__FLASH_SIZE+0xc0400>
10000e50:	d0dc                	sw	a5,36(s1)
10000e52:	42002737          	lui	a4,0x42002
10000e56:	431c                	lw	a5,0(a4)
10000e58:	9bf5                	andi	a5,a5,-3
10000e5a:	c31c                	sw	a5,0(a4)
10000e5c:	11042783          	lw	a5,272(s0) # 40080110 <__StackTop+0x2007c110>
10000e60:	6721                	lui	a4,0x8
10000e62:	80070713          	addi	a4,a4,-2048 # 7800 <bt_gatt_attr_get_handle+0x12>
10000e66:	8fd9                	or	a5,a5,a4
10000e68:	10f42823          	sw	a5,272(s0)
10000e6c:	00fcd537          	lui	a0,0xfcd
10000e70:	bff50513          	addi	a0,a0,-1025 # fccbff <__FLASH_SIZE+0xf8cbff>
10000e74:	10000097          	auipc	ra,0x10000
10000e78:	3f6080e7          	jalr	1014(ra) # 2000126a <poweron_unused_gpio_mask_parse_and_set>
10000e7c:	12044783          	lbu	a5,288(s0)
10000e80:	0047e793          	ori	a5,a5,4
10000e84:	12f40023          	sb	a5,288(s0)
10000e88:	40000793          	li	a5,1024
10000e8c:	c49c                	sw	a5,8(s1)
10000e8e:	c002                	sw	zero,0(sp)
10000e90:	4702                	lw	a4,0(sp)
10000e92:	47a5                	li	a5,9
10000e94:	00e7c963          	blt	a5,a4,10000ea6 <sys_entry+0xa0>
10000e98:	873e                	mv	a4,a5
10000e9a:	4782                	lw	a5,0(sp)
10000e9c:	0785                	addi	a5,a5,1
10000e9e:	c03e                	sw	a5,0(sp)
10000ea0:	4782                	lw	a5,0(sp)
10000ea2:	fef75ce3          	bge	a4,a5,10000e9a <sys_entry+0x94>
10000ea6:	400007b7          	lui	a5,0x40000
10000eaa:	0007a423          	sw	zero,8(a5) # 40000008 <__StackTop+0x1fffc008>
10000eae:	300467f3          	csrrsi	a5,mstatus,8
10000eb2:	3e5d                	jal	10000a68 <main>
10000eb4:	40b2                	lw	ra,12(sp)
10000eb6:	4422                	lw	s0,8(sp)
10000eb8:	4492                	lw	s1,4(sp)
10000eba:	0141                	addi	sp,sp,16
10000ebc:	8082                	ret

10000ebe <otp_load_cfg>:
10000ebe:	1f8046b7          	lui	a3,0x1f804
10000ec2:	f3068713          	addi	a4,a3,-208 # 1f803f30 <__etext+0xf7ff8f0>
10000ec6:	200027b7          	lui	a5,0x20002
10000eca:	62878793          	addi	a5,a5,1576 # 20002628 <g_otp_cfg>
10000ece:	f7868693          	addi	a3,a3,-136
10000ed2:	00072383          	lw	t2,0(a4)
10000ed6:	00472283          	lw	t0,4(a4)
10000eda:	00872303          	lw	t1,8(a4)
10000ede:	4748                	lw	a0,12(a4)
10000ee0:	4b0c                	lw	a1,16(a4)
10000ee2:	4b50                	lw	a2,20(a4)
10000ee4:	0077a023          	sw	t2,0(a5)
10000ee8:	0057a223          	sw	t0,4(a5)
10000eec:	0067a423          	sw	t1,8(a5)
10000ef0:	c7c8                	sw	a0,12(a5)
10000ef2:	cb8c                	sw	a1,16(a5)
10000ef4:	cbd0                	sw	a2,20(a5)
10000ef6:	0761                	addi	a4,a4,24
10000ef8:	07e1                	addi	a5,a5,24
10000efa:	fcd71ce3          	bne	a4,a3,10000ed2 <otp_load_cfg+0x14>
10000efe:	200027b7          	lui	a5,0x20002
10000f02:	6287c703          	lbu	a4,1576(a5) # 20002628 <g_otp_cfg>
10000f06:	0ff00793          	li	a5,255
10000f0a:	00f71d63          	bne	a4,a5,10000f24 <otp_load_cfg+0x66>
10000f0e:	20002737          	lui	a4,0x20002
10000f12:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10000f16:	00074783          	lbu	a5,0(a4)
10000f1a:	9bc1                	andi	a5,a5,-16
10000f1c:	00a7e793          	ori	a5,a5,10
10000f20:	00f70023          	sb	a5,0(a4)
10000f24:	200027b7          	lui	a5,0x20002
10000f28:	62a7c703          	lbu	a4,1578(a5) # 2000262a <g_otp_cfg+0x2>
10000f2c:	0ff00793          	li	a5,255
10000f30:	10f70f63          	beq	a4,a5,1000104e <otp_load_cfg+0x190>
10000f34:	200027b7          	lui	a5,0x20002
10000f38:	62c7d703          	lhu	a4,1580(a5) # 2000262c <g_otp_cfg+0x4>
10000f3c:	67c1                	lui	a5,0x10
10000f3e:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000f40:	12f70363          	beq	a4,a5,10001066 <otp_load_cfg+0x1a8>
10000f44:	200027b7          	lui	a5,0x20002
10000f48:	62e7d703          	lhu	a4,1582(a5) # 2000262e <g_otp_cfg+0x6>
10000f4c:	67c1                	lui	a5,0x10
10000f4e:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000f50:	12f70263          	beq	a4,a5,10001074 <otp_load_cfg+0x1b6>
10000f54:	200027b7          	lui	a5,0x20002
10000f58:	6307d703          	lhu	a4,1584(a5) # 20002630 <g_otp_cfg+0x8>
10000f5c:	67c1                	lui	a5,0x10
10000f5e:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000f60:	12f70163          	beq	a4,a5,10001082 <otp_load_cfg+0x1c4>
10000f64:	200027b7          	lui	a5,0x20002
10000f68:	6347a703          	lw	a4,1588(a5) # 20002634 <g_otp_cfg+0xc>
10000f6c:	57fd                	li	a5,-1
10000f6e:	12f70763          	beq	a4,a5,1000109c <otp_load_cfg+0x1de>
10000f72:	200027b7          	lui	a5,0x20002
10000f76:	6387a703          	lw	a4,1592(a5) # 20002638 <g_otp_cfg+0x10>
10000f7a:	57fd                	li	a5,-1
10000f7c:	14f70263          	beq	a4,a5,100010c0 <otp_load_cfg+0x202>
10000f80:	200027b7          	lui	a5,0x20002
10000f84:	63c7a703          	lw	a4,1596(a5) # 2000263c <g_otp_cfg+0x14>
10000f88:	57fd                	li	a5,-1
10000f8a:	14f70d63          	beq	a4,a5,100010e4 <otp_load_cfg+0x226>
10000f8e:	200027b7          	lui	a5,0x20002
10000f92:	6407a703          	lw	a4,1600(a5) # 20002640 <g_otp_cfg+0x18>
10000f96:	57fd                	li	a5,-1
10000f98:	16f70863          	beq	a4,a5,10001108 <otp_load_cfg+0x24a>
10000f9c:	200027b7          	lui	a5,0x20002
10000fa0:	6447a703          	lw	a4,1604(a5) # 20002644 <g_otp_cfg+0x1c>
10000fa4:	57fd                	li	a5,-1
10000fa6:	18f70363          	beq	a4,a5,1000112c <otp_load_cfg+0x26e>
10000faa:	200027b7          	lui	a5,0x20002
10000fae:	6487a703          	lw	a4,1608(a5) # 20002648 <g_otp_cfg+0x20>
10000fb2:	57fd                	li	a5,-1
10000fb4:	18f70e63          	beq	a4,a5,10001150 <otp_load_cfg+0x292>
10000fb8:	200027b7          	lui	a5,0x20002
10000fbc:	64c7a703          	lw	a4,1612(a5) # 2000264c <g_otp_cfg+0x24>
10000fc0:	57fd                	li	a5,-1
10000fc2:	1af70963          	beq	a4,a5,10001174 <otp_load_cfg+0x2b6>
10000fc6:	200027b7          	lui	a5,0x20002
10000fca:	6507a703          	lw	a4,1616(a5) # 20002650 <g_otp_cfg+0x28>
10000fce:	57fd                	li	a5,-1
10000fd0:	1cf70663          	beq	a4,a5,1000119c <otp_load_cfg+0x2de>
10000fd4:	200027b7          	lui	a5,0x20002
10000fd8:	6547d703          	lhu	a4,1620(a5) # 20002654 <g_otp_cfg+0x2c>
10000fdc:	67c1                	lui	a5,0x10
10000fde:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000fe0:	1ef70063          	beq	a4,a5,100011c0 <otp_load_cfg+0x302>
10000fe4:	200027b7          	lui	a5,0x20002
10000fe8:	6587d703          	lhu	a4,1624(a5) # 20002658 <g_otp_cfg+0x30>
10000fec:	67c1                	lui	a5,0x10
10000fee:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10000ff0:	1ef70363          	beq	a4,a5,100011d6 <otp_load_cfg+0x318>
10000ff4:	200027b7          	lui	a5,0x20002
10000ff8:	65a7d703          	lhu	a4,1626(a5) # 2000265a <g_otp_cfg+0x32>
10000ffc:	67c1                	lui	a5,0x10
10000ffe:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10001000:	1ef70663          	beq	a4,a5,100011ec <otp_load_cfg+0x32e>
10001004:	200027b7          	lui	a5,0x20002
10001008:	65c7d703          	lhu	a4,1628(a5) # 2000265c <g_otp_cfg+0x34>
1000100c:	67c1                	lui	a5,0x10
1000100e:	17fd                	addi	a5,a5,-1 # ffff <memset+0x3633>
10001010:	1ef70963          	beq	a4,a5,10001202 <otp_load_cfg+0x344>
10001014:	200027b7          	lui	a5,0x20002
10001018:	6607a703          	lw	a4,1632(a5) # 20002660 <g_otp_cfg+0x38>
1000101c:	57fd                	li	a5,-1
1000101e:	1ef70f63          	beq	a4,a5,1000121c <otp_load_cfg+0x35e>
10001022:	200027b7          	lui	a5,0x20002
10001026:	6647a703          	lw	a4,1636(a5) # 20002664 <g_otp_cfg+0x3c>
1000102a:	57fd                	li	a5,-1
1000102c:	20f70463          	beq	a4,a5,10001234 <otp_load_cfg+0x376>
10001030:	200027b7          	lui	a5,0x20002
10001034:	6687a703          	lw	a4,1640(a5) # 20002668 <g_otp_cfg+0x40>
10001038:	57fd                	li	a5,-1
1000103a:	20f70c63          	beq	a4,a5,10001252 <otp_load_cfg+0x394>
1000103e:	200027b7          	lui	a5,0x20002
10001042:	66c7a703          	lw	a4,1644(a5) # 2000266c <g_otp_cfg+0x44>
10001046:	57fd                	li	a5,-1
10001048:	22f70963          	beq	a4,a5,1000127a <otp_load_cfg+0x3bc>
1000104c:	8082                	ret
1000104e:	20002737          	lui	a4,0x20002
10001052:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10001056:	00274783          	lbu	a5,2(a4)
1000105a:	9bc1                	andi	a5,a5,-16
1000105c:	0037e793          	ori	a5,a5,3
10001060:	00f70123          	sb	a5,2(a4)
10001064:	bdc1                	j	10000f34 <otp_load_cfg+0x76>
10001066:	200027b7          	lui	a5,0x20002
1000106a:	f8d00713          	li	a4,-115
1000106e:	62e78623          	sb	a4,1580(a5) # 2000262c <g_otp_cfg+0x4>
10001072:	bdc9                	j	10000f44 <otp_load_cfg+0x86>
10001074:	200027b7          	lui	a5,0x20002
10001078:	fb700713          	li	a4,-73
1000107c:	62e78723          	sb	a4,1582(a5) # 2000262e <g_otp_cfg+0x6>
10001080:	bdd1                	j	10000f54 <otp_load_cfg+0x96>
10001082:	20002737          	lui	a4,0x20002
10001086:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
1000108a:	00875783          	lhu	a5,8(a4)
1000108e:	c007f793          	andi	a5,a5,-1024
10001092:	1407e793          	ori	a5,a5,320
10001096:	00f71423          	sh	a5,8(a4)
1000109a:	b5e9                	j	10000f64 <otp_load_cfg+0xa6>
1000109c:	20002737          	lui	a4,0x20002
100010a0:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
100010a4:	475c                	lw	a5,12(a4)
100010a6:	76fd                	lui	a3,0xfffff
100010a8:	8ff5                	and	a5,a5,a3
100010aa:	2587e793          	ori	a5,a5,600
100010ae:	fc0106b7          	lui	a3,0xfc010
100010b2:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
100010b4:	8ff5                	and	a5,a5,a3
100010b6:	02ab06b7          	lui	a3,0x2ab0
100010ba:	8fd5                	or	a5,a5,a3
100010bc:	c75c                	sw	a5,12(a4)
100010be:	bd55                	j	10000f72 <otp_load_cfg+0xb4>
100010c0:	20002737          	lui	a4,0x20002
100010c4:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
100010c8:	4b1c                	lw	a5,16(a4)
100010ca:	76fd                	lui	a3,0xfffff
100010cc:	8ff5                	and	a5,a5,a3
100010ce:	0c87e793          	ori	a5,a5,200
100010d2:	fc0106b7          	lui	a3,0xfc010
100010d6:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
100010d8:	8ff5                	and	a5,a5,a3
100010da:	00e406b7          	lui	a3,0xe40
100010de:	8fd5                	or	a5,a5,a3
100010e0:	cb1c                	sw	a5,16(a4)
100010e2:	bd79                	j	10000f80 <otp_load_cfg+0xc2>
100010e4:	20002737          	lui	a4,0x20002
100010e8:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
100010ec:	4b5c                	lw	a5,20(a4)
100010ee:	76fd                	lui	a3,0xfffff
100010f0:	8ff5                	and	a5,a5,a3
100010f2:	4b07e793          	ori	a5,a5,1200
100010f6:	fc0106b7          	lui	a3,0xfc010
100010fa:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
100010fc:	8ff5                	and	a5,a5,a3
100010fe:	02ab06b7          	lui	a3,0x2ab0
10001102:	8fd5                	or	a5,a5,a3
10001104:	cb5c                	sw	a5,20(a4)
10001106:	b561                	j	10000f8e <otp_load_cfg+0xd0>
10001108:	20002737          	lui	a4,0x20002
1000110c:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10001110:	4f1c                	lw	a5,24(a4)
10001112:	76fd                	lui	a3,0xfffff
10001114:	8ff5                	and	a5,a5,a3
10001116:	1907e793          	ori	a5,a5,400
1000111a:	fc0106b7          	lui	a3,0xfc010
1000111e:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001120:	8ff5                	and	a5,a5,a3
10001122:	00e406b7          	lui	a3,0xe40
10001126:	8fd5                	or	a5,a5,a3
10001128:	cf1c                	sw	a5,24(a4)
1000112a:	bd8d                	j	10000f9c <otp_load_cfg+0xde>
1000112c:	20002737          	lui	a4,0x20002
10001130:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10001134:	4f5c                	lw	a5,28(a4)
10001136:	76fd                	lui	a3,0xfffff
10001138:	8ff5                	and	a5,a5,a3
1000113a:	7087e793          	ori	a5,a5,1800
1000113e:	fc0106b7          	lui	a3,0xfc010
10001142:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001144:	8ff5                	and	a5,a5,a3
10001146:	02ab06b7          	lui	a3,0x2ab0
1000114a:	8fd5                	or	a5,a5,a3
1000114c:	cf5c                	sw	a5,28(a4)
1000114e:	bdb1                	j	10000faa <otp_load_cfg+0xec>
10001150:	20002737          	lui	a4,0x20002
10001154:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10001158:	531c                	lw	a5,32(a4)
1000115a:	76fd                	lui	a3,0xfffff
1000115c:	8ff5                	and	a5,a5,a3
1000115e:	2587e793          	ori	a5,a5,600
10001162:	fc0106b7          	lui	a3,0xfc010
10001166:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001168:	8ff5                	and	a5,a5,a3
1000116a:	00e406b7          	lui	a3,0xe40
1000116e:	8fd5                	or	a5,a5,a3
10001170:	d31c                	sw	a5,32(a4)
10001172:	b599                	j	10000fb8 <otp_load_cfg+0xfa>
10001174:	20002737          	lui	a4,0x20002
10001178:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
1000117c:	535c                	lw	a5,36(a4)
1000117e:	76fd                	lui	a3,0xfffff
10001180:	8ff5                	and	a5,a5,a3
10001182:	6685                	lui	a3,0x1
10001184:	96068693          	addi	a3,a3,-1696 # 960 <__STACK_SIZE+0x560>
10001188:	8fd5                	or	a5,a5,a3
1000118a:	fc0106b7          	lui	a3,0xfc010
1000118e:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001190:	8ff5                	and	a5,a5,a3
10001192:	02ab06b7          	lui	a3,0x2ab0
10001196:	8fd5                	or	a5,a5,a3
10001198:	d35c                	sw	a5,36(a4)
1000119a:	b535                	j	10000fc6 <otp_load_cfg+0x108>
1000119c:	20002737          	lui	a4,0x20002
100011a0:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
100011a4:	571c                	lw	a5,40(a4)
100011a6:	76fd                	lui	a3,0xfffff
100011a8:	8ff5                	and	a5,a5,a3
100011aa:	3207e793          	ori	a5,a5,800
100011ae:	fc0106b7          	lui	a3,0xfc010
100011b2:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
100011b4:	8ff5                	and	a5,a5,a3
100011b6:	00e406b7          	lui	a3,0xe40
100011ba:	8fd5                	or	a5,a5,a3
100011bc:	d71c                	sw	a5,40(a4)
100011be:	bd19                	j	10000fd4 <otp_load_cfg+0x116>
100011c0:	200027b7          	lui	a5,0x20002
100011c4:	62878793          	addi	a5,a5,1576 # 20002628 <g_otp_cfg>
100011c8:	02c7d703          	lhu	a4,44(a5)
100011cc:	3ff76713          	ori	a4,a4,1023
100011d0:	02e79623          	sh	a4,44(a5)
100011d4:	bd01                	j	10000fe4 <otp_load_cfg+0x126>
100011d6:	200027b7          	lui	a5,0x20002
100011da:	62878793          	addi	a5,a5,1576 # 20002628 <g_otp_cfg>
100011de:	0307d703          	lhu	a4,48(a5)
100011e2:	76fd                	lui	a3,0xfffff
100011e4:	8f75                	and	a4,a4,a3
100011e6:	02e79823          	sh	a4,48(a5)
100011ea:	b529                	j	10000ff4 <otp_load_cfg+0x136>
100011ec:	200027b7          	lui	a5,0x20002
100011f0:	62878793          	addi	a5,a5,1576 # 20002628 <g_otp_cfg>
100011f4:	0327d703          	lhu	a4,50(a5)
100011f8:	76fd                	lui	a3,0xfffff
100011fa:	8f75                	and	a4,a4,a3
100011fc:	02e79923          	sh	a4,50(a5)
10001200:	b511                	j	10001004 <otp_load_cfg+0x146>
10001202:	20002737          	lui	a4,0x20002
10001206:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
1000120a:	03475783          	lhu	a5,52(a4)
1000120e:	76fd                	lui	a3,0xfffff
10001210:	8ff5                	and	a5,a5,a3
10001212:	40c7e793          	ori	a5,a5,1036
10001216:	02f71a23          	sh	a5,52(a4)
1000121a:	bbed                	j	10001014 <otp_load_cfg+0x156>
1000121c:	20002737          	lui	a4,0x20002
10001220:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10001224:	5f1c                	lw	a5,56(a4)
10001226:	800006b7          	lui	a3,0x80000
1000122a:	8ff5                	and	a5,a5,a3
1000122c:	0357e793          	ori	a5,a5,53
10001230:	df1c                	sw	a5,56(a4)
10001232:	bbc5                	j	10001022 <otp_load_cfg+0x164>
10001234:	20002737          	lui	a4,0x20002
10001238:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
1000123c:	5f5c                	lw	a5,60(a4)
1000123e:	800006b7          	lui	a3,0x80000
10001242:	8ff5                	and	a5,a5,a3
10001244:	0003b6b7          	lui	a3,0x3b
10001248:	98068693          	addi	a3,a3,-1664 # 3a980 <memset+0x2dfb4>
1000124c:	8fd5                	or	a5,a5,a3
1000124e:	df5c                	sw	a5,60(a4)
10001250:	b3c5                	j	10001030 <otp_load_cfg+0x172>
10001252:	20002737          	lui	a4,0x20002
10001256:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
1000125a:	433c                	lw	a5,64(a4)
1000125c:	76fd                	lui	a3,0xfffff
1000125e:	8ff5                	and	a5,a5,a3
10001260:	6685                	lui	a3,0x1
10001262:	bb868693          	addi	a3,a3,-1096 # bb8 <__STACK_SIZE+0x7b8>
10001266:	8fd5                	or	a5,a5,a3
10001268:	fc0106b7          	lui	a3,0xfc010
1000126c:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
1000126e:	8ff5                	and	a5,a5,a3
10001270:	035506b7          	lui	a3,0x3550
10001274:	8fd5                	or	a5,a5,a3
10001276:	c33c                	sw	a5,64(a4)
10001278:	b3d9                	j	1000103e <otp_load_cfg+0x180>
1000127a:	20002737          	lui	a4,0x20002
1000127e:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
10001282:	437c                	lw	a5,68(a4)
10001284:	76fd                	lui	a3,0xfffff
10001286:	8ff5                	and	a5,a5,a3
10001288:	7d07e793          	ori	a5,a5,2000
1000128c:	fc0106b7          	lui	a3,0xfc010
10001290:	16fd                	addi	a3,a3,-1 # fc00ffff <__StackTop+0xdc00bfff>
10001292:	8ff5                	and	a5,a5,a3
10001294:	023906b7          	lui	a3,0x2390
10001298:	8fd5                	or	a5,a5,a3
1000129a:	c37c                	sw	a5,68(a4)
1000129c:	8082                	ret

1000129e <otp_apply_cfg>:
1000129e:	400807b7          	lui	a5,0x40080
100012a2:	1047a603          	lw	a2,260(a5) # 40080104 <__StackTop+0x2007c104>
100012a6:	fffc4737          	lui	a4,0xfffc4
100012aa:	177d                	addi	a4,a4,-1 # fffc3fff <__StackTop+0xdffbffff>
100012ac:	8e79                	and	a2,a2,a4
100012ae:	20002737          	lui	a4,0x20002
100012b2:	62870713          	addi	a4,a4,1576 # 20002628 <g_otp_cfg>
100012b6:	00275683          	lhu	a3,2(a4)
100012ba:	8abd                	andi	a3,a3,15
100012bc:	06ba                	slli	a3,a3,0xe
100012be:	8ed1                	or	a3,a3,a2
100012c0:	10d7a223          	sw	a3,260(a5)
100012c4:	1087a603          	lw	a2,264(a5)
100012c8:	76c1                	lui	a3,0xffff0
100012ca:	0ff68693          	addi	a3,a3,255 # ffff00ff <__StackTop+0xdffec0ff>
100012ce:	8e75                	and	a2,a2,a3
100012d0:	00474683          	lbu	a3,4(a4)
100012d4:	06a2                	slli	a3,a3,0x8
100012d6:	8ed1                	or	a3,a3,a2
100012d8:	10d7a423          	sw	a3,264(a5)
100012dc:	10c7a603          	lw	a2,268(a5)
100012e0:	76e1                	lui	a3,0xffff8
100012e2:	07f68693          	addi	a3,a3,127 # ffff807f <__StackTop+0xdfff407f>
100012e6:	8e75                	and	a2,a2,a3
100012e8:	00674683          	lbu	a3,6(a4)
100012ec:	069e                	slli	a3,a3,0x7
100012ee:	8ed1                	or	a3,a3,a2
100012f0:	10d7a623          	sw	a3,268(a5)
100012f4:	1107a603          	lw	a2,272(a5)
100012f8:	ff0406b7          	lui	a3,0xff040
100012fc:	16fd                	addi	a3,a3,-1 # ff03ffff <__StackTop+0xdf03bfff>
100012fe:	8e75                	and	a2,a2,a3
10001300:	5f14                	lw	a3,56(a4)
10001302:	06ca                	slli	a3,a3,0x12
10001304:	8ed1                	or	a3,a3,a2
10001306:	10d7a823          	sw	a3,272(a5)
1000130a:	42002637          	lui	a2,0x42002
1000130e:	4614                	lw	a3,8(a2)
10001310:	880007b7          	lui	a5,0x88000
10001314:	17fd                	addi	a5,a5,-1 # 87ffffff <__StackTop+0x67ffbfff>
10001316:	8efd                	and	a3,a3,a5
10001318:	431c                	lw	a5,0(a4)
1000131a:	8bbd                	andi	a5,a5,15
1000131c:	07ee                	slli	a5,a5,0x1b
1000131e:	8fd5                	or	a5,a5,a3
10001320:	c61c                	sw	a5,8(a2)
10001322:	8082                	ret

10001324 <RTC_GetCurrentSysTime>:
10001324:	400007b7          	lui	a5,0x40000
10001328:	0b07a503          	lw	a0,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
1000132c:	8082                	ret

1000132e <RTC_SetTimerTarget>:
1000132e:	400007b7          	lui	a5,0x40000
10001332:	0aa7aa23          	sw	a0,180(a5) # 400000b4 <__StackTop+0x1fffc0b4>
10001336:	8082                	ret

10001338 <RTC_GetTimerTarget>:
10001338:	400007b7          	lui	a5,0x40000
1000133c:	0b47a503          	lw	a0,180(a5) # 400000b4 <__StackTop+0x1fffc0b4>
10001340:	8082                	ret

10001342 <RTC_ITConfig>:
10001342:	c999                	beqz	a1,10001358 <RTC_ITConfig+0x16>
10001344:	40000737          	lui	a4,0x40000
10001348:	0b875783          	lhu	a5,184(a4) # 400000b8 <__StackTop+0x1fffc0b8>
1000134c:	07c2                	slli	a5,a5,0x10
1000134e:	83c1                	srli	a5,a5,0x10
10001350:	8d5d                	or	a0,a0,a5
10001352:	0aa71c23          	sh	a0,184(a4)
10001356:	8082                	ret
10001358:	40000737          	lui	a4,0x40000
1000135c:	0b875783          	lhu	a5,184(a4) # 400000b8 <__StackTop+0x1fffc0b8>
10001360:	07c2                	slli	a5,a5,0x10
10001362:	83c1                	srli	a5,a5,0x10
10001364:	fff54513          	not	a0,a0
10001368:	8d7d                	and	a0,a0,a5
1000136a:	0aa71c23          	sh	a0,184(a4)
1000136e:	8082                	ret

10001370 <RTC_GetITStatus>:
10001370:	400007b7          	lui	a5,0x40000
10001374:	0b87d783          	lhu	a5,184(a5) # 400000b8 <__StackTop+0x1fffc0b8>
10001378:	00153513          	seqz	a0,a0
1000137c:	8d7d                	and	a0,a0,a5
1000137e:	00153513          	seqz	a0,a0
10001382:	8082                	ret

10001384 <RTC_ClearITPendingBit>:
10001384:	40000737          	lui	a4,0x40000
10001388:	0b875783          	lhu	a5,184(a4) # 400000b8 <__StackTop+0x1fffc0b8>
1000138c:	07c2                	slli	a5,a5,0x10
1000138e:	83c1                	srli	a5,a5,0x10
10001390:	8fc9                	or	a5,a5,a0
10001392:	0af71c23          	sh	a5,184(a4)
10001396:	8082                	ret

10001398 <_timer_sub>:
10001398:	8d0d                	sub	a0,a0,a1
1000139a:	8082                	ret

1000139c <_timer_refresh_timeout>:
1000139c:	1151                	addi	sp,sp,-12
1000139e:	c406                	sw	ra,8(sp)
100013a0:	c222                	sw	s0,4(sp)
100013a2:	200027b7          	lui	a5,0x20002
100013a6:	6707a783          	lw	a5,1648(a5) # 20002670 <VTIMER_Context>
100013aa:	cf95                	beqz	a5,100013e6 <_timer_refresh_timeout+0x4a>
100013ac:	43c0                	lw	s0,4(a5)
100013ae:	3f9d                	jal	10001324 <RTC_GetCurrentSysTime>
100013b0:	0529                	addi	a0,a0,10
100013b2:	02857063          	bgeu	a0,s0,100013d2 <_timer_refresh_timeout+0x36>
100013b6:	40a407b3          	sub	a5,s0,a0
100013ba:	0007d363          	bgez	a5,100013c0 <_timer_refresh_timeout+0x24>
100013be:	842a                	mv	s0,a0
100013c0:	4585                	li	a1,1
100013c2:	4505                	li	a0,1
100013c4:	3fbd                	jal	10001342 <RTC_ITConfig>
100013c6:	8522                	mv	a0,s0
100013c8:	379d                	jal	1000132e <RTC_SetTimerTarget>
100013ca:	40a2                	lw	ra,8(sp)
100013cc:	4412                	lw	s0,4(sp)
100013ce:	0131                	addi	sp,sp,12
100013d0:	8082                	ret
100013d2:	40850733          	sub	a4,a0,s0
100013d6:	800007b7          	lui	a5,0x80000
100013da:	ffe7c793          	xori	a5,a5,-2
100013de:	fee7e1e3          	bltu	a5,a4,100013c0 <_timer_refresh_timeout+0x24>
100013e2:	842a                	mv	s0,a0
100013e4:	bff1                	j	100013c0 <_timer_refresh_timeout+0x24>
100013e6:	4581                	li	a1,0
100013e8:	4505                	li	a0,1
100013ea:	3fa1                	jal	10001342 <RTC_ITConfig>
100013ec:	bff9                	j	100013ca <_timer_refresh_timeout+0x2e>

100013ee <_timer_remove>:
100013ee:	1151                	addi	sp,sp,-12
100013f0:	c406                	sw	ra,8(sp)
100013f2:	c222                	sw	s0,4(sp)
100013f4:	30047473          	csrrci	s0,mstatus,8
100013f8:	200027b7          	lui	a5,0x20002
100013fc:	6707a783          	lw	a5,1648(a5) # 20002670 <VTIMER_Context>
10001400:	c395                	beqz	a5,10001424 <_timer_remove+0x36>
10001402:	02f50363          	beq	a0,a5,10001428 <_timer_remove+0x3a>
10001406:	873e                	mv	a4,a5
10001408:	439c                	lw	a5,0(a5)
1000140a:	c791                	beqz	a5,10001416 <_timer_remove+0x28>
1000140c:	fef51de3          	bne	a0,a5,10001406 <_timer_remove+0x18>
10001410:	411c                	lw	a5,0(a0)
10001412:	c31c                	sw	a5,0(a4)
10001414:	a011                	j	10001418 <_timer_remove+0x2a>
10001416:	dd6d                	beqz	a0,10001410 <_timer_remove+0x22>
10001418:	30041073          	csrw	mstatus,s0
1000141c:	40a2                	lw	ra,8(sp)
1000141e:	4412                	lw	s0,4(sp)
10001420:	0131                	addi	sp,sp,12
10001422:	8082                	ret
10001424:	f975                	bnez	a0,10001418 <_timer_remove+0x2a>
10001426:	87aa                	mv	a5,a0
10001428:	4398                	lw	a4,0(a5)
1000142a:	200027b7          	lui	a5,0x20002
1000142e:	66e7a823          	sw	a4,1648(a5) # 20002670 <VTIMER_Context>
10001432:	37ad                	jal	1000139c <_timer_refresh_timeout>
10001434:	b7d5                	j	10001418 <_timer_remove+0x2a>

10001436 <VTIMER_Init>:
10001436:	1151                	addi	sp,sp,-12
10001438:	c406                	sw	ra,8(sp)
1000143a:	c222                	sw	s0,4(sp)
1000143c:	c026                	sw	s1,0(sp)
1000143e:	200027b7          	lui	a5,0x20002
10001442:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
10001446:	0007a023          	sw	zero,0(a5)
1000144a:	0007a223          	sw	zero,4(a5)
1000144e:	0007a423          	sw	zero,8(a5)
10001452:	0007a623          	sw	zero,12(a5)
10001456:	0007a823          	sw	zero,16(a5)
1000145a:	0007aa23          	sw	zero,20(a5)
1000145e:	0007ac23          	sw	zero,24(a5)
10001462:	0007ae23          	sw	zero,28(a5)
10001466:	44a1                	li	s1,8
10001468:	40000437          	lui	s0,0x40000
1000146c:	4515                	li	a0,5
1000146e:	10000097          	auipc	ra,0x10000
10001472:	ea6080e7          	jalr	-346(ra) # 20001314 <VTIMER_ClkCali_Trigger>
10001476:	03c00513          	li	a0,60
1000147a:	f000b097          	auipc	ra,0xf000b
1000147e:	45c080e7          	jalr	1116(ra) # c8d6 <delay_us>
10001482:	4785                	li	a5,1
10001484:	06f40823          	sb	a5,112(s0) # 40000070 <__StackTop+0x1fffc070>
10001488:	10000097          	auipc	ra,0x10000
1000148c:	eb4080e7          	jalr	-332(ra) # 2000133c <VTIMER_ClkCali_Wait>
10001490:	583c                	lw	a5,112(s0)
10001492:	9bf9                	andi	a5,a5,-2
10001494:	d83c                	sw	a5,112(s0)
10001496:	d94ff0ef          	jal	10000a2a <clkcal_reset>
1000149a:	3e800513          	li	a0,1000
1000149e:	f000b097          	auipc	ra,0xf000b
100014a2:	438080e7          	jalr	1080(ra) # c8d6 <delay_us>
100014a6:	14fd                	addi	s1,s1,-1 # 3fffffff <__StackTop+0x1fffbfff>
100014a8:	f0f1                	bnez	s1,1000146c <VTIMER_Init+0x36>
100014aa:	200027b7          	lui	a5,0x20002
100014ae:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
100014b2:	0087d703          	lhu	a4,8(a5)
100014b6:	0742                	slli	a4,a4,0x10
100014b8:	8341                	srli	a4,a4,0x10
100014ba:	00e79323          	sh	a4,6(a5)
100014be:	40a2                	lw	ra,8(sp)
100014c0:	4412                	lw	s0,4(sp)
100014c2:	4482                	lw	s1,0(sp)
100014c4:	0131                	addi	sp,sp,12
100014c6:	8082                	ret

100014c8 <VTIMER_IRQHandler>:
100014c8:	1151                	addi	sp,sp,-12
100014ca:	c406                	sw	ra,8(sp)
100014cc:	c222                	sw	s0,4(sp)
100014ce:	c026                	sw	s1,0(sp)
100014d0:	10000513          	li	a0,256
100014d4:	3d71                	jal	10001370 <RTC_GetITStatus>
100014d6:	e511                	bnez	a0,100014e2 <VTIMER_IRQHandler+0x1a>
100014d8:	40a2                	lw	ra,8(sp)
100014da:	4412                	lw	s0,4(sp)
100014dc:	4482                	lw	s1,0(sp)
100014de:	0131                	addi	sp,sp,12
100014e0:	8082                	ret
100014e2:	10000513          	li	a0,256
100014e6:	3d79                	jal	10001384 <RTC_ClearITPendingBit>
100014e8:	a005                	j	10001508 <VTIMER_IRQHandler+0x40>
100014ea:	4448                	lw	a0,12(s0)
100014ec:	9782                	jalr	a5
100014ee:	a829                	j	10001508 <VTIMER_IRQHandler+0x40>
100014f0:	409504b3          	sub	s1,a0,s1
100014f4:	800007b7          	lui	a5,0x80000
100014f8:	ffe7c793          	xori	a5,a5,-2
100014fc:	fc97eee3          	bltu	a5,s1,100014d8 <VTIMER_IRQHandler+0x10>
10001500:	8522                	mv	a0,s0
10001502:	35f5                	jal	100013ee <_timer_remove>
10001504:	441c                	lw	a5,8(s0)
10001506:	f3f5                	bnez	a5,100014ea <VTIMER_IRQHandler+0x22>
10001508:	200027b7          	lui	a5,0x20002
1000150c:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
10001510:	4380                	lw	s0,0(a5)
10001512:	d079                	beqz	s0,100014d8 <VTIMER_IRQHandler+0x10>
10001514:	4044                	lw	s1,4(s0)
10001516:	3539                	jal	10001324 <RTC_GetCurrentSysTime>
10001518:	fc957ce3          	bgeu	a0,s1,100014f0 <VTIMER_IRQHandler+0x28>
1000151c:	8c89                	sub	s1,s1,a0
1000151e:	fe04c1e3          	bltz	s1,10001500 <VTIMER_IRQHandler+0x38>
10001522:	bf5d                	j	100014d8 <VTIMER_IRQHandler+0x10>

10001524 <Timer_SleepMode_Check>:
10001524:	200027b7          	lui	a5,0x20002
10001528:	6707a783          	lw	a5,1648(a5) # 20002670 <VTIMER_Context>
1000152c:	c795                	beqz	a5,10001558 <Timer_SleepMode_Check+0x34>
1000152e:	1151                	addi	sp,sp,-12
10001530:	c406                	sw	ra,8(sp)
10001532:	c222                	sw	s0,4(sp)
10001534:	3511                	jal	10001338 <RTC_GetTimerTarget>
10001536:	842a                	mv	s0,a0
10001538:	33f5                	jal	10001324 <RTC_GetCurrentSysTime>
1000153a:	85aa                	mv	a1,a0
1000153c:	8522                	mv	a0,s0
1000153e:	3da9                	jal	10001398 <_timer_sub>
10001540:	842a                	mv	s0,a0
10001542:	27b010ef          	jal	10002fbc <t1001_sleep_get_protect_time>
10001546:	00a43533          	sltu	a0,s0,a0
1000154a:	00154513          	xori	a0,a0,1
1000154e:	0505                	addi	a0,a0,1
10001550:	40a2                	lw	ra,8(sp)
10001552:	4412                	lw	s0,4(sp)
10001554:	0131                	addi	sp,sp,12
10001556:	8082                	ret
10001558:	450d                	li	a0,3
1000155a:	8082                	ret

1000155c <ble_set_adv_addr>:
1000155c:	1151                	addi	sp,sp,-12
1000155e:	c406                	sw	ra,8(sp)
10001560:	331000ef          	jal	10002090 <omw_svc_set_addr>
10001564:	40a2                	lw	ra,8(sp)
10001566:	0131                	addi	sp,sp,12
10001568:	8082                	ret

1000156a <ble_set_adv_param>:
1000156a:	1141                	addi	sp,sp,-16
1000156c:	c606                	sw	ra,12(sp)
1000156e:	00254383          	lbu	t2,2(a0)
10001572:	00354583          	lbu	a1,3(a0)
10001576:	05a2                	slli	a1,a1,0x8
10001578:	00054283          	lbu	t0,0(a0)
1000157c:	00154303          	lbu	t1,1(a0)
10001580:	0322                	slli	t1,t1,0x8
10001582:	00e54783          	lbu	a5,14(a0)
10001586:	c03e                	sw	a5,0(sp)
10001588:	00d54783          	lbu	a5,13(a0)
1000158c:	00650713          	addi	a4,a0,6
10001590:	00554683          	lbu	a3,5(a0)
10001594:	00454603          	lbu	a2,4(a0)
10001598:	0075e5b3          	or	a1,a1,t2
1000159c:	00536533          	or	a0,t1,t0
100015a0:	f0004097          	auipc	ra,0xf0004
100015a4:	086080e7          	jalr	134(ra) # 5626 <hci_send_cmd_le_set_adv_param>
100015a8:	40b2                	lw	ra,12(sp)
100015aa:	0141                	addi	sp,sp,16
100015ac:	8082                	ret

100015ae <ble_adv_enable>:
100015ae:	1151                	addi	sp,sp,-12
100015b0:	c406                	sw	ra,8(sp)
100015b2:	4505                	li	a0,1
100015b4:	f0004097          	auipc	ra,0xf0004
100015b8:	132080e7          	jalr	306(ra) # 56e6 <hci_send_cmd_le_set_adv_enable>
100015bc:	40a2                	lw	ra,8(sp)
100015be:	0131                	addi	sp,sp,12
100015c0:	8082                	ret

100015c2 <ble_set_adv_data>:
100015c2:	1151                	addi	sp,sp,-12
100015c4:	c406                	sw	ra,8(sp)
100015c6:	f0004097          	auipc	ra,0xf0004
100015ca:	0cc080e7          	jalr	204(ra) # 5692 <hci_send_cmd_le_set_adv_data>
100015ce:	40a2                	lw	ra,8(sp)
100015d0:	0131                	addi	sp,sp,12
100015d2:	8082                	ret

100015d4 <ble_set_scan_rsp_data>:
100015d4:	1151                	addi	sp,sp,-12
100015d6:	c406                	sw	ra,8(sp)
100015d8:	f0004097          	auipc	ra,0xf0004
100015dc:	0e4080e7          	jalr	228(ra) # 56bc <hci_send_cmd_le_set_scan_rsp_data>
100015e0:	40a2                	lw	ra,8(sp)
100015e2:	0131                	addi	sp,sp,12
100015e4:	8082                	ret

100015e6 <ble_update_conn_param>:
100015e6:	1131                	addi	sp,sp,-20
100015e8:	c806                	sw	ra,16(sp)
100015ea:	00b11023          	sh	a1,0(sp)
100015ee:	00c11123          	sh	a2,2(sp)
100015f2:	00d11223          	sh	a3,4(sp)
100015f6:	00e11323          	sh	a4,6(sp)
100015fa:	858a                	mv	a1,sp
100015fc:	f0006097          	auipc	ra,0xf0006
10001600:	a1c080e7          	jalr	-1508(ra) # 7018 <bt_conn_le_param_update>
10001604:	40c2                	lw	ra,16(sp)
10001606:	0151                	addi	sp,sp,20
10001608:	8082                	ret

1000160a <ble_user_service_add>:
1000160a:	200027b7          	lui	a5,0x20002
1000160e:	6b07c303          	lbu	t1,1712(a5) # 200026b0 <user_service_num>
10001612:	479d                	li	a5,7
10001614:	0667e663          	bltu	a5,t1,10001680 <ble_user_service_add+0x76>
10001618:	861a                	mv	a2,t1
1000161a:	02605663          	blez	t1,10001646 <ble_user_service_add+0x3c>
1000161e:	200027b7          	lui	a5,0x20002
10001622:	6907a783          	lw	a5,1680(a5) # 20002690 <user_service_list>
10001626:	04f50f63          	beq	a0,a5,10001684 <ble_user_service_add+0x7a>
1000162a:	200027b7          	lui	a5,0x20002
1000162e:	69078793          	addi	a5,a5,1680 # 20002690 <user_service_list>
10001632:	4701                	li	a4,0
10001634:	0705                	addi	a4,a4,1
10001636:	00c70863          	beq	a4,a2,10001646 <ble_user_service_add+0x3c>
1000163a:	0791                	addi	a5,a5,4
1000163c:	4394                	lw	a3,0(a5)
1000163e:	fea69be3          	bne	a3,a0,10001634 <ble_user_service_add+0x2a>
10001642:	557d                	li	a0,-1
10001644:	8082                	ret
10001646:	1151                	addi	sp,sp,-12
10001648:	c406                	sw	ra,8(sp)
1000164a:	87aa                	mv	a5,a0
1000164c:	00130513          	addi	a0,t1,1
10001650:	0ff57513          	zext.b	a0,a0
10001654:	20002737          	lui	a4,0x20002
10001658:	6aa70823          	sb	a0,1712(a4) # 200026b0 <user_service_num>
1000165c:	200025b7          	lui	a1,0x20002
10001660:	69058713          	addi	a4,a1,1680 # 20002690 <user_service_list>
10001664:	030a                	slli	t1,t1,0x2
10001666:	933a                	add	t1,t1,a4
10001668:	00f32023          	sw	a5,0(t1)
1000166c:	69058593          	addi	a1,a1,1680
10001670:	f0006097          	auipc	ra,0xf0006
10001674:	0ca080e7          	jalr	202(ra) # 773a <bt_gatt_service_init>
10001678:	4501                	li	a0,0
1000167a:	40a2                	lw	ra,8(sp)
1000167c:	0131                	addi	sp,sp,12
1000167e:	8082                	ret
10001680:	5579                	li	a0,-2
10001682:	8082                	ret
10001684:	557d                	li	a0,-1
10001686:	8082                	ret

10001688 <ble_event_callback>:
10001688:	1151                	addi	sp,sp,-12
1000168a:	c406                	sw	ra,8(sp)
1000168c:	f0005097          	auipc	ra,0xf0005
10001690:	6d8080e7          	jalr	1752(ra) # 6d64 <bt_conn_cb_register>
10001694:	40a2                	lw	ra,8(sp)
10001696:	0131                	addi	sp,sp,12
10001698:	8082                	ret

1000169a <ble_host_init>:
1000169a:	1151                	addi	sp,sp,-12
1000169c:	c406                	sw	ra,8(sp)
1000169e:	e08007b7          	lui	a5,0xe0800
100016a2:	43dc                	lw	a5,4(a5)
100016a4:	83d5                	srli	a5,a5,0x15
100016a6:	8bbd                	andi	a5,a5,15
100016a8:	46a1                	li	a3,8
100016aa:	8e9d                	sub	a3,a3,a5
100016ac:	e0801737          	lui	a4,0xe0801
100016b0:	09774783          	lbu	a5,151(a4) # e0801097 <__StackTop+0xc07fd097>
100016b4:	0ff7f613          	zext.b	a2,a5
100016b8:	0ff00793          	li	a5,255
100016bc:	00d797b3          	sll	a5,a5,a3
100016c0:	fff7c793          	not	a5,a5
100016c4:	8ff1                	and	a5,a5,a2
100016c6:	460d                	li	a2,3
100016c8:	00d616b3          	sll	a3,a2,a3
100016cc:	8fd5                	or	a5,a5,a3
100016ce:	0ff7f793          	zext.b	a5,a5
100016d2:	08f70ba3          	sb	a5,151(a4)
100016d6:	09574783          	lbu	a5,149(a4)
100016da:	0ff7f793          	zext.b	a5,a5
100016de:	0017e793          	ori	a5,a5,1
100016e2:	08f70aa3          	sb	a5,149(a4)
100016e6:	175000ef          	jal	1000205a <hci_driver_init>
100016ea:	400007b7          	lui	a5,0x40000
100016ee:	53d8                	lw	a4,36(a5)
100016f0:	00875793          	srli	a5,a4,0x8
100016f4:	0027f693          	andi	a3,a5,2
100016f8:	c689                	beqz	a3,10001702 <ble_host_init+0x68>
100016fa:	8b8d                	andi	a5,a5,3
100016fc:	4689                	li	a3,2
100016fe:	00d78563          	beq	a5,a3,10001708 <ble_host_init+0x6e>
10001702:	40a2                	lw	ra,8(sp)
10001704:	0131                	addi	sp,sp,12
10001706:	8082                	ret
10001708:	8311                	srli	a4,a4,0x4
1000170a:	8b0d                	andi	a4,a4,3
1000170c:	478d                	li	a5,3
1000170e:	fef71ae3          	bne	a4,a5,10001702 <ble_host_init+0x68>
10001712:	20000737          	lui	a4,0x20000
10001716:	4b675783          	lhu	a5,1206(a4) # 200004b6 <ll_gap_time>
1000171a:	0791                	addi	a5,a5,4 # 40000004 <__StackTop+0x1fffc004>
1000171c:	4af71b23          	sh	a5,1206(a4)
10001720:	20003737          	lui	a4,0x20003
10001724:	ef875783          	lhu	a5,-264(a4) # 20002ef8 <ll_gap_time_1m>
10001728:	0791                	addi	a5,a5,4
1000172a:	eef71c23          	sh	a5,-264(a4)
1000172e:	bfd1                	j	10001702 <ble_host_init+0x68>

10001730 <hw_chk_and_en_irq>:
10001730:	300027f3          	csrr	a5,mstatus
10001734:	8ba1                	andi	a5,a5,8
10001736:	e399                	bnez	a5,1000173c <hw_chk_and_en_irq+0xc>
10001738:	30046073          	csrsi	mstatus,8
1000173c:	8082                	ret

1000173e <ble_host_work_polling>:
1000173e:	1151                	addi	sp,sp,-12
10001740:	c406                	sw	ra,8(sp)
10001742:	081010ef          	jal	10002fc2 <bt_polling_work_ext>
10001746:	2f55                	jal	10001efa <bt_att_tx_polling>
10001748:	37e5                	jal	10001730 <hw_chk_and_en_irq>
1000174a:	40a2                	lw	ra,8(sp)
1000174c:	0131                	addi	sp,sp,12
1000174e:	8082                	ret

10001750 <ble_sleep_check>:
10001750:	1151                	addi	sp,sp,-12
10001752:	c406                	sw	ra,8(sp)
10001754:	4601                	li	a2,0
10001756:	4581                	li	a1,0
10001758:	450d                	li	a0,3
1000175a:	2a85                	jal	100018ca <T1001_Sleep>
1000175c:	40a2                	lw	ra,8(sp)
1000175e:	0131                	addi	sp,sp,12
10001760:	8082                	ret

10001762 <t1001_sleep_restore_uart_reg_info>:
10001762:	1141                	addi	sp,sp,-16
10001764:	c606                	sw	ra,12(sp)
10001766:	c422                	sw	s0,8(sp)
10001768:	c226                	sw	s1,4(sp)
1000176a:	c02a                	sw	a0,0(sp)
1000176c:	84ae                	mv	s1,a1
1000176e:	4401                	li	s0,0
10001770:	a815                	j	100017a4 <t1001_sleep_restore_uart_reg_info+0x42>
10001772:	4502                	lw	a0,0(sp)
10001774:	2705                	jal	10001e94 <wait_uart_not_busy>
10001776:	4702                	lw	a4,0(sp)
10001778:	475c                	lw	a5,12(a4)
1000177a:	0807e793          	ori	a5,a5,128
1000177e:	c75c                	sw	a5,12(a4)
10001780:	200017b7          	lui	a5,0x20001
10001784:	bd478793          	addi	a5,a5,-1068 # 20000bd4 <uart_addr_idx_list>
10001788:	0057c783          	lbu	a5,5(a5)
1000178c:	078a                	slli	a5,a5,0x2
1000178e:	97ba                	add	a5,a5,a4
10001790:	4098                	lw	a4,0(s1)
10001792:	c398                	sw	a4,0(a5)
10001794:	0405                	addi	s0,s0,1
10001796:	0491                	addi	s1,s1,4
10001798:	a031                	j	100017a4 <t1001_sleep_restore_uart_reg_info+0x42>
1000179a:	0405                	addi	s0,s0,1
1000179c:	0491                	addi	s1,s1,4
1000179e:	47a1                	li	a5,8
100017a0:	02f40963          	beq	s0,a5,100017d2 <t1001_sleep_restore_uart_reg_info+0x70>
100017a4:	4795                	li	a5,5
100017a6:	fcf406e3          	beq	s0,a5,10001772 <t1001_sleep_restore_uart_reg_info+0x10>
100017aa:	200017b7          	lui	a5,0x20001
100017ae:	bd478793          	addi	a5,a5,-1068 # 20000bd4 <uart_addr_idx_list>
100017b2:	97a2                	add	a5,a5,s0
100017b4:	0007c783          	lbu	a5,0(a5)
100017b8:	078a                	slli	a5,a5,0x2
100017ba:	4702                	lw	a4,0(sp)
100017bc:	97ba                	add	a5,a5,a4
100017be:	4098                	lw	a4,0(s1)
100017c0:	c398                	sw	a4,0(a5)
100017c2:	479d                	li	a5,7
100017c4:	fcf41be3          	bne	s0,a5,1000179a <t1001_sleep_restore_uart_reg_info+0x38>
100017c8:	4702                	lw	a4,0(sp)
100017ca:	475c                	lw	a5,12(a4)
100017cc:	f7f7f793          	andi	a5,a5,-129
100017d0:	c75c                	sw	a5,12(a4)
100017d2:	40b2                	lw	ra,12(sp)
100017d4:	4422                	lw	s0,8(sp)
100017d6:	4492                	lw	s1,4(sp)
100017d8:	0141                	addi	sp,sp,16
100017da:	8082                	ret

100017dc <app_sleep_enable>:
100017dc:	200027b7          	lui	a5,0x20002
100017e0:	4705                	li	a4,1
100017e2:	6ae788a3          	sb	a4,1713(a5) # 200026b1 <app_sleep_flag>
100017e6:	8082                	ret

100017e8 <app_sleep_disable>:
100017e8:	200027b7          	lui	a5,0x20002
100017ec:	6a0788a3          	sb	zero,1713(a5) # 200026b1 <app_sleep_flag>
100017f0:	8082                	ret

100017f2 <App_SleepMode_Check>:
100017f2:	200027b7          	lui	a5,0x20002
100017f6:	6b17c503          	lbu	a0,1713(a5) # 200026b1 <app_sleep_flag>
100017fa:	0ff57513          	zext.b	a0,a0
100017fe:	e111                	bnez	a0,10001802 <App_SleepMode_Check+0x10>
10001800:	8082                	ret
10001802:	1151                	addi	sp,sp,-12
10001804:	c406                	sw	ra,8(sp)
10001806:	23d010ef          	jal	10003242 <bt_conn_can_sleep_check>
1000180a:	00a03533          	snez	a0,a0
1000180e:	40a2                	lw	ra,8(sp)
10001810:	0131                	addi	sp,sp,12
10001812:	8082                	ret

10001814 <t1001_cfg_wakeup_gpio>:
10001814:	1131                	addi	sp,sp,-20
10001816:	c806                	sw	ra,16(sp)
10001818:	c622                	sw	s0,12(sp)
1000181a:	c426                	sw	s1,8(sp)
1000181c:	84aa                	mv	s1,a0
1000181e:	c22e                	sw	a1,4(sp)
10001820:	0015b793          	seqz	a5,a1
10001824:	0796                	slli	a5,a5,0x5
10001826:	02078793          	addi	a5,a5,32
1000182a:	c03e                	sw	a5,0(sp)
1000182c:	4401                	li	s0,0
1000182e:	a029                	j	10001838 <t1001_cfg_wakeup_gpio+0x24>
10001830:	0405                	addi	s0,s0,1
10001832:	47e1                	li	a5,24
10001834:	00f40a63          	beq	s0,a5,10001848 <t1001_cfg_wakeup_gpio+0x34>
10001838:	0084d7b3          	srl	a5,s1,s0
1000183c:	8b85                	andi	a5,a5,1
1000183e:	dbed                	beqz	a5,10001830 <t1001_cfg_wakeup_gpio+0x1c>
10001840:	4582                	lw	a1,0(sp)
10001842:	8522                	mv	a0,s0
10001844:	2bd5                	jal	10001e38 <omw_gpio_set_func>
10001846:	b7ed                	j	10001830 <t1001_cfg_wakeup_gpio+0x1c>
10001848:	4792                	lw	a5,4(sp)
1000184a:	eb89                	bnez	a5,1000185c <t1001_cfg_wakeup_gpio+0x48>
1000184c:	400807b7          	lui	a5,0x40080
10001850:	cb84                	sw	s1,16(a5)
10001852:	40c2                	lw	ra,16(sp)
10001854:	4432                	lw	s0,12(sp)
10001856:	44a2                	lw	s1,8(sp)
10001858:	0151                	addi	sp,sp,20
1000185a:	8082                	ret
1000185c:	400807b7          	lui	a5,0x40080
10001860:	cbc4                	sw	s1,20(a5)
10001862:	bfc5                	j	10001852 <t1001_cfg_wakeup_gpio+0x3e>

10001864 <ble_sleep_init>:
10001864:	20003737          	lui	a4,0x20003
10001868:	000337b7          	lui	a5,0x33
1000186c:	30378793          	addi	a5,a5,771 # 33303 <memset+0x26937>
10001870:	f6f72223          	sw	a5,-156(a4) # 20002f64 <unused_gpio_mask_when_sleep>
10001874:	20003737          	lui	a4,0x20003
10001878:	200017b7          	lui	a5,0x20001
1000187c:	49678793          	addi	a5,a5,1174 # 20001496 <otp_pwr_on>
10001880:	f4f72623          	sw	a5,-180(a4) # 20002f4c <otp_init_ptr>
10001884:	20003737          	lui	a4,0x20003
10001888:	200017b7          	lui	a5,0x20001
1000188c:	3ba78793          	addi	a5,a5,954 # 200013ba <qspi_regs_restore>
10001890:	f4f72823          	sw	a5,-176(a4) # 20002f50 <qspi_regs_restore_ptr>
10001894:	20003737          	lui	a4,0x20003
10001898:	200017b7          	lui	a5,0x20001
1000189c:	3e478793          	addi	a5,a5,996 # 200013e4 <restore_more_regs_when_not_wakeup_fully>
100018a0:	f4f72a23          	sw	a5,-172(a4) # 20002f54 <restore_more_ext_cr_regs>
100018a4:	200017b7          	lui	a5,0x20001
100018a8:	4729                	li	a4,10
100018aa:	fce78223          	sb	a4,-60(a5) # 20000fc4 <gpio_vdd_pin1>
100018ae:	200017b7          	lui	a5,0x20001
100018b2:	577d                	li	a4,-1
100018b4:	fce782a3          	sb	a4,-59(a5) # 20000fc5 <gpio_vdd_pin2>
100018b8:	20003737          	lui	a4,0x20003
100018bc:	200017b7          	lui	a5,0x20001
100018c0:	3e278793          	addi	a5,a5,994 # 200013e2 <gpio_regs_restore_before_rel_gpio_hold>
100018c4:	f4f72223          	sw	a5,-188(a4) # 20002f44 <gpio_regs_restore_before_rel_gpio_hold_ptr>
100018c8:	8082                	ret

100018ca <T1001_Sleep>:
100018ca:	f6410113          	addi	sp,sp,-156
100018ce:	cd06                	sw	ra,152(sp)
100018d0:	cb22                	sw	s0,148(sp)
100018d2:	c926                	sw	s1,144(sp)
100018d4:	842a                	mv	s0,a0
100018d6:	c42e                	sw	a1,8(sp)
100018d8:	c632                	sw	a2,12(sp)
100018da:	200027b7          	lui	a5,0x20002
100018de:	6a07ac23          	sw	zero,1720(a5) # 200026b8 <sleep_wakeup_reason>
100018e2:	30047073          	csrci	mstatus,8
100018e6:	10000097          	auipc	ra,0x10000
100018ea:	cee080e7          	jalr	-786(ra) # 200015d4 <bt_fast_chk_sleep>
100018ee:	e909                	bnez	a0,10001900 <T1001_Sleep+0x36>
100018f0:	30046073          	csrsi	mstatus,8
100018f4:	40ea                	lw	ra,152(sp)
100018f6:	445a                	lw	s0,148(sp)
100018f8:	44ca                	lw	s1,144(sp)
100018fa:	09c10113          	addi	sp,sp,156
100018fe:	8082                	ret
10001900:	3dcd                	jal	100017f2 <App_SleepMode_Check>
10001902:	d57d                	beqz	a0,100018f0 <T1001_Sleep+0x26>
10001904:	10000097          	auipc	ra,0x10000
10001908:	b08080e7          	jalr	-1272(ra) # 2000140c <Bt_SleepMode_Check>
1000190c:	84aa                	mv	s1,a0
1000190e:	4785                	li	a5,1
10001910:	fea7f0e3          	bgeu	a5,a0,100018f0 <T1001_Sleep+0x26>
10001914:	8522                	mv	a0,s0
10001916:	3139                	jal	10001524 <Timer_SleepMode_Check>
10001918:	4785                	li	a5,1
1000191a:	fca7fbe3          	bgeu	a5,a0,100018f0 <T1001_Sleep+0x26>
1000191e:	c826                	sw	s1,16(sp)
10001920:	00957363          	bgeu	a0,s1,10001926 <T1001_Sleep+0x5c>
10001924:	c82a                	sw	a0,16(sp)
10001926:	200027b7          	lui	a5,0x20002
1000192a:	6b478793          	addi	a5,a5,1716 # 200026b4 <g_save_buf>
1000192e:	c23e                	sw	a5,4(sp)
10001930:	aa05                	j	10001a60 <T1001_Sleep+0x196>
10001932:	10000097          	auipc	ra,0x10000
10001936:	5fc080e7          	jalr	1532(ra) # 20001f2e <calc_and_set_sleep_dur>
1000193a:	14051b63          	bnez	a0,10001a90 <T1001_Sleep+0x1c6>
1000193e:	bf4d                	j	100018f0 <T1001_Sleep+0x26>
10001940:	41001537          	lui	a0,0x41001
10001944:	2b81                	jal	10001e94 <wait_uart_not_busy>
10001946:	410017b7          	lui	a5,0x41001
1000194a:	47d8                	lw	a4,12(a5)
1000194c:	08076713          	ori	a4,a4,128
10001950:	c7d8                	sw	a4,12(a5)
10001952:	4702                	lw	a4,0(sp)
10001954:	00074703          	lbu	a4,0(a4)
10001958:	070a                	slli	a4,a4,0x2
1000195a:	97ba                	add	a5,a5,a4
1000195c:	439c                	lw	a5,0(a5)
1000195e:	c01c                	sw	a5,0(s0)
10001960:	0485                	addi	s1,s1,1
10001962:	4782                	lw	a5,0(sp)
10001964:	0785                	addi	a5,a5,1 # 41001001 <__StackTop+0x20ffd001>
10001966:	c03e                	sw	a5,0(sp)
10001968:	0411                	addi	s0,s0,4
1000196a:	4799                	li	a5,6
1000196c:	fcf48ae3          	beq	s1,a5,10001940 <T1001_Sleep+0x76>
10001970:	4782                	lw	a5,0(sp)
10001972:	0007c783          	lbu	a5,0(a5)
10001976:	00279713          	slli	a4,a5,0x2
1000197a:	410017b7          	lui	a5,0x41001
1000197e:	97ba                	add	a5,a5,a4
10001980:	439c                	lw	a5,0(a5)
10001982:	c01c                	sw	a5,0(s0)
10001984:	479d                	li	a5,7
10001986:	fc97fde3          	bgeu	a5,s1,10001960 <T1001_Sleep+0x96>
1000198a:	4452                	lw	s0,20(sp)
1000198c:	47a2                	lw	a5,8(sp)
1000198e:	16079363          	bnez	a5,10001af4 <T1001_Sleep+0x22a>
10001992:	47b2                	lw	a5,12(sp)
10001994:	16079463          	bnez	a5,10001afc <T1001_Sleep+0x232>
10001998:	400804b7          	lui	s1,0x40080
1000199c:	3ff00793          	li	a5,1023
100019a0:	08f49223          	sh	a5,132(s1) # 40080084 <__StackTop+0x2007c084>
100019a4:	010007b7          	lui	a5,0x1000
100019a8:	cc9c                	sw	a5,24(s1)
100019aa:	0f3010ef          	jal	1000329c <ll_conn_process_before_sleep>
100019ae:	1104a783          	lw	a5,272(s1)
100019b2:	7761                	lui	a4,0xffff8
100019b4:	7ff70713          	addi	a4,a4,2047 # ffff87ff <__StackTop+0xdfff47ff>
100019b8:	8ff9                	and	a5,a5,a4
100019ba:	6721                	lui	a4,0x8
100019bc:	80070713          	addi	a4,a4,-2048 # 7800 <bt_gatt_attr_get_handle+0x12>
100019c0:	8fd9                	or	a5,a5,a4
100019c2:	10f4a823          	sw	a5,272(s1)
100019c6:	10000097          	auipc	ra,0x10000
100019ca:	7d0080e7          	jalr	2000(ra) # 20002196 <T1001_ChipSleepCriticalWork>
100019ce:	200027b7          	lui	a5,0x20002
100019d2:	6bc7a583          	lw	a1,1724(a5) # 200026bc <uart0_save_buf>
100019d6:	41001537          	lui	a0,0x41001
100019da:	3361                	jal	10001762 <t1001_sleep_restore_uart_reg_info>
100019dc:	4792                	lw	a5,4(sp)
100019de:	439c                	lw	a5,0(a5)
100019e0:	4394                	lw	a3,0(a5)
100019e2:	4018                	lw	a4,0(s0)
100019e4:	c314                	sw	a3,0(a4)
100019e6:	0411                	addi	s0,s0,4
100019e8:	0791                	addi	a5,a5,4
100019ea:	10004737          	lui	a4,0x10004
100019ee:	45470713          	addi	a4,a4,1108 # 10004454 <addr_list+0x44>
100019f2:	fee417e3          	bne	s0,a4,100019e0 <T1001_Sleep+0x116>
100019f6:	40080737          	lui	a4,0x40080
100019fa:	08075783          	lhu	a5,128(a4) # 40080080 <__StackTop+0x2007c080>
100019fe:	07c2                	slli	a5,a5,0x10
10001a00:	83c1                	srli	a5,a5,0x10
10001a02:	200026b7          	lui	a3,0x20002
10001a06:	6af6ac23          	sw	a5,1720(a3) # 200026b8 <sleep_wakeup_reason>
10001a0a:	3ff00793          	li	a5,1023
10001a0e:	08f71223          	sh	a5,132(a4)
10001a12:	4701                	li	a4,0
10001a14:	e08005b7          	lui	a1,0xe0800
10001a18:	4605                	li	a2,1
10001a1a:	03000693          	li	a3,48
10001a1e:	40070793          	addi	a5,a4,1024
10001a22:	078a                	slli	a5,a5,0x2
10001a24:	97ae                	add	a5,a5,a1
10001a26:	00c78123          	sb	a2,2(a5)
10001a2a:	0705                	addi	a4,a4,1
10001a2c:	fed719e3          	bne	a4,a3,10001a1e <T1001_Sleep+0x154>
10001a30:	478d                	li	a5,3
10001a32:	4742                	lw	a4,16(sp)
10001a34:	eaf71ee3          	bne	a4,a5,100018f0 <T1001_Sleep+0x26>
10001a38:	200027b7          	lui	a5,0x20002
10001a3c:	6b87a783          	lw	a5,1720(a5) # 200026b8 <sleep_wakeup_reason>
10001a40:	ea0788e3          	beqz	a5,100018f0 <T1001_Sleep+0x26>
10001a44:	400807b7          	lui	a5,0x40080
10001a48:	4fdc                	lw	a5,28(a5)
10001a4a:	efcd                	bnez	a5,10001b04 <T1001_Sleep+0x23a>
10001a4c:	200027b7          	lui	a5,0x20002
10001a50:	6a07ac23          	sw	zero,1720(a5) # 200026b8 <sleep_wakeup_reason>
10001a54:	3e800513          	li	a0,1000
10001a58:	f000b097          	auipc	ra,0xf000b
10001a5c:	e7e080e7          	jalr	-386(ra) # c8d6 <delay_us>
10001a60:	4792                	lw	a5,4(sp)
10001a62:	1838                	addi	a4,sp,56
10001a64:	c398                	sw	a4,0(a5)
10001a66:	200037b7          	lui	a5,0x20003
10001a6a:	f40784a3          	sb	zero,-183(a5) # 20002f49 <is_vtimer_to>
10001a6e:	478d                	li	a5,3
10001a70:	4742                	lw	a4,16(sp)
10001a72:	ecf710e3          	bne	a4,a5,10001932 <T1001_Sleep+0x68>
10001a76:	200037b7          	lui	a5,0x20003
10001a7a:	4705                	li	a4,1
10001a7c:	f4e784a3          	sb	a4,-183(a5) # 20002f49 <is_vtimer_to>
10001a80:	400007b7          	lui	a5,0x40000
10001a84:	0b07a783          	lw	a5,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
10001a88:	17fd                	addi	a5,a5,-1
10001a8a:	40080737          	lui	a4,0x40080
10001a8e:	c35c                	sw	a5,4(a4)
10001a90:	200027b7          	lui	a5,0x20002
10001a94:	0838                	addi	a4,sp,24
10001a96:	6ae7ae23          	sw	a4,1724(a5) # 200026bc <uart0_save_buf>
10001a9a:	4792                	lw	a5,4(sp)
10001a9c:	4390                	lw	a2,0(a5)
10001a9e:	100047b7          	lui	a5,0x10004
10001aa2:	41078413          	addi	s0,a5,1040 # 10004410 <addr_list>
10001aa6:	8732                	mv	a4,a2
10001aa8:	41078793          	addi	a5,a5,1040
10001aac:	4394                	lw	a3,0(a5)
10001aae:	4294                	lw	a3,0(a3)
10001ab0:	c314                	sw	a3,0(a4)
10001ab2:	0791                	addi	a5,a5,4
10001ab4:	0711                	addi	a4,a4,4 # 40080004 <__StackTop+0x2007c004>
10001ab6:	100046b7          	lui	a3,0x10004
10001aba:	45468693          	addi	a3,a3,1108 # 10004454 <addr_list+0x44>
10001abe:	fed797e3          	bne	a5,a3,10001aac <T1001_Sleep+0x1e2>
10001ac2:	200017b7          	lui	a5,0x20001
10001ac6:	bc078793          	addi	a5,a5,-1088 # 20000bc0 <more_cr_regs>
10001aca:	04460713          	addi	a4,a2,68 # 42002044 <__StackTop+0x21ffe044>
10001ace:	01478613          	addi	a2,a5,20
10001ad2:	4394                	lw	a3,0(a5)
10001ad4:	4294                	lw	a3,0(a3)
10001ad6:	c314                	sw	a3,0(a4)
10001ad8:	0791                	addi	a5,a5,4
10001ada:	0711                	addi	a4,a4,4
10001adc:	fec79be3          	bne	a5,a2,10001ad2 <T1001_Sleep+0x208>
10001ae0:	200017b7          	lui	a5,0x20001
10001ae4:	bd478793          	addi	a5,a5,-1068 # 20000bd4 <uart_addr_idx_list>
10001ae8:	c03e                	sw	a5,0(sp)
10001aea:	083c                	addi	a5,sp,24
10001aec:	4485                	li	s1,1
10001aee:	ca22                	sw	s0,20(sp)
10001af0:	843e                	mv	s0,a5
10001af2:	bda5                	j	1000196a <T1001_Sleep+0xa0>
10001af4:	4581                	li	a1,0
10001af6:	853e                	mv	a0,a5
10001af8:	3b31                	jal	10001814 <t1001_cfg_wakeup_gpio>
10001afa:	bd61                	j	10001992 <T1001_Sleep+0xc8>
10001afc:	4585                	li	a1,1
10001afe:	853e                	mv	a0,a5
10001b00:	3b11                	jal	10001814 <t1001_cfg_wakeup_gpio>
10001b02:	bd59                	j	10001998 <T1001_Sleep+0xce>
10001b04:	42000737          	lui	a4,0x42000
10001b08:	10072783          	lw	a5,256(a4) # 42000100 <__StackTop+0x21ffc100>
10001b0c:	0107e793          	ori	a5,a5,16
10001b10:	10f72023          	sw	a5,256(a4)
10001b14:	bbf1                	j	100018f0 <T1001_Sleep+0x26>

10001b16 <omw_clkcal_delayus>:
10001b16:	41f55793          	srai	a5,a0,0x1f
10001b1a:	8bfd                	andi	a5,a5,31
10001b1c:	97aa                	add	a5,a5,a0
10001b1e:	40000737          	lui	a4,0x40000
10001b22:	0b072703          	lw	a4,176(a4) # 400000b0 <__StackTop+0x1fffc0b0>
10001b26:	8795                	srai	a5,a5,0x5
10001b28:	4689                	li	a3,2
10001b2a:	00d7f363          	bgeu	a5,a3,10001b30 <omw_clkcal_delayus+0x1a>
10001b2e:	4789                	li	a5,2
10001b30:	97ba                	add	a5,a5,a4
10001b32:	400006b7          	lui	a3,0x40000
10001b36:	0b06a703          	lw	a4,176(a3) # 400000b0 <__StackTop+0x1fffc0b0>
10001b3a:	fef76ee3          	bltu	a4,a5,10001b36 <omw_clkcal_delayus+0x20>
10001b3e:	8082                	ret

10001b40 <omw_clkcal_reset>:
10001b40:	1151                	addi	sp,sp,-12
10001b42:	c406                	sw	ra,8(sp)
10001b44:	c222                	sw	s0,4(sp)
10001b46:	40000437          	lui	s0,0x40000
10001b4a:	07044783          	lbu	a5,112(s0) # 40000070 <__StackTop+0x1fffc070>
10001b4e:	0ff7f793          	zext.b	a5,a5
10001b52:	0027e793          	ori	a5,a5,2
10001b56:	06f40823          	sb	a5,112(s0)
10001b5a:	06400513          	li	a0,100
10001b5e:	3f65                	jal	10001b16 <omw_clkcal_delayus>
10001b60:	07044783          	lbu	a5,112(s0)
10001b64:	0fd7f793          	andi	a5,a5,253
10001b68:	06f40823          	sb	a5,112(s0)
10001b6c:	06400513          	li	a0,100
10001b70:	375d                	jal	10001b16 <omw_clkcal_delayus>
10001b72:	40a2                	lw	ra,8(sp)
10001b74:	4412                	lw	s0,4(sp)
10001b76:	0131                	addi	sp,sp,12
10001b78:	8082                	ret

10001b7a <omw_clkcal_init>:
10001b7a:	40000737          	lui	a4,0x40000
10001b7e:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
10001b82:	0fe7f793          	andi	a5,a5,254
10001b86:	068a                	slli	a3,a3,0x2
10001b88:	8edd                	or	a3,a3,a5
10001b8a:	0ff6f693          	zext.b	a3,a3
10001b8e:	06d70823          	sb	a3,112(a4)
10001b92:	ffd57713          	andi	a4,a0,-3
10001b96:	4785                	li	a5,1
10001b98:	00f70a63          	beq	a4,a5,10001bac <omw_clkcal_init+0x32>
10001b9c:	4785                	li	a5,1
10001b9e:	00a79533          	sll	a0,a5,a0
10001ba2:	0522                	slli	a0,a0,0x8
10001ba4:	00b795b3          	sll	a1,a5,a1
10001ba8:	8dc9                	or	a1,a1,a0
10001baa:	a039                	j	10001bb8 <omw_clkcal_init+0x3e>
10001bac:	00b795b3          	sll	a1,a5,a1
10001bb0:	05a2                	slli	a1,a1,0x8
10001bb2:	00a79533          	sll	a0,a5,a0
10001bb6:	8dc9                	or	a1,a1,a0
10001bb8:	05c2                	slli	a1,a1,0x10
10001bba:	81c1                	srli	a1,a1,0x10
10001bbc:	400007b7          	lui	a5,0x40000
10001bc0:	06b79a23          	sh	a1,116(a5) # 40000074 <__StackTop+0x1fffc074>
10001bc4:	dfb0                	sw	a2,120(a5)
10001bc6:	8082                	ret

10001bc8 <omw_clkcal_enable>:
10001bc8:	400007b7          	lui	a5,0x40000
10001bcc:	0707c703          	lbu	a4,112(a5) # 40000070 <__StackTop+0x1fffc070>
10001bd0:	0ff77713          	zext.b	a4,a4
10001bd4:	00176793          	ori	a5,a4,1
10001bd8:	e119                	bnez	a0,10001bde <omw_clkcal_enable+0x16>
10001bda:	ffe77793          	andi	a5,a4,-2
10001bde:	0ff7f793          	zext.b	a5,a5
10001be2:	40000737          	lui	a4,0x40000
10001be6:	06f70823          	sb	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
10001bea:	8082                	ret

10001bec <omw_clkcal_calpol>:
10001bec:	1151                	addi	sp,sp,-12
10001bee:	c406                	sw	ra,8(sp)
10001bf0:	4681                	li	a3,0
10001bf2:	3761                	jal	10001b7a <omw_clkcal_init>
10001bf4:	37b1                	jal	10001b40 <omw_clkcal_reset>
10001bf6:	4505                	li	a0,1
10001bf8:	3fc1                	jal	10001bc8 <omw_clkcal_enable>
10001bfa:	40000737          	lui	a4,0x40000
10001bfe:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
10001c02:	8bc1                	andi	a5,a5,16
10001c04:	dfed                	beqz	a5,10001bfe <omw_clkcal_calpol+0x12>
10001c06:	400007b7          	lui	a5,0x40000
10001c0a:	5fe8                	lw	a0,124(a5)
10001c0c:	40a2                	lw	ra,8(sp)
10001c0e:	0131                	addi	sp,sp,12
10001c10:	8082                	ret

10001c12 <omw_clkcal_rc24m_calibration>:
10001c12:	1111                	addi	sp,sp,-28
10001c14:	cc06                	sw	ra,24(sp)
10001c16:	ca22                	sw	s0,20(sp)
10001c18:	c826                	sw	s1,16(sp)
10001c1a:	400807b7          	lui	a5,0x40080
10001c1e:	1087a403          	lw	s0,264(a5) # 40080108 <__StackTop+0x2007c108>
10001c22:	8421                	srai	s0,s0,0x8
10001c24:	0ff47413          	zext.b	s0,s0
10001c28:	0ff00493          	li	s1,255
10001c2c:	c002                	sw	zero,0(sp)
10001c2e:	100007b7          	lui	a5,0x10000
10001c32:	17fd                	addi	a5,a5,-1 # fffffff <__FLASH_SIZE+0xffbffff>
10001c34:	c43e                	sw	a5,8(sp)
10001c36:	c63e                	sw	a5,12(sp)
10001c38:	fffc57b7          	lui	a5,0xfffc5
10001c3c:	68078793          	addi	a5,a5,1664 # fffc5680 <__StackTop+0xdffc1680>
10001c40:	c23e                	sw	a5,4(sp)
10001c42:	a82d                	j	10001c7c <omw_clkcal_rc24m_calibration+0x6a>
10001c44:	4782                	lw	a5,0(sp)
10001c46:	40f40733          	sub	a4,s0,a5
10001c4a:	01f75793          	srli	a5,a4,0x1f
10001c4e:	97ba                	add	a5,a5,a4
10001c50:	8785                	srai	a5,a5,0x1
10001c52:	84a2                	mv	s1,s0
10001c54:	8c1d                	sub	s0,s0,a5
10001c56:	c42a                	sw	a0,8(sp)
10001c58:	4782                	lw	a5,0(sp)
10001c5a:	04f40663          	beq	s0,a5,10001ca6 <omw_clkcal_rc24m_calibration+0x94>
10001c5e:	04940463          	beq	s0,s1,10001ca6 <omw_clkcal_rc24m_calibration+0x94>
10001c62:	400806b7          	lui	a3,0x40080
10001c66:	1086a783          	lw	a5,264(a3) # 40080108 <__StackTop+0x2007c108>
10001c6a:	7741                	lui	a4,0xffff0
10001c6c:	0ff70713          	addi	a4,a4,255 # ffff00ff <__StackTop+0xdffec0ff>
10001c70:	8f7d                	and	a4,a4,a5
10001c72:	00841793          	slli	a5,s0,0x8
10001c76:	8fd9                	or	a5,a5,a4
10001c78:	10f6a423          	sw	a5,264(a3)
10001c7c:	0003b637          	lui	a2,0x3b
10001c80:	98060613          	addi	a2,a2,-1664 # 3a980 <memset+0x2dfb4>
10001c84:	4585                	li	a1,1
10001c86:	450d                	li	a0,3
10001c88:	3795                	jal	10001bec <omw_clkcal_calpol>
10001c8a:	4792                	lw	a5,4(sp)
10001c8c:	953e                	add	a0,a0,a5
10001c8e:	faa04be3          	bgtz	a0,10001c44 <omw_clkcal_rc24m_calibration+0x32>
10001c92:	40848733          	sub	a4,s1,s0
10001c96:	01f75793          	srli	a5,a4,0x1f
10001c9a:	97ba                	add	a5,a5,a4
10001c9c:	8785                	srai	a5,a5,0x1
10001c9e:	c022                	sw	s0,0(sp)
10001ca0:	943e                	add	s0,s0,a5
10001ca2:	c62a                	sw	a0,12(sp)
10001ca4:	bf55                	j	10001c58 <omw_clkcal_rc24m_calibration+0x46>
10001ca6:	4732                	lw	a4,12(sp)
10001ca8:	41f75793          	srai	a5,a4,0x1f
10001cac:	8f3d                	xor	a4,a4,a5
10001cae:	8f1d                	sub	a4,a4,a5
10001cb0:	47a2                	lw	a5,8(sp)
10001cb2:	41f7d693          	srai	a3,a5,0x1f
10001cb6:	8fb5                	xor	a5,a5,a3
10001cb8:	8f95                	sub	a5,a5,a3
10001cba:	00e7c363          	blt	a5,a4,10001cc0 <omw_clkcal_rc24m_calibration+0xae>
10001cbe:	4482                	lw	s1,0(sp)
10001cc0:	06800513          	li	a0,104
10001cc4:	02a48533          	mul	a0,s1,a0
10001cc8:	6791                	lui	a5,0x4
10001cca:	51078793          	addi	a5,a5,1296 # 4510 <ll_parse_ctrl+0x36c>
10001cce:	953e                	add	a0,a0,a5
10001cd0:	18e020ef          	jal	10003e5e <__floatsidf>
10001cd4:	100047b7          	lui	a5,0x10004
10001cd8:	4587a603          	lw	a2,1112(a5) # 10004458 <addr_list+0x48>
10001cdc:	45c7a683          	lw	a3,1116(a5)
10001ce0:	5dc010ef          	jal	100032bc <__divdf3>
10001ce4:	100047b7          	lui	a5,0x10004
10001ce8:	4607a603          	lw	a2,1120(a5) # 10004460 <addr_list+0x50>
10001cec:	4647a683          	lw	a3,1124(a5)
10001cf0:	333010ef          	jal	10003822 <__subdf3>
10001cf4:	104020ef          	jal	10003df8 <__fixdfsi>
10001cf8:	0ff00793          	li	a5,255
10001cfc:	00a7d463          	bge	a5,a0,10001d04 <omw_clkcal_rc24m_calibration+0xf2>
10001d00:	0ff00513          	li	a0,255
10001d04:	400807b7          	lui	a5,0x40080
10001d08:	1087a783          	lw	a5,264(a5) # 40080108 <__StackTop+0x2007c108>
10001d0c:	0ff00713          	li	a4,255
10001d10:	00975463          	bge	a4,s1,10001d18 <omw_clkcal_rc24m_calibration+0x106>
10001d14:	0ff00493          	li	s1,255
10001d18:	fff4c713          	not	a4,s1
10001d1c:	877d                	srai	a4,a4,0x1f
10001d1e:	8cf9                	and	s1,s1,a4
10001d20:	04a2                	slli	s1,s1,0x8
10001d22:	ff000737          	lui	a4,0xff000
10001d26:	0ff70713          	addi	a4,a4,255 # ff0000ff <__StackTop+0xdeffc0ff>
10001d2a:	8ff9                	and	a5,a5,a4
10001d2c:	8cdd                	or	s1,s1,a5
10001d2e:	fff54793          	not	a5,a0
10001d32:	87fd                	srai	a5,a5,0x1f
10001d34:	8d7d                	and	a0,a0,a5
10001d36:	0542                	slli	a0,a0,0x10
10001d38:	8cc9                	or	s1,s1,a0
10001d3a:	400807b7          	lui	a5,0x40080
10001d3e:	1097a423          	sw	s1,264(a5) # 40080108 <__StackTop+0x2007c108>
10001d42:	4501                	li	a0,0
10001d44:	3551                	jal	10001bc8 <omw_clkcal_enable>
10001d46:	3bed                	jal	10001b40 <omw_clkcal_reset>
10001d48:	40e2                	lw	ra,24(sp)
10001d4a:	4452                	lw	s0,20(sp)
10001d4c:	44c2                	lw	s1,16(sp)
10001d4e:	0171                	addi	sp,sp,28
10001d50:	8082                	ret

10001d52 <omw_clkcal_rc32k_calibration>:
10001d52:	1111                	addi	sp,sp,-28
10001d54:	cc06                	sw	ra,24(sp)
10001d56:	ca22                	sw	s0,20(sp)
10001d58:	c826                	sw	s1,16(sp)
10001d5a:	400807b7          	lui	a5,0x40080
10001d5e:	10c7d403          	lhu	s0,268(a5) # 4008010c <__StackTop+0x2007c10c>
10001d62:	801d                	srli	s0,s0,0x7
10001d64:	0ff47413          	zext.b	s0,s0
10001d68:	0ff00793          	li	a5,255
10001d6c:	c03e                	sw	a5,0(sp)
10001d6e:	4481                	li	s1,0
10001d70:	100007b7          	lui	a5,0x10000
10001d74:	17fd                	addi	a5,a5,-1 # fffffff <__FLASH_SIZE+0xffbffff>
10001d76:	c43e                	sw	a5,8(sp)
10001d78:	c63e                	sw	a5,12(sp)
10001d7a:	fffc57b7          	lui	a5,0xfffc5
10001d7e:	68078793          	addi	a5,a5,1664 # fffc5680 <__StackTop+0xdffc1680>
10001d82:	c23e                	sw	a5,4(sp)
10001d84:	a081                	j	10001dc4 <omw_clkcal_rc32k_calibration+0x72>
10001d86:	40940733          	sub	a4,s0,s1
10001d8a:	01f75793          	srli	a5,a4,0x1f
10001d8e:	97ba                	add	a5,a5,a4
10001d90:	8785                	srai	a5,a5,0x1
10001d92:	c022                	sw	s0,0(sp)
10001d94:	8c1d                	sub	s0,s0,a5
10001d96:	c42a                	sw	a0,8(sp)
10001d98:	04940a63          	beq	s0,s1,10001dec <omw_clkcal_rc32k_calibration+0x9a>
10001d9c:	4782                	lw	a5,0(sp)
10001d9e:	04f40763          	beq	s0,a5,10001dec <omw_clkcal_rc32k_calibration+0x9a>
10001da2:	400806b7          	lui	a3,0x40080
10001da6:	10c6d783          	lhu	a5,268(a3) # 4008010c <__StackTop+0x2007c10c>
10001daa:	07c2                	slli	a5,a5,0x10
10001dac:	83c1                	srli	a5,a5,0x10
10001dae:	7761                	lui	a4,0xffff8
10001db0:	07f70713          	addi	a4,a4,127 # ffff807f <__StackTop+0xdfff407f>
10001db4:	8f7d                	and	a4,a4,a5
10001db6:	00741793          	slli	a5,s0,0x7
10001dba:	8fd9                	or	a5,a5,a4
10001dbc:	07c2                	slli	a5,a5,0x10
10001dbe:	83c1                	srli	a5,a5,0x10
10001dc0:	10f69623          	sh	a5,268(a3)
10001dc4:	14700613          	li	a2,327
10001dc8:	4581                	li	a1,0
10001dca:	450d                	li	a0,3
10001dcc:	3505                	jal	10001bec <omw_clkcal_calpol>
10001dce:	4792                	lw	a5,4(sp)
10001dd0:	953e                	add	a0,a0,a5
10001dd2:	faa04ae3          	bgtz	a0,10001d86 <omw_clkcal_rc32k_calibration+0x34>
10001dd6:	4782                	lw	a5,0(sp)
10001dd8:	40878733          	sub	a4,a5,s0
10001ddc:	01f75793          	srli	a5,a4,0x1f
10001de0:	97ba                	add	a5,a5,a4
10001de2:	8785                	srai	a5,a5,0x1
10001de4:	84a2                	mv	s1,s0
10001de6:	943e                	add	s0,s0,a5
10001de8:	c62a                	sw	a0,12(sp)
10001dea:	b77d                	j	10001d98 <omw_clkcal_rc32k_calibration+0x46>
10001dec:	4732                	lw	a4,12(sp)
10001dee:	41f75793          	srai	a5,a4,0x1f
10001df2:	8f3d                	xor	a4,a4,a5
10001df4:	8f1d                	sub	a4,a4,a5
10001df6:	47a2                	lw	a5,8(sp)
10001df8:	41f7d693          	srai	a3,a5,0x1f
10001dfc:	8fb5                	xor	a5,a5,a3
10001dfe:	8f95                	sub	a5,a5,a3
10001e00:	00e7c363          	blt	a5,a4,10001e06 <omw_clkcal_rc32k_calibration+0xb4>
10001e04:	c026                	sw	s1,0(sp)
10001e06:	400806b7          	lui	a3,0x40080
10001e0a:	10c6d783          	lhu	a5,268(a3) # 4008010c <__StackTop+0x2007c10c>
10001e0e:	07c2                	slli	a5,a5,0x10
10001e10:	83c1                	srli	a5,a5,0x10
10001e12:	7761                	lui	a4,0xffff8
10001e14:	07f70713          	addi	a4,a4,127 # ffff807f <__StackTop+0xdfff407f>
10001e18:	8f7d                	and	a4,a4,a5
10001e1a:	4782                	lw	a5,0(sp)
10001e1c:	079e                	slli	a5,a5,0x7
10001e1e:	8fd9                	or	a5,a5,a4
10001e20:	07c2                	slli	a5,a5,0x10
10001e22:	83c1                	srli	a5,a5,0x10
10001e24:	10f69623          	sh	a5,268(a3)
10001e28:	4501                	li	a0,0
10001e2a:	3b79                	jal	10001bc8 <omw_clkcal_enable>
10001e2c:	3b11                	jal	10001b40 <omw_clkcal_reset>
10001e2e:	40e2                	lw	ra,24(sp)
10001e30:	4452                	lw	s0,20(sp)
10001e32:	44c2                	lw	s1,16(sp)
10001e34:	0171                	addi	sp,sp,28
10001e36:	8082                	ret

10001e38 <omw_gpio_set_func>:
10001e38:	00351713          	slli	a4,a0,0x3
10001e3c:	01877313          	andi	t1,a4,24
10001e40:	ffc57613          	andi	a2,a0,-4
10001e44:	400106b7          	lui	a3,0x40010
10001e48:	20068793          	addi	a5,a3,512 # 40010200 <__StackTop+0x2000c200>
10001e4c:	963e                	add	a2,a2,a5
10001e4e:	4218                	lw	a4,0(a2)
10001e50:	0ff00793          	li	a5,255
10001e54:	006797b3          	sll	a5,a5,t1
10001e58:	fff7c793          	not	a5,a5
10001e5c:	8ff9                	and	a5,a5,a4
10001e5e:	01f5f713          	andi	a4,a1,31
10001e62:	00671733          	sll	a4,a4,t1
10001e66:	8fd9                	or	a5,a5,a4
10001e68:	c21c                	sw	a5,0(a2)
10001e6a:	00151713          	slli	a4,a0,0x1
10001e6e:	8b79                	andi	a4,a4,30
10001e70:	8111                	srli	a0,a0,0x4
10001e72:	050a                	slli	a0,a0,0x2
10001e74:	0a068693          	addi	a3,a3,160
10001e78:	9536                	add	a0,a0,a3
10001e7a:	4114                	lw	a3,0(a0)
10001e7c:	478d                	li	a5,3
10001e7e:	00e797b3          	sll	a5,a5,a4
10001e82:	fff7c793          	not	a5,a5
10001e86:	8ff5                	and	a5,a5,a3
10001e88:	8195                	srli	a1,a1,0x5
10001e8a:	00e595b3          	sll	a1,a1,a4
10001e8e:	8ddd                	or	a1,a1,a5
10001e90:	c10c                	sw	a1,0(a0)
10001e92:	8082                	ret

10001e94 <wait_uart_not_busy>:
10001e94:	5d7c                	lw	a5,124(a0)
10001e96:	8b85                	andi	a5,a5,1
10001e98:	c791                	beqz	a5,10001ea4 <wait_uart_not_busy+0x10>
10001e9a:	495c                	lw	a5,20(a0)
10001e9c:	8b85                	andi	a5,a5,1
10001e9e:	dbfd                	beqz	a5,10001e94 <wait_uart_not_busy>
10001ea0:	411c                	lw	a5,0(a0)
10001ea2:	bfcd                	j	10001e94 <wait_uart_not_busy>
10001ea4:	8082                	ret

10001ea6 <ll_conn_set_conn_buf>:
10001ea6:	200007b7          	lui	a5,0x20000
10001eaa:	4709                	li	a4,2
10001eac:	76e78223          	sb	a4,1892(a5) # 20000764 <ble_max_conn_nr>
10001eb0:	20000737          	lui	a4,0x20000
10001eb4:	200027b7          	lui	a5,0x20002
10001eb8:	6c078793          	addi	a5,a5,1728 # 200026c0 <ll_conn_buf>
10001ebc:	76f72823          	sw	a5,1904(a4) # 20000770 <ll_conn>
10001ec0:	8082                	ret

10001ec2 <bt_att_set_att_info_buf>:
10001ec2:	1151                	addi	sp,sp,-12
10001ec4:	c406                	sw	ra,8(sp)
10001ec6:	20003537          	lui	a0,0x20003
10001eca:	8d850713          	addi	a4,a0,-1832 # 200028d8 <att_info_buf>
10001ece:	200017b7          	lui	a5,0x20001
10001ed2:	82e7ac23          	sw	a4,-1992(a5) # 20000838 <att_info>
10001ed6:	200007b7          	lui	a5,0x20000
10001eda:	7647c783          	lbu	a5,1892(a5) # 20000764 <ble_max_conn_nr>
10001ede:	00379613          	slli	a2,a5,0x3
10001ee2:	8e1d                	sub	a2,a2,a5
10001ee4:	060a                	slli	a2,a2,0x2
10001ee6:	4581                	li	a1,0
10001ee8:	8d850513          	addi	a0,a0,-1832
10001eec:	f000b097          	auipc	ra,0xf000b
10001ef0:	ae0080e7          	jalr	-1312(ra) # c9cc <memset>
10001ef4:	40a2                	lw	ra,8(sp)
10001ef6:	0131                	addi	sp,sp,12
10001ef8:	8082                	ret

10001efa <bt_att_tx_polling>:
10001efa:	200007b7          	lui	a5,0x20000
10001efe:	7647c783          	lbu	a5,1892(a5) # 20000764 <ble_max_conn_nr>
10001f02:	cba5                	beqz	a5,10001f72 <bt_att_tx_polling+0x78>
10001f04:	1131                	addi	sp,sp,-20
10001f06:	c806                	sw	ra,16(sp)
10001f08:	c622                	sw	s0,12(sp)
10001f0a:	c426                	sw	s1,8(sp)
10001f0c:	4481                	li	s1,0
10001f0e:	c002                	sw	zero,0(sp)
10001f10:	a831                	j	10001f2c <bt_att_tx_polling+0x32>
10001f12:	c85c                	sw	a5,20(s0)
10001f14:	a81d                	j	10001f4a <bt_att_tx_polling+0x50>
10001f16:	4782                	lw	a5,0(sp)
10001f18:	00178713          	addi	a4,a5,1
10001f1c:	c03a                	sw	a4,0(sp)
10001f1e:	04f1                	addi	s1,s1,28
10001f20:	200007b7          	lui	a5,0x20000
10001f24:	7647c783          	lbu	a5,1892(a5) # 20000764 <ble_max_conn_nr>
10001f28:	04f75063          	bge	a4,a5,10001f68 <bt_att_tx_polling+0x6e>
10001f2c:	200017b7          	lui	a5,0x20001
10001f30:	8387a403          	lw	s0,-1992(a5) # 20000838 <att_info>
10001f34:	9426                	add	s0,s0,s1
10001f36:	401c                	lw	a5,0(s0)
10001f38:	dff9                	beqz	a5,10001f16 <bt_att_tx_polling+0x1c>
10001f3a:	4814                	lw	a3,16(s0)
10001f3c:	c236                	sw	a3,4(sp)
10001f3e:	dee1                	beqz	a3,10001f16 <bt_att_tx_polling+0x1c>
10001f40:	429c                	lw	a5,0(a3)
10001f42:	c81c                	sw	a5,16(s0)
10001f44:	4858                	lw	a4,20(s0)
10001f46:	fce686e3          	beq	a3,a4,10001f12 <bt_att_tx_polling+0x18>
10001f4a:	4592                	lw	a1,4(sp)
10001f4c:	8522                	mv	a0,s0
10001f4e:	f0004097          	auipc	ra,0xf0004
10001f52:	dd4080e7          	jalr	-556(ra) # 5d22 <att_send>
10001f56:	d161                	beqz	a0,10001f16 <bt_att_tx_polling+0x1c>
10001f58:	481c                	lw	a5,16(s0)
10001f5a:	4712                	lw	a4,4(sp)
10001f5c:	c31c                	sw	a5,0(a4)
10001f5e:	c818                	sw	a4,16(s0)
10001f60:	485c                	lw	a5,20(s0)
10001f62:	fbd5                	bnez	a5,10001f16 <bt_att_tx_polling+0x1c>
10001f64:	c858                	sw	a4,20(s0)
10001f66:	bf45                	j	10001f16 <bt_att_tx_polling+0x1c>
10001f68:	40c2                	lw	ra,16(sp)
10001f6a:	4432                	lw	s0,12(sp)
10001f6c:	44a2                	lw	s1,8(sp)
10001f6e:	0151                	addi	sp,sp,20
10001f70:	8082                	ret
10001f72:	8082                	ret

10001f74 <bt_att_can_sleep>:
10001f74:	200007b7          	lui	a5,0x20000
10001f78:	7647c603          	lbu	a2,1892(a5) # 20000764 <ble_max_conn_nr>
10001f7c:	02c05463          	blez	a2,10001fa4 <bt_att_can_sleep+0x30>
10001f80:	200017b7          	lui	a5,0x20001
10001f84:	8387a783          	lw	a5,-1992(a5) # 20000838 <att_info>
10001f88:	4701                	li	a4,0
10001f8a:	a029                	j	10001f94 <bt_att_can_sleep+0x20>
10001f8c:	0705                	addi	a4,a4,1
10001f8e:	07f1                	addi	a5,a5,28
10001f90:	00c70863          	beq	a4,a2,10001fa0 <bt_att_can_sleep+0x2c>
10001f94:	4394                	lw	a3,0(a5)
10001f96:	dafd                	beqz	a3,10001f8c <bt_att_can_sleep+0x18>
10001f98:	4b94                	lw	a3,16(a5)
10001f9a:	daed                	beqz	a3,10001f8c <bt_att_can_sleep+0x18>
10001f9c:	4501                	li	a0,0
10001f9e:	8082                	ret
10001fa0:	4505                	li	a0,1
10001fa2:	8082                	ret
10001fa4:	4505                	li	a0,1
10001fa6:	8082                	ret

10001fa8 <bt_conn_set_acl_conns_buf>:
10001fa8:	1151                	addi	sp,sp,-12
10001faa:	c406                	sw	ra,8(sp)
10001fac:	20003537          	lui	a0,0x20003
10001fb0:	91050713          	addi	a4,a0,-1776 # 20002910 <acl_conns_buf>
10001fb4:	200017b7          	lui	a5,0x20001
10001fb8:	82e7ae23          	sw	a4,-1988(a5) # 2000083c <acl_conns>
10001fbc:	200007b7          	lui	a5,0x20000
10001fc0:	7647c603          	lbu	a2,1892(a5) # 20000764 <ble_max_conn_nr>
10001fc4:	07400793          	li	a5,116
10001fc8:	02f60633          	mul	a2,a2,a5
10001fcc:	4581                	li	a1,0
10001fce:	91050513          	addi	a0,a0,-1776
10001fd2:	f000b097          	auipc	ra,0xf000b
10001fd6:	9fa080e7          	jalr	-1542(ra) # c9cc <memset>
10001fda:	40a2                	lw	ra,8(sp)
10001fdc:	0131                	addi	sp,sp,12
10001fde:	8082                	ret

10001fe0 <bt_buf_init>:
10001fe0:	1151                	addi	sp,sp,-12
10001fe2:	c406                	sw	ra,8(sp)
10001fe4:	200007b7          	lui	a5,0x20000
10001fe8:	0ff00713          	li	a4,255
10001fec:	4ae79a23          	sh	a4,1204(a5) # 200004b4 <bt_buf_max_len>
10001ff0:	200007b7          	lui	a5,0x20000
10001ff4:	4ac78793          	addi	a5,a5,1196 # 200004ac <bt_buf_cnt_info>
10001ff8:	470d                	li	a4,3
10001ffa:	00e78023          	sb	a4,0(a5)
10001ffe:	00e78123          	sb	a4,2(a5)
10002002:	4715                	li	a4,5
10002004:	00e78223          	sb	a4,4(a5)
10002008:	00e78323          	sb	a4,6(a5)
1000200c:	8189                	srli	a1,a1,0x2
1000200e:	f000a097          	auipc	ra,0xf000a
10002012:	2a0080e7          	jalr	672(ra) # c2ae <simple_buf_init_buf>
10002016:	40a2                	lw	ra,8(sp)
10002018:	0131                	addi	sp,sp,12
1000201a:	8082                	ret

1000201c <bt_buf_init_ext>:
1000201c:	1151                	addi	sp,sp,-12
1000201e:	c406                	sw	ra,8(sp)
10002020:	200007b7          	lui	a5,0x20000
10002024:	472d                	li	a4,11
10002026:	2ce78423          	sb	a4,712(a5) # 200002c8 <ll_ver_nr>
1000202a:	20000737          	lui	a4,0x20000
1000202e:	6785                	lui	a5,0x1
10002030:	b2478793          	addi	a5,a5,-1244 # b24 <__STACK_SIZE+0x724>
10002034:	2af71e23          	sh	a5,700(a4) # 200002bc <ll_company_id>
10002038:	20000737          	lui	a4,0x20000
1000203c:	77ed                	lui	a5,0xffffb
1000203e:	bcd78793          	addi	a5,a5,-1075 # ffffabcd <__StackTop+0xdfff6bcd>
10002042:	2cf71323          	sh	a5,710(a4) # 200002c6 <ll_subv_nr>
10002046:	50000593          	li	a1,1280
1000204a:	20003537          	lui	a0,0x20003
1000204e:	9f850513          	addi	a0,a0,-1544 # 200029f8 <__dyn_ram>
10002052:	3779                	jal	10001fe0 <bt_buf_init>
10002054:	40a2                	lw	ra,8(sp)
10002056:	0131                	addi	sp,sp,12
10002058:	8082                	ret

1000205a <hci_driver_init>:
1000205a:	1151                	addi	sp,sp,-12
1000205c:	c406                	sw	ra,8(sp)
1000205e:	10004537          	lui	a0,0x10004
10002062:	46850513          	addi	a0,a0,1128 # 10004468 <drv>
10002066:	f0007097          	auipc	ra,0xf0007
1000206a:	fae080e7          	jalr	-82(ra) # 9014 <bt_hci_driver_register>
1000206e:	40a2                	lw	ra,8(sp)
10002070:	0131                	addi	sp,sp,12
10002072:	8082                	ret

10002074 <bt_storage_kv_flash_init>:
10002074:	8082                	ret

10002076 <bt_smp_recv>:
10002076:	4501                	li	a0,0
10002078:	8082                	ret

1000207a <bt_smp_connected>:
1000207a:	8082                	ret

1000207c <bt_smp_disconnected>:
1000207c:	8082                	ret

1000207e <bt_smp_encrypt_change>:
1000207e:	8082                	ret

10002080 <bt_smp_start_security>:
10002080:	4501                	li	a0,0
10002082:	8082                	ret

10002084 <bt_smp_update_keys>:
10002084:	8082                	ret

10002086 <bt_smp_request_ltk>:
10002086:	4501                	li	a0,0
10002088:	8082                	ret

1000208a <bt_keys_find_addr>:
1000208a:	4501                	li	a0,0
1000208c:	8082                	ret

1000208e <sys_timeout_work>:
1000208e:	8082                	ret

10002090 <omw_svc_set_addr>:
10002090:	200017b7          	lui	a5,0x20001
10002094:	bdc78793          	addi	a5,a5,-1060 # 20000bdc <bdaddr>
10002098:	00554703          	lbu	a4,5(a0)
1000209c:	00e78023          	sb	a4,0(a5)
100020a0:	00454703          	lbu	a4,4(a0)
100020a4:	00e780a3          	sb	a4,1(a5)
100020a8:	00354703          	lbu	a4,3(a0)
100020ac:	00e78123          	sb	a4,2(a5)
100020b0:	00254703          	lbu	a4,2(a0)
100020b4:	00e781a3          	sb	a4,3(a5)
100020b8:	00154703          	lbu	a4,1(a0)
100020bc:	00e78223          	sb	a4,4(a5)
100020c0:	00054703          	lbu	a4,0(a0)
100020c4:	00e782a3          	sb	a4,5(a5)
100020c8:	8082                	ret

100020ca <bt_base_init>:
100020ca:	1151                	addi	sp,sp,-12
100020cc:	c406                	sw	ra,8(sp)
100020ce:	c222                	sw	s0,4(sp)
100020d0:	842a                	mv	s0,a0
100020d2:	20000737          	lui	a4,0x20000
100020d6:	200017b7          	lui	a5,0x20001
100020da:	4c278793          	addi	a5,a5,1218 # 200014c2 <RADIO_CommonDescInit_SetFreq>
100020de:	3ef72223          	sw	a5,996(a4) # 200003e4 <RADIO_CommonDescInit_SetFreq_ptr>
100020e2:	20000737          	lui	a4,0x20000
100020e6:	100027b7          	lui	a5,0x10002
100020ea:	07478793          	addi	a5,a5,116 # 10002074 <bt_storage_kv_flash_init>
100020ee:	40f72423          	sw	a5,1032(a4) # 20000408 <bt_storage_kv_flash_init_ptr>
100020f2:	20000737          	lui	a4,0x20000
100020f6:	100027b7          	lui	a5,0x10002
100020fa:	07678793          	addi	a5,a5,118 # 10002076 <bt_smp_recv>
100020fe:	3ef72c23          	sw	a5,1016(a4) # 200003f8 <bt_smp_recv_ptr>
10002102:	20000737          	lui	a4,0x20000
10002106:	100027b7          	lui	a5,0x10002
1000210a:	07a78793          	addi	a5,a5,122 # 1000207a <bt_smp_connected>
1000210e:	3ef72623          	sw	a5,1004(a4) # 200003ec <bt_smp_connected_ptr>
10002112:	20000737          	lui	a4,0x20000
10002116:	100027b7          	lui	a5,0x10002
1000211a:	07c78793          	addi	a5,a5,124 # 1000207c <bt_smp_disconnected>
1000211e:	3ef72823          	sw	a5,1008(a4) # 200003f0 <bt_smp_disconnected_ptr>
10002122:	20000737          	lui	a4,0x20000
10002126:	100027b7          	lui	a5,0x10002
1000212a:	07e78793          	addi	a5,a5,126 # 1000207e <bt_smp_encrypt_change>
1000212e:	3ef72a23          	sw	a5,1012(a4) # 200003f4 <bt_smp_encrypt_change_ptr>
10002132:	20000737          	lui	a4,0x20000
10002136:	100027b7          	lui	a5,0x10002
1000213a:	08078793          	addi	a5,a5,128 # 10002080 <bt_smp_start_security>
1000213e:	40f72023          	sw	a5,1024(a4) # 20000400 <bt_smp_start_security_ptr>
10002142:	20000737          	lui	a4,0x20000
10002146:	100027b7          	lui	a5,0x10002
1000214a:	08478793          	addi	a5,a5,132 # 10002084 <bt_smp_update_keys>
1000214e:	40f72223          	sw	a5,1028(a4) # 20000404 <bt_smp_update_keys_ptr>
10002152:	20000737          	lui	a4,0x20000
10002156:	100027b7          	lui	a5,0x10002
1000215a:	08678793          	addi	a5,a5,134 # 10002086 <bt_smp_request_ltk>
1000215e:	3ef72e23          	sw	a5,1020(a4) # 200003fc <bt_smp_request_ltk_ptr>
10002162:	20000737          	lui	a4,0x20000
10002166:	100027b7          	lui	a5,0x10002
1000216a:	08a78793          	addi	a5,a5,138 # 1000208a <bt_keys_find_addr>
1000216e:	3ef72423          	sw	a5,1000(a4) # 200003e8 <bt_keys_find_addr_ptr>
10002172:	20000737          	lui	a4,0x20000
10002176:	100027b7          	lui	a5,0x10002
1000217a:	08e78793          	addi	a5,a5,142 # 1000208e <sys_timeout_work>
1000217e:	40f72623          	sw	a5,1036(a4) # 2000040c <sys_timeout_work_ptr>
10002182:	200017b7          	lui	a5,0x20001
10002186:	900788a3          	sb	zero,-1775(a5) # 20000911 <g_tail_rsvd_wdl>
1000218a:	200017b7          	lui	a5,0x20001
1000218e:	90078823          	sb	zero,-1776(a5) # 20000910 <g_hdr_rsvd_wdl>
10002192:	3b11                	jal	10001ea6 <ll_conn_set_conn_buf>
10002194:	3d11                	jal	10001fa8 <bt_conn_set_acl_conns_buf>
10002196:	3335                	jal	10001ec2 <bt_att_set_att_info_buf>
10002198:	20000737          	lui	a4,0x20000
1000219c:	200017b7          	lui	a5,0x20001
100021a0:	e8078793          	addi	a5,a5,-384 # 20000e80 <rf_common_desc_tx_setfreq>
100021a4:	40f72a23          	sw	a5,1044(a4) # 20000414 <rf_bt_common_desc_tx_setfreq>
100021a8:	20000737          	lui	a4,0x20000
100021ac:	200017b7          	lui	a5,0x20001
100021b0:	de878793          	addi	a5,a5,-536 # 20000de8 <rf_common_desc_rx_setfreq>
100021b4:	40f72823          	sw	a5,1040(a4) # 20000410 <rf_bt_common_desc_rx_setfreq>
100021b8:	e08007b7          	lui	a5,0xe0800
100021bc:	43dc                	lw	a5,4(a5)
100021be:	83d5                	srli	a5,a5,0x15
100021c0:	8bbd                	andi	a5,a5,15
100021c2:	46a1                	li	a3,8
100021c4:	8e9d                	sub	a3,a3,a5
100021c6:	e0801737          	lui	a4,0xe0801
100021ca:	04f74783          	lbu	a5,79(a4) # e080104f <__StackTop+0xc07fd04f>
100021ce:	0ff7f613          	zext.b	a2,a5
100021d2:	0ff00793          	li	a5,255
100021d6:	00d797b3          	sll	a5,a5,a3
100021da:	fff7c793          	not	a5,a5
100021de:	8ff1                	and	a5,a5,a2
100021e0:	460d                	li	a2,3
100021e2:	00d616b3          	sll	a3,a2,a3
100021e6:	8fd5                	or	a5,a5,a3
100021e8:	0ff7f793          	zext.b	a5,a5
100021ec:	04f707a3          	sb	a5,79(a4)
100021f0:	04d74783          	lbu	a5,77(a4)
100021f4:	0ff7f793          	zext.b	a5,a5
100021f8:	0017e793          	ori	a5,a5,1
100021fc:	04f706a3          	sb	a5,77(a4)
10002200:	2a61                	jal	10002398 <RADIO_Init>
10002202:	2091                	jal	10002246 <RF_BT_Init>
10002204:	57e9                	li	a5,-6
10002206:	20000737          	lui	a4,0x20000
1000220a:	6ef70da3          	sb	a5,1787(a4) # 200006fb <adv_nxt_chl_tmr_gap>
1000220e:	20000737          	lui	a4,0x20000
10002212:	6ef70d23          	sb	a5,1786(a4) # 200006fa <adv_int_tx_gap>
10002216:	06f00793          	li	a5,111
1000221a:	20000737          	lui	a4,0x20000
1000221e:	4af71b23          	sh	a5,1206(a4) # 200004b6 <ll_gap_time>
10002222:	20003737          	lui	a4,0x20003
10002226:	eef71c23          	sh	a5,-264(a4) # 20002ef8 <ll_gap_time_1m>
1000222a:	200015b7          	lui	a1,0x20001
1000222e:	bdc58593          	addi	a1,a1,-1060 # 20000bdc <bdaddr>
10002232:	4501                	li	a0,0
10002234:	f0000097          	auipc	ra,0xf0000
10002238:	2a0080e7          	jalr	672(ra) # 24d4 <ll_addr_set>
1000223c:	9402                	jalr	s0
1000223e:	40a2                	lw	ra,8(sp)
10002240:	4412                	lw	s0,4(sp)
10002242:	0131                	addi	sp,sp,12
10002244:	8082                	ret

10002246 <RF_BT_Init>:
10002246:	1141                	addi	sp,sp,-16
10002248:	c606                	sw	ra,12(sp)
1000224a:	c422                	sw	s0,8(sp)
1000224c:	c226                	sw	s1,4(sp)
1000224e:	26d1                	jal	10002612 <RF_OnChip_Init>
10002250:	200007b7          	lui	a5,0x20000
10002254:	43078793          	addi	a5,a5,1072 # 20000430 <rf_bt_time_info>
10002258:	10004737          	lui	a4,0x10004
1000225c:	47470713          	addi	a4,a4,1140 # 10004474 <time_info>
10002260:	00075483          	lhu	s1,0(a4)
10002264:	00275403          	lhu	s0,2(a4)
10002268:	00475383          	lhu	t2,4(a4)
1000226c:	00675283          	lhu	t0,6(a4)
10002270:	00875303          	lhu	t1,8(a4)
10002274:	00a75503          	lhu	a0,10(a4)
10002278:	00c75583          	lhu	a1,12(a4)
1000227c:	00e75603          	lhu	a2,14(a4)
10002280:	01075683          	lhu	a3,16(a4)
10002284:	00d11123          	sh	a3,2(sp)
10002288:	01275683          	lhu	a3,18(a4)
1000228c:	01475703          	lhu	a4,20(a4)
10002290:	00979023          	sh	s1,0(a5)
10002294:	00879123          	sh	s0,2(a5)
10002298:	00779223          	sh	t2,4(a5)
1000229c:	00579323          	sh	t0,6(a5)
100022a0:	00679423          	sh	t1,8(a5)
100022a4:	00a79523          	sh	a0,10(a5)
100022a8:	00b79623          	sh	a1,12(a5)
100022ac:	00c79723          	sh	a2,14(a5)
100022b0:	00215603          	lhu	a2,2(sp)
100022b4:	00c79823          	sh	a2,16(a5)
100022b8:	00d79923          	sh	a3,18(a5)
100022bc:	00e79a23          	sh	a4,20(a5)
100022c0:	200007b7          	lui	a5,0x20000
100022c4:	42078793          	addi	a5,a5,1056 # 20000420 <rf_bt_mgr>
100022c8:	0007a023          	sw	zero,0(a5)
100022cc:	0007a223          	sw	zero,4(a5)
100022d0:	0007a423          	sw	zero,8(a5)
100022d4:	0007a623          	sw	zero,12(a5)
100022d8:	20000737          	lui	a4,0x20000
100022dc:	004a57b7          	lui	a5,0x4a5
100022e0:	07a1                	addi	a5,a5,8 # 4a5008 <__FLASH_SIZE+0x465008>
100022e2:	40f72e23          	sw	a5,1052(a4) # 2000041c <rf_bt_common_desc_txrx_ifs_delay+0x4>
100022e6:	420007b7          	lui	a5,0x42000
100022ea:	470d                	li	a4,3
100022ec:	cfd8                	sw	a4,28(a5)
100022ee:	01000737          	lui	a4,0x1000
100022f2:	65b70713          	addi	a4,a4,1627 # 100065b <__FLASH_SIZE+0xfc065b>
100022f6:	d3d8                	sw	a4,36(a5)
100022f8:	4721                	li	a4,8
100022fa:	04e78a23          	sb	a4,84(a5) # 42000054 <__StackTop+0x21ffc054>
100022fe:	200007b7          	lui	a5,0x20000
10002302:	1b478793          	addi	a5,a5,436 # 200001b4 <rf_call_desc_list_tx_process>
10002306:	20001737          	lui	a4,0x20001
1000230a:	dc870713          	addi	a4,a4,-568 # 20000dc8 <rf_common_desc_rftx_on>
1000230e:	c798                	sw	a4,8(a5)
10002310:	20001737          	lui	a4,0x20001
10002314:	da870713          	addi	a4,a4,-600 # 20000da8 <rf_common_desc_rftx_off>
10002318:	cbb8                	sw	a4,80(a5)
1000231a:	20000737          	lui	a4,0x20000
1000231e:	16470713          	addi	a4,a4,356 # 20000164 <rf_call_desc_list_rx_process>
10002322:	200016b7          	lui	a3,0x20001
10002326:	d8868693          	addi	a3,a3,-632 # 20000d88 <rf_common_desc_rfrx_on>
1000232a:	c714                	sw	a3,8(a4)
1000232c:	200016b7          	lui	a3,0x20001
10002330:	d6868693          	addi	a3,a3,-664 # 20000d68 <rf_common_desc_rfrx_off>
10002334:	c734                	sw	a3,72(a4)
10002336:	200006b7          	lui	a3,0x20000
1000233a:	0bc68693          	addi	a3,a3,188 # 200000bc <rf_bt_common_desc_rx_pkt>
1000233e:	db14                	sw	a3,48(a4)
10002340:	20000737          	lui	a4,0x20000
10002344:	41472683          	lw	a3,1044(a4) # 20000414 <rf_bt_common_desc_tx_setfreq>
10002348:	20000737          	lui	a4,0x20000
1000234c:	0ad72a23          	sw	a3,180(a4) # 200000b4 <rf_bt_call_desc_list_tx_setfreq_delay>
10002350:	200006b7          	lui	a3,0x20000
10002354:	20001737          	lui	a4,0x20001
10002358:	e8070713          	addi	a4,a4,-384 # 20000e80 <rf_common_desc_tx_setfreq>
1000235c:	00e6a223          	sw	a4,4(a3) # 20000004 <not_1st_tx_patch_desc>
10002360:	20001737          	lui	a4,0x20001
10002364:	bec70713          	addi	a4,a4,-1044 # 20000bec <rf_common_desc_mdm_txon_v0_2_0_ext>
10002368:	d398                	sw	a4,32(a5)
1000236a:	20001737          	lui	a4,0x20001
1000236e:	c2c70713          	addi	a4,a4,-980 # 20000c2c <rf_common_desc_rf_tx_pa_off_ext>
10002372:	df98                	sw	a4,56(a5)
10002374:	20001737          	lui	a4,0x20001
10002378:	c1c70713          	addi	a4,a4,-996 # 20000c1c <rf_common_desc_rf_tx_dac_off_ext>
1000237c:	c7b8                	sw	a4,72(a5)
1000237e:	200007b7          	lui	a5,0x20000
10002382:	4107a703          	lw	a4,1040(a5) # 20000410 <rf_bt_common_desc_rx_setfreq>
10002386:	200007b7          	lui	a5,0x20000
1000238a:	02e7a623          	sw	a4,44(a5) # 2000002c <rf_bt_call_desc_list_rx_setfreq_delay>
1000238e:	40b2                	lw	ra,12(sp)
10002390:	4422                	lw	s0,8(sp)
10002392:	4492                	lw	s1,4(sp)
10002394:	0141                	addi	sp,sp,16
10002396:	8082                	ret

10002398 <RADIO_Init>:
10002398:	200007b7          	lui	a5,0x20000
1000239c:	10004737          	lui	a4,0x10004
100023a0:	48c70713          	addi	a4,a4,1164 # 1000448c <time_info>
100023a4:	00074683          	lbu	a3,0(a4)
100023a8:	4ad78023          	sb	a3,1184(a5) # 200004a0 <rf_common_time_info>
100023ac:	4a078793          	addi	a5,a5,1184
100023b0:	00174703          	lbu	a4,1(a4)
100023b4:	00e780a3          	sb	a4,1(a5)
100023b8:	200007b7          	lui	a5,0x20000
100023bc:	4709                	li	a4,2
100023be:	4ae78223          	sb	a4,1188(a5) # 200004a4 <rf_err_thr_cfg>
100023c2:	4a478793          	addi	a5,a5,1188
100023c6:	00e780a3          	sb	a4,1(a5)
100023ca:	02400693          	li	a3,36
100023ce:	00d78123          	sb	a3,2(a5)
100023d2:	00e781a3          	sb	a4,3(a5)
100023d6:	20000737          	lui	a4,0x20000
100023da:	001e57b7          	lui	a5,0x1e5
100023de:	07a1                	addi	a5,a5,8 # 1e5008 <__FLASH_SIZE+0x1a5008>
100023e0:	48f72e23          	sw	a5,1180(a4) # 2000049c <rf_common_desc_tx_end_delay+0x4>
100023e4:	420006b7          	lui	a3,0x42000
100023e8:	6705                	lui	a4,0x1
100023ea:	70170793          	addi	a5,a4,1793 # 1701 <__STACK_SIZE+0x1301>
100023ee:	10f69023          	sh	a5,256(a3) # 42000100 <__StackTop+0x21ffc100>
100023f2:	478d                	li	a5,3
100023f4:	06f68023          	sb	a5,96(a3)
100023f8:	e08007b7          	lui	a5,0xe0800
100023fc:	43dc                	lw	a5,4(a5)
100023fe:	83d5                	srli	a5,a5,0x15
10002400:	8bbd                	andi	a5,a5,15
10002402:	45a1                	li	a1,8
10002404:	8d9d                	sub	a1,a1,a5
10002406:	e0801637          	lui	a2,0xe0801
1000240a:	04b64783          	lbu	a5,75(a2) # e080104b <__StackTop+0xc07fd04b>
1000240e:	0ff7f513          	zext.b	a0,a5
10002412:	0ff00793          	li	a5,255
10002416:	00b797b3          	sll	a5,a5,a1
1000241a:	fff7c793          	not	a5,a5
1000241e:	8fe9                	and	a5,a5,a0
10002420:	4511                	li	a0,4
10002422:	00b515b3          	sll	a1,a0,a1
10002426:	8fcd                	or	a5,a5,a1
10002428:	0ff7f793          	zext.b	a5,a5
1000242c:	04f605a3          	sb	a5,75(a2)
10002430:	04964783          	lbu	a5,73(a2)
10002434:	0ff7f793          	zext.b	a5,a5
10002438:	0017e793          	ori	a5,a5,1
1000243c:	04f604a3          	sb	a5,73(a2)
10002440:	02f00613          	li	a2,47
10002444:	0cc6a623          	sw	a2,204(a3)
10002448:	77fd                	lui	a5,0xfffff
1000244a:	70078793          	addi	a5,a5,1792 # fffff700 <__StackTop+0xdfffb700>
1000244e:	00f69423          	sh	a5,8(a3)
10002452:	420017b7          	lui	a5,0x42001
10002456:	b0070713          	addi	a4,a4,-1280
1000245a:	db98                	sw	a4,48(a5)
1000245c:	02c00713          	li	a4,44
10002460:	10e7a023          	sw	a4,256(a5) # 42001100 <__StackTop+0x21ffd100>
10002464:	1407a623          	sw	zero,332(a5)
10002468:	8082                	ret

1000246a <rf_get_ad_pll_counter>:
1000246a:	1131                	addi	sp,sp,-20
1000246c:	c806                	sw	ra,16(sp)
1000246e:	c622                	sw	s0,12(sp)
10002470:	c426                	sw	s1,8(sp)
10002472:	c02a                	sw	a0,0(sp)
10002474:	c22e                	sw	a1,4(sp)
10002476:	4415                	li	s0,5
10002478:	4481                	li	s1,0
1000247a:	400006b7          	lui	a3,0x40000
1000247e:	1846a783          	lw	a5,388(a3) # 40000184 <__StackTop+0x1fffc184>
10002482:	7741                	lui	a4,0xffff0
10002484:	8ff9                	and	a5,a5,a4
10002486:	4712                	lw	a4,4(sp)
10002488:	8fd9                	or	a5,a5,a4
1000248a:	18f6a223          	sw	a5,388(a3)
1000248e:	4502                	lw	a0,0(sp)
10002490:	0ffff097          	auipc	ra,0xffff
10002494:	458080e7          	jalr	1112(ra) # 200018e8 <_rf_kvco_read_y>
10002498:	94aa                	add	s1,s1,a0
1000249a:	147d                	addi	s0,s0,-1
1000249c:	fc79                	bnez	s0,1000247a <rf_get_ad_pll_counter+0x10>
1000249e:	4515                	li	a0,5
100024a0:	02a4d533          	divu	a0,s1,a0
100024a4:	40c2                	lw	ra,16(sp)
100024a6:	4432                	lw	s0,12(sp)
100024a8:	44a2                	lw	s1,8(sp)
100024aa:	0151                	addi	sp,sp,20
100024ac:	8082                	ret

100024ae <omw_rf_set_tx_pwr_lvl>:
100024ae:	200037b7          	lui	a5,0x20003
100024b2:	f2178783          	lb	a5,-223(a5) # 20002f21 <g_rf_cfg+0x9>
100024b6:	953e                	add	a0,a0,a5
100024b8:	57a5                	li	a5,-23
100024ba:	00f55363          	bge	a0,a5,100024c0 <omw_rf_set_tx_pwr_lvl+0x12>
100024be:	5525                	li	a0,-23
100024c0:	200037b7          	lui	a5,0x20003
100024c4:	f1a7c683          	lbu	a3,-230(a5) # 20002f1a <g_rf_cfg+0x2>
100024c8:	01968593          	addi	a1,a3,25
100024cc:	0ff5f593          	zext.b	a1,a1
100024d0:	47b5                	li	a5,13
100024d2:	00a7d363          	bge	a5,a0,100024d8 <omw_rf_set_tx_pwr_lvl+0x2a>
100024d6:	4535                	li	a0,13
100024d8:	01750793          	addi	a5,a0,23
100024dc:	0ff7f793          	zext.b	a5,a5
100024e0:	02100713          	li	a4,33
100024e4:	4601                	li	a2,0
100024e6:	00f77d63          	bgeu	a4,a5,10002500 <omw_rf_set_tx_pwr_lvl+0x52>
100024ea:	fde78713          	addi	a4,a5,-34
100024ee:	00171613          	slli	a2,a4,0x1
100024f2:	10004737          	lui	a4,0x10004
100024f6:	4dc70713          	addi	a4,a4,1244 # 100044dc <rf_pwr_lvl_map_1>
100024fa:	9732                	add	a4,a4,a2
100024fc:	00075603          	lhu	a2,0(a4)
10002500:	00561713          	slli	a4,a2,0x5
10002504:	80077713          	andi	a4,a4,-2048
10002508:	03f67613          	andi	a2,a2,63
1000250c:	8e59                	or	a2,a2,a4
1000250e:	00168713          	addi	a4,a3,1
10002512:	072e                	slli	a4,a4,0xb
10002514:	06be                	slli	a3,a3,0xf
10002516:	8ecd                	or	a3,a3,a1
10002518:	8ed9                	or	a3,a3,a4
1000251a:	00c68733          	add	a4,a3,a2
1000251e:	00179693          	slli	a3,a5,0x1
10002522:	100047b7          	lui	a5,0x10004
10002526:	49078793          	addi	a5,a5,1168 # 10004490 <rf_pwr_lvl_map_0>
1000252a:	97b6                	add	a5,a5,a3
1000252c:	0007d783          	lhu	a5,0(a5)
10002530:	420026b7          	lui	a3,0x42002
10002534:	08c6a583          	lw	a1,140(a3) # 4200208c <__StackTop+0x21ffe08c>
10002538:	03f7f613          	andi	a2,a5,63
1000253c:	fffc0537          	lui	a0,0xfffc0
10002540:	7c050513          	addi	a0,a0,1984 # fffc07c0 <__StackTop+0xdffbc7c0>
10002544:	8de9                	and	a1,a1,a0
10002546:	8e4d                	or	a2,a2,a1
10002548:	0796                	slli	a5,a5,0x5
1000254a:	8007f793          	andi	a5,a5,-2048
1000254e:	8fd1                	or	a5,a5,a2
10002550:	08f6a623          	sw	a5,140(a3)
10002554:	469c                	lw	a5,8(a3)
10002556:	fff80637          	lui	a2,0xfff80
1000255a:	7c060613          	addi	a2,a2,1984 # fff807c0 <__StackTop+0xdff7c7c0>
1000255e:	8ff1                	and	a5,a5,a2
10002560:	8fd9                	or	a5,a5,a4
10002562:	c69c                	sw	a5,8(a3)
10002564:	200017b7          	lui	a5,0x20001
10002568:	e8078793          	addi	a5,a5,-384 # 20000e80 <rf_common_desc_tx_setfreq>
1000256c:	00b75693          	srli	a3,a4,0xb
10002570:	8abd                	andi	a3,a3,15
10002572:	06ce                	slli	a3,a3,0x13
10002574:	5bcc                	lw	a1,52(a5)
10002576:	ff010637          	lui	a2,0xff010
1000257a:	167d                	addi	a2,a2,-1 # ff00ffff <__StackTop+0xdf00bfff>
1000257c:	8df1                	and	a1,a1,a2
1000257e:	8ecd                	or	a3,a3,a1
10002580:	dbd4                	sw	a3,52(a5)
10002582:	00f75693          	srli	a3,a4,0xf
10002586:	8a85                	andi	a3,a3,1
10002588:	06de                	slli	a3,a3,0x17
1000258a:	5fcc                	lw	a1,60(a5)
1000258c:	8df1                	and	a1,a1,a2
1000258e:	8ecd                	or	a3,a3,a1
10002590:	dfd4                	sw	a3,60(a5)
10002592:	000706b7          	lui	a3,0x70
10002596:	8f75                	and	a4,a4,a3
10002598:	43f4                	lw	a3,68(a5)
1000259a:	8e75                	and	a2,a2,a3
1000259c:	8f51                	or	a4,a4,a2
1000259e:	c3f8                	sw	a4,68(a5)
100025a0:	4501                	li	a0,0
100025a2:	8082                	ret

100025a4 <PMU_OnChip_Init>:
100025a4:	1151                	addi	sp,sp,-12
100025a6:	c406                	sw	ra,8(sp)
100025a8:	087000ef          	jal	10002e2e <omw_rf_cal>
100025ac:	400807b7          	lui	a5,0x40080
100025b0:	1107a703          	lw	a4,272(a5) # 40080110 <__StackTop+0x2007c110>
100025b4:	00776713          	ori	a4,a4,7
100025b8:	10e7a823          	sw	a4,272(a5)
100025bc:	6725                	lui	a4,0x9
100025be:	64270713          	addi	a4,a4,1602 # 9642 <bt_data_parse+0x5c>
100025c2:	d3b8                	sw	a4,96(a5)
100025c4:	6719                	lui	a4,0x6
100025c6:	bab70713          	addi	a4,a4,-1109 # 5bab <hci_send_cmd_le_set_adv_enable+0x4c5>
100025ca:	10e7a623          	sw	a4,268(a5)
100025ce:	21290737          	lui	a4,0x21290
100025d2:	177d                	addi	a4,a4,-1 # 2128ffff <__StackTop+0x128bfff>
100025d4:	c798                	sw	a4,8(a5)
100025d6:	1107a703          	lw	a4,272(a5)
100025da:	ff0386b7          	lui	a3,0xff038
100025de:	7ff68693          	addi	a3,a3,2047 # ff0387ff <__StackTop+0xdf0347ff>
100025e2:	8f75                	and	a4,a4,a3
100025e4:	00d046b7          	lui	a3,0xd04
100025e8:	8f55                	or	a4,a4,a3
100025ea:	10e7a823          	sw	a4,272(a5)
100025ee:	40a2                	lw	ra,8(sp)
100025f0:	0131                	addi	sp,sp,12
100025f2:	8082                	ret

100025f4 <Radio_OnChip_Set_Freq_Sw>:
100025f4:	00251793          	slli	a5,a0,0x2
100025f8:	20001537          	lui	a0,0x20001
100025fc:	c3c50513          	addi	a0,a0,-964 # 20000c3c <freq_cfg_val>
10002600:	953e                	add	a0,a0,a5
10002602:	4118                	lw	a4,0(a0)
10002604:	800007b7          	lui	a5,0x80000
10002608:	8fd9                	or	a5,a5,a4
1000260a:	42001737          	lui	a4,0x42001
1000260e:	d35c                	sw	a5,36(a4)
10002610:	8082                	ret

10002612 <RF_OnChip_Init>:
10002612:	fcc10113          	addi	sp,sp,-52
10002616:	d806                	sw	ra,48(sp)
10002618:	d622                	sw	s0,44(sp)
1000261a:	d426                	sw	s1,40(sp)
1000261c:	0ffff097          	auipc	ra,0xffff
10002620:	55c080e7          	jalr	1372(ra) # 20001b78 <RF_OnChip_Base_Init>
10002624:	20003637          	lui	a2,0x20003
10002628:	f1860613          	addi	a2,a2,-232 # 20002f18 <g_rf_cfg>
1000262c:	00264703          	lbu	a4,2(a2)
10002630:	200016b7          	lui	a3,0x20001
10002634:	dc868693          	addi	a3,a3,-568 # 20000dc8 <rf_common_desc_rftx_on>
10002638:	42cc                	lw	a1,4(a3)
1000263a:	ff0107b7          	lui	a5,0xff010
1000263e:	17fd                	addi	a5,a5,-1 # ff00ffff <__StackTop+0xdf00bfff>
10002640:	8dfd                	and	a1,a1,a5
10002642:	01970513          	addi	a0,a4,25 # 42001019 <__StackTop+0x21ffd019>
10002646:	0ff57513          	zext.b	a0,a0
1000264a:	0542                	slli	a0,a0,0x10
1000264c:	8dc9                	or	a1,a1,a0
1000264e:	c2cc                	sw	a1,4(a3)
10002650:	46cc                	lw	a1,12(a3)
10002652:	8dfd                	and	a1,a1,a5
10002654:	00470513          	addi	a0,a4,4
10002658:	054e                	slli	a0,a0,0x13
1000265a:	8dc9                	or	a1,a1,a0
1000265c:	c6cc                	sw	a1,12(a3)
1000265e:	200015b7          	lui	a1,0x20001
10002662:	da858593          	addi	a1,a1,-600 # 20000da8 <rf_common_desc_rftx_off>
10002666:	41d4                	lw	a3,4(a1)
10002668:	8efd                	and	a3,a3,a5
1000266a:	00564503          	lbu	a0,5(a2)
1000266e:	0542                	slli	a0,a0,0x10
10002670:	8ec9                	or	a3,a3,a0
10002672:	c1d4                	sw	a3,4(a1)
10002674:	200014b7          	lui	s1,0x20001
10002678:	e8048413          	addi	s0,s1,-384 # 20000e80 <rf_common_desc_tx_setfreq>
1000267c:	4474                	lw	a3,76(s0)
1000267e:	8efd                	and	a3,a3,a5
10002680:	00664583          	lbu	a1,6(a2)
10002684:	05c2                	slli	a1,a1,0x10
10002686:	8ecd                	or	a3,a3,a1
10002688:	c474                	sw	a3,76(s0)
1000268a:	00170313          	addi	t1,a4,1
1000268e:	0ff37693          	zext.b	a3,t1
10002692:	584c                	lw	a1,52(s0)
10002694:	8dfd                	and	a1,a1,a5
10002696:	00168513          	addi	a0,a3,1
1000269a:	054e                	slli	a0,a0,0x13
1000269c:	8dc9                	or	a1,a1,a0
1000269e:	d84c                	sw	a1,52(s0)
100026a0:	5c48                	lw	a0,60(s0)
100026a2:	8d7d                	and	a0,a0,a5
100026a4:	01769293          	slli	t0,a3,0x17
100026a8:	00ff05b7          	lui	a1,0xff0
100026ac:	00b2f2b3          	and	t0,t0,a1
100026b0:	00556533          	or	a0,a0,t0
100026b4:	dc48                	sw	a0,60(s0)
100026b6:	4068                	lw	a0,68(s0)
100026b8:	8d7d                	and	a0,a0,a5
100026ba:	8285                	srli	a3,a3,0x1
100026bc:	06c2                	slli	a3,a3,0x10
100026be:	8ec9                	or	a3,a3,a0
100026c0:	c074                	sw	a3,68(s0)
100026c2:	200016b7          	lui	a3,0x20001
100026c6:	de868693          	addi	a3,a3,-536 # 20000de8 <rf_common_desc_rx_setfreq>
100026ca:	5ac8                	lw	a0,52(a3)
100026cc:	8d7d                	and	a0,a0,a5
100026ce:	034e                	slli	t1,t1,0x13
100026d0:	00656533          	or	a0,a0,t1
100026d4:	dac8                	sw	a0,52(a3)
100026d6:	5ec8                	lw	a0,60(a3)
100026d8:	8d7d                	and	a0,a0,a5
100026da:	01771313          	slli	t1,a4,0x17
100026de:	00b37333          	and	t1,t1,a1
100026e2:	00656533          	or	a0,a0,t1
100026e6:	dec8                	sw	a0,60(a3)
100026e8:	42e8                	lw	a0,68(a3)
100026ea:	8d7d                	and	a0,a0,a5
100026ec:	00175313          	srli	t1,a4,0x1
100026f0:	0342                	slli	t1,t1,0x10
100026f2:	00656533          	or	a0,a0,t1
100026f6:	c2e8                	sw	a0,68(a3)
100026f8:	1779                	addi	a4,a4,-2
100026fa:	0ff77713          	zext.b	a4,a4
100026fe:	200016b7          	lui	a3,0x20001
10002702:	d8868693          	addi	a3,a3,-632 # 20000d88 <rf_common_desc_rfrx_on>
10002706:	46c8                	lw	a0,12(a3)
10002708:	8d7d                	and	a0,a0,a5
1000270a:	01771313          	slli	t1,a4,0x17
1000270e:	00b37333          	and	t1,t1,a1
10002712:	00656533          	or	a0,a0,t1
10002716:	c6c8                	sw	a0,12(a3)
10002718:	4ac8                	lw	a0,20(a3)
1000271a:	8d7d                	and	a0,a0,a5
1000271c:	8305                	srli	a4,a4,0x1
1000271e:	0742                	slli	a4,a4,0x10
10002720:	8f49                	or	a4,a4,a0
10002722:	cad8                	sw	a4,20(a3)
10002724:	00364703          	lbu	a4,3(a2)
10002728:	200016b7          	lui	a3,0x20001
1000272c:	d6868693          	addi	a3,a3,-664 # 20000d68 <rf_common_desc_rfrx_off>
10002730:	42d0                	lw	a2,4(a3)
10002732:	8e7d                	and	a2,a2,a5
10002734:	01771513          	slli	a0,a4,0x17
10002738:	8de9                	and	a1,a1,a0
1000273a:	8dd1                	or	a1,a1,a2
1000273c:	c2cc                	sw	a1,4(a3)
1000273e:	46d0                	lw	a2,12(a3)
10002740:	8ff1                	and	a5,a5,a2
10002742:	8305                	srli	a4,a4,0x1
10002744:	0742                	slli	a4,a4,0x10
10002746:	8f5d                	or	a4,a4,a5
10002748:	c6d8                	sw	a4,12(a3)
1000274a:	2965                	jal	10002c02 <omw_rf_dcoc_cal>
1000274c:	6785                	lui	a5,0x1
1000274e:	40778793          	addi	a5,a5,1031 # 1407 <__STACK_SIZE+0x1007>
10002752:	02f11223          	sh	a5,36(sp)
10002756:	02100793          	li	a5,33
1000275a:	02f10323          	sb	a5,38(sp)
1000275e:	420027b7          	lui	a5,0x42002
10002762:	60600713          	li	a4,1542
10002766:	cbd8                	sw	a4,20(a5)
10002768:	400006b7          	lui	a3,0x40000
1000276c:	1846a783          	lw	a5,388(a3) # 40000184 <__StackTop+0x1fffc184>
10002770:	7701                	lui	a4,0xfffe0
10002772:	8ff9                	and	a5,a5,a4
10002774:	6741                	lui	a4,0x10
10002776:	20070713          	addi	a4,a4,512 # 10200 <memset+0x3834>
1000277a:	8fd9                	or	a5,a5,a4
1000277c:	18f6a223          	sw	a5,388(a3)
10002780:	8660b7b7          	lui	a5,0x8660b
10002784:	53878793          	addi	a5,a5,1336 # 8660b538 <__StackTop+0x66607538>
10002788:	c01c                	sw	a5,0(s0)
1000278a:	e8048513          	addi	a0,s1,-384
1000278e:	0ffff097          	auipc	ra,0xffff
10002792:	200080e7          	jalr	512(ra) # 2000198e <start_await_dma>
10002796:	200037b7          	lui	a5,0x20003
1000279a:	f0478793          	addi	a5,a5,-252 # 20002f04 <g_hp>
1000279e:	cc3e                	sw	a5,24(sp)
100027a0:	105c                	addi	a5,sp,36
100027a2:	ce3e                	sw	a5,28(sp)
100027a4:	6785                	lui	a5,0x1
100027a6:	80078793          	addi	a5,a5,-2048 # 800 <__STACK_SIZE+0x400>
100027aa:	d03e                	sw	a5,32(sp)
100027ac:	a29d                	j	10002912 <RF_OnChip_Init+0x300>
100027ae:	4789                	li	a5,2
100027b0:	4702                	lw	a4,0(sp)
100027b2:	12e7c463          	blt	a5,a4,100028da <RF_OnChip_Init+0x2c8>
100027b6:	47f2                	lw	a5,28(sp)
100027b8:	0007c503          	lbu	a0,0(a5)
100027bc:	3d25                	jal	100025f4 <Radio_OnChip_Set_Freq_Sw>
100027be:	42002437          	lui	s0,0x42002
100027c2:	00042c23          	sw	zero,24(s0) # 42002018 <__StackTop+0x21ffe018>
100027c6:	4785                	li	a5,1
100027c8:	cc1c                	sw	a5,24(s0)
100027ca:	470d                	li	a4,3
100027cc:	cc18                	sw	a4,24(s0)
100027ce:	cc1c                	sw	a5,24(s0)
100027d0:	0c800513          	li	a0,200
100027d4:	f000a097          	auipc	ra,0xf000a
100027d8:	102080e7          	jalr	258(ra) # c8d6 <delay_us>
100027dc:	4c5c                	lw	a5,28(s0)
100027de:	0002c737          	lui	a4,0x2c
100027e2:	8fd9                	or	a5,a5,a4
100027e4:	cc5c                	sw	a5,28(s0)
100027e6:	67a5                	lui	a5,0x9
100027e8:	80278793          	addi	a5,a5,-2046 # 8802 <bt_security_err_get+0xca>
100027ec:	0cf42a23          	sw	a5,212(s0)
100027f0:	4c5c                	lw	a5,28(s0)
100027f2:	83b9                	srli	a5,a5,0xe
100027f4:	8b8d                	andi	a5,a5,3
100027f6:	5702                	lw	a4,32(sp)
100027f8:	00f714b3          	sll	s1,a4,a5
100027fc:	01049713          	slli	a4,s1,0x10
10002800:	8341                	srli	a4,a4,0x10
10002802:	19c00593          	li	a1,412
10002806:	c23a                	sw	a4,4(sp)
10002808:	853a                	mv	a0,a4
1000280a:	3185                	jal	1000246a <rf_get_ad_pll_counter>
1000280c:	c42a                	sw	a0,8(sp)
1000280e:	26400593          	li	a1,612
10002812:	4512                	lw	a0,4(sp)
10002814:	3999                	jal	1000246a <rf_get_ad_pll_counter>
10002816:	4c5c                	lw	a5,28(s0)
10002818:	7701                	lui	a4,0xfffe0
1000281a:	177d                	addi	a4,a4,-1 # fffdffff <__StackTop+0xdffdbfff>
1000281c:	8ff9                	and	a5,a5,a4
1000281e:	cc5c                	sw	a5,28(s0)
10002820:	67a5                	lui	a5,0x9
10002822:	81978793          	addi	a5,a5,-2023 # 8819 <bt_security_err_get+0xe1>
10002826:	0cf42a23          	sw	a5,212(s0)
1000282a:	47a2                	lw	a5,8(sp)
1000282c:	8d1d                	sub	a0,a0,a5
1000282e:	00151793          	slli	a5,a0,0x1
10002832:	953e                	add	a0,a0,a5
10002834:	0506                	slli	a0,a0,0x1
10002836:	00549713          	slli	a4,s1,0x5
1000283a:	8f05                	sub	a4,a4,s1
1000283c:	070a                	slli	a4,a4,0x2
1000283e:	9726                	add	a4,a4,s1
10002840:	02a75733          	divu	a4,a4,a0
10002844:	4329                	li	t1,10
10002846:	026777b3          	remu	a5,a4,t1
1000284a:	0057b793          	sltiu	a5,a5,5
1000284e:	0017c793          	xori	a5,a5,1
10002852:	02675733          	divu	a4,a4,t1
10002856:	973e                	add	a4,a4,a5
10002858:	0ff77713          	zext.b	a4,a4
1000285c:	4462                	lw	s0,24(sp)
1000285e:	85a2                	mv	a1,s0
10002860:	00e40123          	sb	a4,2(s0)
10002864:	0fa00793          	li	a5,250
10002868:	02f487b3          	mul	a5,s1,a5
1000286c:	02a7d7b3          	divu	a5,a5,a0
10002870:	0267f6b3          	remu	a3,a5,t1
10002874:	0056b693          	sltiu	a3,a3,5
10002878:	0016c693          	xori	a3,a3,1
1000287c:	0267d7b3          	divu	a5,a5,t1
10002880:	97b6                	add	a5,a5,a3
10002882:	0ff7f693          	zext.b	a3,a5
10002886:	00d40023          	sb	a3,0(s0)
1000288a:	1f400793          	li	a5,500
1000288e:	02f487b3          	mul	a5,s1,a5
10002892:	02a7d7b3          	divu	a5,a5,a0
10002896:	0267f633          	remu	a2,a5,t1
1000289a:	00563613          	sltiu	a2,a2,5
1000289e:	00164613          	xori	a2,a2,1
100028a2:	0267d7b3          	divu	a5,a5,t1
100028a6:	97b2                	add	a5,a5,a2
100028a8:	0ff7f793          	zext.b	a5,a5
100028ac:	00f400a3          	sb	a5,1(s0)
100028b0:	fc068613          	addi	a2,a3,-64
100028b4:	0ff67613          	zext.b	a2,a2
100028b8:	03f00513          	li	a0,63
100028bc:	eec569e3          	bltu	a0,a2,100027ae <RF_OnChip_Init+0x19c>
100028c0:	4632                	lw	a2,12(sp)
100028c2:	96b2                	add	a3,a3,a2
100028c4:	c636                	sw	a3,12(sp)
100028c6:	46c2                	lw	a3,16(sp)
100028c8:	97b6                	add	a5,a5,a3
100028ca:	c83e                	sw	a5,16(sp)
100028cc:	47d2                	lw	a5,20(sp)
100028ce:	97ba                	add	a5,a5,a4
100028d0:	ca3e                	sw	a5,20(sp)
100028d2:	4782                	lw	a5,0(sp)
100028d4:	0785                	addi	a5,a5,1
100028d6:	c03e                	sw	a5,0(sp)
100028d8:	bdd9                	j	100027ae <RF_OnChip_Init+0x19c>
100028da:	478d                	li	a5,3
100028dc:	4732                	lw	a4,12(sp)
100028de:	02f75733          	divu	a4,a4,a5
100028e2:	00e58023          	sb	a4,0(a1) # ff0000 <__FLASH_SIZE+0xfb0000>
100028e6:	4742                	lw	a4,16(sp)
100028e8:	02f75733          	divu	a4,a4,a5
100028ec:	00e580a3          	sb	a4,1(a1)
100028f0:	4752                	lw	a4,20(sp)
100028f2:	02f757b3          	divu	a5,a4,a5
100028f6:	00f58123          	sb	a5,2(a1)
100028fa:	47e2                	lw	a5,24(sp)
100028fc:	078d                	addi	a5,a5,3
100028fe:	cc3e                	sw	a5,24(sp)
10002900:	4772                	lw	a4,28(sp)
10002902:	0705                	addi	a4,a4,1
10002904:	ce3a                	sw	a4,28(sp)
10002906:	20003737          	lui	a4,0x20003
1000290a:	f0d70713          	addi	a4,a4,-243 # 20002f0d <g_hp+0x9>
1000290e:	00e78763          	beq	a5,a4,1000291c <RF_OnChip_Init+0x30a>
10002912:	c002                	sw	zero,0(sp)
10002914:	ca02                	sw	zero,20(sp)
10002916:	c802                	sw	zero,16(sp)
10002918:	c602                	sw	zero,12(sp)
1000291a:	bd71                	j	100027b6 <RF_OnChip_Init+0x1a4>
1000291c:	20001537          	lui	a0,0x20001
10002920:	da850513          	addi	a0,a0,-600 # 20000da8 <rf_common_desc_rftx_off>
10002924:	0ffff097          	auipc	ra,0xffff
10002928:	06a080e7          	jalr	106(ra) # 2000198e <start_await_dma>
1000292c:	40000737          	lui	a4,0x40000
10002930:	18472783          	lw	a5,388(a4) # 40000184 <__StackTop+0x1fffc184>
10002934:	7681                	lui	a3,0xfffe0
10002936:	8ff5                	and	a5,a5,a3
10002938:	2007e793          	ori	a5,a5,512
1000293c:	18f72223          	sw	a5,388(a4)
10002940:	420027b7          	lui	a5,0x42002
10002944:	471d                	li	a4,7
10002946:	cbd8                	sw	a4,20(a5)
10002948:	0ffff097          	auipc	ra,0xffff
1000294c:	ff4080e7          	jalr	-12(ra) # 2000193c <trigger_gpadc_temp_sampling>
10002950:	4529                	li	a0,10
10002952:	f000a097          	auipc	ra,0xf000a
10002956:	f84080e7          	jalr	-124(ra) # c8d6 <delay_us>
1000295a:	400407b7          	lui	a5,0x40040
1000295e:	57f8                	lw	a4,108(a5)
10002960:	200037b7          	lui	a5,0x20003
10002964:	f2e78023          	sb	a4,-224(a5) # 20002f20 <g_rf_cfg+0x8>
10002968:	2131                	jal	10002d74 <disable_gpadc>
1000296a:	0ffff097          	auipc	ra,0xffff
1000296e:	2d4080e7          	jalr	724(ra) # 20001c3e <RF_OnChip_Cali_Cfg>
10002972:	4501                	li	a0,0
10002974:	3e2d                	jal	100024ae <omw_rf_set_tx_pwr_lvl>
10002976:	50c2                	lw	ra,48(sp)
10002978:	5432                	lw	s0,44(sp)
1000297a:	54a2                	lw	s1,40(sp)
1000297c:	03410113          	addi	sp,sp,52
10002980:	8082                	ret

10002982 <start_adc_cap>:
10002982:	1161                	addi	sp,sp,-8
10002984:	400007b7          	lui	a5,0x40000
10002988:	4705                	li	a4,1
1000298a:	16e7a223          	sw	a4,356(a5) # 40000164 <__StackTop+0x1fffc164>
1000298e:	420007b7          	lui	a5,0x42000
10002992:	1047a783          	lw	a5,260(a5) # 42000104 <__StackTop+0x21ffc104>
10002996:	c23e                	sw	a5,4(sp)
10002998:	42000637          	lui	a2,0x42000
1000299c:	46cd                	li	a3,19
1000299e:	10462783          	lw	a5,260(a2) # 42000104 <__StackTop+0x21ffc104>
100029a2:	4712                	lw	a4,4(sp)
100029a4:	8f99                	sub	a5,a5,a4
100029a6:	fef6fce3          	bgeu	a3,a5,1000299e <start_adc_cap+0x1c>
100029aa:	400007b7          	lui	a5,0x40000
100029ae:	470d                	li	a4,3
100029b0:	16e7a223          	sw	a4,356(a5) # 40000164 <__StackTop+0x1fffc164>
100029b4:	420007b7          	lui	a5,0x42000
100029b8:	1047a783          	lw	a5,260(a5) # 42000104 <__StackTop+0x21ffc104>
100029bc:	c03e                	sw	a5,0(sp)
100029be:	42000637          	lui	a2,0x42000
100029c2:	46cd                	li	a3,19
100029c4:	10462783          	lw	a5,260(a2) # 42000104 <__StackTop+0x21ffc104>
100029c8:	4702                	lw	a4,0(sp)
100029ca:	8f99                	sub	a5,a5,a4
100029cc:	fef6fce3          	bgeu	a3,a5,100029c4 <start_adc_cap+0x42>
100029d0:	400007b7          	lui	a5,0x40000
100029d4:	4705                	li	a4,1
100029d6:	16e7a223          	sw	a4,356(a5) # 40000164 <__StackTop+0x1fffc164>
100029da:	40000737          	lui	a4,0x40000
100029de:	16872783          	lw	a5,360(a4) # 40000168 <__StackTop+0x1fffc168>
100029e2:	8b9d                	andi	a5,a5,7
100029e4:	ffed                	bnez	a5,100029de <start_adc_cap+0x5c>
100029e6:	40000737          	lui	a4,0x40000
100029ea:	16072223          	sw	zero,356(a4) # 40000164 <__StackTop+0x1fffc164>
100029ee:	000907b7          	lui	a5,0x90
100029f2:	079d                	addi	a5,a5,7 # 90007 <__FLASH_SIZE+0x50007>
100029f4:	16f72823          	sw	a5,368(a4)
100029f8:	0121                	addi	sp,sp,8
100029fa:	8082                	ret

100029fc <get_dc_info_iq>:
100029fc:	fcc10113          	addi	sp,sp,-52
10002a00:	d806                	sw	ra,48(sp)
10002a02:	d622                	sw	s0,44(sp)
10002a04:	d426                	sw	s1,40(sp)
10002a06:	200007b7          	lui	a5,0x20000
10002a0a:	0007a283          	lw	t0,0(a5) # 20000000 <__etext+0xfffb9c0>
10002a0e:	0047a303          	lw	t1,4(a5)
10002a12:	4788                	lw	a0,8(a5)
10002a14:	47cc                	lw	a1,12(a5)
10002a16:	4b90                	lw	a2,16(a5)
10002a18:	4bd4                	lw	a3,20(a5)
10002a1a:	4f98                	lw	a4,24(a5)
10002a1c:	4fdc                	lw	a5,28(a5)
10002a1e:	c416                	sw	t0,8(sp)
10002a20:	c61a                	sw	t1,12(sp)
10002a22:	c82a                	sw	a0,16(sp)
10002a24:	ca2e                	sw	a1,20(sp)
10002a26:	cc32                	sw	a2,24(sp)
10002a28:	ce36                	sw	a3,28(sp)
10002a2a:	d03a                	sw	a4,32(sp)
10002a2c:	d23e                	sw	a5,36(sp)
10002a2e:	400007b7          	lui	a5,0x40000
10002a32:	00110737          	lui	a4,0x110
10002a36:	16e7a023          	sw	a4,352(a5) # 40000160 <__StackTop+0x1fffc160>
10002a3a:	01090737          	lui	a4,0x1090
10002a3e:	071d                	addi	a4,a4,7 # 1090007 <__FLASH_SIZE+0x1050007>
10002a40:	16e7a823          	sw	a4,368(a5)
10002a44:	53d8                	lw	a4,36(a5)
10002a46:	6689                	lui	a3,0x2
10002a48:	8f55                	or	a4,a4,a3
10002a4a:	d3d8                	sw	a4,36(a5)
10002a4c:	47a1                	li	a5,8
10002a4e:	c23e                	sw	a5,4(sp)
10002a50:	4401                	li	s0,0
10002a52:	4481                	li	s1,0
10002a54:	200007b7          	lui	a5,0x20000
10002a58:	02078793          	addi	a5,a5,32 # 20000020 <rf_bt_call_desc_list_recv_fist+0xc>
10002a5c:	c03e                	sw	a5,0(sp)
10002a5e:	a82d                	j	10002a98 <get_dc_info_iq+0x9c>
10002a60:	943a                	add	s0,s0,a4
10002a62:	0691                	addi	a3,a3,4 # 2004 <xrand>
10002a64:	4782                	lw	a5,0(sp)
10002a66:	02f68563          	beq	a3,a5,10002a90 <get_dc_info_iq+0x94>
10002a6a:	429c                	lw	a5,0(a3)
10002a6c:	00a7d713          	srli	a4,a5,0xa
10002a70:	3ff77613          	andi	a2,a4,1023
10002a74:	20077713          	andi	a4,a4,512
10002a78:	c319                	beqz	a4,10002a7e <get_dc_info_iq+0x82>
10002a7a:	c0060613          	addi	a2,a2,-1024
10002a7e:	94b2                	add	s1,s1,a2
10002a80:	3ff7f713          	andi	a4,a5,1023
10002a84:	2007f793          	andi	a5,a5,512
10002a88:	dfe1                	beqz	a5,10002a60 <get_dc_info_iq+0x64>
10002a8a:	c0070713          	addi	a4,a4,-1024
10002a8e:	bfc9                	j	10002a60 <get_dc_info_iq+0x64>
10002a90:	4792                	lw	a5,4(sp)
10002a92:	17fd                	addi	a5,a5,-1
10002a94:	c23e                	sw	a5,4(sp)
10002a96:	c789                	beqz	a5,10002aa0 <get_dc_info_iq+0xa4>
10002a98:	35ed                	jal	10002982 <start_adc_cap>
10002a9a:	200006b7          	lui	a3,0x20000
10002a9e:	b7f1                	j	10002a6a <get_dc_info_iq+0x6e>
10002aa0:	200007b7          	lui	a5,0x20000
10002aa4:	42b2                	lw	t0,12(sp)
10002aa6:	4342                	lw	t1,16(sp)
10002aa8:	4552                	lw	a0,20(sp)
10002aaa:	45e2                	lw	a1,24(sp)
10002aac:	4672                	lw	a2,28(sp)
10002aae:	5682                	lw	a3,32(sp)
10002ab0:	5712                	lw	a4,36(sp)
10002ab2:	43a2                	lw	t2,8(sp)
10002ab4:	0077a023          	sw	t2,0(a5) # 20000000 <__etext+0xfffb9c0>
10002ab8:	0057a223          	sw	t0,4(a5)
10002abc:	0067a423          	sw	t1,8(a5)
10002ac0:	c7c8                	sw	a0,12(a5)
10002ac2:	cb8c                	sw	a1,16(a5)
10002ac4:	cbd0                	sw	a2,20(a5)
10002ac6:	cf94                	sw	a3,24(a5)
10002ac8:	cfd8                	sw	a4,28(a5)
10002aca:	41f4d513          	srai	a0,s1,0x1f
10002ace:	0ff57513          	zext.b	a0,a0
10002ad2:	9526                	add	a0,a0,s1
10002ad4:	8521                	srai	a0,a0,0x8
10002ad6:	0542                	slli	a0,a0,0x10
10002ad8:	41f45793          	srai	a5,s0,0x1f
10002adc:	0ff7f793          	zext.b	a5,a5
10002ae0:	97a2                	add	a5,a5,s0
10002ae2:	87a1                	srai	a5,a5,0x8
10002ae4:	07c2                	slli	a5,a5,0x10
10002ae6:	83c1                	srli	a5,a5,0x10
10002ae8:	8d5d                	or	a0,a0,a5
10002aea:	50c2                	lw	ra,48(sp)
10002aec:	5432                	lw	s0,44(sp)
10002aee:	54a2                	lw	s1,40(sp)
10002af0:	03410113          	addi	sp,sp,52
10002af4:	8082                	ret

10002af6 <rf_dcoc_calib_iq_bq>:
10002af6:	1101                	addi	sp,sp,-32
10002af8:	ce06                	sw	ra,28(sp)
10002afa:	cc22                	sw	s0,24(sp)
10002afc:	ca26                	sw	s1,20(sp)
10002afe:	10801737          	lui	a4,0x10801
10002b02:	81070713          	addi	a4,a4,-2032 # 10800810 <__etext+0x7fc1d0>
10002b06:	8f09                	sub	a4,a4,a0
10002b08:	00271793          	slli	a5,a4,0x2
10002b0c:	c83e                	sw	a5,16(sp)
10002b0e:	47a1                	li	a5,8
10002b10:	8f89                	sub	a5,a5,a0
10002b12:	0792                	slli	a5,a5,0x4
10002b14:	42001737          	lui	a4,0x42001
10002b18:	10f72223          	sw	a5,260(a4) # 42001104 <__StackTop+0x21ffd104>
10002b1c:	35c5                	jal	100029fc <get_dc_info_iq>
10002b1e:	41055493          	srai	s1,a0,0x10
10002b22:	01051413          	slli	s0,a0,0x10
10002b26:	8441                	srai	s0,s0,0x10
10002b28:	0c000793          	li	a5,192
10002b2c:	c23e                	sw	a5,4(sp)
10002b2e:	fc000793          	li	a5,-64
10002b32:	c03e                	sw	a5,0(sp)
10002b34:	02905163          	blez	s1,10002b56 <rf_dcoc_calib_iq_bq+0x60>
10002b38:	0c000793          	li	a5,192
10002b3c:	c63e                	sw	a5,12(sp)
10002b3e:	fc000793          	li	a5,-64
10002b42:	c43e                	sw	a5,8(sp)
10002b44:	00805e63          	blez	s0,10002b60 <rf_dcoc_calib_iq_bq+0x6a>
10002b48:	04d1                	addi	s1,s1,20
10002b4a:	0294b493          	sltiu	s1,s1,41
10002b4e:	0451                	addi	s0,s0,20
10002b50:	02943413          	sltiu	s0,s0,41
10002b54:	a0b1                	j	10002ba0 <rf_dcoc_calib_iq_bq+0xaa>
10002b56:	04000793          	li	a5,64
10002b5a:	c23e                	sw	a5,4(sp)
10002b5c:	c03e                	sw	a5,0(sp)
10002b5e:	bfe9                	j	10002b38 <rf_dcoc_calib_iq_bq+0x42>
10002b60:	04000793          	li	a5,64
10002b64:	c63e                	sw	a5,12(sp)
10002b66:	c43e                	sw	a5,8(sp)
10002b68:	b7c5                	j	10002b48 <rf_dcoc_calib_iq_bq+0x52>
10002b6a:	46c2                	lw	a3,16(sp)
10002b6c:	429c                	lw	a5,0(a3)
10002b6e:	fff01737          	lui	a4,0xfff01
10002b72:	177d                	addi	a4,a4,-1 # fff00fff <__StackTop+0xdfefcfff>
10002b74:	8f7d                	and	a4,a4,a5
10002b76:	4792                	lw	a5,4(sp)
10002b78:	07b2                	slli	a5,a5,0xc
10002b7a:	8fd9                	or	a5,a5,a4
10002b7c:	c29c                	sw	a5,0(a3)
10002b7e:	ec0d                	bnez	s0,10002bb8 <rf_dcoc_calib_iq_bq+0xc2>
10002b80:	a01d                	j	10002ba6 <rf_dcoc_calib_iq_bq+0xb0>
10002b82:	4592                	lw	a1,4(sp)
10002b84:	95b6                	add	a1,a1,a3
10002b86:	c22e                	sw	a1,4(sp)
10002b88:	c036                	sw	a3,0(sp)
10002b8a:	a8b9                	j	10002be8 <rf_dcoc_calib_iq_bq+0xf2>
10002b8c:	46b2                	lw	a3,12(sp)
10002b8e:	96b2                	add	a3,a3,a2
10002b90:	c636                	sw	a3,12(sp)
10002b92:	c432                	sw	a2,8(sp)
10002b94:	0751                	addi	a4,a4,20
10002b96:	02973493          	sltiu	s1,a4,41
10002b9a:	07d1                	addi	a5,a5,20
10002b9c:	0297b413          	sltiu	s0,a5,41
10002ba0:	d4e9                	beqz	s1,10002b6a <rf_dcoc_calib_iq_bq+0x74>
10002ba2:	04041b63          	bnez	s0,10002bf8 <rf_dcoc_calib_iq_bq+0x102>
10002ba6:	46c2                	lw	a3,16(sp)
10002ba8:	429c                	lw	a5,0(a3)
10002baa:	777d                	lui	a4,0xfffff
10002bac:	073d                	addi	a4,a4,15 # fffff00f <__StackTop+0xdfffb00f>
10002bae:	8f7d                	and	a4,a4,a5
10002bb0:	47b2                	lw	a5,12(sp)
10002bb2:	0792                	slli	a5,a5,0x4
10002bb4:	8fd9                	or	a5,a5,a4
10002bb6:	c29c                	sw	a5,0(a3)
10002bb8:	3591                	jal	100029fc <get_dc_info_iq>
10002bba:	41055713          	srai	a4,a0,0x10
10002bbe:	01051793          	slli	a5,a0,0x10
10002bc2:	87c1                	srai	a5,a5,0x10
10002bc4:	4602                	lw	a2,0(sp)
10002bc6:	40165693          	srai	a3,a2,0x1
10002bca:	02c68763          	beq	a3,a2,10002bf8 <rf_dcoc_calib_iq_bq+0x102>
10002bce:	45a2                	lw	a1,8(sp)
10002bd0:	4015d613          	srai	a2,a1,0x1
10002bd4:	02b60263          	beq	a2,a1,10002bf8 <rf_dcoc_calib_iq_bq+0x102>
10002bd8:	00049863          	bnez	s1,10002be8 <rf_dcoc_calib_iq_bq+0xf2>
10002bdc:	fa0743e3          	bltz	a4,10002b82 <rf_dcoc_calib_iq_bq+0x8c>
10002be0:	4592                	lw	a1,4(sp)
10002be2:	8d95                	sub	a1,a1,a3
10002be4:	c22e                	sw	a1,4(sp)
10002be6:	c036                	sw	a3,0(sp)
10002be8:	f455                	bnez	s0,10002b94 <rf_dcoc_calib_iq_bq+0x9e>
10002bea:	fa07c1e3          	bltz	a5,10002b8c <rf_dcoc_calib_iq_bq+0x96>
10002bee:	46b2                	lw	a3,12(sp)
10002bf0:	8e91                	sub	a3,a3,a2
10002bf2:	c636                	sw	a3,12(sp)
10002bf4:	c432                	sw	a2,8(sp)
10002bf6:	bf79                	j	10002b94 <rf_dcoc_calib_iq_bq+0x9e>
10002bf8:	40f2                	lw	ra,28(sp)
10002bfa:	4462                	lw	s0,24(sp)
10002bfc:	44d2                	lw	s1,20(sp)
10002bfe:	6105                	addi	sp,sp,32
10002c00:	8082                	ret

10002c02 <omw_rf_dcoc_cal>:
10002c02:	1151                	addi	sp,sp,-12
10002c04:	c406                	sw	ra,8(sp)
10002c06:	c222                	sw	s0,4(sp)
10002c08:	c026                	sw	s1,0(sp)
10002c0a:	20001737          	lui	a4,0x20001
10002c0e:	8660b7b7          	lui	a5,0x8660b
10002c12:	53878793          	addi	a5,a5,1336 # 8660b538 <__StackTop+0x66607538>
10002c16:	def72423          	sw	a5,-536(a4) # 20000de8 <rf_common_desc_rx_setfreq>
10002c1a:	20001537          	lui	a0,0x20001
10002c1e:	f3c50513          	addi	a0,a0,-196 # 20000f3c <rf_desc_dcoc_calib_rx_on>
10002c22:	0ffff097          	auipc	ra,0xffff
10002c26:	d6c080e7          	jalr	-660(ra) # 2000198e <start_await_dma>
10002c2a:	200037b7          	lui	a5,0x20003
10002c2e:	4709                	li	a4,2
10002c30:	f2e78223          	sb	a4,-220(a5) # 20002f24 <g_rf_cfg+0xc>
10002c34:	42002737          	lui	a4,0x42002
10002c38:	0c472783          	lw	a5,196(a4) # 420020c4 <__StackTop+0x21ffe0c4>
10002c3c:	f40006b7          	lui	a3,0xf4000
10002c40:	16fd                	addi	a3,a3,-1 # f3ffffff <__StackTop+0xd3ffbfff>
10002c42:	8ff5                	and	a5,a5,a3
10002c44:	080006b7          	lui	a3,0x8000
10002c48:	8fd5                	or	a5,a5,a3
10002c4a:	0cf72223          	sw	a5,196(a4)
10002c4e:	420016b7          	lui	a3,0x42001
10002c52:	1006a783          	lw	a5,256(a3) # 42001100 <__StackTop+0x21ffd100>
10002c56:	0017e793          	ori	a5,a5,1
10002c5a:	10f6a023          	sw	a5,256(a3)
10002c5e:	0c072783          	lw	a5,192(a4)
10002c62:	9bbd                	andi	a5,a5,-17
10002c64:	0cf72023          	sw	a5,192(a4)
10002c68:	4401                	li	s0,0
10002c6a:	44a5                	li	s1,9
10002c6c:	0ff47513          	zext.b	a0,s0
10002c70:	3559                	jal	10002af6 <rf_dcoc_calib_iq_bq>
10002c72:	0405                	addi	s0,s0,1
10002c74:	fe941ce3          	bne	s0,s1,10002c6c <omw_rf_dcoc_cal+0x6a>
10002c78:	200036b7          	lui	a3,0x20003
10002c7c:	f1868693          	addi	a3,a3,-232 # 20002f18 <g_rf_cfg>
10002c80:	420027b7          	lui	a5,0x42002
10002c84:	02078793          	addi	a5,a5,32 # 42002020 <__StackTop+0x21ffe020>
10002c88:	42002637          	lui	a2,0x42002
10002c8c:	04460613          	addi	a2,a2,68 # 42002044 <__StackTop+0x21ffe044>
10002c90:	4398                	lw	a4,0(a5)
10002c92:	8311                	srli	a4,a4,0x4
10002c94:	00e69723          	sh	a4,14(a3)
10002c98:	0791                	addi	a5,a5,4
10002c9a:	0689                	addi	a3,a3,2
10002c9c:	fec79ae3          	bne	a5,a2,10002c90 <omw_rf_dcoc_cal+0x8e>
10002ca0:	42002737          	lui	a4,0x42002
10002ca4:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
10002ca8:	0107e793          	ori	a5,a5,16
10002cac:	0cf72023          	sw	a5,192(a4)
10002cb0:	42001737          	lui	a4,0x42001
10002cb4:	10072783          	lw	a5,256(a4) # 42001100 <__StackTop+0x21ffd100>
10002cb8:	9bf9                	andi	a5,a5,-2
10002cba:	10f72023          	sw	a5,256(a4)
10002cbe:	20001537          	lui	a0,0x20001
10002cc2:	f2450513          	addi	a0,a0,-220 # 20000f24 <rf_desc_dcoc_calib_rx_off>
10002cc6:	0ffff097          	auipc	ra,0xffff
10002cca:	cc8080e7          	jalr	-824(ra) # 2000198e <start_await_dma>
10002cce:	40a2                	lw	ra,8(sp)
10002cd0:	4412                	lw	s0,4(sp)
10002cd2:	4482                	lw	s1,0(sp)
10002cd4:	0131                	addi	sp,sp,12
10002cd6:	8082                	ret

10002cd8 <omw_clkcal_poll_corner>:
10002cd8:	1151                	addi	sp,sp,-12
10002cda:	c406                	sw	ra,8(sp)
10002cdc:	c222                	sw	s0,4(sp)
10002cde:	c026                	sw	s1,0(sp)
10002ce0:	40000437          	lui	s0,0x40000
10002ce4:	07044783          	lbu	a5,112(s0) # 40000070 <__StackTop+0x1fffc070>
10002ce8:	0fe7f793          	andi	a5,a5,254
10002cec:	06f40823          	sb	a5,112(s0)
10002cf0:	6785                	lui	a5,0x1
10002cf2:	07a1                	addi	a5,a5,8 # 1008 <__STACK_SIZE+0xc08>
10002cf4:	06f41a23          	sh	a5,116(s0)
10002cf8:	47a9                	li	a5,10
10002cfa:	dc3c                	sw	a5,120(s0)
10002cfc:	583c                	lw	a5,112(s0)
10002cfe:	0027e793          	ori	a5,a5,2
10002d02:	d83c                	sw	a5,112(s0)
10002d04:	06400513          	li	a0,100
10002d08:	f000a097          	auipc	ra,0xf000a
10002d0c:	bce080e7          	jalr	-1074(ra) # c8d6 <delay_us>
10002d10:	583c                	lw	a5,112(s0)
10002d12:	9bf5                	andi	a5,a5,-3
10002d14:	d83c                	sw	a5,112(s0)
10002d16:	06400513          	li	a0,100
10002d1a:	f000a097          	auipc	ra,0xf000a
10002d1e:	bbc080e7          	jalr	-1092(ra) # c8d6 <delay_us>
10002d22:	583c                	lw	a5,112(s0)
10002d24:	0017e793          	ori	a5,a5,1
10002d28:	d83c                	sw	a5,112(s0)
10002d2a:	40000737          	lui	a4,0x40000
10002d2e:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
10002d32:	8bc1                	andi	a5,a5,16
10002d34:	dfed                	beqz	a5,10002d2e <omw_clkcal_poll_corner+0x56>
10002d36:	40000437          	lui	s0,0x40000
10002d3a:	5c64                	lw	s1,124(s0)
10002d3c:	583c                	lw	a5,112(s0)
10002d3e:	9bf9                	andi	a5,a5,-2
10002d40:	d83c                	sw	a5,112(s0)
10002d42:	583c                	lw	a5,112(s0)
10002d44:	0027e793          	ori	a5,a5,2
10002d48:	d83c                	sw	a5,112(s0)
10002d4a:	06400513          	li	a0,100
10002d4e:	f000a097          	auipc	ra,0xf000a
10002d52:	b88080e7          	jalr	-1144(ra) # c8d6 <delay_us>
10002d56:	583c                	lw	a5,112(s0)
10002d58:	9bf5                	andi	a5,a5,-3
10002d5a:	d83c                	sw	a5,112(s0)
10002d5c:	06400513          	li	a0,100
10002d60:	f000a097          	auipc	ra,0xf000a
10002d64:	b76080e7          	jalr	-1162(ra) # c8d6 <delay_us>
10002d68:	8526                	mv	a0,s1
10002d6a:	40a2                	lw	ra,8(sp)
10002d6c:	4412                	lw	s0,4(sp)
10002d6e:	4482                	lw	s1,0(sp)
10002d70:	0131                	addi	sp,sp,12
10002d72:	8082                	ret

10002d74 <disable_gpadc>:
10002d74:	420027b7          	lui	a5,0x42002
10002d78:	0e87a703          	lw	a4,232(a5) # 420020e8 <__StackTop+0x21ffe0e8>
10002d7c:	9b79                	andi	a4,a4,-2
10002d7e:	0ee7a423          	sw	a4,232(a5)
10002d82:	40040737          	lui	a4,0x40040
10002d86:	00072023          	sw	zero,0(a4) # 40040000 <__StackTop+0x2003c000>
10002d8a:	43d8                	lw	a4,4(a5)
10002d8c:	9b79                	andi	a4,a4,-2
10002d8e:	c3d8                	sw	a4,4(a5)
10002d90:	8082                	ret

10002d92 <get_vtrim>:
10002d92:	c609                	beqz	a2,10002d9c <get_vtrim+0xa>
10002d94:	479d                	li	a5,7
10002d96:	00a7d363          	bge	a5,a0,10002d9c <get_vtrim+0xa>
10002d9a:	1541                	addi	a0,a0,-16
10002d9c:	952e                	add	a0,a0,a1
10002d9e:	00c54663          	blt	a0,a2,10002daa <get_vtrim+0x18>
10002da2:	063d                	addi	a2,a2,15
10002da4:	00c55363          	bge	a0,a2,10002daa <get_vtrim+0x18>
10002da8:	862a                	mv	a2,a0
10002daa:	0641                	addi	a2,a2,16
10002dac:	41f65513          	srai	a0,a2,0x1f
10002db0:	8171                	srli	a0,a0,0x1c
10002db2:	962a                	add	a2,a2,a0
10002db4:	8a3d                	andi	a2,a2,15
10002db6:	40a60533          	sub	a0,a2,a0
10002dba:	8082                	ret

10002dbc <get_corner_offset>:
10002dbc:	1141                	addi	sp,sp,-16
10002dbe:	c606                	sw	ra,12(sp)
10002dc0:	c422                	sw	s0,8(sp)
10002dc2:	c226                	sw	s1,4(sp)
10002dc4:	c02a                	sw	a0,0(sp)
10002dc6:	42002437          	lui	s0,0x42002
10002dca:	4044                	lw	s1,4(s0)
10002dcc:	445c                	lw	a5,12(s0)
10002dce:	1007e793          	ori	a5,a5,256
10002dd2:	c45c                	sw	a5,12(s0)
10002dd4:	405c                	lw	a5,4(s0)
10002dd6:	01c7e793          	ori	a5,a5,28
10002dda:	c05c                	sw	a5,4(s0)
10002ddc:	405c                	lw	a5,4(s0)
10002dde:	2007e793          	ori	a5,a5,512
10002de2:	c05c                	sw	a5,4(s0)
10002de4:	441c                	lw	a5,8(s0)
10002de6:	87f7f793          	andi	a5,a5,-1921
10002dea:	2807e793          	ori	a5,a5,640
10002dee:	c41c                	sw	a5,8(s0)
10002df0:	35e5                	jal	10002cd8 <omw_clkcal_poll_corner>
10002df2:	445c                	lw	a5,12(s0)
10002df4:	eff7f793          	andi	a5,a5,-257
10002df8:	c45c                	sw	a5,12(s0)
10002dfa:	c044                	sw	s1,4(s0)
10002dfc:	0003b737          	lui	a4,0x3b
10002e00:	98070713          	addi	a4,a4,-1664 # 3a980 <memset+0x2dfb4>
10002e04:	02a767b3          	rem	a5,a4,a0
10002e08:	01f55693          	srli	a3,a0,0x1f
10002e0c:	96aa                	add	a3,a3,a0
10002e0e:	8685                	srai	a3,a3,0x1
10002e10:	00d7a7b3          	slt	a5,a5,a3
10002e14:	0017c793          	xori	a5,a5,1
10002e18:	02a74533          	div	a0,a4,a0
10002e1c:	953e                	add	a0,a0,a5
10002e1e:	4782                	lw	a5,0(sp)
10002e20:	40a78533          	sub	a0,a5,a0
10002e24:	40b2                	lw	ra,12(sp)
10002e26:	4422                	lw	s0,8(sp)
10002e28:	4492                	lw	s1,4(sp)
10002e2a:	0141                	addi	sp,sp,16
10002e2c:	8082                	ret

10002e2e <omw_rf_cal>:
10002e2e:	1131                	addi	sp,sp,-20
10002e30:	c806                	sw	ra,16(sp)
10002e32:	c622                	sw	s0,12(sp)
10002e34:	c426                	sw	s1,8(sp)
10002e36:	14a00513          	li	a0,330
10002e3a:	3749                	jal	10002dbc <get_corner_offset>
10002e3c:	46e1                	li	a3,24
10002e3e:	02d54733          	div	a4,a0,a3
10002e42:	41f55613          	srai	a2,a0,0x1f
10002e46:	00a647b3          	xor	a5,a2,a0
10002e4a:	8f91                	sub	a5,a5,a2
10002e4c:	02d7e7b3          	rem	a5,a5,a3
10002e50:	462d                	li	a2,11
10002e52:	4681                	li	a3,0
10002e54:	00f65663          	bge	a2,a5,10002e60 <omw_rf_cal+0x32>
10002e58:	41f55693          	srai	a3,a0,0x1f
10002e5c:	0016e693          	ori	a3,a3,1
10002e60:	9736                	add	a4,a4,a3
10002e62:	01871793          	slli	a5,a4,0x18
10002e66:	87e1                	srai	a5,a5,0x18
10002e68:	20003637          	lui	a2,0x20003
10002e6c:	f1860613          	addi	a2,a2,-232 # 20002f18 <g_rf_cfg>
10002e70:	00f605a3          	sb	a5,11(a2)
10002e74:	0ff77713          	zext.b	a4,a4
10002e78:	00570693          	addi	a3,a4,5
10002e7c:	0ff6f693          	zext.b	a3,a3
10002e80:	00578593          	addi	a1,a5,5
10002e84:	00b601a3          	sb	a1,3(a2)
10002e88:	0f000593          	li	a1,240
10002e8c:	4601                	li	a2,0
10002e8e:	00d5e963          	bltu	a1,a3,10002ea0 <omw_rf_cal+0x72>
10002e92:	8636                	mv	a2,a3
10002e94:	45bd                	li	a1,15
10002e96:	00d5f363          	bgeu	a1,a3,10002e9c <omw_rf_cal+0x6e>
10002e9a:	463d                	li	a2,15
10002e9c:	0ff67613          	zext.b	a2,a2
10002ea0:	200036b7          	lui	a3,0x20003
10002ea4:	f0c68d23          	sb	a2,-230(a3) # 20002f1a <g_rf_cfg+0x2>
10002ea8:	00378693          	addi	a3,a5,3
10002eac:	0686                	slli	a3,a3,0x1
10002eae:	0ff6f693          	zext.b	a3,a3
10002eb2:	0f000593          	li	a1,240
10002eb6:	4601                	li	a2,0
10002eb8:	00d5e963          	bltu	a1,a3,10002eca <omw_rf_cal+0x9c>
10002ebc:	8636                	mv	a2,a3
10002ebe:	45fd                	li	a1,31
10002ec0:	00d5f363          	bgeu	a1,a3,10002ec6 <omw_rf_cal+0x98>
10002ec4:	467d                	li	a2,31
10002ec6:	0ff67613          	zext.b	a2,a2
10002eca:	200036b7          	lui	a3,0x20003
10002ece:	f1868693          	addi	a3,a3,-232 # 20002f18 <g_rf_cfg>
10002ed2:	00c68223          	sb	a2,4(a3)
10002ed6:	0706                	slli	a4,a4,0x1
10002ed8:	0ff77713          	zext.b	a4,a4
10002edc:	00770613          	addi	a2,a4,7
10002ee0:	00c682a3          	sb	a2,5(a3)
10002ee4:	00c78613          	addi	a2,a5,12
10002ee8:	0606                	slli	a2,a2,0x1
10002eea:	00c68323          	sb	a2,6(a3)
10002eee:	0715                	addi	a4,a4,5
10002ef0:	00e683a3          	sb	a4,7(a3)
10002ef4:	00279713          	slli	a4,a5,0x2
10002ef8:	8f99                	sub	a5,a5,a4
10002efa:	078e                	slli	a5,a5,0x3
10002efc:	953e                	add	a0,a0,a5
10002efe:	4699                	li	a3,6
10002f00:	02d54733          	div	a4,a0,a3
10002f04:	41f55613          	srai	a2,a0,0x1f
10002f08:	00a647b3          	xor	a5,a2,a0
10002f0c:	8f91                	sub	a5,a5,a2
10002f0e:	02d7e7b3          	rem	a5,a5,a3
10002f12:	4609                	li	a2,2
10002f14:	4681                	li	a3,0
10002f16:	00f65663          	bge	a2,a5,10002f22 <omw_rf_cal+0xf4>
10002f1a:	41f55693          	srai	a3,a0,0x1f
10002f1e:	0016e693          	ori	a3,a3,1
10002f22:	00d707b3          	add	a5,a4,a3
10002f26:	01879493          	slli	s1,a5,0x18
10002f2a:	84e1                	srai	s1,s1,0x18
10002f2c:	20003437          	lui	s0,0x20003
10002f30:	f1840413          	addi	s0,s0,-232 # 20002f18 <g_rf_cfg>
10002f34:	00940523          	sb	s1,10(s0)
10002f38:	200027b7          	lui	a5,0x20002
10002f3c:	62878793          	addi	a5,a5,1576 # 20002628 <g_otp_cfg>
10002f40:	c03e                	sw	a5,0(sp)
10002f42:	4398                	lw	a4,0(a5)
10002f44:	4601                	li	a2,0
10002f46:	85a6                	mv	a1,s1
10002f48:	c23a                	sw	a4,4(sp)
10002f4a:	00f77513          	andi	a0,a4,15
10002f4e:	3591                	jal	10002d92 <get_vtrim>
10002f50:	00a40023          	sb	a0,0(s0)
10002f54:	4712                	lw	a4,4(sp)
10002f56:	01075513          	srli	a0,a4,0x10
10002f5a:	5661                	li	a2,-8
10002f5c:	85a6                	mv	a1,s1
10002f5e:	893d                	andi	a0,a0,15
10002f60:	3d0d                	jal	10002d92 <get_vtrim>
10002f62:	00a400a3          	sb	a0,1(s0)
10002f66:	478d                	li	a5,3
10002f68:	00f404a3          	sb	a5,9(s0)
10002f6c:	4782                	lw	a5,0(sp)
10002f6e:	5bd0                	lw	a2,52(a5)
10002f70:	0652                	slli	a2,a2,0x14
10002f72:	8251                	srli	a2,a2,0x14
10002f74:	100047b7          	lui	a5,0x10004
10002f78:	4e478793          	addi	a5,a5,1252 # 100044e4 <rssi_thresholds>
10002f7c:	00c78593          	addi	a1,a5,12
10002f80:	4501                	li	a0,0
10002f82:	470d                	li	a4,3
10002f84:	4305                	li	t1,1
10002f86:	a021                	j	10002f8e <omw_rf_cal+0x160>
10002f88:	0789                	addi	a5,a5,2
10002f8a:	00b78b63          	beq	a5,a1,10002fa0 <omw_rf_cal+0x172>
10002f8e:	0007d683          	lhu	a3,0(a5)
10002f92:	fed64be3          	blt	a2,a3,10002f88 <omw_rf_cal+0x15a>
10002f96:	177d                	addi	a4,a4,-1
10002f98:	0762                	slli	a4,a4,0x18
10002f9a:	8761                	srai	a4,a4,0x18
10002f9c:	851a                	mv	a0,t1
10002f9e:	b7ed                	j	10002f88 <omw_rf_cal+0x15a>
10002fa0:	c509                	beqz	a0,10002faa <omw_rf_cal+0x17c>
10002fa2:	200037b7          	lui	a5,0x20003
10002fa6:	f2e780a3          	sb	a4,-223(a5) # 20002f21 <g_rf_cfg+0x9>
10002faa:	c69fe0ef          	jal	10001c12 <omw_clkcal_rc24m_calibration>
10002fae:	da5fe0ef          	jal	10001d52 <omw_clkcal_rc32k_calibration>
10002fb2:	40c2                	lw	ra,16(sp)
10002fb4:	4432                	lw	s0,12(sp)
10002fb6:	44a2                	lw	s1,8(sp)
10002fb8:	0151                	addi	sp,sp,20
10002fba:	8082                	ret

10002fbc <t1001_sleep_get_protect_time>:
10002fbc:	51200513          	li	a0,1298
10002fc0:	8082                	ret

10002fc2 <bt_polling_work_ext>:
10002fc2:	1151                	addi	sp,sp,-12
10002fc4:	c406                	sw	ra,8(sp)
10002fc6:	c222                	sw	s0,4(sp)
10002fc8:	c026                	sw	s1,0(sp)
10002fca:	f0006097          	auipc	ra,0xf0006
10002fce:	5e4080e7          	jalr	1508(ra) # 95ae <bt_is_ready>
10002fd2:	cd31                	beqz	a0,1000302e <bt_polling_work_ext+0x6c>
10002fd4:	f0004097          	auipc	ra,0xf0004
10002fd8:	d50080e7          	jalr	-688(ra) # 6d24 <bt_conn_tx_polling>
10002fdc:	20001537          	lui	a0,0x20001
10002fe0:	8e450513          	addi	a0,a0,-1820 # 200008e4 <bt_dev+0x84>
10002fe4:	f0009097          	auipc	ra,0xf0009
10002fe8:	4f8080e7          	jalr	1272(ra) # c4dc <simple_buf_get>
10002fec:	842a                	mv	s0,a0
10002fee:	c125                	beqz	a0,1000304e <bt_polling_work_ext+0x8c>
10002ff0:	00c44783          	lbu	a5,12(s0)
10002ff4:	4705                	li	a4,1
10002ff6:	0ae78063          	beq	a5,a4,10003096 <bt_polling_work_ext+0xd4>
10002ffa:	470d                	li	a4,3
10002ffc:	0ae79e63          	bne	a5,a4,100030b8 <bt_polling_work_ext+0xf6>
10003000:	4591                	li	a1,4
10003002:	01040513          	addi	a0,s0,16
10003006:	f0009097          	auipc	ra,0xf0009
1000300a:	52e080e7          	jalr	1326(ra) # c534 <simple_buf_base_pull_mem>
1000300e:	00254683          	lbu	a3,2(a0)
10003012:	00354783          	lbu	a5,3(a0)
10003016:	07a2                	slli	a5,a5,0x8
10003018:	01445703          	lhu	a4,20(s0)
1000301c:	8fd5                	or	a5,a5,a3
1000301e:	04f70363          	beq	a4,a5,10003064 <bt_polling_work_ext+0xa2>
10003022:	8522                	mv	a0,s0
10003024:	f0009097          	auipc	ra,0xf0009
10003028:	46a080e7          	jalr	1130(ra) # c48e <simple_buf_free>
1000302c:	a895                	j	100030a0 <bt_polling_work_ext+0xde>
1000302e:	f0006097          	auipc	ra,0xf0006
10003032:	012080e7          	jalr	18(ra) # 9040 <bt_init>
10003036:	200017b7          	lui	a5,0x20001
1000303a:	4709                	li	a4,2
1000303c:	8ee7a623          	sw	a4,-1812(a5) # 200008ec <bt_dev+0x8c>
10003040:	200017b7          	lui	a5,0x20001
10003044:	8f87a783          	lw	a5,-1800(a5) # 200008f8 <bt_dev+0x98>
10003048:	d7d1                	beqz	a5,10002fd4 <bt_polling_work_ext+0x12>
1000304a:	9782                	jalr	a5
1000304c:	b761                	j	10002fd4 <bt_polling_work_ext+0x12>
1000304e:	20001537          	lui	a0,0x20001
10003052:	8dc50513          	addi	a0,a0,-1828 # 200008dc <bt_dev+0x7c>
10003056:	f0009097          	auipc	ra,0xf0009
1000305a:	486080e7          	jalr	1158(ra) # c4dc <simple_buf_get>
1000305e:	842a                	mv	s0,a0
10003060:	f941                	bnez	a0,10002ff0 <bt_polling_work_ext+0x2e>
10003062:	a83d                	j	100030a0 <bt_polling_work_ext+0xde>
10003064:	00054783          	lbu	a5,0(a0)
10003068:	00154483          	lbu	s1,1(a0)
1000306c:	04a2                	slli	s1,s1,0x8
1000306e:	8cdd                	or	s1,s1,a5
10003070:	01449513          	slli	a0,s1,0x14
10003074:	8151                	srli	a0,a0,0x14
10003076:	f0004097          	auipc	ra,0xf0004
1000307a:	b7e080e7          	jalr	-1154(ra) # 6bf4 <bt_conn_lookup_handle>
1000307e:	c511                	beqz	a0,1000308a <bt_polling_work_ext+0xc8>
10003080:	00c4d613          	srli	a2,s1,0xc
10003084:	85a2                	mv	a1,s0
10003086:	283d                	jal	100030c4 <bt_conn_recv_ext>
10003088:	a821                	j	100030a0 <bt_polling_work_ext+0xde>
1000308a:	8522                	mv	a0,s0
1000308c:	f0009097          	auipc	ra,0xf0009
10003090:	402080e7          	jalr	1026(ra) # c48e <simple_buf_free>
10003094:	a031                	j	100030a0 <bt_polling_work_ext+0xde>
10003096:	8522                	mv	a0,s0
10003098:	f0006097          	auipc	ra,0xf0006
1000309c:	898080e7          	jalr	-1896(ra) # 8930 <hci_event>
100030a0:	200017b7          	lui	a5,0x20001
100030a4:	8f47a783          	lw	a5,-1804(a5) # 200008f4 <bt_dev+0x94>
100030a8:	479c                	lw	a5,8(a5)
100030aa:	c391                	beqz	a5,100030ae <bt_polling_work_ext+0xec>
100030ac:	9782                	jalr	a5
100030ae:	40a2                	lw	ra,8(sp)
100030b0:	4412                	lw	s0,4(sp)
100030b2:	4482                	lw	s1,0(sp)
100030b4:	0131                	addi	sp,sp,12
100030b6:	8082                	ret
100030b8:	8522                	mv	a0,s0
100030ba:	f0009097          	auipc	ra,0xf0009
100030be:	3d4080e7          	jalr	980(ra) # c48e <simple_buf_free>
100030c2:	bff9                	j	100030a0 <bt_polling_work_ext+0xde>

100030c4 <bt_conn_recv_ext>:
100030c4:	1141                	addi	sp,sp,-16
100030c6:	c606                	sw	ra,12(sp)
100030c8:	c422                	sw	s0,8(sp)
100030ca:	c226                	sw	s1,4(sp)
100030cc:	84ae                	mv	s1,a1
100030ce:	00654783          	lbu	a5,6(a0)
100030d2:	c7c1                	beqz	a5,1000315a <bt_conn_recv_ext+0x96>
100030d4:	842a                	mv	s0,a0
100030d6:	4785                	li	a5,1
100030d8:	0cf60963          	beq	a2,a5,100031aa <bt_conn_recv_ext+0xe6>
100030dc:	4789                	li	a5,2
100030de:	14f61263          	bne	a2,a5,10003222 <bt_conn_recv_ext+0x15e>
100030e2:	455c                	lw	a5,12(a0)
100030e4:	c789                	beqz	a5,100030ee <bt_conn_recv_ext+0x2a>
100030e6:	f0004097          	auipc	ra,0xf0004
100030ea:	998080e7          	jalr	-1640(ra) # 6a7e <bt_conn_reset_rx_state>
100030ee:	4894                	lw	a3,16(s1)
100030f0:	0016c583          	lbu	a1,1(a3)
100030f4:	05a2                	slli	a1,a1,0x8
100030f6:	0006c783          	lbu	a5,0(a3)
100030fa:	8ddd                	or	a1,a1,a5
100030fc:	0144d603          	lhu	a2,20(s1)
10003100:	00458713          	addi	a4,a1,4
10003104:	0742                	slli	a4,a4,0x10
10003106:	8341                	srli	a4,a4,0x10
10003108:	8f11                	sub	a4,a4,a2
1000310a:	0164d783          	lhu	a5,22(s1)
1000310e:	8f91                	sub	a5,a5,a2
10003110:	4c90                	lw	a2,24(s1)
10003112:	8e91                	sub	a3,a3,a2
10003114:	8f95                	sub	a5,a5,a3
10003116:	07c2                	slli	a5,a5,0x10
10003118:	83c1                	srli	a5,a5,0x10
1000311a:	04e7ca63          	blt	a5,a4,1000316e <bt_conn_recv_ext+0xaa>
1000311e:	c444                	sw	s1,12(s0)
10003120:	444c                	lw	a1,12(s0)
10003122:	0145d703          	lhu	a4,20(a1)
10003126:	4785                	li	a5,1
10003128:	02e7fe63          	bgeu	a5,a4,10003164 <bt_conn_recv_ext+0xa0>
1000312c:	4994                	lw	a3,16(a1)
1000312e:	0016c783          	lbu	a5,1(a3)
10003132:	07a2                	slli	a5,a5,0x8
10003134:	0006c683          	lbu	a3,0(a3)
10003138:	8fd5                	or	a5,a5,a3
1000313a:	0791                	addi	a5,a5,4
1000313c:	07c2                	slli	a5,a5,0x10
1000313e:	83c1                	srli	a5,a5,0x10
10003140:	02f76263          	bltu	a4,a5,10003164 <bt_conn_recv_ext+0xa0>
10003144:	0ee7e963          	bltu	a5,a4,10003236 <bt_conn_recv_ext+0x172>
10003148:	00042623          	sw	zero,12(s0)
1000314c:	4605                	li	a2,1
1000314e:	8522                	mv	a0,s0
10003150:	f0006097          	auipc	ra,0xf0006
10003154:	732080e7          	jalr	1842(ra) # 9882 <bt_l2cap_recv>
10003158:	a031                	j	10003164 <bt_conn_recv_ext+0xa0>
1000315a:	852e                	mv	a0,a1
1000315c:	f0009097          	auipc	ra,0xf0009
10003160:	332080e7          	jalr	818(ra) # c48e <simple_buf_free>
10003164:	40b2                	lw	ra,12(sp)
10003166:	4422                	lw	s0,8(sp)
10003168:	4492                	lw	s1,4(sp)
1000316a:	0141                	addi	sp,sp,16
1000316c:	8082                	ret
1000316e:	05b1                	addi	a1,a1,12
10003170:	05c2                	slli	a1,a1,0x10
10003172:	81c1                	srli	a1,a1,0x10
10003174:	450d                	li	a0,3
10003176:	f0007097          	auipc	ra,0xf0007
1000317a:	b7c080e7          	jalr	-1156(ra) # 9cf2 <bt_buf_get>
1000317e:	d145                	beqz	a0,1000311e <bt_conn_recv_ext+0x5a>
10003180:	0144d603          	lhu	a2,20(s1)
10003184:	488c                	lw	a1,16(s1)
10003186:	c02a                	sw	a0,0(sp)
10003188:	4908                	lw	a0,16(a0)
1000318a:	f000a097          	auipc	ra,0xf000a
1000318e:	82a080e7          	jalr	-2006(ra) # c9b4 <memcpy>
10003192:	0144d783          	lhu	a5,20(s1)
10003196:	4702                	lw	a4,0(sp)
10003198:	00f71a23          	sh	a5,20(a4)
1000319c:	8526                	mv	a0,s1
1000319e:	f0009097          	auipc	ra,0xf0009
100031a2:	2f0080e7          	jalr	752(ra) # c48e <simple_buf_free>
100031a6:	4482                	lw	s1,0(sp)
100031a8:	bf9d                	j	1000311e <bt_conn_recv_ext+0x5a>
100031aa:	4548                	lw	a0,12(a0)
100031ac:	c91d                	beqz	a0,100031e2 <bt_conn_recv_ext+0x11e>
100031ae:	0145d603          	lhu	a2,20(a1)
100031b2:	c239                	beqz	a2,100031f8 <bt_conn_recv_ext+0x134>
100031b4:	01655783          	lhu	a5,22(a0)
100031b8:	01455703          	lhu	a4,20(a0)
100031bc:	8f99                	sub	a5,a5,a4
100031be:	4918                	lw	a4,16(a0)
100031c0:	4d14                	lw	a3,24(a0)
100031c2:	8f15                	sub	a4,a4,a3
100031c4:	8f99                	sub	a5,a5,a4
100031c6:	02c7ef63          	bltu	a5,a2,10003204 <bt_conn_recv_ext+0x140>
100031ca:	498c                	lw	a1,16(a1)
100031cc:	0541                	addi	a0,a0,16
100031ce:	f0009097          	auipc	ra,0xf0009
100031d2:	3b2080e7          	jalr	946(ra) # c580 <simple_buf_base_add_mem>
100031d6:	8526                	mv	a0,s1
100031d8:	f0009097          	auipc	ra,0xf0009
100031dc:	2b6080e7          	jalr	694(ra) # c48e <simple_buf_free>
100031e0:	b781                	j	10003120 <bt_conn_recv_ext+0x5c>
100031e2:	8522                	mv	a0,s0
100031e4:	f0004097          	auipc	ra,0xf0004
100031e8:	89a080e7          	jalr	-1894(ra) # 6a7e <bt_conn_reset_rx_state>
100031ec:	8526                	mv	a0,s1
100031ee:	f0009097          	auipc	ra,0xf0009
100031f2:	2a0080e7          	jalr	672(ra) # c48e <simple_buf_free>
100031f6:	b7bd                	j	10003164 <bt_conn_recv_ext+0xa0>
100031f8:	852e                	mv	a0,a1
100031fa:	f0009097          	auipc	ra,0xf0009
100031fe:	294080e7          	jalr	660(ra) # c48e <simple_buf_free>
10003202:	b78d                	j	10003164 <bt_conn_recv_ext+0xa0>
10003204:	4601                	li	a2,0
10003206:	85aa                	mv	a1,a0
10003208:	8522                	mv	a0,s0
1000320a:	f0006097          	auipc	ra,0xf0006
1000320e:	678080e7          	jalr	1656(ra) # 9882 <bt_l2cap_recv>
10003212:	00042623          	sw	zero,12(s0)
10003216:	8526                	mv	a0,s1
10003218:	f0009097          	auipc	ra,0xf0009
1000321c:	276080e7          	jalr	630(ra) # c48e <simple_buf_free>
10003220:	b791                	j	10003164 <bt_conn_recv_ext+0xa0>
10003222:	f0004097          	auipc	ra,0xf0004
10003226:	85c080e7          	jalr	-1956(ra) # 6a7e <bt_conn_reset_rx_state>
1000322a:	8526                	mv	a0,s1
1000322c:	f0009097          	auipc	ra,0xf0009
10003230:	262080e7          	jalr	610(ra) # c48e <simple_buf_free>
10003234:	bf05                	j	10003164 <bt_conn_recv_ext+0xa0>
10003236:	8522                	mv	a0,s0
10003238:	f0004097          	auipc	ra,0xf0004
1000323c:	846080e7          	jalr	-1978(ra) # 6a7e <bt_conn_reset_rx_state>
10003240:	b715                	j	10003164 <bt_conn_recv_ext+0xa0>

10003242 <bt_conn_can_sleep_check>:
10003242:	1151                	addi	sp,sp,-12
10003244:	c406                	sw	ra,8(sp)
10003246:	d2ffe0ef          	jal	10001f74 <bt_att_can_sleep>
1000324a:	cd15                	beqz	a0,10003286 <bt_conn_can_sleep_check+0x44>
1000324c:	200007b7          	lui	a5,0x20000
10003250:	7647c603          	lbu	a2,1892(a5) # 20000764 <ble_max_conn_nr>
10003254:	02c05c63          	blez	a2,1000328c <bt_conn_can_sleep_check+0x4a>
10003258:	200017b7          	lui	a5,0x20001
1000325c:	83c7a783          	lw	a5,-1988(a5) # 2000083c <acl_conns>
10003260:	53d8                	lw	a4,36(a5)
10003262:	e71d                	bnez	a4,10003290 <bt_conn_can_sleep_check+0x4e>
10003264:	4bd8                	lw	a4,20(a5)
10003266:	e71d                	bnez	a4,10003294 <bt_conn_can_sleep_check+0x52>
10003268:	08878793          	addi	a5,a5,136
1000326c:	0705                	addi	a4,a4,1
1000326e:	00c70b63          	beq	a4,a2,10003284 <bt_conn_can_sleep_check+0x42>
10003272:	4b94                	lw	a3,16(a5)
10003274:	e295                	bnez	a3,10003298 <bt_conn_can_sleep_check+0x56>
10003276:	07478793          	addi	a5,a5,116
1000327a:	f8c7a683          	lw	a3,-116(a5)
1000327e:	d6fd                	beqz	a3,1000326c <bt_conn_can_sleep_check+0x2a>
10003280:	4501                	li	a0,0
10003282:	a011                	j	10003286 <bt_conn_can_sleep_check+0x44>
10003284:	4505                	li	a0,1
10003286:	40a2                	lw	ra,8(sp)
10003288:	0131                	addi	sp,sp,12
1000328a:	8082                	ret
1000328c:	4505                	li	a0,1
1000328e:	bfe5                	j	10003286 <bt_conn_can_sleep_check+0x44>
10003290:	4501                	li	a0,0
10003292:	bfd5                	j	10003286 <bt_conn_can_sleep_check+0x44>
10003294:	4501                	li	a0,0
10003296:	bfc5                	j	10003286 <bt_conn_can_sleep_check+0x44>
10003298:	4501                	li	a0,0
1000329a:	b7f5                	j	10003286 <bt_conn_can_sleep_check+0x44>

1000329c <ll_conn_process_before_sleep>:
1000329c:	1151                	addi	sp,sp,-12
1000329e:	c406                	sw	ra,8(sp)
100032a0:	4501                	li	a0,0
100032a2:	f0000097          	auipc	ra,0xf0000
100032a6:	8f2080e7          	jalr	-1806(ra) # 2b94 <ll_conn_set_get>
100032aa:	00054703          	lbu	a4,0(a0)
100032ae:	200037b7          	lui	a5,0x20003
100032b2:	f6e78823          	sb	a4,-144(a5) # 20002f70 <ll_conn_status>
100032b6:	40a2                	lw	ra,8(sp)
100032b8:	0131                	addi	sp,sp,12
100032ba:	8082                	ret

100032bc <__divdf3>:
100032bc:	fdc10113          	addi	sp,sp,-36
100032c0:	872a                	mv	a4,a0
100032c2:	852e                	mv	a0,a1
100032c4:	cc26                	sw	s1,24(sp)
100032c6:	82b6                	mv	t0,a3
100032c8:	00c59493          	slli	s1,a1,0xc
100032cc:	01f55693          	srli	a3,a0,0x1f
100032d0:	81d1                	srli	a1,a1,0x14
100032d2:	d006                	sw	ra,32(sp)
100032d4:	ce22                	sw	s0,28(sp)
100032d6:	7ff5f593          	andi	a1,a1,2047
100032da:	c436                	sw	a3,8(sp)
100032dc:	80b1                	srli	s1,s1,0xc
100032de:	c5c1                	beqz	a1,10003366 <__divdf3+0xaa>
100032e0:	7ff00693          	li	a3,2047
100032e4:	0ed58463          	beq	a1,a3,100033cc <__divdf3+0x110>
100032e8:	01d75413          	srli	s0,a4,0x1d
100032ec:	048e                	slli	s1,s1,0x3
100032ee:	008007b7          	lui	a5,0x800
100032f2:	8c45                	or	s0,s0,s1
100032f4:	8c5d                	or	s0,s0,a5
100032f6:	c0158593          	addi	a1,a1,-1023
100032fa:	00371793          	slli	a5,a4,0x3
100032fe:	4301                	li	t1,0
10003300:	0142d693          	srli	a3,t0,0x14
10003304:	00c29713          	slli	a4,t0,0xc
10003308:	7ff6f693          	andi	a3,a3,2047
1000330c:	00c75393          	srli	t2,a4,0xc
10003310:	01f2d493          	srli	s1,t0,0x1f
10003314:	caf1                	beqz	a3,100033e8 <__divdf3+0x12c>
10003316:	7ff00713          	li	a4,2047
1000331a:	14e68863          	beq	a3,a4,1000346a <__divdf3+0x1ae>
1000331e:	00339513          	slli	a0,t2,0x3
10003322:	01d65713          	srli	a4,a2,0x1d
10003326:	8f49                	or	a4,a4,a0
10003328:	00800537          	lui	a0,0x800
1000332c:	00a763b3          	or	t2,a4,a0
10003330:	c0168693          	addi	a3,a3,-1023
10003334:	00361513          	slli	a0,a2,0x3
10003338:	4701                	li	a4,0
1000333a:	4622                	lw	a2,8(sp)
1000333c:	40d586b3          	sub	a3,a1,a3
10003340:	c036                	sw	a3,0(sp)
10003342:	00231693          	slli	a3,t1,0x2
10003346:	8e25                	xor	a2,a2,s1
10003348:	8ed9                	or	a3,a3,a4
1000334a:	c232                	sw	a2,4(sp)
1000334c:	16fd                	addi	a3,a3,-1
1000334e:	4639                	li	a2,14
10003350:	12d66a63          	bltu	a2,a3,10003484 <__divdf3+0x1c8>
10003354:	00001617          	auipc	a2,0x1
10003358:	19c60613          	addi	a2,a2,412 # 100044f0 <rssi_thresholds+0xc>
1000335c:	068a                	slli	a3,a3,0x2
1000335e:	96b2                	add	a3,a3,a2
10003360:	4294                	lw	a3,0(a3)
10003362:	96b2                	add	a3,a3,a2
10003364:	8682                	jr	a3
10003366:	00e4e433          	or	s0,s1,a4
1000336a:	c43d                	beqz	s0,100033d8 <__divdf3+0x11c>
1000336c:	c616                	sw	t0,12(sp)
1000336e:	c232                	sw	a2,4(sp)
10003370:	c89d                	beqz	s1,100033a6 <__divdf3+0xea>
10003372:	8526                	mv	a0,s1
10003374:	c03a                	sw	a4,0(sp)
10003376:	34d000ef          	jal	10003ec2 <__clzsi2>
1000337a:	4702                	lw	a4,0(sp)
1000337c:	4612                	lw	a2,4(sp)
1000337e:	42b2                	lw	t0,12(sp)
10003380:	87aa                	mv	a5,a0
10003382:	ff550593          	addi	a1,a0,-11 # 7ffff5 <__FLASH_SIZE+0x7bfff5>
10003386:	4475                	li	s0,29
10003388:	ff878693          	addi	a3,a5,-8 # 7ffff8 <__FLASH_SIZE+0x7bfff8>
1000338c:	8c0d                	sub	s0,s0,a1
1000338e:	00d494b3          	sll	s1,s1,a3
10003392:	00875433          	srl	s0,a4,s0
10003396:	8c45                	or	s0,s0,s1
10003398:	00d714b3          	sll	s1,a4,a3
1000339c:	c0d00593          	li	a1,-1011
100033a0:	8d9d                	sub	a1,a1,a5
100033a2:	87a6                	mv	a5,s1
100033a4:	bfa9                	j	100032fe <__divdf3+0x42>
100033a6:	853a                	mv	a0,a4
100033a8:	c03a                	sw	a4,0(sp)
100033aa:	319000ef          	jal	10003ec2 <__clzsi2>
100033ae:	01550593          	addi	a1,a0,21
100033b2:	46f1                	li	a3,28
100033b4:	4702                	lw	a4,0(sp)
100033b6:	4612                	lw	a2,4(sp)
100033b8:	42b2                	lw	t0,12(sp)
100033ba:	02050793          	addi	a5,a0,32
100033be:	fcb6d4e3          	bge	a3,a1,10003386 <__divdf3+0xca>
100033c2:	ff850413          	addi	s0,a0,-8
100033c6:	00871433          	sll	s0,a4,s0
100033ca:	bfc9                	j	1000339c <__divdf3+0xe0>
100033cc:	00e4e433          	or	s0,s1,a4
100033d0:	e801                	bnez	s0,100033e0 <__divdf3+0x124>
100033d2:	4781                	li	a5,0
100033d4:	4309                	li	t1,2
100033d6:	b72d                	j	10003300 <__divdf3+0x44>
100033d8:	4781                	li	a5,0
100033da:	4581                	li	a1,0
100033dc:	4305                	li	t1,1
100033de:	b70d                	j	10003300 <__divdf3+0x44>
100033e0:	87ba                	mv	a5,a4
100033e2:	8426                	mv	s0,s1
100033e4:	430d                	li	t1,3
100033e6:	bf29                	j	10003300 <__divdf3+0x44>
100033e8:	00c3e533          	or	a0,t2,a2
100033ec:	c549                	beqz	a0,10003476 <__divdf3+0x1ba>
100033ee:	04038663          	beqz	t2,1000343a <__divdf3+0x17e>
100033f2:	851e                	mv	a0,t2
100033f4:	ca32                	sw	a2,20(sp)
100033f6:	c81a                	sw	t1,16(sp)
100033f8:	c62e                	sw	a1,12(sp)
100033fa:	c23e                	sw	a5,4(sp)
100033fc:	c01e                	sw	t2,0(sp)
100033fe:	2c5000ef          	jal	10003ec2 <__clzsi2>
10003402:	4382                	lw	t2,0(sp)
10003404:	4792                	lw	a5,4(sp)
10003406:	45b2                	lw	a1,12(sp)
10003408:	4342                	lw	t1,16(sp)
1000340a:	4652                	lw	a2,20(sp)
1000340c:	86aa                	mv	a3,a0
1000340e:	ff550293          	addi	t0,a0,-11
10003412:	4775                	li	a4,29
10003414:	ff868513          	addi	a0,a3,-8
10003418:	40570733          	sub	a4,a4,t0
1000341c:	00a393b3          	sll	t2,t2,a0
10003420:	00e65733          	srl	a4,a2,a4
10003424:	00776733          	or	a4,a4,t2
10003428:	00a613b3          	sll	t2,a2,a0
1000342c:	c0d00613          	li	a2,-1011
10003430:	851e                	mv	a0,t2
10003432:	40d606b3          	sub	a3,a2,a3
10003436:	83ba                	mv	t2,a4
10003438:	b701                	j	10003338 <__divdf3+0x7c>
1000343a:	8532                	mv	a0,a2
1000343c:	ca1e                	sw	t2,20(sp)
1000343e:	c81a                	sw	t1,16(sp)
10003440:	c62e                	sw	a1,12(sp)
10003442:	c23e                	sw	a5,4(sp)
10003444:	c032                	sw	a2,0(sp)
10003446:	27d000ef          	jal	10003ec2 <__clzsi2>
1000344a:	01550293          	addi	t0,a0,21
1000344e:	4771                	li	a4,28
10003450:	4602                	lw	a2,0(sp)
10003452:	4792                	lw	a5,4(sp)
10003454:	45b2                	lw	a1,12(sp)
10003456:	4342                	lw	t1,16(sp)
10003458:	43d2                	lw	t2,20(sp)
1000345a:	02050693          	addi	a3,a0,32
1000345e:	fa575ae3          	bge	a4,t0,10003412 <__divdf3+0x156>
10003462:	1561                	addi	a0,a0,-8
10003464:	00a61733          	sll	a4,a2,a0
10003468:	b7d1                	j	1000342c <__divdf3+0x170>
1000346a:	00c3e533          	or	a0,t2,a2
1000346e:	e901                	bnez	a0,1000347e <__divdf3+0x1c2>
10003470:	4381                	li	t2,0
10003472:	4709                	li	a4,2
10003474:	b5d9                	j	1000333a <__divdf3+0x7e>
10003476:	4381                	li	t2,0
10003478:	4681                	li	a3,0
1000347a:	4705                	li	a4,1
1000347c:	bd7d                	j	1000333a <__divdf3+0x7e>
1000347e:	8532                	mv	a0,a2
10003480:	470d                	li	a4,3
10003482:	bd65                	j	1000333a <__divdf3+0x7e>
10003484:	0083e663          	bltu	t2,s0,10003490 <__divdf3+0x1d4>
10003488:	2a741d63          	bne	s0,t2,10003742 <__divdf3+0x486>
1000348c:	2aa7eb63          	bltu	a5,a0,10003742 <__divdf3+0x486>
10003490:	01f41693          	slli	a3,s0,0x1f
10003494:	0017d713          	srli	a4,a5,0x1
10003498:	01f79313          	slli	t1,a5,0x1f
1000349c:	8005                	srli	s0,s0,0x1
1000349e:	00e6e7b3          	or	a5,a3,a4
100034a2:	00839713          	slli	a4,t2,0x8
100034a6:	01075493          	srli	s1,a4,0x10
100034aa:	029456b3          	divu	a3,s0,s1
100034ae:	01855613          	srli	a2,a0,0x18
100034b2:	8e59                	or	a2,a2,a4
100034b4:	01061713          	slli	a4,a2,0x10
100034b8:	8341                	srli	a4,a4,0x10
100034ba:	c43a                	sw	a4,8(sp)
100034bc:	0107d593          	srli	a1,a5,0x10
100034c0:	00851293          	slli	t0,a0,0x8
100034c4:	02947433          	remu	s0,s0,s1
100034c8:	02d70733          	mul	a4,a4,a3
100034cc:	0442                	slli	s0,s0,0x10
100034ce:	8c4d                	or	s0,s0,a1
100034d0:	85b6                	mv	a1,a3
100034d2:	00e47c63          	bgeu	s0,a4,100034ea <__divdf3+0x22e>
100034d6:	9432                	add	s0,s0,a2
100034d8:	fff68593          	addi	a1,a3,-1
100034dc:	00c46763          	bltu	s0,a2,100034ea <__divdf3+0x22e>
100034e0:	00e47563          	bgeu	s0,a4,100034ea <__divdf3+0x22e>
100034e4:	ffe68593          	addi	a1,a3,-2
100034e8:	9432                	add	s0,s0,a2
100034ea:	8c19                	sub	s0,s0,a4
100034ec:	029456b3          	divu	a3,s0,s1
100034f0:	01061713          	slli	a4,a2,0x10
100034f4:	8341                	srli	a4,a4,0x10
100034f6:	07c2                	slli	a5,a5,0x10
100034f8:	83c1                	srli	a5,a5,0x10
100034fa:	02947433          	remu	s0,s0,s1
100034fe:	8536                	mv	a0,a3
10003500:	02d70733          	mul	a4,a4,a3
10003504:	0442                	slli	s0,s0,0x10
10003506:	8fc1                	or	a5,a5,s0
10003508:	00e7fc63          	bgeu	a5,a4,10003520 <__divdf3+0x264>
1000350c:	97b2                	add	a5,a5,a2
1000350e:	fff68513          	addi	a0,a3,-1
10003512:	00c7e763          	bltu	a5,a2,10003520 <__divdf3+0x264>
10003516:	00e7f563          	bgeu	a5,a4,10003520 <__divdf3+0x264>
1000351a:	ffe68513          	addi	a0,a3,-2
1000351e:	97b2                	add	a5,a5,a2
10003520:	05c2                	slli	a1,a1,0x10
10003522:	8dc9                	or	a1,a1,a0
10003524:	8f99                	sub	a5,a5,a4
10003526:	01029693          	slli	a3,t0,0x10
1000352a:	01059713          	slli	a4,a1,0x10
1000352e:	82c1                	srli	a3,a3,0x10
10003530:	0102d413          	srli	s0,t0,0x10
10003534:	0105d513          	srli	a0,a1,0x10
10003538:	8341                	srli	a4,a4,0x10
1000353a:	02d703b3          	mul	t2,a4,a3
1000353e:	c436                	sw	a3,8(sp)
10003540:	02e40733          	mul	a4,s0,a4
10003544:	02d506b3          	mul	a3,a0,a3
10003548:	02850533          	mul	a0,a0,s0
1000354c:	9736                	add	a4,a4,a3
1000354e:	0103d413          	srli	s0,t2,0x10
10003552:	9722                	add	a4,a4,s0
10003554:	00d77463          	bgeu	a4,a3,1000355c <__divdf3+0x2a0>
10003558:	66c1                	lui	a3,0x10
1000355a:	9536                	add	a0,a0,a3
1000355c:	03c2                	slli	t2,t2,0x10
1000355e:	01075693          	srli	a3,a4,0x10
10003562:	0103d393          	srli	t2,t2,0x10
10003566:	0742                	slli	a4,a4,0x10
10003568:	971e                	add	a4,a4,t2
1000356a:	96aa                	add	a3,a3,a0
1000356c:	c43a                	sw	a4,8(sp)
1000356e:	00d7e763          	bltu	a5,a3,1000357c <__divdf3+0x2c0>
10003572:	83ae                	mv	t2,a1
10003574:	04d79263          	bne	a5,a3,100035b8 <__divdf3+0x2fc>
10003578:	04e37063          	bgeu	t1,a4,100035b8 <__divdf3+0x2fc>
1000357c:	00530533          	add	a0,t1,t0
10003580:	00653433          	sltu	s0,a0,t1
10003584:	00c40733          	add	a4,s0,a2
10003588:	97ba                	add	a5,a5,a4
1000358a:	fff58393          	addi	t2,a1,-1
1000358e:	832a                	mv	t1,a0
10003590:	00f66563          	bltu	a2,a5,1000359a <__divdf3+0x2de>
10003594:	02f61263          	bne	a2,a5,100035b8 <__divdf3+0x2fc>
10003598:	e005                	bnez	s0,100035b8 <__divdf3+0x2fc>
1000359a:	00d7e763          	bltu	a5,a3,100035a8 <__divdf3+0x2ec>
1000359e:	00f69d63          	bne	a3,a5,100035b8 <__divdf3+0x2fc>
100035a2:	4722                	lw	a4,8(sp)
100035a4:	00e57a63          	bgeu	a0,a4,100035b8 <__divdf3+0x2fc>
100035a8:	9516                	add	a0,a0,t0
100035aa:	ffe58393          	addi	t2,a1,-2
100035ae:	005535b3          	sltu	a1,a0,t0
100035b2:	95b2                	add	a1,a1,a2
100035b4:	832a                	mv	t1,a0
100035b6:	97ae                	add	a5,a5,a1
100035b8:	4722                	lw	a4,8(sp)
100035ba:	40d786b3          	sub	a3,a5,a3
100035be:	557d                	li	a0,-1
100035c0:	40e30733          	sub	a4,t1,a4
100035c4:	00e33333          	sltu	t1,t1,a4
100035c8:	406686b3          	sub	a3,a3,t1
100035cc:	10d60063          	beq	a2,a3,100036cc <__divdf3+0x410>
100035d0:	0296d533          	divu	a0,a3,s1
100035d4:	01061793          	slli	a5,a2,0x10
100035d8:	83c1                	srli	a5,a5,0x10
100035da:	02a785b3          	mul	a1,a5,a0
100035de:	0296f7b3          	remu	a5,a3,s1
100035e2:	01075693          	srli	a3,a4,0x10
100035e6:	07c2                	slli	a5,a5,0x10
100035e8:	8fd5                	or	a5,a5,a3
100035ea:	86aa                	mv	a3,a0
100035ec:	00b7fc63          	bgeu	a5,a1,10003604 <__divdf3+0x348>
100035f0:	97b2                	add	a5,a5,a2
100035f2:	fff50693          	addi	a3,a0,-1
100035f6:	00c7e763          	bltu	a5,a2,10003604 <__divdf3+0x348>
100035fa:	00b7f563          	bgeu	a5,a1,10003604 <__divdf3+0x348>
100035fe:	ffe50693          	addi	a3,a0,-2
10003602:	97b2                	add	a5,a5,a2
10003604:	8f8d                	sub	a5,a5,a1
10003606:	0297d533          	divu	a0,a5,s1
1000360a:	01061593          	slli	a1,a2,0x10
1000360e:	81c1                	srli	a1,a1,0x10
10003610:	0742                	slli	a4,a4,0x10
10003612:	8341                	srli	a4,a4,0x10
10003614:	0297f7b3          	remu	a5,a5,s1
10003618:	832a                	mv	t1,a0
1000361a:	02a585b3          	mul	a1,a1,a0
1000361e:	07c2                	slli	a5,a5,0x10
10003620:	8f5d                	or	a4,a4,a5
10003622:	00b77c63          	bgeu	a4,a1,1000363a <__divdf3+0x37e>
10003626:	9732                	add	a4,a4,a2
10003628:	fff50313          	addi	t1,a0,-1
1000362c:	00c76763          	bltu	a4,a2,1000363a <__divdf3+0x37e>
10003630:	00b77563          	bgeu	a4,a1,1000363a <__divdf3+0x37e>
10003634:	ffe50313          	addi	t1,a0,-2
10003638:	9732                	add	a4,a4,a2
1000363a:	06c2                	slli	a3,a3,0x10
1000363c:	0066e6b3          	or	a3,a3,t1
10003640:	01029413          	slli	s0,t0,0x10
10003644:	0106d793          	srli	a5,a3,0x10
10003648:	8041                	srli	s0,s0,0x10
1000364a:	8f0d                	sub	a4,a4,a1
1000364c:	01069513          	slli	a0,a3,0x10
10003650:	01029593          	slli	a1,t0,0x10
10003654:	02878333          	mul	t1,a5,s0
10003658:	8141                	srli	a0,a0,0x10
1000365a:	0102d413          	srli	s0,t0,0x10
1000365e:	81c1                	srli	a1,a1,0x10
10003660:	02a585b3          	mul	a1,a1,a0
10003664:	02a40533          	mul	a0,s0,a0
10003668:	02f407b3          	mul	a5,s0,a5
1000366c:	951a                	add	a0,a0,t1
1000366e:	0105d413          	srli	s0,a1,0x10
10003672:	9522                	add	a0,a0,s0
10003674:	00657463          	bgeu	a0,t1,1000367c <__divdf3+0x3c0>
10003678:	6341                	lui	t1,0x10
1000367a:	979a                	add	a5,a5,t1
1000367c:	01055313          	srli	t1,a0,0x10
10003680:	05c2                	slli	a1,a1,0x10
10003682:	0542                	slli	a0,a0,0x10
10003684:	81c1                	srli	a1,a1,0x10
10003686:	979a                	add	a5,a5,t1
10003688:	95aa                	add	a1,a1,a0
1000368a:	00f76663          	bltu	a4,a5,10003696 <__divdf3+0x3da>
1000368e:	8536                	mv	a0,a3
10003690:	02f71c63          	bne	a4,a5,100036c8 <__divdf3+0x40c>
10003694:	cd85                	beqz	a1,100036cc <__divdf3+0x410>
10003696:	9732                	add	a4,a4,a2
10003698:	fff68513          	addi	a0,a3,-1 # ffff <memset+0x3633>
1000369c:	833a                	mv	t1,a4
1000369e:	02c76163          	bltu	a4,a2,100036c0 <__divdf3+0x404>
100036a2:	00f76663          	bltu	a4,a5,100036ae <__divdf3+0x3f2>
100036a6:	02f71163          	bne	a4,a5,100036c8 <__divdf3+0x40c>
100036aa:	00b2fd63          	bgeu	t0,a1,100036c4 <__divdf3+0x408>
100036ae:	ffe68513          	addi	a0,a3,-2
100036b2:	00129693          	slli	a3,t0,0x1
100036b6:	0056b333          	sltu	t1,a3,t0
100036ba:	9332                	add	t1,t1,a2
100036bc:	933a                	add	t1,t1,a4
100036be:	82b6                	mv	t0,a3
100036c0:	00f31463          	bne	t1,a5,100036c8 <__divdf3+0x40c>
100036c4:	00558463          	beq	a1,t0,100036cc <__divdf3+0x410>
100036c8:	00156513          	ori	a0,a0,1
100036cc:	4782                	lw	a5,0(sp)
100036ce:	3ff78793          	addi	a5,a5,1023
100036d2:	0af05063          	blez	a5,10003772 <__divdf3+0x4b6>
100036d6:	00757713          	andi	a4,a0,7
100036da:	cf01                	beqz	a4,100036f2 <__divdf3+0x436>
100036dc:	00f57713          	andi	a4,a0,15
100036e0:	4691                	li	a3,4
100036e2:	00d70863          	beq	a4,a3,100036f2 <__divdf3+0x436>
100036e6:	00d50733          	add	a4,a0,a3
100036ea:	00a736b3          	sltu	a3,a4,a0
100036ee:	93b6                	add	t2,t2,a3
100036f0:	853a                	mv	a0,a4
100036f2:	00739713          	slli	a4,t2,0x7
100036f6:	00075a63          	bgez	a4,1000370a <__divdf3+0x44e>
100036fa:	ff0007b7          	lui	a5,0xff000
100036fe:	17fd                	addi	a5,a5,-1 # feffffff <__StackTop+0xdeffbfff>
10003700:	00f3f3b3          	and	t2,t2,a5
10003704:	4782                	lw	a5,0(sp)
10003706:	40078793          	addi	a5,a5,1024
1000370a:	7fe00713          	li	a4,2046
1000370e:	10f74163          	blt	a4,a5,10003810 <__divdf3+0x554>
10003712:	00355713          	srli	a4,a0,0x3
10003716:	01d39513          	slli	a0,t2,0x1d
1000371a:	8d59                	or	a0,a0,a4
1000371c:	0033d393          	srli	t2,t2,0x3
10003720:	4712                	lw	a4,4(sp)
10003722:	03b2                	slli	t2,t2,0xc
10003724:	5082                	lw	ra,32(sp)
10003726:	4472                	lw	s0,28(sp)
10003728:	07d2                	slli	a5,a5,0x14
1000372a:	00c3d393          	srli	t2,t2,0xc
1000372e:	0077e7b3          	or	a5,a5,t2
10003732:	077e                	slli	a4,a4,0x1f
10003734:	00e7e6b3          	or	a3,a5,a4
10003738:	44e2                	lw	s1,24(sp)
1000373a:	85b6                	mv	a1,a3
1000373c:	02410113          	addi	sp,sp,36
10003740:	8082                	ret
10003742:	4702                	lw	a4,0(sp)
10003744:	4301                	li	t1,0
10003746:	177d                	addi	a4,a4,-1
10003748:	c03a                	sw	a4,0(sp)
1000374a:	bba1                	j	100034a2 <__divdf3+0x1e6>
1000374c:	c226                	sw	s1,4(sp)
1000374e:	833a                	mv	t1,a4
10003750:	4789                	li	a5,2
10003752:	0af30f63          	beq	t1,a5,10003810 <__divdf3+0x554>
10003756:	478d                	li	a5,3
10003758:	0af30563          	beq	t1,a5,10003802 <__divdf3+0x546>
1000375c:	4785                	li	a5,1
1000375e:	f6f317e3          	bne	t1,a5,100036cc <__divdf3+0x410>
10003762:	4381                	li	t2,0
10003764:	4501                	li	a0,0
10003766:	a0bd                	j	100037d4 <__divdf3+0x518>
10003768:	4722                	lw	a4,8(sp)
1000376a:	83a2                	mv	t2,s0
1000376c:	853e                	mv	a0,a5
1000376e:	c23a                	sw	a4,4(sp)
10003770:	b7c5                	j	10003750 <__divdf3+0x494>
10003772:	4685                	li	a3,1
10003774:	cb89                	beqz	a5,10003786 <__divdf3+0x4ca>
10003776:	8e9d                	sub	a3,a3,a5
10003778:	03800713          	li	a4,56
1000377c:	fed743e3          	blt	a4,a3,10003762 <__divdf3+0x4a6>
10003780:	477d                	li	a4,31
10003782:	04d74b63          	blt	a4,a3,100037d8 <__divdf3+0x51c>
10003786:	4782                	lw	a5,0(sp)
10003788:	41e78713          	addi	a4,a5,1054
1000378c:	00d557b3          	srl	a5,a0,a3
10003790:	00e51533          	sll	a0,a0,a4
10003794:	00a03533          	snez	a0,a0
10003798:	00e39733          	sll	a4,t2,a4
1000379c:	8d59                	or	a0,a0,a4
1000379e:	8fc9                	or	a5,a5,a0
100037a0:	00d3d3b3          	srl	t2,t2,a3
100037a4:	0077f713          	andi	a4,a5,7
100037a8:	cf01                	beqz	a4,100037c0 <__divdf3+0x504>
100037aa:	00f7f713          	andi	a4,a5,15
100037ae:	4691                	li	a3,4
100037b0:	00d70863          	beq	a4,a3,100037c0 <__divdf3+0x504>
100037b4:	00d78733          	add	a4,a5,a3
100037b8:	00f736b3          	sltu	a3,a4,a5
100037bc:	93b6                	add	t2,t2,a3
100037be:	87ba                	mv	a5,a4
100037c0:	00839713          	slli	a4,t2,0x8
100037c4:	04074b63          	bltz	a4,1000381a <__divdf3+0x55e>
100037c8:	01d39513          	slli	a0,t2,0x1d
100037cc:	838d                	srli	a5,a5,0x3
100037ce:	8d5d                	or	a0,a0,a5
100037d0:	0033d393          	srli	t2,t2,0x3
100037d4:	4781                	li	a5,0
100037d6:	b7a9                	j	10003720 <__divdf3+0x464>
100037d8:	5705                	li	a4,-31
100037da:	40f707b3          	sub	a5,a4,a5
100037de:	02000613          	li	a2,32
100037e2:	00f3d7b3          	srl	a5,t2,a5
100037e6:	4701                	li	a4,0
100037e8:	00c68763          	beq	a3,a2,100037f6 <__divdf3+0x53a>
100037ec:	4702                	lw	a4,0(sp)
100037ee:	43e70713          	addi	a4,a4,1086
100037f2:	00e39733          	sll	a4,t2,a4
100037f6:	8f49                	or	a4,a4,a0
100037f8:	00e03733          	snez	a4,a4
100037fc:	8fd9                	or	a5,a5,a4
100037fe:	4381                	li	t2,0
10003800:	b755                	j	100037a4 <__divdf3+0x4e8>
10003802:	000803b7          	lui	t2,0x80
10003806:	4501                	li	a0,0
10003808:	7ff00793          	li	a5,2047
1000380c:	c202                	sw	zero,4(sp)
1000380e:	bf09                	j	10003720 <__divdf3+0x464>
10003810:	4381                	li	t2,0
10003812:	4501                	li	a0,0
10003814:	7ff00793          	li	a5,2047
10003818:	b721                	j	10003720 <__divdf3+0x464>
1000381a:	4381                	li	t2,0
1000381c:	4501                	li	a0,0
1000381e:	4785                	li	a5,1
10003820:	b701                	j	10003720 <__divdf3+0x464>

10003822 <__subdf3>:
10003822:	00100337          	lui	t1,0x100
10003826:	137d                	addi	t1,t1,-1 # fffff <__FLASH_SIZE+0xbffff>
10003828:	1131                	addi	sp,sp,-20
1000382a:	8732                	mv	a4,a2
1000382c:	00b37633          	and	a2,t1,a1
10003830:	0145d793          	srli	a5,a1,0x14
10003834:	c622                	sw	s0,12(sp)
10003836:	01f5d413          	srli	s0,a1,0x1f
1000383a:	00361593          	slli	a1,a2,0x3
1000383e:	01d55613          	srli	a2,a0,0x1d
10003842:	00d37333          	and	t1,t1,a3
10003846:	c426                	sw	s1,8(sp)
10003848:	7ff7f493          	andi	s1,a5,2047
1000384c:	00b667b3          	or	a5,a2,a1
10003850:	0146d593          	srli	a1,a3,0x14
10003854:	00331293          	slli	t0,t1,0x3
10003858:	c806                	sw	ra,16(sp)
1000385a:	01d75313          	srli	t1,a4,0x1d
1000385e:	7ff5f593          	andi	a1,a1,2047
10003862:	7ff00613          	li	a2,2047
10003866:	050e                	slli	a0,a0,0x3
10003868:	82fd                	srli	a3,a3,0x1f
1000386a:	00536333          	or	t1,t1,t0
1000386e:	070e                	slli	a4,a4,0x3
10003870:	00c59563          	bne	a1,a2,1000387a <__subdf3+0x58>
10003874:	00e36633          	or	a2,t1,a4
10003878:	e219                	bnez	a2,1000387e <__subdf3+0x5c>
1000387a:	0016c693          	xori	a3,a3,1
1000387e:	40b48633          	sub	a2,s1,a1
10003882:	7ff00293          	li	t0,2047
10003886:	26869263          	bne	a3,s0,10003aea <__subdf3+0x2c8>
1000388a:	10c05963          	blez	a2,1000399c <__subdf3+0x17a>
1000388e:	e5ad                	bnez	a1,100038f8 <__subdf3+0xd6>
10003890:	00e366b3          	or	a3,t1,a4
10003894:	ce99                	beqz	a3,100038b2 <__subdf3+0x90>
10003896:	fff48613          	addi	a2,s1,-1
1000389a:	ea11                	bnez	a2,100038ae <__subdf3+0x8c>
1000389c:	972a                	add	a4,a4,a0
1000389e:	00a736b3          	sltu	a3,a4,a0
100038a2:	933e                	add	t1,t1,a5
100038a4:	853a                	mv	a0,a4
100038a6:	00d307b3          	add	a5,t1,a3
100038aa:	4485                	li	s1,1
100038ac:	a851                	j	10003940 <__subdf3+0x11e>
100038ae:	04549b63          	bne	s1,t0,10003904 <__subdf3+0xe2>
100038b2:	01d79713          	slli	a4,a5,0x1d
100038b6:	810d                	srli	a0,a0,0x3
100038b8:	0037d613          	srli	a2,a5,0x3
100038bc:	7ff00793          	li	a5,2047
100038c0:	8f49                	or	a4,a4,a0
100038c2:	00f49963          	bne	s1,a5,100038d4 <__subdf3+0xb2>
100038c6:	8f51                	or	a4,a4,a2
100038c8:	4601                	li	a2,0
100038ca:	c709                	beqz	a4,100038d4 <__subdf3+0xb2>
100038cc:	00080637          	lui	a2,0x80
100038d0:	4701                	li	a4,0
100038d2:	4401                	li	s0,0
100038d4:	01449793          	slli	a5,s1,0x14
100038d8:	7ff006b7          	lui	a3,0x7ff00
100038dc:	0632                	slli	a2,a2,0xc
100038de:	8ff5                	and	a5,a5,a3
100038e0:	8231                	srli	a2,a2,0xc
100038e2:	047e                	slli	s0,s0,0x1f
100038e4:	8fd1                	or	a5,a5,a2
100038e6:	40c2                	lw	ra,16(sp)
100038e8:	0087e6b3          	or	a3,a5,s0
100038ec:	4432                	lw	s0,12(sp)
100038ee:	44a2                	lw	s1,8(sp)
100038f0:	853a                	mv	a0,a4
100038f2:	85b6                	mv	a1,a3
100038f4:	0151                	addi	sp,sp,20
100038f6:	8082                	ret
100038f8:	fa548de3          	beq	s1,t0,100038b2 <__subdf3+0x90>
100038fc:	008006b7          	lui	a3,0x800
10003900:	00d36333          	or	t1,t1,a3
10003904:	03800693          	li	a3,56
10003908:	08c6c563          	blt	a3,a2,10003992 <__subdf3+0x170>
1000390c:	46fd                	li	a3,31
1000390e:	02000293          	li	t0,32
10003912:	04c6cd63          	blt	a3,a2,1000396c <__subdf3+0x14a>
10003916:	40c282b3          	sub	t0,t0,a2
1000391a:	00c755b3          	srl	a1,a4,a2
1000391e:	005316b3          	sll	a3,t1,t0
10003922:	005712b3          	sll	t0,a4,t0
10003926:	8ecd                	or	a3,a3,a1
10003928:	005032b3          	snez	t0,t0
1000392c:	0056e733          	or	a4,a3,t0
10003930:	00c35633          	srl	a2,t1,a2
10003934:	953a                	add	a0,a0,a4
10003936:	963e                	add	a2,a2,a5
10003938:	00e53733          	sltu	a4,a0,a4
1000393c:	00e607b3          	add	a5,a2,a4
10003940:	00879713          	slli	a4,a5,0x8
10003944:	16075763          	bgez	a4,10003ab2 <__subdf3+0x290>
10003948:	0485                	addi	s1,s1,1
1000394a:	7ff00713          	li	a4,2047
1000394e:	48e48963          	beq	s1,a4,10003de0 <__subdf3+0x5be>
10003952:	ff800737          	lui	a4,0xff800
10003956:	177d                	addi	a4,a4,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003958:	8ff9                	and	a5,a5,a4
1000395a:	00155713          	srli	a4,a0,0x1
1000395e:	8905                	andi	a0,a0,1
10003960:	8f49                	or	a4,a4,a0
10003962:	01f79513          	slli	a0,a5,0x1f
10003966:	8d59                	or	a0,a0,a4
10003968:	8385                	srli	a5,a5,0x1
1000396a:	a2a1                	j	10003ab2 <__subdf3+0x290>
1000396c:	fe060693          	addi	a3,a2,-32 # 7ffe0 <__FLASH_SIZE+0x3ffe0>
10003970:	00d356b3          	srl	a3,t1,a3
10003974:	4581                	li	a1,0
10003976:	00560763          	beq	a2,t0,10003984 <__subdf3+0x162>
1000397a:	04000593          	li	a1,64
1000397e:	8d91                	sub	a1,a1,a2
10003980:	00b315b3          	sll	a1,t1,a1
10003984:	8dd9                	or	a1,a1,a4
10003986:	00b035b3          	snez	a1,a1
1000398a:	00b6e733          	or	a4,a3,a1
1000398e:	4601                	li	a2,0
10003990:	b755                	j	10003934 <__subdf3+0x112>
10003992:	00e36733          	or	a4,t1,a4
10003996:	00e03733          	snez	a4,a4
1000399a:	bfd5                	j	1000398e <__subdf3+0x16c>
1000399c:	c255                	beqz	a2,10003a40 <__subdf3+0x21e>
1000399e:	409586b3          	sub	a3,a1,s1
100039a2:	ec91                	bnez	s1,100039be <__subdf3+0x19c>
100039a4:	00a7e633          	or	a2,a5,a0
100039a8:	c619                	beqz	a2,100039b6 <__subdf3+0x194>
100039aa:	fff68613          	addi	a2,a3,-1 # 7fffff <__FLASH_SIZE+0x7bffff>
100039ae:	ee0607e3          	beqz	a2,1000389c <__subdf3+0x7a>
100039b2:	00569c63          	bne	a3,t0,100039ca <__subdf3+0x1a8>
100039b6:	879a                	mv	a5,t1
100039b8:	853a                	mv	a0,a4
100039ba:	84b6                	mv	s1,a3
100039bc:	bddd                	j	100038b2 <__subdf3+0x90>
100039be:	42558463          	beq	a1,t0,10003de6 <__subdf3+0x5c4>
100039c2:	00800637          	lui	a2,0x800
100039c6:	8fd1                	or	a5,a5,a2
100039c8:	8636                	mv	a2,a3
100039ca:	03800693          	li	a3,56
100039ce:	06c6c463          	blt	a3,a2,10003a36 <__subdf3+0x214>
100039d2:	46fd                	li	a3,31
100039d4:	02000393          	li	t2,32
100039d8:	02c6ca63          	blt	a3,a2,10003a0c <__subdf3+0x1ea>
100039dc:	40c383b3          	sub	t2,t2,a2
100039e0:	007796b3          	sll	a3,a5,t2
100039e4:	00c552b3          	srl	t0,a0,a2
100039e8:	007513b3          	sll	t2,a0,t2
100039ec:	0056e6b3          	or	a3,a3,t0
100039f0:	007033b3          	snez	t2,t2
100039f4:	0076e6b3          	or	a3,a3,t2
100039f8:	00c7d7b3          	srl	a5,a5,a2
100039fc:	00e68533          	add	a0,a3,a4
10003a00:	979a                	add	a5,a5,t1
10003a02:	00d536b3          	sltu	a3,a0,a3
10003a06:	97b6                	add	a5,a5,a3
10003a08:	84ae                	mv	s1,a1
10003a0a:	bf1d                	j	10003940 <__subdf3+0x11e>
10003a0c:	fe060693          	addi	a3,a2,-32 # 7fffe0 <__FLASH_SIZE+0x7bffe0>
10003a10:	00d7d6b3          	srl	a3,a5,a3
10003a14:	4281                	li	t0,0
10003a16:	00760863          	beq	a2,t2,10003a26 <__subdf3+0x204>
10003a1a:	04000293          	li	t0,64
10003a1e:	40c282b3          	sub	t0,t0,a2
10003a22:	005792b3          	sll	t0,a5,t0
10003a26:	00a2e2b3          	or	t0,t0,a0
10003a2a:	005032b3          	snez	t0,t0
10003a2e:	0056e6b3          	or	a3,a3,t0
10003a32:	4781                	li	a5,0
10003a34:	b7e1                	j	100039fc <__subdf3+0x1da>
10003a36:	00a7e6b3          	or	a3,a5,a0
10003a3a:	00d036b3          	snez	a3,a3
10003a3e:	bfd5                	j	10003a32 <__subdf3+0x210>
10003a40:	00148693          	addi	a3,s1,1
10003a44:	7fe6f613          	andi	a2,a3,2046
10003a48:	e639                	bnez	a2,10003a96 <__subdf3+0x274>
10003a4a:	00a7e6b3          	or	a3,a5,a0
10003a4e:	e885                	bnez	s1,10003a7e <__subdf3+0x25c>
10003a50:	22068963          	beqz	a3,10003c82 <__subdf3+0x460>
10003a54:	00e366b3          	or	a3,t1,a4
10003a58:	36068c63          	beqz	a3,10003dd0 <__subdf3+0x5ae>
10003a5c:	972a                	add	a4,a4,a0
10003a5e:	933e                	add	t1,t1,a5
10003a60:	00a73533          	sltu	a0,a4,a0
10003a64:	932a                	add	t1,t1,a0
10003a66:	00831793          	slli	a5,t1,0x8
10003a6a:	2007dc63          	bgez	a5,10003c82 <__subdf3+0x460>
10003a6e:	ff800637          	lui	a2,0xff800
10003a72:	167d                	addi	a2,a2,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003a74:	00c377b3          	and	a5,t1,a2
10003a78:	853a                	mv	a0,a4
10003a7a:	4485                	li	s1,1
10003a7c:	bd1d                	j	100038b2 <__subdf3+0x90>
10003a7e:	34068c63          	beqz	a3,10003dd6 <__subdf3+0x5b4>
10003a82:	00e36333          	or	t1,t1,a4
10003a86:	8496                	mv	s1,t0
10003a88:	e20305e3          	beqz	t1,100038b2 <__subdf3+0x90>
10003a8c:	4401                	li	s0,0
10003a8e:	004007b7          	lui	a5,0x400
10003a92:	4501                	li	a0,0
10003a94:	bd39                	j	100038b2 <__subdf3+0x90>
10003a96:	34568463          	beq	a3,t0,10003dde <__subdf3+0x5bc>
10003a9a:	972a                	add	a4,a4,a0
10003a9c:	00a73533          	sltu	a0,a4,a0
10003aa0:	933e                	add	t1,t1,a5
10003aa2:	932a                	add	t1,t1,a0
10003aa4:	01f31513          	slli	a0,t1,0x1f
10003aa8:	8305                	srli	a4,a4,0x1
10003aaa:	8d59                	or	a0,a0,a4
10003aac:	00135793          	srli	a5,t1,0x1
10003ab0:	84b6                	mv	s1,a3
10003ab2:	00757713          	andi	a4,a0,7
10003ab6:	cf01                	beqz	a4,10003ace <__subdf3+0x2ac>
10003ab8:	00f57713          	andi	a4,a0,15
10003abc:	4691                	li	a3,4
10003abe:	00d70863          	beq	a4,a3,10003ace <__subdf3+0x2ac>
10003ac2:	00d50733          	add	a4,a0,a3
10003ac6:	00a736b3          	sltu	a3,a4,a0
10003aca:	97b6                	add	a5,a5,a3
10003acc:	853a                	mv	a0,a4
10003ace:	00879713          	slli	a4,a5,0x8
10003ad2:	de0750e3          	bgez	a4,100038b2 <__subdf3+0x90>
10003ad6:	0485                	addi	s1,s1,1
10003ad8:	7ff00713          	li	a4,2047
10003adc:	30e48263          	beq	s1,a4,10003de0 <__subdf3+0x5be>
10003ae0:	ff800737          	lui	a4,0xff800
10003ae4:	177d                	addi	a4,a4,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003ae6:	8ff9                	and	a5,a5,a4
10003ae8:	b3e9                	j	100038b2 <__subdf3+0x90>
10003aea:	0cc05163          	blez	a2,10003bac <__subdf3+0x38a>
10003aee:	e1c1                	bnez	a1,10003b6e <__subdf3+0x34c>
10003af0:	00e366b3          	or	a3,t1,a4
10003af4:	da068fe3          	beqz	a3,100038b2 <__subdf3+0x90>
10003af8:	fff48613          	addi	a2,s1,-1
10003afc:	ee01                	bnez	a2,10003b14 <__subdf3+0x2f2>
10003afe:	40e50733          	sub	a4,a0,a4
10003b02:	00e536b3          	sltu	a3,a0,a4
10003b06:	40678333          	sub	t1,a5,t1
10003b0a:	853a                	mv	a0,a4
10003b0c:	40d307b3          	sub	a5,t1,a3
10003b10:	4485                	li	s1,1
10003b12:	a0a1                	j	10003b5a <__subdf3+0x338>
10003b14:	d8548fe3          	beq	s1,t0,100038b2 <__subdf3+0x90>
10003b18:	03800693          	li	a3,56
10003b1c:	08c6c363          	blt	a3,a2,10003ba2 <__subdf3+0x380>
10003b20:	46fd                	li	a3,31
10003b22:	02000293          	li	t0,32
10003b26:	04c6cb63          	blt	a3,a2,10003b7c <__subdf3+0x35a>
10003b2a:	40c282b3          	sub	t0,t0,a2
10003b2e:	00c755b3          	srl	a1,a4,a2
10003b32:	005316b3          	sll	a3,t1,t0
10003b36:	005712b3          	sll	t0,a4,t0
10003b3a:	8ecd                	or	a3,a3,a1
10003b3c:	005032b3          	snez	t0,t0
10003b40:	0056e733          	or	a4,a3,t0
10003b44:	00c35633          	srl	a2,t1,a2
10003b48:	40e50733          	sub	a4,a0,a4
10003b4c:	00e536b3          	sltu	a3,a0,a4
10003b50:	40c78633          	sub	a2,a5,a2
10003b54:	853a                	mv	a0,a4
10003b56:	40d607b3          	sub	a5,a2,a3
10003b5a:	00879713          	slli	a4,a5,0x8
10003b5e:	f4075ae3          	bgez	a4,10003ab2 <__subdf3+0x290>
10003b62:	008005b7          	lui	a1,0x800
10003b66:	15fd                	addi	a1,a1,-1 # 7fffff <__FLASH_SIZE+0x7bffff>
10003b68:	8dfd                	and	a1,a1,a5
10003b6a:	862a                	mv	a2,a0
10003b6c:	a26d                	j	10003d16 <__subdf3+0x4f4>
10003b6e:	d45482e3          	beq	s1,t0,100038b2 <__subdf3+0x90>
10003b72:	008006b7          	lui	a3,0x800
10003b76:	00d36333          	or	t1,t1,a3
10003b7a:	bf79                	j	10003b18 <__subdf3+0x2f6>
10003b7c:	fe060693          	addi	a3,a2,-32
10003b80:	00d356b3          	srl	a3,t1,a3
10003b84:	4581                	li	a1,0
10003b86:	00560763          	beq	a2,t0,10003b94 <__subdf3+0x372>
10003b8a:	04000593          	li	a1,64
10003b8e:	8d91                	sub	a1,a1,a2
10003b90:	00b315b3          	sll	a1,t1,a1
10003b94:	8dd9                	or	a1,a1,a4
10003b96:	00b035b3          	snez	a1,a1
10003b9a:	00b6e733          	or	a4,a3,a1
10003b9e:	4601                	li	a2,0
10003ba0:	b765                	j	10003b48 <__subdf3+0x326>
10003ba2:	00e36733          	or	a4,t1,a4
10003ba6:	00e03733          	snez	a4,a4
10003baa:	bfd5                	j	10003b9e <__subdf3+0x37c>
10003bac:	ce4d                	beqz	a2,10003c66 <__subdf3+0x444>
10003bae:	409583b3          	sub	t2,a1,s1
10003bb2:	e885                	bnez	s1,10003be2 <__subdf3+0x3c0>
10003bb4:	00a7e633          	or	a2,a5,a0
10003bb8:	c205                	beqz	a2,10003bd8 <__subdf3+0x3b6>
10003bba:	fff38613          	addi	a2,t2,-1 # 7ffff <__FLASH_SIZE+0x3ffff>
10003bbe:	ea19                	bnez	a2,10003bd4 <__subdf3+0x3b2>
10003bc0:	40a70533          	sub	a0,a4,a0
10003bc4:	40f30333          	sub	t1,t1,a5
10003bc8:	00a73633          	sltu	a2,a4,a0
10003bcc:	40c307b3          	sub	a5,t1,a2
10003bd0:	8436                	mv	s0,a3
10003bd2:	bf3d                	j	10003b10 <__subdf3+0x2ee>
10003bd4:	00539d63          	bne	t2,t0,10003bee <__subdf3+0x3cc>
10003bd8:	8436                	mv	s0,a3
10003bda:	879a                	mv	a5,t1
10003bdc:	853a                	mv	a0,a4
10003bde:	849e                	mv	s1,t2
10003be0:	b9c9                	j	100038b2 <__subdf3+0x90>
10003be2:	20558163          	beq	a1,t0,10003de4 <__subdf3+0x5c2>
10003be6:	00800637          	lui	a2,0x800
10003bea:	8fd1                	or	a5,a5,a2
10003bec:	861e                	mv	a2,t2
10003bee:	03800293          	li	t0,56
10003bf2:	06c2c663          	blt	t0,a2,10003c5e <__subdf3+0x43c>
10003bf6:	42fd                	li	t0,31
10003bf8:	02000413          	li	s0,32
10003bfc:	02c2cc63          	blt	t0,a2,10003c34 <__subdf3+0x412>
10003c00:	8c11                	sub	s0,s0,a2
10003c02:	00c553b3          	srl	t2,a0,a2
10003c06:	008792b3          	sll	t0,a5,s0
10003c0a:	00851433          	sll	s0,a0,s0
10003c0e:	0072e2b3          	or	t0,t0,t2
10003c12:	00803433          	snez	s0,s0
10003c16:	0082e533          	or	a0,t0,s0
10003c1a:	00c7d633          	srl	a2,a5,a2
10003c1e:	40a70533          	sub	a0,a4,a0
10003c22:	40c30633          	sub	a2,t1,a2
10003c26:	00a737b3          	sltu	a5,a4,a0
10003c2a:	40f607b3          	sub	a5,a2,a5
10003c2e:	84ae                	mv	s1,a1
10003c30:	8436                	mv	s0,a3
10003c32:	b725                	j	10003b5a <__subdf3+0x338>
10003c34:	fe060293          	addi	t0,a2,-32 # 7fffe0 <__FLASH_SIZE+0x7bffe0>
10003c38:	0057d2b3          	srl	t0,a5,t0
10003c3c:	4381                	li	t2,0
10003c3e:	00860863          	beq	a2,s0,10003c4e <__subdf3+0x42c>
10003c42:	04000393          	li	t2,64
10003c46:	40c383b3          	sub	t2,t2,a2
10003c4a:	007793b3          	sll	t2,a5,t2
10003c4e:	00a3e3b3          	or	t2,t2,a0
10003c52:	007033b3          	snez	t2,t2
10003c56:	0072e533          	or	a0,t0,t2
10003c5a:	4601                	li	a2,0
10003c5c:	b7c9                	j	10003c1e <__subdf3+0x3fc>
10003c5e:	8d5d                	or	a0,a0,a5
10003c60:	00a03533          	snez	a0,a0
10003c64:	bfdd                	j	10003c5a <__subdf3+0x438>
10003c66:	00148613          	addi	a2,s1,1
10003c6a:	7fe67613          	andi	a2,a2,2046
10003c6e:	ee2d                	bnez	a2,10003ce8 <__subdf3+0x4c6>
10003c70:	00e36633          	or	a2,t1,a4
10003c74:	00a7e5b3          	or	a1,a5,a0
10003c78:	e8b9                	bnez	s1,10003cce <__subdf3+0x4ac>
10003c7a:	e999                	bnez	a1,10003c90 <__subdf3+0x46e>
10003c7c:	16060963          	beqz	a2,10003dee <__subdf3+0x5cc>
10003c80:	8436                	mv	s0,a3
10003c82:	00676533          	or	a0,a4,t1
10003c86:	c96d                	beqz	a0,10003d78 <__subdf3+0x556>
10003c88:	879a                	mv	a5,t1
10003c8a:	853a                	mv	a0,a4
10003c8c:	4481                	li	s1,0
10003c8e:	b515                	j	10003ab2 <__subdf3+0x290>
10003c90:	14060063          	beqz	a2,10003dd0 <__subdf3+0x5ae>
10003c94:	40e505b3          	sub	a1,a0,a4
10003c98:	00b532b3          	sltu	t0,a0,a1
10003c9c:	40678633          	sub	a2,a5,t1
10003ca0:	40560633          	sub	a2,a2,t0
10003ca4:	00861293          	slli	t0,a2,0x8
10003ca8:	0002dc63          	bgez	t0,10003cc0 <__subdf3+0x49e>
10003cac:	40a70533          	sub	a0,a4,a0
10003cb0:	00a73633          	sltu	a2,a4,a0
10003cb4:	40f30333          	sub	t1,t1,a5
10003cb8:	872a                	mv	a4,a0
10003cba:	40c30333          	sub	t1,t1,a2
10003cbe:	b7c9                	j	10003c80 <__subdf3+0x45e>
10003cc0:	00c5e533          	or	a0,a1,a2
10003cc4:	12050763          	beqz	a0,10003df2 <__subdf3+0x5d0>
10003cc8:	8332                	mv	t1,a2
10003cca:	872e                	mv	a4,a1
10003ccc:	bf5d                	j	10003c82 <__subdf3+0x460>
10003cce:	e989                	bnez	a1,10003ce0 <__subdf3+0x4be>
10003cd0:	8436                	mv	s0,a3
10003cd2:	10061263          	bnez	a2,10003dd6 <__subdf3+0x5b4>
10003cd6:	4401                	li	s0,0
10003cd8:	004007b7          	lui	a5,0x400
10003cdc:	4501                	li	a0,0
10003cde:	a8f5                	j	10003dda <__subdf3+0x5b8>
10003ce0:	8496                	mv	s1,t0
10003ce2:	bc0608e3          	beqz	a2,100038b2 <__subdf3+0x90>
10003ce6:	b35d                	j	10003a8c <__subdf3+0x26a>
10003ce8:	40e502b3          	sub	t0,a0,a4
10003cec:	005533b3          	sltu	t2,a0,t0
10003cf0:	406785b3          	sub	a1,a5,t1
10003cf4:	407585b3          	sub	a1,a1,t2
10003cf8:	00859393          	slli	t2,a1,0x8
10003cfc:	8616                	mv	a2,t0
10003cfe:	0603d963          	bgez	t2,10003d70 <__subdf3+0x54e>
10003d02:	40a70533          	sub	a0,a4,a0
10003d06:	40f30333          	sub	t1,t1,a5
10003d0a:	00a73733          	sltu	a4,a4,a0
10003d0e:	862a                	mv	a2,a0
10003d10:	40e305b3          	sub	a1,t1,a4
10003d14:	8436                	mv	s0,a3
10003d16:	c5a5                	beqz	a1,10003d7e <__subdf3+0x55c>
10003d18:	852e                	mv	a0,a1
10003d1a:	c232                	sw	a2,4(sp)
10003d1c:	c02e                	sw	a1,0(sp)
10003d1e:	2255                	jal	10003ec2 <__clzsi2>
10003d20:	4582                	lw	a1,0(sp)
10003d22:	4612                	lw	a2,4(sp)
10003d24:	ff850713          	addi	a4,a0,-8
10003d28:	02000313          	li	t1,32
10003d2c:	40e30333          	sub	t1,t1,a4
10003d30:	00e595b3          	sll	a1,a1,a4
10003d34:	00665333          	srl	t1,a2,t1
10003d38:	00b36333          	or	t1,t1,a1
10003d3c:	00e615b3          	sll	a1,a2,a4
10003d40:	08974063          	blt	a4,s1,10003dc0 <__subdf3+0x59e>
10003d44:	8f05                	sub	a4,a4,s1
10003d46:	00170613          	addi	a2,a4,1
10003d4a:	47fd                	li	a5,31
10003d4c:	02000693          	li	a3,32
10003d50:	04c7c763          	blt	a5,a2,10003d9e <__subdf3+0x57c>
10003d54:	8e91                	sub	a3,a3,a2
10003d56:	00d31733          	sll	a4,t1,a3
10003d5a:	00c5d7b3          	srl	a5,a1,a2
10003d5e:	00d596b3          	sll	a3,a1,a3
10003d62:	8f5d                	or	a4,a4,a5
10003d64:	00d036b3          	snez	a3,a3
10003d68:	8f55                	or	a4,a4,a3
10003d6a:	00c35333          	srl	t1,t1,a2
10003d6e:	bf11                	j	10003c82 <__subdf3+0x460>
10003d70:	00b2e533          	or	a0,t0,a1
10003d74:	f14d                	bnez	a0,10003d16 <__subdf3+0x4f4>
10003d76:	4401                	li	s0,0
10003d78:	4781                	li	a5,0
10003d7a:	4481                	li	s1,0
10003d7c:	be1d                	j	100038b2 <__subdf3+0x90>
10003d7e:	8532                	mv	a0,a2
10003d80:	c22e                	sw	a1,4(sp)
10003d82:	c032                	sw	a2,0(sp)
10003d84:	2a3d                	jal	10003ec2 <__clzsi2>
10003d86:	01850713          	addi	a4,a0,24
10003d8a:	47fd                	li	a5,31
10003d8c:	4602                	lw	a2,0(sp)
10003d8e:	4592                	lw	a1,4(sp)
10003d90:	f8e7dce3          	bge	a5,a4,10003d28 <__subdf3+0x506>
10003d94:	ff850313          	addi	t1,a0,-8
10003d98:	00661333          	sll	t1,a2,t1
10003d9c:	b755                	j	10003d40 <__subdf3+0x51e>
10003d9e:	1705                	addi	a4,a4,-31
10003da0:	00e35733          	srl	a4,t1,a4
10003da4:	4781                	li	a5,0
10003da6:	00d60763          	beq	a2,a3,10003db4 <__subdf3+0x592>
10003daa:	04000793          	li	a5,64
10003dae:	8f91                	sub	a5,a5,a2
10003db0:	00f317b3          	sll	a5,t1,a5
10003db4:	8fcd                	or	a5,a5,a1
10003db6:	00f037b3          	snez	a5,a5
10003dba:	8f5d                	or	a4,a4,a5
10003dbc:	4301                	li	t1,0
10003dbe:	b5d1                	j	10003c82 <__subdf3+0x460>
10003dc0:	ff800637          	lui	a2,0xff800
10003dc4:	167d                	addi	a2,a2,-1 # ff7fffff <__StackTop+0xdf7fbfff>
10003dc6:	8c99                	sub	s1,s1,a4
10003dc8:	00c377b3          	and	a5,t1,a2
10003dcc:	852e                	mv	a0,a1
10003dce:	b1d5                	j	10003ab2 <__subdf3+0x290>
10003dd0:	833e                	mv	t1,a5
10003dd2:	872a                	mv	a4,a0
10003dd4:	b57d                	j	10003c82 <__subdf3+0x460>
10003dd6:	879a                	mv	a5,t1
10003dd8:	853a                	mv	a0,a4
10003dda:	8496                	mv	s1,t0
10003ddc:	bcd9                	j	100038b2 <__subdf3+0x90>
10003dde:	84b6                	mv	s1,a3
10003de0:	4781                	li	a5,0
10003de2:	b945                	j	10003a92 <__subdf3+0x270>
10003de4:	8436                	mv	s0,a3
10003de6:	879a                	mv	a5,t1
10003de8:	853a                	mv	a0,a4
10003dea:	84ae                	mv	s1,a1
10003dec:	b4d9                	j	100038b2 <__subdf3+0x90>
10003dee:	4401                	li	s0,0
10003df0:	bfc5                	j	10003de0 <__subdf3+0x5be>
10003df2:	4401                	li	s0,0
10003df4:	4781                	li	a5,0
10003df6:	bc75                	j	100038b2 <__subdf3+0x90>

10003df8 <__fixdfsi>:
10003df8:	0145d713          	srli	a4,a1,0x14
10003dfc:	00100637          	lui	a2,0x100
10003e00:	86aa                	mv	a3,a0
10003e02:	fff60793          	addi	a5,a2,-1 # fffff <__FLASH_SIZE+0xbffff>
10003e06:	7ff77713          	andi	a4,a4,2047
10003e0a:	3fe00513          	li	a0,1022
10003e0e:	8fed                	and	a5,a5,a1
10003e10:	81fd                	srli	a1,a1,0x1f
10003e12:	04e55463          	bge	a0,a4,10003e5a <__fixdfsi+0x62>
10003e16:	41d00513          	li	a0,1053
10003e1a:	00e55763          	bge	a0,a4,10003e28 <__fixdfsi+0x30>
10003e1e:	80000537          	lui	a0,0x80000
10003e22:	157d                	addi	a0,a0,-1 # 7fffffff <__StackTop+0x5fffbfff>
10003e24:	952e                	add	a0,a0,a1
10003e26:	8082                	ret
10003e28:	8fd1                	or	a5,a5,a2
10003e2a:	43300613          	li	a2,1075
10003e2e:	8e19                	sub	a2,a2,a4
10003e30:	457d                	li	a0,31
10003e32:	00c54d63          	blt	a0,a2,10003e4c <__fixdfsi+0x54>
10003e36:	bed70713          	addi	a4,a4,-1043
10003e3a:	00e79533          	sll	a0,a5,a4
10003e3e:	00c6d6b3          	srl	a3,a3,a2
10003e42:	8d55                	or	a0,a0,a3
10003e44:	cd81                	beqz	a1,10003e5c <__fixdfsi+0x64>
10003e46:	40a00533          	neg	a0,a0
10003e4a:	8082                	ret
10003e4c:	41300693          	li	a3,1043
10003e50:	40e68733          	sub	a4,a3,a4
10003e54:	00e7d533          	srl	a0,a5,a4
10003e58:	b7f5                	j	10003e44 <__fixdfsi+0x4c>
10003e5a:	4501                	li	a0,0
10003e5c:	8082                	ret

10003e5e <__floatsidf>:
10003e5e:	1151                	addi	sp,sp,-12
10003e60:	c406                	sw	ra,8(sp)
10003e62:	c222                	sw	s0,4(sp)
10003e64:	c026                	sw	s1,0(sp)
10003e66:	87aa                	mv	a5,a0
10003e68:	c931                	beqz	a0,10003ebc <__floatsidf+0x5e>
10003e6a:	41f55713          	srai	a4,a0,0x1f
10003e6e:	00a744b3          	xor	s1,a4,a0
10003e72:	8c99                	sub	s1,s1,a4
10003e74:	01f55413          	srli	s0,a0,0x1f
10003e78:	8526                	mv	a0,s1
10003e7a:	20a1                	jal	10003ec2 <__clzsi2>
10003e7c:	41e00793          	li	a5,1054
10003e80:	4729                	li	a4,10
10003e82:	8f89                	sub	a5,a5,a0
10003e84:	02a74763          	blt	a4,a0,10003eb2 <__floatsidf+0x54>
10003e88:	472d                	li	a4,11
10003e8a:	8f09                	sub	a4,a4,a0
10003e8c:	0555                	addi	a0,a0,21
10003e8e:	00e4d733          	srl	a4,s1,a4
10003e92:	00a494b3          	sll	s1,s1,a0
10003e96:	0732                	slli	a4,a4,0xc
10003e98:	8331                	srli	a4,a4,0xc
10003e9a:	07d2                	slli	a5,a5,0x14
10003e9c:	047e                	slli	s0,s0,0x1f
10003e9e:	8fd9                	or	a5,a5,a4
10003ea0:	40a2                	lw	ra,8(sp)
10003ea2:	0087e733          	or	a4,a5,s0
10003ea6:	4412                	lw	s0,4(sp)
10003ea8:	8526                	mv	a0,s1
10003eaa:	85ba                	mv	a1,a4
10003eac:	4482                	lw	s1,0(sp)
10003eae:	0131                	addi	sp,sp,12
10003eb0:	8082                	ret
10003eb2:	1555                	addi	a0,a0,-11
10003eb4:	00a49733          	sll	a4,s1,a0
10003eb8:	4481                	li	s1,0
10003eba:	bff1                	j	10003e96 <__floatsidf+0x38>
10003ebc:	4401                	li	s0,0
10003ebe:	4701                	li	a4,0
10003ec0:	bfe5                	j	10003eb8 <__floatsidf+0x5a>

10003ec2 <__clzsi2>:
10003ec2:	67c1                	lui	a5,0x10
10003ec4:	02f57663          	bgeu	a0,a5,10003ef0 <__clzsi2+0x2e>
10003ec8:	10053793          	sltiu	a5,a0,256
10003ecc:	0017b793          	seqz	a5,a5
10003ed0:	078e                	slli	a5,a5,0x3
10003ed2:	02000713          	li	a4,32
10003ed6:	8f1d                	sub	a4,a4,a5
10003ed8:	00f55533          	srl	a0,a0,a5
10003edc:	00000797          	auipc	a5,0x0
10003ee0:	65078793          	addi	a5,a5,1616 # 1000452c <__clz_tab>
10003ee4:	97aa                	add	a5,a5,a0
10003ee6:	0007c503          	lbu	a0,0(a5)
10003eea:	40a70533          	sub	a0,a4,a0
10003eee:	8082                	ret
10003ef0:	01000737          	lui	a4,0x1000
10003ef4:	47e1                	li	a5,24
10003ef6:	fce57ee3          	bgeu	a0,a4,10003ed2 <__clzsi2+0x10>
10003efa:	47c1                	li	a5,16
10003efc:	bfd9                	j	10003ed2 <__clzsi2+0x10>

10003efe <__thead_uread4>:
10003efe:	00154703          	lbu	a4,1(a0)
10003f02:	00054783          	lbu	a5,0(a0)
10003f06:	0722                	slli	a4,a4,0x8
10003f08:	8f5d                	or	a4,a4,a5
10003f0a:	00254783          	lbu	a5,2(a0)
10003f0e:	00354503          	lbu	a0,3(a0)
10003f12:	07c2                	slli	a5,a5,0x10
10003f14:	8fd9                	or	a5,a5,a4
10003f16:	0562                	slli	a0,a0,0x18
10003f18:	8d5d                	or	a0,a0,a5
10003f1a:	8082                	ret

10003f1c <__thead_uwrite4>:
10003f1c:	00855793          	srli	a5,a0,0x8
10003f20:	00a58023          	sb	a0,0(a1)
10003f24:	00f580a3          	sb	a5,1(a1)
10003f28:	01055793          	srli	a5,a0,0x10
10003f2c:	8161                	srli	a0,a0,0x18
10003f2e:	00f58123          	sb	a5,2(a1)
10003f32:	00a581a3          	sb	a0,3(a1)
10003f36:	8082                	ret

10003f38 <__thead_uread8>:
10003f38:	00154703          	lbu	a4,1(a0)
10003f3c:	00054683          	lbu	a3,0(a0)
10003f40:	87aa                	mv	a5,a0
10003f42:	0722                	slli	a4,a4,0x8
10003f44:	8f55                	or	a4,a4,a3
10003f46:	00254683          	lbu	a3,2(a0)
10003f4a:	0057c603          	lbu	a2,5(a5)
10003f4e:	00354503          	lbu	a0,3(a0)
10003f52:	06c2                	slli	a3,a3,0x10
10003f54:	8ed9                	or	a3,a3,a4
10003f56:	0047c703          	lbu	a4,4(a5)
10003f5a:	0622                	slli	a2,a2,0x8
10003f5c:	0077c583          	lbu	a1,7(a5)
10003f60:	8e59                	or	a2,a2,a4
10003f62:	0067c703          	lbu	a4,6(a5)
10003f66:	0562                	slli	a0,a0,0x18
10003f68:	05e2                	slli	a1,a1,0x18
10003f6a:	0742                	slli	a4,a4,0x10
10003f6c:	8f51                	or	a4,a4,a2
10003f6e:	8d55                	or	a0,a0,a3
10003f70:	8dd9                	or	a1,a1,a4
10003f72:	8082                	ret

10003f74 <__thead_uwrite8>:
10003f74:	00855793          	srli	a5,a0,0x8
10003f78:	00f600a3          	sb	a5,1(a2)
10003f7c:	01055793          	srli	a5,a0,0x10
10003f80:	00f60123          	sb	a5,2(a2)
10003f84:	0085d793          	srli	a5,a1,0x8
10003f88:	00a60023          	sb	a0,0(a2)
10003f8c:	00b60223          	sb	a1,4(a2)
10003f90:	8161                	srli	a0,a0,0x18
10003f92:	00f602a3          	sb	a5,5(a2)
10003f96:	0105d793          	srli	a5,a1,0x10
10003f9a:	81e1                	srli	a1,a1,0x18
10003f9c:	00a601a3          	sb	a0,3(a2)
10003fa0:	00f60323          	sb	a5,6(a2)
10003fa4:	00b603a3          	sb	a1,7(a2)
10003fa8:	8082                	ret
10003faa:	0000                	unimp
10003fac:	0020                	addi	s0,sp,8
10003fae:	0000                	unimp
10003fb0:	3130                	.insn	2, 0x3130
10003fb2:	3332                	.insn	2, 0x3332
10003fb4:	3534                	.insn	2, 0x3534
10003fb6:	3736                	.insn	2, 0x3736
10003fb8:	3938                	.insn	2, 0x3938
10003fba:	6261                	lui	tp,0x18
10003fbc:	66656463          	bltu	a0,t1,10004624 <__clz_tab+0xf8>
10003fc0:	0000                	unimp
10003fc2:	0000                	unimp
10003fc4:	3130                	.insn	2, 0x3130
10003fc6:	3332                	.insn	2, 0x3332
10003fc8:	3534                	.insn	2, 0x3534
10003fca:	3736                	.insn	2, 0x3736
10003fcc:	3938                	.insn	2, 0x3938
10003fce:	4241                	li	tp,16
10003fd0:	46454443          	.insn	4, 0x46454443
10003fd4:	0000                	unimp
10003fd6:	0000                	unimp
10003fd8:	5245                	li	tp,-15
10003fda:	4f52                	lw	t5,20(sp)
10003fdc:	0052                	c.slli	zero,0x14
10003fde:	0000                	unimp
10003fe0:	74746167          	.insn	4, 0x74746167
10003fe4:	645f 7461 5f61      	.insn	6, 0x5f617461645f
10003fea:	74697277          	.insn	4, 0x74697277
10003fee:	2065                	jal	10004096 <__thead_uwrite8+0x122>
10003ff0:	000a                	c.slli	zero,0x2
10003ff2:	0000                	unimp
10003ff4:	3025                	jal	1000381c <__divdf3+0x560>
10003ff6:	7832                	.insn	2, 0x7832
10003ff8:	0020                	addi	s0,sp,8
10003ffa:	0000                	unimp
10003ffc:	200a                	.insn	2, 0x200a
10003ffe:	0000                	unimp
10004000:	5f636363          	bltu	t1,s6,100045e6 <__clz_tab+0xba>
10004004:	5f676663          	bltu	a4,s6,100045f0 <__clz_tab+0xc4>
10004008:	6e65                	lui	t3,0x19
1000400a:	6261                	lui	tp,0x18
1000400c:	656c                	.insn	2, 0x656c
1000400e:	3a20                	.insn	2, 0x3a20
10004010:	6425                	lui	s0,0x9
10004012:	0a20                	addi	s0,sp,280
10004014:	0000                	unimp
10004016:	0000                	unimp
10004018:	6e6e6f43          	.insn	4, 0x6e6e6f43
1000401c:	6365                	lui	t1,0x19
1000401e:	6974                	.insn	2, 0x6974
10004020:	66206e6f          	jal	t3,1000a682 <__etext+0x6042>
10004024:	6961                	lui	s2,0x18
10004026:	656c                	.insn	2, 0x656c
10004028:	2064                	.insn	2, 0x2064
1000402a:	6528                	.insn	2, 0x6528
1000402c:	7272                	.insn	2, 0x7272
1000402e:	3020                	.insn	2, 0x3020
10004030:	2578                	.insn	2, 0x2578
10004032:	3230                	.insn	2, 0x3230
10004034:	2978                	.insn	2, 0x2978
10004036:	000a                	c.slli	zero,0x2
10004038:	6e6e6f43          	.insn	4, 0x6e6e6f43
1000403c:	6365                	lui	t1,0x19
1000403e:	6574                	.insn	2, 0x6574
10004040:	2064                	.insn	2, 0x2064
10004042:	63637573          	.insn	4, 0x63637573
10004046:	7365                	lui	t1,0xffff9
10004048:	21646573          	.insn	4, 0x21646573
1000404c:	2820                	.insn	2, 0x2820
1000404e:	6e6e6f63          	bltu	t3,t1,1000474c <__etext+0x10c>
10004052:	3e2d                	jal	10003b8c <__subdf3+0x36a>
10004054:	6168                	.insn	2, 0x6168
10004056:	646e                	.insn	2, 0x646e
10004058:	656c                	.insn	2, 0x656c
1000405a:	3020                	.insn	2, 0x3020
1000405c:	2578                	.insn	2, 0x2578
1000405e:	3230                	.insn	2, 0x3230
10004060:	2978                	.insn	2, 0x2978
10004062:	000a                	c.slli	zero,0x2
10004064:	6c62                	.insn	2, 0x6c62
10004066:	5f65                	li	t5,-7
10004068:	6170                	.insn	2, 0x6170
1000406a:	6172                	.insn	2, 0x6172
1000406c:	5f6d                	li	t5,-5
1000406e:	6572                	.insn	2, 0x6572
10004070:	2171                	jal	100044fc <rssi_thresholds+0x18>
10004072:	2820                	.insn	2, 0x2820
10004074:	6e6e6f63          	bltu	t3,t1,10004772 <__etext+0x132>
10004078:	3e2d                	jal	10003bb2 <__subdf3+0x390>
1000407a:	6168                	.insn	2, 0x6168
1000407c:	646e                	.insn	2, 0x646e
1000407e:	656c                	.insn	2, 0x656c
10004080:	3020                	.insn	2, 0x3020
10004082:	2578                	.insn	2, 0x2578
10004084:	3230                	.insn	2, 0x3230
10004086:	2978                	.insn	2, 0x2978
10004088:	000a                	c.slli	zero,0x2
1000408a:	0000                	unimp
1000408c:	6c62                	.insn	2, 0x6c62
1000408e:	5f65                	li	t5,-7
10004090:	6170                	.insn	2, 0x6170
10004092:	6172                	.insn	2, 0x6172
10004094:	5f6d                	li	t5,-5
10004096:	7075                	c.lui	zero,0xffffd
10004098:	6164                	.insn	2, 0x6164
1000409a:	6574                	.insn	2, 0x6574
1000409c:	2021                	jal	100040a4 <__thead_uwrite8+0x130>
1000409e:	6328                	.insn	2, 0x6328
100040a0:	2d6e6e6f          	jal	t3,100ea376 <__etext+0xe5d36>
100040a4:	683e                	.insn	2, 0x683e
100040a6:	6e61                	lui	t3,0x18
100040a8:	6c64                	.insn	2, 0x6c64
100040aa:	2065                	jal	10004152 <__thead_uwrite8+0x1de>
100040ac:	7830                	.insn	2, 0x7830
100040ae:	3025                	jal	100038d6 <__subdf3+0xb4>
100040b0:	7832                	.insn	2, 0x7832
100040b2:	0a29                	addi	s4,s4,10
100040b4:	0000                	unimp
100040b6:	0000                	unimp
100040b8:	6c62                	.insn	2, 0x6c62
100040ba:	5f65                	li	t5,-7
100040bc:	6870                	.insn	2, 0x6870
100040be:	5f79                	li	t5,-2
100040c0:	7075                	c.lui	zero,0xffffd
100040c2:	6164                	.insn	2, 0x6164
100040c4:	6574                	.insn	2, 0x6574
100040c6:	2021                	jal	100040ce <__thead_uwrite8+0x15a>
100040c8:	5854                	lw	a3,52(s0)
100040ca:	505f 5948 253d      	.insn	6, 0x253d5948505f
100040d0:	2c78                	.insn	2, 0x2c78
100040d2:	5852                	lw	a6,52(sp)
100040d4:	505f 5948 253d      	.insn	6, 0x253d5948505f
100040da:	2078                	.insn	2, 0x2078
100040dc:	000a                	c.slli	zero,0x2
100040de:	0000                	unimp
100040e0:	74746167          	.insn	4, 0x74746167
100040e4:	645f 7461 5f61      	.insn	6, 0x5f617461645f
100040ea:	6572                	.insn	2, 0x6572
100040ec:	6461                	lui	s0,0x18
100040ee:	0a20                	addi	s0,sp,280
100040f0:	0000                	unimp
100040f2:	0000                	unimp
100040f4:	72617473          	.insn	4, 0x72617473
100040f8:	5f74                	lw	a3,124(a4)
100040fa:	6461                	lui	s0,0x18
100040fc:	7264                	.insn	2, 0x7264
100040fe:	3a20                	.insn	2, 0x3a20
10004100:	7825                	lui	a6,0xfffe9
10004102:	2c20                	.insn	2, 0x2c20
10004104:	6425                	lui	s0,0x9
10004106:	000a                	c.slli	zero,0x2
10004108:	6944                	.insn	2, 0x6944
1000410a:	6e6f6373          	.insn	4, 0x6e6f6373
1000410e:	656e                	.insn	2, 0x656e
10004110:	6f697463          	bgeu	s2,s6,100047f8 <__etext+0x1b8>
10004114:	206e                	.insn	2, 0x206e
10004116:	6572                	.insn	2, 0x6572
10004118:	7361                	lui	t1,0xffff8
1000411a:	28206e6f          	jal	t3,1000a39c <__etext+0x5d5c>
1000411e:	7265                	lui	tp,0xffff9
10004120:	2072                	.insn	2, 0x2072
10004122:	7830                	.insn	2, 0x7830
10004124:	3025                	jal	1000394c <__subdf3+0x12a>
10004126:	7832                	.insn	2, 0x7832
10004128:	0a29                	addi	s4,s4,10
1000412a:	0000                	unimp
1000412c:	6c42                	.insn	2, 0x6c42
1000412e:	6575                	lui	a0,0x1d
10004130:	6f74                	.insn	2, 0x6f74
10004132:	2068746f          	jal	s0,1008b338 <__etext+0x86cf8>
10004136:	6e69                	lui	t3,0x1a
10004138:	7469                	lui	s0,0xffffa
1000413a:	6620                	.insn	2, 0x6620
1000413c:	6961                	lui	s2,0x18
1000413e:	656c                	.insn	2, 0x656c
10004140:	2064                	.insn	2, 0x2064
10004142:	6528                	.insn	2, 0x6528
10004144:	7272                	.insn	2, 0x7272
10004146:	2520                	.insn	2, 0x2520
10004148:	2964                	.insn	2, 0x2964
1000414a:	000a                	c.slli	zero,0x2
1000414c:	6c62                	.insn	2, 0x6c62
1000414e:	5f65                	li	t5,-7
10004150:	7375                	lui	t1,0xffffd
10004152:	7265                	lui	tp,0xffff9
10004154:	735f 7265 6976      	.insn	6, 0x69767265735f
1000415a:	695f6563          	bltu	t5,s5,100047e4 <__etext+0x1a4>
1000415e:	696e                	.insn	2, 0x696e
10004160:	2074                	.insn	2, 0x2074
10004162:	000a                	c.slli	zero,0x2
10004164:	6441                	lui	s0,0x10
10004166:	6576                	.insn	2, 0x6576
10004168:	7472                	.insn	2, 0x7472
1000416a:	7369                	lui	t1,0xffffa
1000416c:	6e69                	lui	t3,0x1a
1000416e:	75732067          	.insn	4, 0x75732067
10004172:	73656363          	bltu	a0,s6,10004898 <__etext+0x258>
10004176:	6c756673          	.insn	4, 0x6c756673
1000417a:	796c                	.insn	2, 0x796c
1000417c:	7320                	.insn	2, 0x7320
1000417e:	6174                	.insn	2, 0x6174
10004180:	7472                	.insn	2, 0x7472
10004182:	6465                	lui	s0,0x19
10004184:	0a21                	addi	s4,s4,8
10004186:	0000                	unimp
10004188:	2041544f          	.insn	4, 0x2041544f
1000418c:	20444d43          	.insn	4, 0x20444d43
10004190:	7825                	lui	a6,0xfffe9
10004192:	0a20                	addi	s0,sp,280
10004194:	0020                	addi	s0,sp,8
10004196:	0000                	unimp
10004198:	7825                	lui	a6,0xfffe9
1000419a:	0020                	addi	s0,sp,8
1000419c:	0a20                	addi	s0,sp,280
1000419e:	0020                	addi	s0,sp,8
100041a0:	6d676573          	.insn	4, 0x6d676573
100041a4:	6e65                	lui	t3,0x19
100041a6:	5f74                	lw	a3,124(a4)
100041a8:	6164                	.insn	2, 0x6164
100041aa:	6174                	.insn	2, 0x6174
100041ac:	6d5f 7861 6c5f      	.insn	6, 0x6c5f78616d5f
100041b2:	6e65                	lui	t3,0x19
100041b4:	3a687467          	.insn	4, 0x3a687467
100041b8:	6425                	lui	s0,0x9
100041ba:	0a20                	addi	s0,sp,280
100041bc:	0000                	unimp
100041be:	0000                	unimp
100041c0:	6162                	.insn	2, 0x6162
100041c2:	61206573          	.insn	4, 0x61206573
100041c6:	6464                	.insn	2, 0x6464
100041c8:	3a72                	.insn	2, 0x3a72
100041ca:	7825                	lui	a6,0xfffe9
100041cc:	2020                	.insn	2, 0x2020
100041ce:	657a6973          	.insn	4, 0x657a6973
100041d2:	253a                	.insn	2, 0x253a
100041d4:	0a64                	addi	s1,sp,284
100041d6:	0000                	unimp
100041d8:	72617473          	.insn	4, 0x72617473
100041dc:	2074                	.insn	2, 0x2074
100041de:	6572                	.insn	2, 0x6572
100041e0:	2071                	jal	1000426c <__thead_uwrite8+0x2f8>
100041e2:	74617473          	.insn	4, 0x74617473
100041e6:	7375                	lui	t1,0xffffd
100041e8:	253a                	.insn	2, 0x253a
100041ea:	2064                	.insn	2, 0x2064
100041ec:	000a                	c.slli	zero,0x2
100041ee:	0000                	unimp
100041f0:	5f4b4453          	.insn	4, 0x5f4b4453
100041f4:	4556                	lw	a0,84(sp)
100041f6:	5352                	lw	t1,52(sp)
100041f8:	4f49                	li	t5,18
100041fa:	3a4e                	.insn	2, 0x3a4e
100041fc:	7825                	lui	a6,0xfffe9
100041fe:	0a20                	addi	s0,sp,280
10004200:	0000                	unimp
10004202:	0000                	unimp
10004204:	5f4b4453          	.insn	4, 0x5f4b4453
10004208:	4144                	lw	s1,4(a0)
1000420a:	4554                	lw	a3,12(a0)
1000420c:	253a                	.insn	2, 0x253a
1000420e:	2078                	.insn	2, 0x2078
10004210:	000a                	c.slli	zero,0x2
10004212:	0000                	unimp
10004214:	7061                	c.lui	zero,0xffff8
10004216:	2070                	.insn	2, 0x2070
10004218:	6c62                	.insn	2, 0x6c62
1000421a:	2065                	jal	100042c2 <__thead_uwrite8+0x34e>
1000421c:	6e69                	lui	t3,0x1a
1000421e:	7469                	lui	s0,0xffffa
10004220:	200a                	.insn	2, 0x200a
10004222:	0000                	unimp
10004224:	6c20                	.insn	2, 0x6c20
10004226:	20706f6f          	jal	t5,1000ac2c <__etext+0x65ec>
1000422a:	203d                	jal	10004258 <__thead_uwrite8+0x2e4>
1000422c:	6425                	lui	s0,0x9
1000422e:	0a20                	addi	s0,sp,280
10004230:	0000                	unimp
10004232:	0000                	unimp
10004234:	6e6e6f63          	bltu	t3,t1,10004932 <__etext+0x2f2>
10004238:	7520                	.insn	2, 0x7520
1000423a:	6470                	.insn	2, 0x6470
1000423c:	7461                	lui	s0,0xffff8
1000423e:	2065                	jal	100042e6 <__thead_uwrite8+0x372>
10004240:	6166                	.insn	2, 0x6166
10004242:	6c69                	lui	s8,0x1a
10004244:	6465                	lui	s0,0x19
10004246:	2820                	.insn	2, 0x2820
10004248:	7265                	lui	tp,0xffff9
1000424a:	2072                	.insn	2, 0x2072
1000424c:	6425                	lui	s0,0x9
1000424e:	2e29                	jal	10004568 <__clz_tab+0x3c>
10004250:	000a                	c.slli	zero,0x2
10004252:	0000                	unimp
10004254:	000a                	c.slli	zero,0x2
10004256:	0000                	unimp
10004258:	50494843          	.insn	4, 0x50494843
1000425c:	505f 4d55 0050      	.insn	6, 0x00504d55505f
10004262:	0000                	unimp
10004264:	0258                	addi	a4,sp,260
10004266:	1000                	addi	s0,sp,32
10004268:	026e                	slli	tp,tp,0x1b
1000426a:	1000                	addi	s0,sp,32
1000426c:	035a                	slli	t1,t1,0x16
1000426e:	1000                	addi	s0,sp,32
10004270:	035a                	slli	t1,t1,0x16
10004272:	1000                	addi	s0,sp,32
10004274:	035a                	slli	t1,t1,0x16
10004276:	1000                	addi	s0,sp,32
10004278:	035a                	slli	t1,t1,0x16
1000427a:	1000                	addi	s0,sp,32
1000427c:	035a                	slli	t1,t1,0x16
1000427e:	1000                	addi	s0,sp,32
10004280:	035a                	slli	t1,t1,0x16
10004282:	1000                	addi	s0,sp,32
10004284:	035a                	slli	t1,t1,0x16
10004286:	1000                	addi	s0,sp,32
10004288:	0254                	addi	a3,sp,260
1000428a:	1000                	addi	s0,sp,32
1000428c:	035a                	slli	t1,t1,0x16
1000428e:	1000                	addi	s0,sp,32
10004290:	035a                	slli	t1,t1,0x16
10004292:	1000                	addi	s0,sp,32
10004294:	035a                	slli	t1,t1,0x16
10004296:	1000                	addi	s0,sp,32
10004298:	02ce                	slli	t0,t0,0x13
1000429a:	1000                	addi	s0,sp,32
1000429c:	035a                	slli	t1,t1,0x16
1000429e:	1000                	addi	s0,sp,32
100042a0:	035a                	slli	t1,t1,0x16
100042a2:	1000                	addi	s0,sp,32
100042a4:	0282                	c.slli64	t0
100042a6:	1000                	addi	s0,sp,32
100042a8:	035a                	slli	t1,t1,0x16
100042aa:	1000                	addi	s0,sp,32
100042ac:	02c4                	addi	s1,sp,324
100042ae:	1000                	addi	s0,sp,32
100042b0:	035a                	slli	t1,t1,0x16
100042b2:	1000                	addi	s0,sp,32
100042b4:	035a                	slli	t1,t1,0x16
100042b6:	1000                	addi	s0,sp,32
100042b8:	02ce                	slli	t0,t0,0x13
100042ba:	1000                	addi	s0,sp,32
100042bc:	035a                	slli	t1,t1,0x16
100042be:	1000                	addi	s0,sp,32
100042c0:	026e                	slli	tp,tp,0x1b
100042c2:	1000                	addi	s0,sp,32
100042c4:	0836                	slli	a6,a6,0xd
100042c6:	1000                	addi	s0,sp,32
100042c8:	086e                	slli	a6,a6,0x1b
100042ca:	1000                	addi	s0,sp,32
100042cc:	085e                	slli	a6,a6,0x17
100042ce:	1000                	addi	s0,sp,32
100042d0:	0912                	slli	s2,s2,0x4
100042d2:	1000                	addi	s0,sp,32
100042d4:	093c                	addi	a5,sp,152
100042d6:	1000                	addi	s0,sp,32
100042d8:	085e                	slli	a6,a6,0x17
100042da:	1000                	addi	s0,sp,32
100042dc:	094e                	slli	s2,s2,0x13
100042de:	1000                	addi	s0,sp,32
100042e0:	0100                	addi	s0,sp,128
100042e2:	0302                	c.slli64	t1
100042e4:	0504                	addi	s1,sp,640
100042e6:	0006                	c.slli	zero,0x1

100042e8 <user_ble_service>:
100042e8:	4398 1000 0006 0000                         .C......

100042f0 <user_ble_ota_service>:
100042f0:	4320 1000 0006 0000                          C......

100042f8 <adv_data>:
100042f8:	0101 0000 0ad0 2000 05aa 0000 0ac8 2000     ....... ....... 

10004308 <scan_rsp_data>:
10004308:	0909 0000 4258 1000 0101 0000 0ac4 2000     ....XB......... 
10004318:	0203 0000 0ac0 2000                         ....... 

10004320 <attr_user_ble_ota_service>:
10004320:	0a7c 2000 77ba 0000 0000 0000 0a78 2000     |.. .w......x.. 
10004330:	0000 0001 0a74 2000 78a4 0000 0000 0000     ....t.. .x......
10004340:	0a6c 2000 0000 0001 0a68 2000 0496 1000     l.. ....h.. ....
10004350:	053c 1000 0000 0000 0000 0003 0a64 2000     <...........d.. 
10004360:	78a4 0000 0000 0000 0a5c 2000 0000 0001     .x......\.. ....
10004370:	0a58 2000 0440 1000 07ca 1000 0000 0000     X.. @...........
10004380:	0000 0002 0a54 2000 7a86 0000 74da 0000     ....T.. .z...t..
10004390:	0a40 2000 0000 0003                         @.. ....

10004398 <attr_user_ble_service>:
10004398:	0abc 2000 77ba 0000 0000 0000 0ab8 2000     ... .w......... 
100043a8:	0000 0001 0ab4 2000 78a4 0000 0000 0000     ....... .x......
100043b8:	0aac 2000 0000 0001 0aa8 2000 0000 0000     ... ....... ....
100043c8:	0368 1000 0000 0000 0000 0002 0aa4 2000     h.............. 
100043d8:	78a4 0000 0000 0000 0a9c 2000 0000 0001     .x......... ....
100043e8:	0a98 2000 04b4 1000 0000 0000 0000 0000     ... ............
100043f8:	0000 0001 0a94 2000 7a86 0000 74da 0000     ....... .z...t..
10004408:	0a80 2000 0000 0003                         ... ....

10004410 <addr_list>:
10004410:	00b4 4000 00b8 4000 1094 e080 0200 4001     ...@...@.......@
10004420:	0204 4001 0208 4001 020c 4001 0210 4001     ...@...@...@...@
10004430:	0214 4001 0300 4001 0304 4001 0010 4001     ...@...@...@...@
10004440:	0170 4001 0180 4001 0190 4001 01a0 4001     p..@...@...@...@
10004450:	0140 4001 0000 0000 0000 0000 8000 4056     @..@..........V@
10004460:	0000 0000 4000 4065                         .....@e@

10004468 <drv>:
10004468:	ba22 0000 b9c8 0000 b9b6 0000               "...........

10004474 <time_info>:
10004474:	e214 3c4a 0028 0018 0150 0320 0096 012c     ..J<(...P. ...,.
10004484:	0000 012c 0001 0000                         ..,.....

1000448c <time_info>:
1000448c:	1e77 0000                                   w...

10004490 <rf_pwr_lvl_map_0>:
10004490:	100e 101a 101d 1029 102b 102d 1039 103a     ......).+.-.9.:.
100044a0:	103b 103d 184d 1888 1889 188a 188b 188c     ;.=.M...........
100044b0:	188d 18ca 18cb 18cc 18ce 190c 190d 194c     ..............L.
100044c0:	194d 198d 19cd 1a0d 1a4d 1a8d 1acd 1b4d     M.......M.....M.
100044d0:	1bcd 1ccd 1e4d 1fce 1fce 0000               ....M.......

100044dc <rf_pwr_lvl_map_1>:
100044dc:	0080 0082 008a 0000                         ........

100044e4 <rssi_thresholds>:
100044e4:	0309 0368 03d2 0449 04cf 0566 f320 ffff     ..h...I...f. ...
100044f4:	f272 ffff f25c ffff f272 ffff f312 ffff     r...\...r.......
10004504:	f272 ffff f25c ffff f320 ffff f320 ffff     r...\... ... ...
10004514:	f312 ffff f25c ffff f278 ffff f278 ffff     ....\...x...x...
10004524:	f278 ffff f312 ffff                         x.......

1000452c <__clz_tab>:
1000452c:	0100 0202 0303 0303 0404 0404 0404 0404     ................
1000453c:	0505 0505 0505 0505 0505 0505 0505 0505     ................
1000454c:	0606 0606 0606 0606 0606 0606 0606 0606     ................
1000455c:	0606 0606 0606 0606 0606 0606 0606 0606     ................
1000456c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
1000457c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
1000458c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
1000459c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
100045ac:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100045bc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100045cc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100045dc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100045ec:	0808 0808 0808 0808 0808 0808 0808 0808     ................
100045fc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
1000460c:	0808 0808 0808 0808 0808 0808 0808 0808     ................
1000461c:	0808 0808 0808 0808 0808 0808 0808 0808     ................

Disassembly of section .data:

20000a00 <ble_conn_callbacks>:
20000a00:	03d6 1000 06a0 1000 0406 1000 0420 1000     ............ ...
	...
20000a1c:	042e 1000 0000 0000 0000 0000               ............

20000a28 <ble_mac_addr>:
20000a28:	0100 0302 0504 0000                         ........

20000a30 <__compound_literal.7.lto_priv.0>:
20000a30:	0000 7000                                   ...p

20000a34 <__compound_literal.3.lto_priv.0>:
20000a34:	0000 7001                                   ...p

20000a38 <__compound_literal.7.lto_priv.1>:
20000a38:	0000 ff02                                   ....

20000a3c <__compound_literal.3.lto_priv.1>:
20000a3c:	0000 ff01                                   ....

20000a40 <__compound_literal.11.lto_priv.0>:
20000a40:	2600 2000 0000 0000 0000 0000 0000 0000     .&. ............
20000a50:	0000 0000                                   ....

20000a54 <__compound_literal.10.lto_priv.0>:
20000a54:	0000 2902                                   ...)

20000a58 <__compound_literal.9.lto_priv.0>:
20000a58:	0000 7000                                   ...p

20000a5c <__compound_literal.8.lto_priv.0>:
20000a5c:	0a30 2000 0000 0028                         0.. ..(.

20000a64 <__compound_literal.6.lto_priv.0>:
20000a64:	0000 2803                                   ...(

20000a68 <__compound_literal.5.lto_priv.0>:
20000a68:	0000 7001                                   ...p

20000a6c <__compound_literal.4.lto_priv.0>:
20000a6c:	0a34 2000 0000 0006                         4.. ....

20000a74 <__compound_literal.2.lto_priv.0>:
20000a74:	0000 2803                                   ...(

20000a78 <__compound_literal.1.lto_priv.0>:
20000a78:	0000 2600                                   ...&

20000a7c <__compound_literal.0.lto_priv.0>:
20000a7c:	0000 2800                                   ...(

20000a80 <__compound_literal.11.lto_priv.1>:
20000a80:	2614 2000 0000 0000 03b8 1000 0000 0000     .&. ............
20000a90:	0000 0000                                   ....

20000a94 <__compound_literal.10.lto_priv.1>:
20000a94:	0000 2902                                   ...)

20000a98 <__compound_literal.9.lto_priv.1>:
20000a98:	0000 ff02                                   ....

20000a9c <__compound_literal.8.lto_priv.1>:
20000a9c:	0a38 2000 0000 0012                         8.. ....

20000aa4 <__compound_literal.6.lto_priv.1>:
20000aa4:	0000 2803                                   ...(

20000aa8 <__compound_literal.5.lto_priv.1>:
20000aa8:	0000 ff01                                   ....

20000aac <__compound_literal.4.lto_priv.1>:
20000aac:	0a3c 2000 0000 0004                         <.. ....

20000ab4 <__compound_literal.2.lto_priv.1>:
20000ab4:	0000 2803                                   ...(

20000ab8 <__compound_literal.1.lto_priv.1>:
20000ab8:	0000 ff00                                   ....

20000abc <__compound_literal.0.lto_priv.1>:
20000abc:	0000 2800                                   ...(

20000ac0 <__compound_literal.5.lto_priv.2>:
20000ac0:	ff00 0000                                   ....

20000ac4 <__compound_literal.3.lto_priv.2>:
20000ac4:	0006 0000                                   ....

20000ac8 <__compound_literal.1.lto_priv.2>:
20000ac8:	9f78 4304 0008 0000                         x..C....

20000ad0 <__compound_literal.0.lto_priv.2>:
20000ad0:	0006 0000 0000 0000 0000 0000 0000 0000     ................
	...

20000b00 <__VECTOR_TABLE>:
	...
20000b0c:	0d26 1000 0000 0000 0000 0000 0000 0000     &...............
20000b1c:	0d26 1000 0000 0000 0000 0000 0000 0000     &...............
20000b2c:	0d26 1000 0000 0000 0000 0000 0000 0000     &...............
20000b3c:	0000 0000 09be 1000 0d26 1000 11a8 2000     ........&...... 
20000b4c:	11ea 2000 0d26 1000 0d26 1000 0d26 1000     ... &...&...&...
20000b5c:	0d26 1000 0d26 1000 0d26 1000 0d26 1000     &...&...&...&...
20000b6c:	0d26 1000 0d26 1000 0d26 1000 0d26 1000     &...&...&...&...
20000b7c:	0d26 1000 09c2 1000 0d26 1000 0d26 1000     &.......&...&...
20000b8c:	0d26 1000 0d26 1000 122e 2000 0d26 1000     &...&...... &...
20000b9c:	0d26 1000 09c6 1000 09ca 1000 09ce 1000     &...............
20000bac:	09d2 1000 09d6 1000 09da 1000 09de 1000     ................
20000bbc:	09e2 1000                                   ....

20000bc0 <more_cr_regs>:
20000bc0:	0030 4001 0040 4001 1104 4200 00a0 4001     0..@@..@...B...@
20000bd0:	00a4 4001                                   ...@

20000bd4 <uart_addr_idx_list>:
20000bd4:	3303 0402 0001 3001                         .3.....0

20000bdc <bdaddr>:
20000bdc:	1518 62e8 3473 0000                         ...bs4..

20000be4 <bt_tmr_hdl>:
20000be4:	03e0 2000                                   ... 

20000be8 <ll_sch_mgr_ptr>:
20000be8:	07f8 2000                                   ... 

20000bec <rf_common_desc_mdm_txon_v0_2_0_ext>:
20000bec:	0000 0000 5080 0013 0084 4200 3040 0202     .....P.....B@0..
20000bfc:	2015 4200 3040 0101 1000 4200 2000 0003     . .B@0.....B. ..
20000c0c:	0000 0000 5080 0002 1027 4200 3048 8000     .....P..'..BH0..

20000c1c <rf_common_desc_rf_tx_dac_off_ext>:
20000c1c:	2015 4200 3040 4200 0084 4200 3048 0200     . .B@0.B...BH0..

20000c2c <rf_common_desc_rf_tx_pa_off_ext>:
20000c2c:	2015 4200 3048 0500                         . .BH0..

20000c34 <ble_tx_end>:
20000c34:	0505 1405                                   ....

20000c38 <dynamic_agc_ctrl_status>:
20000c38:	0001 0000                                   ....

20000c3c <freq_cfg_val>:
20000c3c:	aaab 0c82 5555 0c85 0000 0c88 aaab 0c8a     ....UU..........
20000c4c:	5555 0c8d 0000 0c90 aaab 0c92 5555 0c95     UU..........UU..
20000c5c:	0000 0c98 aaab 0c9a 5555 0c9d 0000 0ca0     ........UU......
20000c6c:	aaab 0ca2 5555 0ca5 0000 0ca8 aaab 0caa     ....UU..........
20000c7c:	5555 0cad 0000 0cb0 aaab 0cb2 5555 0cb5     UU..........UU..
20000c8c:	0000 0cb8 aaab 0cba 5555 0cbd 0000 0cc0     ........UU......
20000c9c:	aaab 0cc2 5555 0cc5 0000 0cc8 aaab 0cca     ....UU..........
20000cac:	5555 0ccd 0000 0cd0 aaab 0cd2 5555 0cd5     UU..........UU..
20000cbc:	0000 0cd8 aaab 0cda 5555 0cdd 0000 0ce0     ........UU......
20000ccc:	aaab 0ce2 5555 0ce5 0000 0ce8 aaab 0cea     ....UU..........

20000cdc <g_lp>:
20000cdc:	562b 0016                                   +V..

20000ce0 <rf_common_desc_pll_on_3>:
20000ce0:	0000 0000 5000 000a 2004 4200 3040 0400     .....P... .B@0..
20000cf0:	200c 4200 3040 0100 2018 4200 3040 0100     . .B@0... .B@0..
20000d00:	2018 4200 3040 0101 2018 4200 3040 0200     . .B@0... .B@0..
20000d10:	2018 4200 3040 0202 2018 4200 3040 0200     . .B@0... .B@0..
20000d20:	0008 4200 2080 f700 029c 2000 6008 0000     ...B. ..... .`..

20000d30 <rf_common_desc_rfpll_off>:
20000d30:	2018 4200 3040 0100 2000 4200 3040 0100     . .B@0... .B@0..
20000d40:	200c 4200 2080 0000 2004 4200 3040 0100     . .B. ... .B@0..
20000d50:	2004 4200 3040 0200 2004 4200 3040 fce0     . .B@0... .B@0..
20000d60:	2005 4200 3048 0100                         . .BH0..

20000d68 <rf_common_desc_rfrx_off>:
20000d68:	2008 4200 3040 8080 2009 4200 3040 0702     . .B@0... .B@0..
20000d78:	2010 4200 2080 00ab 0d30 2000 6008 0000     . .B. ..0.. .`..

20000d88 <rf_common_desc_rfrx_on>:
20000d88:	20d2 4200 3040 0f0f 2008 4200 3040 8080     . .B@0... .B@0..
20000d98:	2009 4200 3040 0701 2010 4200 2088 01ff     . .B@0... .B. ..

20000da8 <rf_common_desc_rftx_off>:
20000da8:	0105 4008 3040 1f05 2008 4200 3040 3f00     ...@@0... .B@0.?
20000db8:	2010 4200 2080 00ab 0d30 2000 6008 0000     . .B. ..0.. .`..

20000dc8 <rf_common_desc_rftx_on>:
20000dc8:	2008 4200 3040 3f1e 2009 4200 3040 7878     . .B@0.?. .B@0xx
20000dd8:	2010 4200 2080 0000 20d2 4200 3048 0f03     . .B. ... .BH0..

20000de8 <rf_common_desc_rx_setfreq>:
20000de8:	0000 0000 2020 1024 20dc 4200 3040 c080     ....  $.. .B@0..
20000df8:	20dd 4200 3040 0701 20dc 4200 3040 3c3c     . .B@0... .B@0<<
20000e08:	20e4 4200 3040 1c0c 20de 4200 3040 0404     . .B@0... .B@0..
20000e18:	2009 4200 3040 7820 2009 4200 3040 8000     . .B@0 x. .B@0..
20000e28:	200a 4200 3040 0702 20dd 4200 3040 0800     . .B@0... .B@0..
20000e38:	20e2 4200 3040 8000 20e3 4200 3040 0300     . .B@0... .B@0..
20000e48:	2000 4200 3040 0101 2004 4200 3040 0101     . .B@0... .B@0..
20000e58:	2004 4200 3040 fcfc 2005 4200 3040 0101     . .B@0... .B@0..
20000e68:	201c 4200 3040 1000 200c 4200 2080 00ff     . .B@0... .B. ..
20000e78:	0ce0 2000 6008 0000                         ... .`..

20000e80 <rf_common_desc_tx_setfreq>:
20000e80:	0000 0000 2020 1024 20dc 4200 3040 c0c0     ....  $.. .B@0..
20000e90:	20dd 4200 3040 0702 20dc 4200 3040 3c20     . .B@0... .B@0 <
20000ea0:	20e4 4200 3040 1c14 20de 4200 3040 0400     . .B@0... .B@0..
20000eb0:	2009 4200 3040 7830 2009 4200 3040 8080     . .B@00x. .B@0..
20000ec0:	200a 4200 3040 0702 0105 4008 3040 1f10     . .B@0.....@@0..
20000ed0:	20dd 4200 3040 0808 20e2 4200 3040 8080     . .B@0... .B@0..
20000ee0:	20e3 4200 3040 0303 2000 4200 3040 0101     . .B@0... .B@0..
20000ef0:	2004 4200 2080 03ff 2015 4200 3040 0606     . .B. ... .B@0..
20000f00:	201c 4200 3040 1010 1027 4200 3040 8080     . .B@0..'..B@0..
20000f10:	200c 4200 2080 00f7 0ce0 2000 6008 0000     . .B. ..... .`..

20000f20 <rf_wb_sat_th>:
20000f20:	0070 0000                                   p...

20000f24 <rf_desc_dcoc_calib_rx_off>:
20000f24:	0224 2000 6000 0000 027c 2000 6000 0000     $.. .`..|.. .`..
20000f34:	0d68 2000 6008 0000                         h.. .`..

20000f3c <rf_desc_dcoc_calib_rx_on>:
20000f3c:	0de8 2000 6000 0000 0000 0000 5000 0032     ... .`.......P2.
20000f4c:	0274 2000 6000 0000 0d88 2000 6000 0000     t.. .`..... .`..
20000f5c:	1004 4200 2000 0001 0284 2000 6000 0000     ...B. ..... .`..
20000f6c:	022c 2000 6008 0000                         ,.. .`..

20000f74 <cr_regs_addr_list>:
20000f74:	0104 4000 0000 e080 104c e080 1048 e080     ...@....L...H...
20000f84:	0008 4200 001c 4200 0024 4200 0060 4200     ...B...B$..B`..B
20000f94:	0100 4200 0114 4200 1030 4200 1100 4200     ...B...B0..B...B
20000fa4:	114c 4200 2008 4200 20a8 4200 208c 4200     L..B. .B. .B. .B
20000fb4:	0020 4000 0024 4000 0028 4000 002c 4000      ..@$..@(..@,..@

20000fc4 <gpio_vdd_pin1>:
20000fc4:	                                             .

20000fc5 <gpio_vdd_pin2>:
20000fc5:	00ff                                         ...

20000fc8 <flash_read_status>:
20000fc8:	1f0007b7          	lui	a5,0x1f000
20000fcc:	4705                	li	a4,1
20000fce:	c398                	sw	a4,0(a5)
20000fd0:	4695                	li	a3,5
20000fd2:	c3d4                	sw	a3,4(a5)
20000fd4:	c7d8                	sw	a4,12(a5)
20000fd6:	cfd8                	sw	a4,28(a5)
20000fd8:	4fc8                	lw	a0,28(a5)
20000fda:	8082                	ret

20000fdc <flash_sector_erase>:
20000fdc:	1171                	addi	sp,sp,-4
20000fde:	c006                	sw	ra,0(sp)
20000fe0:	300477f3          	csrrci	a5,mstatus,8
20000fe4:	1f0007b7          	lui	a5,0x1f000
20000fe8:	0007a023          	sw	zero,0(a5) # 1f000000 <__etext+0xeffb9c0>
20000fec:	4719                	li	a4,6
20000fee:	c3d8                	sw	a4,4(a5)
20000ff0:	4705                	li	a4,1
20000ff2:	cfd8                	sw	a4,28(a5)
20000ff4:	468d                	li	a3,3
20000ff6:	c394                	sw	a3,0(a5)
20000ff8:	02000693          	li	a3,32
20000ffc:	c3d4                	sw	a3,4(a5)
20000ffe:	c788                	sw	a0,8(a5)
20001000:	cfd8                	sw	a4,28(a5)
20001002:	37d9                	jal	20000fc8 <flash_read_status>
20001004:	8905                	andi	a0,a0,1
20001006:	fd75                	bnez	a0,20001002 <flash_sector_erase+0x26>
20001008:	300467f3          	csrrsi	a5,mstatus,8
2000100c:	4082                	lw	ra,0(sp)
2000100e:	0111                	addi	sp,sp,4
20001010:	8082                	ret

20001012 <flash_page_program>:
20001012:	1171                	addi	sp,sp,-4
20001014:	c006                	sw	ra,0(sp)
20001016:	300477f3          	csrrci	a5,mstatus,8
2000101a:	1f000737          	lui	a4,0x1f000
2000101e:	00072023          	sw	zero,0(a4) # 1f000000 <__etext+0xeffb9c0>
20001022:	4799                	li	a5,6
20001024:	c35c                	sw	a5,4(a4)
20001026:	4785                	li	a5,1
20001028:	cf5c                	sw	a5,28(a4)
2000102a:	4795                	li	a5,5
2000102c:	c31c                	sw	a5,0(a4)
2000102e:	4789                	li	a5,2
20001030:	c35c                	sw	a5,4(a4)
20001032:	ffc60793          	addi	a5,a2,-4
20001036:	00f037b3          	snez	a5,a5
2000103a:	40f007b3          	neg	a5,a5
2000103e:	c708                	sw	a0,8(a4)
20001040:	8b9d                	andi	a5,a5,7
20001042:	c750                	sw	a2,12(a4)
20001044:	0785                	addi	a5,a5,1
20001046:	4681                	li	a3,0
20001048:	01070613          	addi	a2,a4,16
2000104c:	00269513          	slli	a0,a3,0x2
20001050:	952e                	add	a0,a0,a1
20001052:	4108                	lw	a0,0(a0)
20001054:	0685                	addi	a3,a3,1 # 800001 <__FLASH_SIZE+0x7c0001>
20001056:	c208                	sw	a0,0(a2)
20001058:	fed79ae3          	bne	a5,a3,2000104c <flash_page_program+0x3a>
2000105c:	4785                	li	a5,1
2000105e:	cf5c                	sw	a5,28(a4)
20001060:	37a5                	jal	20000fc8 <flash_read_status>
20001062:	8905                	andi	a0,a0,1
20001064:	fd75                	bnez	a0,20001060 <flash_page_program+0x4e>
20001066:	300467f3          	csrrsi	a5,mstatus,8
2000106a:	4082                	lw	ra,0(sp)
2000106c:	0111                	addi	sp,sp,4
2000106e:	8082                	ret

20001070 <flash_page_read.constprop.0>:
20001070:	1f0007b7          	lui	a5,0x1f000
20001074:	4719                	li	a4,6
20001076:	c398                	sw	a4,0(a5)
20001078:	03b00713          	li	a4,59
2000107c:	c3d8                	sw	a4,4(a5)
2000107e:	c788                	sw	a0,8(a5)
20001080:	4711                	li	a4,4
20001082:	c7d8                	sw	a4,12(a5)
20001084:	4705                	li	a4,1
20001086:	cfd8                	sw	a4,28(a5)
20001088:	4b98                	lw	a4,16(a5)
2000108a:	200027b7          	lui	a5,0x20002
2000108e:	52e7a423          	sw	a4,1320(a5) # 20002528 <__data_end__>
20001092:	8082                	ret

20001094 <flash_write_less_one_word>:
20001094:	1131                	addi	sp,sp,-20
20001096:	c622                	sw	s0,12(sp)
20001098:	c426                	sw	s1,8(sp)
2000109a:	842e                	mv	s0,a1
2000109c:	c232                	sw	a2,4(sp)
2000109e:	c806                	sw	ra,16(sp)
200010a0:	c02a                	sw	a0,0(sp)
200010a2:	84b6                	mv	s1,a3
200010a4:	37f1                	jal	20001070 <flash_page_read.constprop.0>
200010a6:	4612                	lw	a2,4(sp)
200010a8:	20002737          	lui	a4,0x20002
200010ac:	4781                	li	a5,0
200010ae:	52870593          	addi	a1,a4,1320 # 20002528 <__data_end__>
200010b2:	0097c963          	blt	a5,s1,200010c4 <flash_write_less_one_word+0x30>
200010b6:	4432                	lw	s0,12(sp)
200010b8:	4502                	lw	a0,0(sp)
200010ba:	40c2                	lw	ra,16(sp)
200010bc:	44a2                	lw	s1,8(sp)
200010be:	4611                	li	a2,4
200010c0:	0151                	addi	sp,sp,20
200010c2:	bf81                	j	20001012 <flash_page_program>
200010c4:	00f60733          	add	a4,a2,a5
200010c8:	00074683          	lbu	a3,0(a4)
200010cc:	00f40733          	add	a4,s0,a5
200010d0:	972e                	add	a4,a4,a1
200010d2:	00d70023          	sb	a3,0(a4)
200010d6:	0785                	addi	a5,a5,1
200010d8:	bfe9                	j	200010b2 <flash_write_less_one_word+0x1e>

200010da <flashProgram.isra.0>:
200010da:	1101                	addi	sp,sp,-32
200010dc:	cc22                	sw	s0,24(sp)
200010de:	ca26                	sw	s1,20(sp)
200010e0:	872e                	mv	a4,a1
200010e2:	842e                	mv	s0,a1
200010e4:	ce06                	sw	ra,28(sp)
200010e6:	00357593          	andi	a1,a0,3
200010ea:	84b2                	mv	s1,a2
200010ec:	832a                	mv	t1,a0
200010ee:	c19d                	beqz	a1,20001114 <flashProgram.isra.0+0x3a>
200010f0:	4791                	li	a5,4
200010f2:	40b78433          	sub	s0,a5,a1
200010f6:	00865363          	bge	a2,s0,200010fc <flashProgram.isra.0+0x22>
200010fa:	8432                	mv	s0,a2
200010fc:	9971                	andi	a0,a0,-4
200010fe:	86a2                	mv	a3,s0
20001100:	863a                	mv	a2,a4
20001102:	c23a                	sw	a4,4(sp)
20001104:	c02a                	sw	a0,0(sp)
20001106:	3779                	jal	20001094 <flash_write_less_one_word>
20001108:	4502                	lw	a0,0(sp)
2000110a:	4712                	lw	a4,4(sp)
2000110c:	8c81                	sub	s1,s1,s0
2000110e:	00450313          	addi	t1,a0,4 # 1d004 <memset+0x10638>
20001112:	943a                	add	s0,s0,a4
20001114:	c002                	sw	zero,0(sp)
20001116:	4615                	li	a2,5
20001118:	468d                	li	a3,3
2000111a:	0296d663          	bge	a3,s1,20001146 <flashProgram.isra.0+0x6c>
2000111e:	40c4d7b3          	sra	a5,s1,a2
20001122:	4685                	li	a3,1
20001124:	c23e                	sw	a5,4(sp)
20001126:	00c69633          	sll	a2,a3,a2
2000112a:	4281                	li	t0,0
2000112c:	4792                	lw	a5,4(sp)
2000112e:	02579763          	bne	a5,t0,2000115c <flashProgram.isra.0+0x82>
20001132:	4782                	lw	a5,0(sp)
20001134:	167d                	addi	a2,a2,-1
20001136:	8cf1                	and	s1,s1,a2
20001138:	00178693          	addi	a3,a5,1
2000113c:	4785                	li	a5,1
2000113e:	4609                	li	a2,2
20001140:	c03e                	sw	a5,0(sp)
20001142:	fcc69be3          	bne	a3,a2,20001118 <flashProgram.isra.0+0x3e>
20001146:	04905b63          	blez	s1,2000119c <flashProgram.isra.0+0xc2>
2000114a:	8622                	mv	a2,s0
2000114c:	4462                	lw	s0,24(sp)
2000114e:	40f2                	lw	ra,28(sp)
20001150:	86a6                	mv	a3,s1
20001152:	44d2                	lw	s1,20(sp)
20001154:	4581                	li	a1,0
20001156:	851a                	mv	a0,t1
20001158:	6105                	addi	sp,sp,32
2000115a:	bf2d                	j	20001094 <flash_write_less_one_word>
2000115c:	00347693          	andi	a3,s0,3
20001160:	85a2                	mv	a1,s0
20001162:	c28d                	beqz	a3,20001184 <flashProgram.isra.0+0xaa>
20001164:	200026b7          	lui	a3,0x20002
20001168:	52868693          	addi	a3,a3,1320 # 20002528 <__data_end__>
2000116c:	8536                	mv	a0,a3
2000116e:	c816                	sw	t0,16(sp)
20001170:	c61a                	sw	t1,12(sp)
20001172:	c432                	sw	a2,8(sp)
20001174:	e000c097          	auipc	ra,0xe000c
20001178:	840080e7          	jalr	-1984(ra) # c9b4 <memcpy>
2000117c:	42c2                	lw	t0,16(sp)
2000117e:	4332                	lw	t1,12(sp)
20001180:	4622                	lw	a2,8(sp)
20001182:	85aa                	mv	a1,a0
20001184:	851a                	mv	a0,t1
20001186:	c816                	sw	t0,16(sp)
20001188:	c632                	sw	a2,12(sp)
2000118a:	c41a                	sw	t1,8(sp)
2000118c:	3559                	jal	20001012 <flash_page_program>
2000118e:	4632                	lw	a2,12(sp)
20001190:	4322                	lw	t1,8(sp)
20001192:	42c2                	lw	t0,16(sp)
20001194:	9432                	add	s0,s0,a2
20001196:	9332                	add	t1,t1,a2
20001198:	0285                	addi	t0,t0,1
2000119a:	bf49                	j	2000112c <flashProgram.isra.0+0x52>
2000119c:	40f2                	lw	ra,28(sp)
2000119e:	4462                	lw	s0,24(sp)
200011a0:	44d2                	lw	s1,20(sp)
200011a2:	6105                	addi	sp,sp,32
200011a4:	8082                	ret

200011a6 <flash_write>:
200011a6:	bf15                	j	200010da <flashProgram.isra.0>

200011a8 <RADIO_DMA_Handler>:
200011a8:	fd810113          	addi	sp,sp,-40
200011ac:	d206                	sw	ra,36(sp)
200011ae:	d016                	sw	t0,32(sp)
200011b0:	ce1a                	sw	t1,28(sp)
200011b2:	cc1e                	sw	t2,24(sp)
200011b4:	ca2a                	sw	a0,20(sp)
200011b6:	c82e                	sw	a1,16(sp)
200011b8:	c632                	sw	a2,12(sp)
200011ba:	c436                	sw	a3,8(sp)
200011bc:	c23a                	sw	a4,4(sp)
200011be:	c03e                	sw	a5,0(sp)
200011c0:	43b000ef          	jal	20001dfa <Check_PwrOn_OnBbDmaIrq_Before>
200011c4:	2eb9                	jal	20001522 <RF_BT_IRQHandler_RAM>
200011c6:	46d000ef          	jal	20001e32 <Check_PwrOn_OnBbDmaIrq>
200011ca:	2e19                	jal	200014e0 <ll_conn_process_wake_up_pre_chk>
200011cc:	2a35                	jal	20001308 <rf_cali_period_temp>
200011ce:	5092                	lw	ra,36(sp)
200011d0:	5282                	lw	t0,32(sp)
200011d2:	4372                	lw	t1,28(sp)
200011d4:	43e2                	lw	t2,24(sp)
200011d6:	4552                	lw	a0,20(sp)
200011d8:	45c2                	lw	a1,16(sp)
200011da:	4632                	lw	a2,12(sp)
200011dc:	46a2                	lw	a3,8(sp)
200011de:	4712                	lw	a4,4(sp)
200011e0:	4782                	lw	a5,0(sp)
200011e2:	02810113          	addi	sp,sp,40
200011e6:	30200073          	mret

200011ea <RADIO_TICK_Handler>:
200011ea:	fd810113          	addi	sp,sp,-40
200011ee:	d206                	sw	ra,36(sp)
200011f0:	d016                	sw	t0,32(sp)
200011f2:	ce1a                	sw	t1,28(sp)
200011f4:	cc1e                	sw	t2,24(sp)
200011f6:	ca2a                	sw	a0,20(sp)
200011f8:	c82e                	sw	a1,16(sp)
200011fa:	c632                	sw	a2,12(sp)
200011fc:	c436                	sw	a3,8(sp)
200011fe:	c23a                	sw	a4,4(sp)
20001200:	c03e                	sw	a5,0(sp)
20001202:	e000b097          	auipc	ra,0xe000b
20001206:	a02080e7          	jalr	-1534(ra) # bc04 <BT_TIMER_IRQHandler>
2000120a:	429000ef          	jal	20001e32 <Check_PwrOn_OnBbDmaIrq>
2000120e:	2cc9                	jal	200014e0 <ll_conn_process_wake_up_pre_chk>
20001210:	28e5                	jal	20001308 <rf_cali_period_temp>
20001212:	5092                	lw	ra,36(sp)
20001214:	5282                	lw	t0,32(sp)
20001216:	4372                	lw	t1,28(sp)
20001218:	43e2                	lw	t2,24(sp)
2000121a:	4552                	lw	a0,20(sp)
2000121c:	45c2                	lw	a1,16(sp)
2000121e:	4632                	lw	a2,12(sp)
20001220:	46a2                	lw	a3,8(sp)
20001222:	4712                	lw	a4,4(sp)
20001224:	4782                	lw	a5,0(sp)
20001226:	02810113          	addi	sp,sp,40
2000122a:	30200073          	mret

2000122e <RTC_Handler>:
2000122e:	fd810113          	addi	sp,sp,-40
20001232:	d206                	sw	ra,36(sp)
20001234:	d016                	sw	t0,32(sp)
20001236:	ce1a                	sw	t1,28(sp)
20001238:	cc1e                	sw	t2,24(sp)
2000123a:	ca2a                	sw	a0,20(sp)
2000123c:	c82e                	sw	a1,16(sp)
2000123e:	c632                	sw	a2,12(sp)
20001240:	c436                	sw	a3,8(sp)
20001242:	c23a                	sw	a4,4(sp)
20001244:	c03e                	sw	a5,0(sp)
20001246:	f0000097          	auipc	ra,0xf0000
2000124a:	282080e7          	jalr	642(ra) # 100014c8 <VTIMER_IRQHandler>
2000124e:	5092                	lw	ra,36(sp)
20001250:	5282                	lw	t0,32(sp)
20001252:	4372                	lw	t1,28(sp)
20001254:	43e2                	lw	t2,24(sp)
20001256:	4552                	lw	a0,20(sp)
20001258:	45c2                	lw	a1,16(sp)
2000125a:	4632                	lw	a2,12(sp)
2000125c:	46a2                	lw	a3,8(sp)
2000125e:	4712                	lw	a4,4(sp)
20001260:	4782                	lw	a5,0(sp)
20001262:	02810113          	addi	sp,sp,40
20001266:	30200073          	mret

2000126a <poweron_unused_gpio_mask_parse_and_set>:
2000126a:	1171                	addi	sp,sp,-4
2000126c:	c022                	sw	s0,0(sp)
2000126e:	40010337          	lui	t1,0x40010
20001272:	03032703          	lw	a4,48(t1) # 40010030 <__StackTop+0x2000c030>
20001276:	fff54793          	not	a5,a0
2000127a:	8ff9                	and	a5,a5,a4
2000127c:	02f32823          	sw	a5,48(t1)
20001280:	20030313          	addi	t1,t1,512
20001284:	4291                	li	t0,4
20001286:	40010437          	lui	s0,0x40010
2000128a:	21840413          	addi	s0,s0,536 # 40010218 <__StackTop+0x2000c218>
2000128e:	a025                	j	200012b6 <poweron_unused_gpio_mask_parse_and_set+0x4c>
20001290:	8105                	srli	a0,a0,0x1
20001292:	0722                	slli	a4,a4,0x8
20001294:	06a2                	slli	a3,a3,0x8
20001296:	0785                	addi	a5,a5,1
20001298:	00578a63          	beq	a5,t0,200012ac <poweron_unused_gpio_mask_parse_and_set+0x42>
2000129c:	00157593          	andi	a1,a0,1
200012a0:	d9e5                	beqz	a1,20001290 <poweron_unused_gpio_mask_parse_and_set+0x26>
200012a2:	fff74593          	not	a1,a4
200012a6:	8e6d                	and	a2,a2,a1
200012a8:	8e55                	or	a2,a2,a3
200012aa:	b7dd                	j	20001290 <poweron_unused_gpio_mask_parse_and_set+0x26>
200012ac:	00c3a023          	sw	a2,0(t2)
200012b0:	0311                	addi	t1,t1,4
200012b2:	00830b63          	beq	t1,s0,200012c8 <poweron_unused_gpio_mask_parse_and_set+0x5e>
200012b6:	839a                	mv	t2,t1
200012b8:	00032603          	lw	a2,0(t1)
200012bc:	0a000693          	li	a3,160
200012c0:	0ff00713          	li	a4,255
200012c4:	4781                	li	a5,0
200012c6:	bfd9                	j	2000129c <poweron_unused_gpio_mask_parse_and_set+0x32>
200012c8:	4402                	lw	s0,0(sp)
200012ca:	0111                	addi	sp,sp,4
200012cc:	8082                	ret
200012ce:	1171                	addi	sp,sp,-4
200012d0:	420007b7          	lui	a5,0x42000
200012d4:	1047a783          	lw	a5,260(a5) # 42000104 <__StackTop+0x21ffc104>
200012d8:	c03e                	sw	a5,0(sp)
200012da:	420006b7          	lui	a3,0x42000
200012de:	1046a783          	lw	a5,260(a3) # 42000104 <__StackTop+0x21ffc104>
200012e2:	4702                	lw	a4,0(sp)
200012e4:	8f99                	sub	a5,a5,a4
200012e6:	fea7ece3          	bltu	a5,a0,200012de <poweron_unused_gpio_mask_parse_and_set+0x74>
200012ea:	0111                	addi	sp,sp,4
200012ec:	8082                	ret

200012ee <delay_ms>:
200012ee:	1171                	addi	sp,sp,-4
200012f0:	c006                	sw	ra,0(sp)
200012f2:	3e800793          	li	a5,1000
200012f6:	02f50533          	mul	a0,a0,a5
200012fa:	e000b097          	auipc	ra,0xe000b
200012fe:	5dc080e7          	jalr	1500(ra) # c8d6 <delay_us>
20001302:	4082                	lw	ra,0(sp)
20001304:	0111                	addi	sp,sp,4
20001306:	8082                	ret

20001308 <rf_cali_period_temp>:
20001308:	1151                	addi	sp,sp,-12
2000130a:	c406                	sw	ra,8(sp)
2000130c:	2afd                	jal	2000150a <omw_cali_period_temp>
2000130e:	40a2                	lw	ra,8(sp)
20001310:	0131                	addi	sp,sp,12
20001312:	8082                	ret

20001314 <VTIMER_ClkCali_Trigger>:
20001314:	40000737          	lui	a4,0x40000
20001318:	10800793          	li	a5,264
2000131c:	06f71a23          	sh	a5,116(a4) # 40000074 <__StackTop+0x1fffc074>
20001320:	4785                	li	a5,1
20001322:	00a797b3          	sll	a5,a5,a0
20001326:	df3c                	sw	a5,120(a4)
20001328:	156d                	addi	a0,a0,-5
2000132a:	0ff57513          	zext.b	a0,a0
2000132e:	200027b7          	lui	a5,0x20002
20001332:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
20001336:	00a782a3          	sb	a0,5(a5)
2000133a:	8082                	ret

2000133c <VTIMER_ClkCali_Wait>:
2000133c:	40000737          	lui	a4,0x40000
20001340:	07074783          	lbu	a5,112(a4) # 40000070 <__StackTop+0x1fffc070>
20001344:	8bc1                	andi	a5,a5,16
20001346:	dfed                	beqz	a5,20001340 <VTIMER_ClkCali_Wait+0x4>
20001348:	200027b7          	lui	a5,0x20002
2000134c:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
20001350:	00a7c703          	lbu	a4,10(a5)
20001354:	0ff77713          	zext.b	a4,a4
20001358:	00171693          	slli	a3,a4,0x1
2000135c:	96be                	add	a3,a3,a5
2000135e:	00c6d603          	lhu	a2,12(a3)
20001362:	01061593          	slli	a1,a2,0x10
20001366:	81c1                	srli	a1,a1,0x10
20001368:	4fd0                	lw	a2,28(a5)
2000136a:	8e0d                	sub	a2,a2,a1
2000136c:	cfd0                	sw	a2,28(a5)
2000136e:	40000637          	lui	a2,0x40000
20001372:	5e70                	lw	a2,124(a2)
20001374:	0057c583          	lbu	a1,5(a5)
20001378:	00b65633          	srl	a2,a2,a1
2000137c:	0642                	slli	a2,a2,0x10
2000137e:	8241                	srli	a2,a2,0x10
20001380:	00c69623          	sh	a2,12(a3)
20001384:	00c6d683          	lhu	a3,12(a3)
20001388:	06c2                	slli	a3,a3,0x10
2000138a:	82c1                	srli	a3,a3,0x10
2000138c:	4fd0                	lw	a2,28(a5)
2000138e:	96b2                	add	a3,a3,a2
20001390:	cfd4                	sw	a3,28(a5)
20001392:	0705                	addi	a4,a4,1
20001394:	8b1d                	andi	a4,a4,7
20001396:	00e78523          	sb	a4,10(a5)
2000139a:	01a7d783          	lhu	a5,26(a5)
2000139e:	07c2                	slli	a5,a5,0x10
200013a0:	83c1                	srli	a5,a5,0x10
200013a2:	cb99                	beqz	a5,200013b8 <VTIMER_ClkCali_Wait+0x7c>
200013a4:	20002737          	lui	a4,0x20002
200013a8:	67070713          	addi	a4,a4,1648 # 20002670 <VTIMER_Context>
200013ac:	4f5c                	lw	a5,28(a4)
200013ae:	838d                	srli	a5,a5,0x3
200013b0:	07c2                	slli	a5,a5,0x10
200013b2:	83c1                	srli	a5,a5,0x10
200013b4:	00f71423          	sh	a5,8(a4)
200013b8:	8082                	ret

200013ba <qspi_regs_restore>:
200013ba:	400107b7          	lui	a5,0x40010
200013be:	4705                	li	a4,1
200013c0:	20e78623          	sb	a4,524(a5) # 4001020c <__StackTop+0x2000c20c>
200013c4:	20e786a3          	sb	a4,525(a5)
200013c8:	20e78823          	sb	a4,528(a5)
200013cc:	20e788a3          	sb	a4,529(a5)
200013d0:	20078523          	sb	zero,522(a5)
200013d4:	00325737          	lui	a4,0x325
200013d8:	41070713          	addi	a4,a4,1040 # 325410 <__FLASH_SIZE+0x2e5410>
200013dc:	30e7a023          	sw	a4,768(a5)
200013e0:	8082                	ret

200013e2 <gpio_regs_restore_before_rel_gpio_hold>:
200013e2:	8082                	ret

200013e4 <restore_more_regs_when_not_wakeup_fully>:
200013e4:	200017b7          	lui	a5,0x20001
200013e8:	bc078793          	addi	a5,a5,-1088 # 20000bc0 <more_cr_regs>
200013ec:	20002737          	lui	a4,0x20002
200013f0:	6b472703          	lw	a4,1716(a4) # 200026b4 <g_save_buf>
200013f4:	04470713          	addi	a4,a4,68
200013f8:	01478593          	addi	a1,a5,20
200013fc:	4310                	lw	a2,0(a4)
200013fe:	4394                	lw	a3,0(a5)
20001400:	c290                	sw	a2,0(a3)
20001402:	0791                	addi	a5,a5,4
20001404:	0711                	addi	a4,a4,4
20001406:	feb79be3          	bne	a5,a1,200013fc <restore_more_regs_when_not_wakeup_fully+0x18>
2000140a:	8082                	ret

2000140c <Bt_SleepMode_Check>:
2000140c:	1151                	addi	sp,sp,-12
2000140e:	c406                	sw	ra,8(sp)
20001410:	078010ef          	jal	20002488 <hci_core_sleep_check>
20001414:	87aa                	mv	a5,a0
20001416:	4501                	li	a0,0
20001418:	e781                	bnez	a5,20001420 <Bt_SleepMode_Check+0x14>
2000141a:	40a2                	lw	ra,8(sp)
2000141c:	0131                	addi	sp,sp,12
2000141e:	8082                	ret
20001420:	0cc010ef          	jal	200024ec <Bt_Controller_SleepMode_Check>
20001424:	bfdd                	j	2000141a <Bt_SleepMode_Check+0xe>

20001426 <flash_power_off>:
20001426:	40010737          	lui	a4,0x40010
2000142a:	4334                	lw	a3,64(a4)
2000142c:	4785                	li	a5,1
2000142e:	00a797b3          	sll	a5,a5,a0
20001432:	fff7c793          	not	a5,a5
20001436:	8ff5                	and	a5,a5,a3
20001438:	c33c                	sw	a5,64(a4)
2000143a:	8082                	ret

2000143c <otp_powup>:
2000143c:	1151                	addi	sp,sp,-12
2000143e:	c406                	sw	ra,8(sp)
20001440:	c222                	sw	s0,4(sp)
20001442:	42002737          	lui	a4,0x42002
20001446:	471c                	lw	a5,8(a4)
20001448:	fc07f793          	andi	a5,a5,-64
2000144c:	01e7e793          	ori	a5,a5,30
20001450:	c71c                	sw	a5,8(a4)
20001452:	40000437          	lui	s0,0x40000
20001456:	4785                	li	a5,1
20001458:	c83c                	sw	a5,80(s0)
2000145a:	4505                	li	a0,1
2000145c:	e000b097          	auipc	ra,0xe000b
20001460:	47a080e7          	jalr	1146(ra) # c8d6 <delay_us>
20001464:	478d                	li	a5,3
20001466:	c83c                	sw	a5,80(s0)
20001468:	4515                	li	a0,5
2000146a:	e000b097          	auipc	ra,0xe000b
2000146e:	46c080e7          	jalr	1132(ra) # c8d6 <delay_us>
20001472:	479d                	li	a5,7
20001474:	c83c                	sw	a5,80(s0)
20001476:	4505                	li	a0,1
20001478:	e000b097          	auipc	ra,0xe000b
2000147c:	45e080e7          	jalr	1118(ra) # c8d6 <delay_us>
20001480:	47bd                	li	a5,15
20001482:	c83c                	sw	a5,80(s0)
20001484:	4519                	li	a0,6
20001486:	e000b097          	auipc	ra,0xe000b
2000148a:	450080e7          	jalr	1104(ra) # c8d6 <delay_us>
2000148e:	40a2                	lw	ra,8(sp)
20001490:	4412                	lw	s0,4(sp)
20001492:	0131                	addi	sp,sp,12
20001494:	8082                	ret

20001496 <otp_pwr_on>:
20001496:	1151                	addi	sp,sp,-12
20001498:	c406                	sw	ra,8(sp)
2000149a:	400007b7          	lui	a5,0x40000
2000149e:	0f800713          	li	a4,248
200014a2:	10e7a023          	sw	a4,256(a5) # 40000100 <__StackTop+0x1fffc100>
200014a6:	470d                	li	a4,3
200014a8:	d7f8                	sw	a4,108(a5)
200014aa:	3f49                	jal	2000143c <otp_powup>
200014ac:	40a2                	lw	ra,8(sp)
200014ae:	0131                	addi	sp,sp,12
200014b0:	8082                	ret

200014b2 <omw_dpslp_bf_slp>:
200014b2:	8082                	ret

200014b4 <omw_dpslp_af_slp>:
200014b4:	400007b7          	lui	a5,0x40000
200014b8:	0f800713          	li	a4,248
200014bc:	10e7a023          	sw	a4,256(a5) # 40000100 <__StackTop+0x1fffc100>
200014c0:	8082                	ret

200014c2 <RADIO_CommonDescInit_SetFreq>:
200014c2:	1151                	addi	sp,sp,-12
200014c4:	c406                	sw	ra,8(sp)
200014c6:	2a81                	jal	20001616 <RADIO_DescInit_Freq>
200014c8:	40a2                	lw	ra,8(sp)
200014ca:	0131                	addi	sp,sp,12
200014cc:	8082                	ret

200014ce <sys_timeout_tick_get_hook>:
200014ce:	420007b7          	lui	a5,0x42000
200014d2:	1047a503          	lw	a0,260(a5) # 42000104 <__StackTop+0x21ffc104>
200014d6:	3e800793          	li	a5,1000
200014da:	02f55533          	divu	a0,a0,a5
200014de:	8082                	ret

200014e0 <ll_conn_process_wake_up_pre_chk>:
200014e0:	1151                	addi	sp,sp,-12
200014e2:	c406                	sw	ra,8(sp)
200014e4:	4501                	li	a0,0
200014e6:	e0001097          	auipc	ra,0xe0001
200014ea:	6ae080e7          	jalr	1710(ra) # 2b94 <ll_conn_set_get>
200014ee:	00054783          	lbu	a5,0(a0)
200014f2:	cb89                	beqz	a5,20001504 <ll_conn_process_wake_up_pre_chk+0x24>
200014f4:	00654783          	lbu	a5,6(a0)
200014f8:	c791                	beqz	a5,20001504 <ll_conn_process_wake_up_pre_chk+0x24>
200014fa:	200037b7          	lui	a5,0x20003
200014fe:	4705                	li	a4,1
20001500:	f4e78523          	sb	a4,-182(a5) # 20002f4a <need_pwr_on>
20001504:	40a2                	lw	ra,8(sp)
20001506:	0131                	addi	sp,sp,12
20001508:	8082                	ret

2000150a <omw_cali_period_temp>:
2000150a:	200007b7          	lui	a5,0x20000
2000150e:	4257c783          	lbu	a5,1061(a5) # 20000425 <rf_bt_mgr+0x5>
20001512:	e391                	bnez	a5,20001516 <omw_cali_period_temp+0xc>
20001514:	8082                	ret
20001516:	1151                	addi	sp,sp,-12
20001518:	c406                	sw	ra,8(sp)
2000151a:	2145                	jal	200019ba <calc_hp_offset_at_curr_temp>
2000151c:	40a2                	lw	ra,8(sp)
2000151e:	0131                	addi	sp,sp,12
20001520:	8082                	ret

20001522 <RF_BT_IRQHandler_RAM>:
20001522:	1141                	addi	sp,sp,-16
20001524:	c606                	sw	ra,12(sp)
20001526:	c422                	sw	s0,8(sp)
20001528:	c226                	sw	s1,4(sp)
2000152a:	200007b7          	lui	a5,0x20000
2000152e:	4287a403          	lw	s0,1064(a5) # 20000428 <rf_bt_mgr+0x8>
20001532:	420007b7          	lui	a5,0x42000
20001536:	43dc                	lw	a5,4(a5)
20001538:	c859                	beqz	s0,200015ce <RF_BT_IRQHandler_RAM+0xac>
2000153a:	20000737          	lui	a4,0x20000
2000153e:	42070713          	addi	a4,a4,1056 # 20000420 <rf_bt_mgr>
20001542:	00674683          	lbu	a3,6(a4)
20001546:	00d40023          	sb	a3,0(s0) # 40000000 <__StackTop+0x1fffc000>
2000154a:	00774703          	lbu	a4,7(a4)
2000154e:	00e400a3          	sb	a4,1(s0)
20001552:	01079713          	slli	a4,a5,0x10
20001556:	8341                	srli	a4,a4,0x10
20001558:	8ba1                	andi	a5,a5,8
2000155a:	00f03533          	snez	a0,a5
2000155e:	c02a                	sw	a0,0(sp)
20001560:	c789                	beqz	a5,2000156a <RF_BT_IRQHandler_RAM+0x48>
20001562:	00477793          	andi	a5,a4,4
20001566:	0017b793          	seqz	a5,a5
2000156a:	0ff7f493          	zext.b	s1,a5
2000156e:	420017b7          	lui	a5,0x42001
20001572:	1e07c703          	lbu	a4,480(a5) # 420011e0 <__StackTop+0x21ffd1e0>
20001576:	1c078793          	addi	a5,a5,448
2000157a:	0ff77713          	zext.b	a4,a4
2000157e:	200036b7          	lui	a3,0x20003
20001582:	f6e6a423          	sw	a4,-152(a3) # 20002f68 <rssi>
20001586:	02c7c783          	lbu	a5,44(a5)
2000158a:	0ff7f793          	zext.b	a5,a5
2000158e:	20003737          	lui	a4,0x20003
20001592:	f6f72623          	sw	a5,-148(a4) # 20002f6c <rx_gain>
20001596:	2d5d                	jal	20001c4c <dynamic_agc_info_get2>
20001598:	420007b7          	lui	a5,0x42000
2000159c:	4705                	li	a4,1
2000159e:	06e78223          	sb	a4,100(a5) # 42000064 <__StackTop+0x21ffc064>
200015a2:	200007b7          	lui	a5,0x20000
200015a6:	420782a3          	sb	zero,1061(a5) # 20000425 <rf_bt_mgr+0x5>
200015aa:	200037b7          	lui	a5,0x20003
200015ae:	f687a603          	lw	a2,-152(a5) # 20002f68 <rssi>
200015b2:	86a2                	mv	a3,s0
200015b4:	0662                	slli	a2,a2,0x18
200015b6:	8661                	srai	a2,a2,0x18
200015b8:	85a6                	mv	a1,s1
200015ba:	4502                	lw	a0,0(sp)
200015bc:	e0004097          	auipc	ra,0xe0004
200015c0:	c7a080e7          	jalr	-902(ra) # 5236 <RF_BT_DoneHandler>
200015c4:	40b2                	lw	ra,12(sp)
200015c6:	4422                	lw	s0,8(sp)
200015c8:	4492                	lw	s1,4(sp)
200015ca:	0141                	addi	sp,sp,16
200015cc:	8082                	ret
200015ce:	4481                	li	s1,0
200015d0:	c002                	sw	zero,0(sp)
200015d2:	b7d9                	j	20001598 <RF_BT_IRQHandler_RAM+0x76>

200015d4 <bt_fast_chk_sleep>:
200015d4:	200017b7          	lui	a5,0x20001
200015d8:	be87a783          	lw	a5,-1048(a5) # 20000be8 <ll_sch_mgr_ptr>
200015dc:	0007d783          	lhu	a5,0(a5)
200015e0:	4501                	li	a0,0
200015e2:	eb8d                	bnez	a5,20001614 <bt_fast_chk_sleep+0x40>
200015e4:	200017b7          	lui	a5,0x20001
200015e8:	be47a783          	lw	a5,-1052(a5) # 20000be4 <bt_tmr_hdl>
200015ec:	439c                	lw	a5,0(a5)
200015ee:	4505                	li	a0,1
200015f0:	c395                	beqz	a5,20001614 <bt_fast_chk_sleep+0x40>
200015f2:	420007b7          	lui	a5,0x42000
200015f6:	1147a503          	lw	a0,276(a5) # 42000114 <__StackTop+0x21ffc114>
200015fa:	1047a703          	lw	a4,260(a5)
200015fe:	77d1                	lui	a5,0xffff4
20001600:	cb078793          	addi	a5,a5,-848 # ffff3cb0 <__StackTop+0xdffefcb0>
20001604:	953e                	add	a0,a0,a5
20001606:	8d19                	sub	a0,a0,a4
20001608:	7fff47b7          	lui	a5,0x7fff4
2000160c:	cb078793          	addi	a5,a5,-848 # 7fff3cb0 <__StackTop+0x5ffefcb0>
20001610:	00f53533          	sltu	a0,a0,a5
20001614:	8082                	ret

20001616 <RADIO_DescInit_Freq>:
20001616:	1151                	addi	sp,sp,-12
20001618:	c406                	sw	ra,8(sp)
2000161a:	c222                	sw	s0,4(sp)
2000161c:	c026                	sw	s1,0(sp)
2000161e:	84aa                	mv	s1,a0
20001620:	200017b7          	lui	a5,0x20001
20001624:	de878793          	addi	a5,a5,-536 # 20000de8 <rf_common_desc_rx_setfreq>
20001628:	06f50b63          	beq	a0,a5,2000169e <RADIO_DescInit_Freq+0x88>
2000162c:	200007b7          	lui	a5,0x20000
20001630:	4207c703          	lbu	a4,1056(a5) # 20000420 <rf_bt_mgr>
20001634:	200017b7          	lui	a5,0x20001
20001638:	c3478793          	addi	a5,a5,-972 # 20000c34 <ble_tx_end>
2000163c:	97ba                	add	a5,a5,a4
2000163e:	0007c783          	lbu	a5,0(a5)
20001642:	07c2                	slli	a5,a5,0x10
20001644:	6695                	lui	a3,0x5
20001646:	06a1                	addi	a3,a3,8 # 5008 <ll_scan_sched+0x10>
20001648:	8fd5                	or	a5,a5,a3
2000164a:	200006b7          	lui	a3,0x20000
2000164e:	48f6ae23          	sw	a5,1180(a3) # 2000049c <rf_common_desc_tx_end_delay+0x4>
20001652:	747d                	lui	s0,0xfffff
20001654:	69e40413          	addi	s0,s0,1694 # fffff69e <__StackTop+0xdfffb69e>
20001658:	942e                	add	s0,s0,a1
2000165a:	8405                	srai	s0,s0,0x1
2000165c:	0ff47413          	zext.b	s0,s0
20001660:	85ba                	mv	a1,a4
20001662:	4789                	li	a5,2
20001664:	00e7f363          	bgeu	a5,a4,2000166a <RADIO_DescInit_Freq+0x54>
20001668:	4589                	li	a1,2
2000166a:	0ff5f593          	zext.b	a1,a1
2000166e:	8522                	mv	a0,s0
20001670:	2935                	jal	20001aac <RF_OnChip_Cfg_KVCO_Cal_val>
20001672:	4501                	li	a0,0
20001674:	4601                	li	a2,0
20001676:	4681                	li	a3,0
20001678:	20001737          	lui	a4,0x20001
2000167c:	00241593          	slli	a1,s0,0x2
20001680:	c3c70413          	addi	s0,a4,-964 # 20000c3c <freq_cfg_val>
20001684:	942e                	add	s0,s0,a1
20001686:	401c                	lw	a5,0(s0)
20001688:	8f95                	sub	a5,a5,a3
2000168a:	00a7d7b3          	srl	a5,a5,a0
2000168e:	8fd1                	or	a5,a5,a2
20001690:	c09c                	sw	a5,0(s1)
20001692:	8526                	mv	a0,s1
20001694:	40a2                	lw	ra,8(sp)
20001696:	4412                	lw	s0,4(sp)
20001698:	4482                	lw	s1,0(sp)
2000169a:	0131                	addi	sp,sp,12
2000169c:	8082                	ret
2000169e:	200037b7          	lui	a5,0x20003
200016a2:	f157c783          	lbu	a5,-235(a5) # 20002f15 <is_high_perf>
200016a6:	0ff7f793          	zext.b	a5,a5
200016aa:	c38d                	beqz	a5,200016cc <RADIO_DescInit_Freq+0xb6>
200016ac:	420026b7          	lui	a3,0x42002
200016b0:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
200016b4:	ffd00737          	lui	a4,0xffd00
200016b8:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
200016bc:	8ff9                	and	a5,a5,a4
200016be:	00100737          	lui	a4,0x100
200016c2:	10070713          	addi	a4,a4,256 # 100100 <__FLASH_SIZE+0xc0100>
200016c6:	8fd9                	or	a5,a5,a4
200016c8:	0cf6a623          	sw	a5,204(a3)
200016cc:	0015f793          	andi	a5,a1,1
200016d0:	cba5                	beqz	a5,20001740 <RADIO_DescInit_Freq+0x12a>
200016d2:	200037b7          	lui	a5,0x20003
200016d6:	ef87d703          	lhu	a4,-264(a5) # 20002ef8 <ll_gap_time_1m>
200016da:	200007b7          	lui	a5,0x20000
200016de:	4ae79b23          	sh	a4,1206(a5) # 200004b6 <ll_gap_time>
200016e2:	747d                	lui	s0,0xfffff
200016e4:	69f40413          	addi	s0,s0,1695 # fffff69f <__StackTop+0xdfffb69f>
200016e8:	942e                	add	s0,s0,a1
200016ea:	8405                	srai	s0,s0,0x1
200016ec:	0ff47413          	zext.b	s0,s0
200016f0:	42002737          	lui	a4,0x42002
200016f4:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
200016f8:	f7f7f793          	andi	a5,a5,-129
200016fc:	0cf72023          	sw	a5,192(a4)
20001700:	200037b7          	lui	a5,0x20003
20001704:	f157c783          	lbu	a5,-235(a5) # 20002f15 <is_high_perf>
20001708:	0ff7f793          	zext.b	a5,a5
2000170c:	e38d                	bnez	a5,2000172e <RADIO_DescInit_Freq+0x118>
2000170e:	420026b7          	lui	a3,0x42002
20001712:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
20001716:	ffd00737          	lui	a4,0xffd00
2000171a:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
2000171e:	8ff9                	and	a5,a5,a4
20001720:	00100737          	lui	a4,0x100
20001724:	10070713          	addi	a4,a4,256 # 100100 <__FLASH_SIZE+0xc0100>
20001728:	8fd9                	or	a5,a5,a4
2000172a:	0cf6a623          	sw	a5,204(a3)
2000172e:	4501                	li	a0,0
20001730:	2ee9                	jal	20001b0a <RF_OnChip_DCOC_Cal_Bw_Cfg>
20001732:	4505                	li	a0,1
20001734:	80000637          	lui	a2,0x80000
20001738:	67d5                	lui	a5,0x15
2000173a:	55578693          	addi	a3,a5,1365 # 15555 <memset+0x8b89>
2000173e:	bf2d                	j	20001678 <RADIO_DescInit_Freq+0x62>
20001740:	200037b7          	lui	a5,0x20003
20001744:	ef87d783          	lhu	a5,-264(a5) # 20002ef8 <ll_gap_time_1m>
20001748:	0799                	addi	a5,a5,6
2000174a:	20000737          	lui	a4,0x20000
2000174e:	4af71b23          	sh	a5,1206(a4) # 200004b6 <ll_gap_time>
20001752:	747d                	lui	s0,0xfffff
20001754:	6a040413          	addi	s0,s0,1696 # fffff6a0 <__StackTop+0xdfffb6a0>
20001758:	942e                	add	s0,s0,a1
2000175a:	8405                	srai	s0,s0,0x1
2000175c:	0ff47413          	zext.b	s0,s0
20001760:	42002737          	lui	a4,0x42002
20001764:	0c072783          	lw	a5,192(a4) # 420020c0 <__StackTop+0x21ffe0c0>
20001768:	0807e793          	ori	a5,a5,128
2000176c:	0cf72023          	sw	a5,192(a4)
20001770:	200037b7          	lui	a5,0x20003
20001774:	f157c783          	lbu	a5,-235(a5) # 20002f15 <is_high_perf>
20001778:	0ff7f793          	zext.b	a5,a5
2000177c:	e38d                	bnez	a5,2000179e <RADIO_DescInit_Freq+0x188>
2000177e:	420026b7          	lui	a3,0x42002
20001782:	0cc6a783          	lw	a5,204(a3) # 420020cc <__StackTop+0x21ffe0cc>
20001786:	ffd00737          	lui	a4,0xffd00
2000178a:	cff70713          	addi	a4,a4,-769 # ffcffcff <__StackTop+0xdfcfbcff>
2000178e:	8ff9                	and	a5,a5,a4
20001790:	00200737          	lui	a4,0x200
20001794:	20070713          	addi	a4,a4,512 # 200200 <__FLASH_SIZE+0x1c0200>
20001798:	8fd9                	or	a5,a5,a4
2000179a:	0cf6a623          	sw	a5,204(a3)
2000179e:	4505                	li	a0,1
200017a0:	26ad                	jal	20001b0a <RF_OnChip_DCOC_Cal_Bw_Cfg>
200017a2:	4505                	li	a0,1
200017a4:	80000637          	lui	a2,0x80000
200017a8:	0002b7b7          	lui	a5,0x2b
200017ac:	aab78693          	addi	a3,a5,-1365 # 2aaab <memset+0x1e0df>
200017b0:	b5e1                	j	20001678 <RADIO_DescInit_Freq+0x62>

200017b2 <omw_rf_set_high_perf_apply>:
200017b2:	200037b7          	lui	a5,0x20003
200017b6:	f157c783          	lbu	a5,-235(a5) # 20002f15 <is_high_perf>
200017ba:	0ff7f793          	zext.b	a5,a5
200017be:	c7c5                	beqz	a5,20001866 <omw_rf_set_high_perf_apply+0xb4>
200017c0:	200037b7          	lui	a5,0x20003
200017c4:	f147c783          	lbu	a5,-236(a5) # 20002f14 <is_add_rf_aon_adda_vc>
200017c8:	ef99                	bnez	a5,200017e6 <omw_rf_set_high_perf_apply+0x34>
200017ca:	200037b7          	lui	a5,0x20003
200017ce:	f1878793          	addi	a5,a5,-232 # 20002f18 <g_rf_cfg>
200017d2:	0057c703          	lbu	a4,5(a5)
200017d6:	0709                	addi	a4,a4,2
200017d8:	00e782a3          	sb	a4,5(a5)
200017dc:	200037b7          	lui	a5,0x20003
200017e0:	4705                	li	a4,1
200017e2:	f0e78a23          	sb	a4,-236(a5) # 20002f14 <is_add_rf_aon_adda_vc>
200017e6:	420027b7          	lui	a5,0x42002
200017ea:	57b8                	lw	a4,104(a5)
200017ec:	9b41                	andi	a4,a4,-16
200017ee:	00476713          	ori	a4,a4,4
200017f2:	d7b8                	sw	a4,104(a5)
200017f4:	57f8                	lw	a4,108(a5)
200017f6:	9b41                	andi	a4,a4,-16
200017f8:	00776713          	ori	a4,a4,7
200017fc:	d7f8                	sw	a4,108(a5)
200017fe:	5bb8                	lw	a4,112(a5)
20001800:	9b41                	andi	a4,a4,-16
20001802:	00776713          	ori	a4,a4,7
20001806:	dbb8                	sw	a4,112(a5)
20001808:	5bf8                	lw	a4,116(a5)
2000180a:	9b41                	andi	a4,a4,-16
2000180c:	00776713          	ori	a4,a4,7
20001810:	dbf8                	sw	a4,116(a5)
20001812:	5fb8                	lw	a4,120(a5)
20001814:	9b41                	andi	a4,a4,-16
20001816:	00776713          	ori	a4,a4,7
2000181a:	dfb8                	sw	a4,120(a5)
2000181c:	5ff0                	lw	a2,124(a5)
2000181e:	76fd                	lui	a3,0xfffff
20001820:	0ff68693          	addi	a3,a3,255 # fffff0ff <__StackTop+0xdfffb0ff>
20001824:	8e75                	and	a2,a2,a3
20001826:	6705                	lui	a4,0x1
20001828:	80070713          	addi	a4,a4,-2048 # 800 <__STACK_SIZE+0x400>
2000182c:	8e59                	or	a2,a2,a4
2000182e:	dff0                	sw	a2,124(a5)
20001830:	0807a603          	lw	a2,128(a5) # 42002080 <__StackTop+0x21ffe080>
20001834:	8e75                	and	a2,a2,a3
20001836:	8e59                	or	a2,a2,a4
20001838:	08c7a023          	sw	a2,128(a5)
2000183c:	0847a603          	lw	a2,132(a5)
20001840:	8e75                	and	a2,a2,a3
20001842:	8e59                	or	a2,a2,a4
20001844:	08c7a223          	sw	a2,132(a5)
20001848:	0887a603          	lw	a2,136(a5)
2000184c:	8ef1                	and	a3,a3,a2
2000184e:	8f55                	or	a4,a4,a3
20001850:	08e7a423          	sw	a4,136(a5)
20001854:	0c87a703          	lw	a4,200(a5)
20001858:	8ff77713          	andi	a4,a4,-1793
2000185c:	20076713          	ori	a4,a4,512
20001860:	0ce7a423          	sw	a4,200(a5)
20001864:	8082                	ret
20001866:	420027b7          	lui	a5,0x42002
2000186a:	57b8                	lw	a4,104(a5)
2000186c:	9b41                	andi	a4,a4,-16
2000186e:	00476713          	ori	a4,a4,4
20001872:	d7b8                	sw	a4,104(a5)
20001874:	57f8                	lw	a4,108(a5)
20001876:	9b41                	andi	a4,a4,-16
20001878:	00776713          	ori	a4,a4,7
2000187c:	d7f8                	sw	a4,108(a5)
2000187e:	5bb8                	lw	a4,112(a5)
20001880:	9b41                	andi	a4,a4,-16
20001882:	00776713          	ori	a4,a4,7
20001886:	dbb8                	sw	a4,112(a5)
20001888:	5bf8                	lw	a4,116(a5)
2000188a:	9b41                	andi	a4,a4,-16
2000188c:	00776713          	ori	a4,a4,7
20001890:	dbf8                	sw	a4,116(a5)
20001892:	5fb8                	lw	a4,120(a5)
20001894:	9b41                	andi	a4,a4,-16
20001896:	00776713          	ori	a4,a4,7
2000189a:	dfb8                	sw	a4,120(a5)
2000189c:	5ff4                	lw	a3,124(a5)
2000189e:	777d                	lui	a4,0xfffff
200018a0:	0ff70713          	addi	a4,a4,255 # fffff0ff <__StackTop+0xdfffb0ff>
200018a4:	8ef9                	and	a3,a3,a4
200018a6:	2006e693          	ori	a3,a3,512
200018aa:	dff4                	sw	a3,124(a5)
200018ac:	0807a683          	lw	a3,128(a5) # 42002080 <__StackTop+0x21ffe080>
200018b0:	8ef9                	and	a3,a3,a4
200018b2:	2006e693          	ori	a3,a3,512
200018b6:	08d7a023          	sw	a3,128(a5)
200018ba:	0847a683          	lw	a3,132(a5)
200018be:	8ef9                	and	a3,a3,a4
200018c0:	2006e693          	ori	a3,a3,512
200018c4:	08d7a223          	sw	a3,132(a5)
200018c8:	0887a683          	lw	a3,136(a5)
200018cc:	8f75                	and	a4,a4,a3
200018ce:	20076713          	ori	a4,a4,512
200018d2:	08e7a423          	sw	a4,136(a5)
200018d6:	0c87a703          	lw	a4,200(a5)
200018da:	8ff77713          	andi	a4,a4,-1793
200018de:	20076713          	ori	a4,a4,512
200018e2:	0ce7a423          	sw	a4,200(a5)
200018e6:	8082                	ret

200018e8 <_rf_kvco_read_y>:
200018e8:	1151                	addi	sp,sp,-12
200018ea:	c406                	sw	ra,8(sp)
200018ec:	c222                	sw	s0,4(sp)
200018ee:	42002437          	lui	s0,0x42002
200018f2:	0cc42783          	lw	a5,204(s0) # 420020cc <__StackTop+0x21ffe0cc>
200018f6:	10000737          	lui	a4,0x10000
200018fa:	8fd9                	or	a5,a5,a4
200018fc:	0cf42623          	sw	a5,204(s0)
20001900:	0cc42783          	lw	a5,204(s0)
20001904:	f0000737          	lui	a4,0xf0000
20001908:	177d                	addi	a4,a4,-1 # efffffff <__StackTop+0xcfffbfff>
2000190a:	8ff9                	and	a5,a5,a4
2000190c:	0cf42623          	sw	a5,204(s0)
20001910:	4785                	li	a5,1
20001912:	cc1c                	sw	a5,24(s0)
20001914:	4795                	li	a5,5
20001916:	cc1c                	sw	a5,24(s0)
20001918:	47e1                	li	a5,24
2000191a:	02f55533          	divu	a0,a0,a5
2000191e:	0515                	addi	a0,a0,5
20001920:	0542                	slli	a0,a0,0x10
20001922:	8141                	srli	a0,a0,0x10
20001924:	e000b097          	auipc	ra,0xe000b
20001928:	fb2080e7          	jalr	-78(ra) # c8d6 <delay_us>
2000192c:	0f042503          	lw	a0,240(s0)
20001930:	052e                	slli	a0,a0,0xb
20001932:	812d                	srli	a0,a0,0xb
20001934:	40a2                	lw	ra,8(sp)
20001936:	4412                	lw	s0,4(sp)
20001938:	0131                	addi	sp,sp,12
2000193a:	8082                	ret

2000193c <trigger_gpadc_temp_sampling>:
2000193c:	1151                	addi	sp,sp,-12
2000193e:	c406                	sw	ra,8(sp)
20001940:	c222                	sw	s0,4(sp)
20001942:	420027b7          	lui	a5,0x42002
20001946:	43d8                	lw	a4,4(a5)
20001948:	00176713          	ori	a4,a4,1
2000194c:	c3d8                	sw	a4,4(a5)
2000194e:	40040437          	lui	s0,0x40040
20001952:	4709                	li	a4,2
20001954:	c018                	sw	a4,0(s0)
20001956:	0e87a703          	lw	a4,232(a5) # 420020e8 <__StackTop+0x21ffe0e8>
2000195a:	00176713          	ori	a4,a4,1
2000195e:	0ee7a423          	sw	a4,232(a5)
20001962:	08800793          	li	a5,136
20001966:	c05c                	sw	a5,4(s0)
20001968:	6791                	lui	a5,0x4
2000196a:	0789                	addi	a5,a5,2 # 4002 <ll_conn_update+0x96>
2000196c:	d03c                	sw	a5,96(s0)
2000196e:	30f00793          	li	a5,783
20001972:	d83c                	sw	a5,112(s0)
20001974:	4511                	li	a0,4
20001976:	e000b097          	auipc	ra,0xe000b
2000197a:	f60080e7          	jalr	-160(ra) # c8d6 <delay_us>
2000197e:	800047b7          	lui	a5,0x80004
20001982:	0789                	addi	a5,a5,2 # 80004002 <__StackTop+0x60000002>
20001984:	d03c                	sw	a5,96(s0)
20001986:	40a2                	lw	ra,8(sp)
20001988:	4412                	lw	s0,4(sp)
2000198a:	0131                	addi	sp,sp,12
2000198c:	8082                	ret

2000198e <start_await_dma>:
2000198e:	420007b7          	lui	a5,0x42000
20001992:	06078023          	sb	zero,96(a5) # 42000060 <__StackTop+0x21ffc060>
20001996:	c7c8                	sw	a0,12(a5)
20001998:	4705                	li	a4,1
2000199a:	c398                	sw	a4,0(a5)
2000199c:	42000737          	lui	a4,0x42000
200019a0:	06474783          	lbu	a5,100(a4) # 42000064 <__StackTop+0x21ffc064>
200019a4:	0ff7f793          	zext.b	a5,a5
200019a8:	dfe5                	beqz	a5,200019a0 <start_await_dma+0x12>
200019aa:	420007b7          	lui	a5,0x42000
200019ae:	4705                	li	a4,1
200019b0:	06e78223          	sb	a4,100(a5) # 42000064 <__StackTop+0x21ffc064>
200019b4:	06e78023          	sb	a4,96(a5)
200019b8:	8082                	ret

200019ba <calc_hp_offset_at_curr_temp>:
200019ba:	200037b7          	lui	a5,0x20003
200019be:	efc7a783          	lw	a5,-260(a5) # 20002efc <aon_tick.0>
200019c2:	cb99                	beqz	a5,200019d8 <calc_hp_offset_at_curr_temp+0x1e>
200019c4:	40000737          	lui	a4,0x40000
200019c8:	0b072703          	lw	a4,176(a4) # 400000b0 <__StackTop+0x1fffc0b0>
200019cc:	8f1d                	sub	a4,a4,a5
200019ce:	000287b7          	lui	a5,0x28
200019d2:	17ed                	addi	a5,a5,-5 # 27ffb <memset+0x1b62f>
200019d4:	0ce7fb63          	bgeu	a5,a4,20001aaa <calc_hp_offset_at_curr_temp+0xf0>
200019d8:	1101                	addi	sp,sp,-32
200019da:	ce06                	sw	ra,28(sp)
200019dc:	cc22                	sw	s0,24(sp)
200019de:	ca26                	sw	s1,20(sp)
200019e0:	400807b7          	lui	a5,0x40080
200019e4:	47d4                	lw	a3,12(a5)
200019e6:	40040437          	lui	s0,0x40040
200019ea:	4018                	lw	a4,0(s0)
200019ec:	c03a                	sw	a4,0(sp)
200019ee:	4050                	lw	a2,4(s0)
200019f0:	c232                	sw	a2,4(sp)
200019f2:	502c                	lw	a1,96(s0)
200019f4:	c42e                	sw	a1,8(sp)
200019f6:	47d8                	lw	a4,12(a5)
200019f8:	00876713          	ori	a4,a4,8
200019fc:	c7d8                	sw	a4,12(a5)
200019fe:	5828                	lw	a0,112(s0)
20001a00:	c62a                	sw	a0,12(sp)
20001a02:	40000637          	lui	a2,0x40000
20001a06:	560c                	lw	a1,40(a2)
20001a08:	5838                	lw	a4,112(s0)
20001a0a:	00176713          	ori	a4,a4,1
20001a0e:	d838                	sw	a4,112(s0)
20001a10:	420024b7          	lui	s1,0x42002
20001a14:	3ff00713          	li	a4,1023
20001a18:	c0d8                	sw	a4,4(s1)
20001a1a:	6721                	lui	a4,0x8
20001a1c:	c82e                	sw	a1,16(sp)
20001a1e:	8f4d                	or	a4,a4,a1
20001a20:	d618                	sw	a4,40(a2)
20001a22:	c7d4                	sw	a3,12(a5)
20001a24:	3f21                	jal	2000193c <trigger_gpadc_temp_sampling>
20001a26:	4521                	li	a0,8
20001a28:	e000b097          	auipc	ra,0xe000b
20001a2c:	eae080e7          	jalr	-338(ra) # c8d6 <delay_us>
20001a30:	547c                	lw	a5,108(s0)
20001a32:	20003737          	lui	a4,0x20003
20001a36:	f2074703          	lbu	a4,-224(a4) # 20002f20 <g_rf_cfg+0x8>
20001a3a:	8f99                	sub	a5,a5,a4
20001a3c:	0791                	addi	a5,a5,4 # 40080004 <__StackTop+0x2007c004>
20001a3e:	4037d713          	srai	a4,a5,0x3
20001a42:	200027b7          	lui	a5,0x20002
20001a46:	6547a783          	lw	a5,1620(a5) # 20002654 <g_otp_cfg+0x2c>
20001a4a:	83bd                	srli	a5,a5,0xf
20001a4c:	8bfd                	andi	a5,a5,31
20001a4e:	02e787b3          	mul	a5,a5,a4
20001a52:	0795                	addi	a5,a5,5
20001a54:	4729                	li	a4,10
20001a56:	02e7c7b3          	div	a5,a5,a4
20001a5a:	20003737          	lui	a4,0x20003
20001a5e:	f0f72823          	sw	a5,-240(a4) # 20002f10 <g_hp_offset>
20001a62:	400006b7          	lui	a3,0x40000
20001a66:	0b06a703          	lw	a4,176(a3) # 400000b0 <__StackTop+0x1fffc0b0>
20001a6a:	200037b7          	lui	a5,0x20003
20001a6e:	eee7ae23          	sw	a4,-260(a5) # 20002efc <aon_tick.0>
20001a72:	0e84a783          	lw	a5,232(s1) # 420020e8 <__StackTop+0x21ffe0e8>
20001a76:	9bf9                	andi	a5,a5,-2
20001a78:	0ef4a423          	sw	a5,232(s1)
20001a7c:	06042023          	sw	zero,96(s0) # 40040060 <__StackTop+0x2003c060>
20001a80:	06042823          	sw	zero,112(s0)
20001a84:	40dc                	lw	a5,4(s1)
20001a86:	9bf9                	andi	a5,a5,-2
20001a88:	c0dc                	sw	a5,4(s1)
20001a8a:	4702                	lw	a4,0(sp)
20001a8c:	c018                	sw	a4,0(s0)
20001a8e:	4612                	lw	a2,4(sp)
20001a90:	c050                	sw	a2,4(s0)
20001a92:	47a2                	lw	a5,8(sp)
20001a94:	d03c                	sw	a5,96(s0)
20001a96:	4532                	lw	a0,12(sp)
20001a98:	d828                	sw	a0,112(s0)
20001a9a:	45c2                	lw	a1,16(sp)
20001a9c:	d68c                	sw	a1,40(a3)
20001a9e:	547c                	lw	a5,108(s0)
20001aa0:	40f2                	lw	ra,28(sp)
20001aa2:	4462                	lw	s0,24(sp)
20001aa4:	44d2                	lw	s1,20(sp)
20001aa6:	6105                	addi	sp,sp,32
20001aa8:	8082                	ret
20001aaa:	8082                	ret

20001aac <RF_OnChip_Cfg_KVCO_Cal_val>:
20001aac:	47b5                	li	a5,13
20001aae:	4701                	li	a4,0
20001ab0:	00a7f663          	bgeu	a5,a0,20001abc <RF_OnChip_Cfg_KVCO_Cal_val+0x10>
20001ab4:	4769                	li	a4,26
20001ab6:	00a73733          	sltu	a4,a4,a0
20001aba:	0705                	addi	a4,a4,1
20001abc:	420016b7          	lui	a3,0x42001
20001ac0:	5290                	lw	a2,32(a3)
20001ac2:	77c1                	lui	a5,0xffff0
20001ac4:	8e7d                	and	a2,a2,a5
20001ac6:	00171793          	slli	a5,a4,0x1
20001aca:	97ba                	add	a5,a5,a4
20001acc:	20003737          	lui	a4,0x20003
20001ad0:	f0470713          	addi	a4,a4,-252 # 20002f04 <g_hp>
20001ad4:	973e                	add	a4,a4,a5
20001ad6:	972e                	add	a4,a4,a1
20001ad8:	00074783          	lbu	a5,0(a4)
20001adc:	20003737          	lui	a4,0x20003
20001ae0:	f1072703          	lw	a4,-240(a4) # 20002f10 <g_hp_offset>
20001ae4:	97ba                	add	a5,a5,a4
20001ae6:	20001737          	lui	a4,0x20001
20001aea:	cdc70713          	addi	a4,a4,-804 # 20000cdc <g_lp>
20001aee:	972e                	add	a4,a4,a1
20001af0:	00074703          	lbu	a4,0(a4)
20001af4:	0722                	slli	a4,a4,0x8
20001af6:	8fd9                	or	a5,a5,a4
20001af8:	8fd1                	or	a5,a5,a2
20001afa:	d29c                	sw	a5,32(a3)
20001afc:	8082                	ret

20001afe <RF_OnChip_Corner_Cal_Cfg>:
20001afe:	1151                	addi	sp,sp,-12
20001b00:	c406                	sw	ra,8(sp)
20001b02:	2c9d                	jal	20001d78 <omw_rf_cal_apply_core>
20001b04:	40a2                	lw	ra,8(sp)
20001b06:	0131                	addi	sp,sp,12
20001b08:	8082                	ret

20001b0a <RF_OnChip_DCOC_Cal_Bw_Cfg>:
20001b0a:	200037b7          	lui	a5,0x20003
20001b0e:	f007c783          	lbu	a5,-256(a5) # 20002f00 <cur_bw>
20001b12:	00a78663          	beq	a5,a0,20001b1e <RF_OnChip_DCOC_Cal_Bw_Cfg+0x14>
20001b16:	200037b7          	lui	a5,0x20003
20001b1a:	f0a78023          	sb	a0,-256(a5) # 20002f00 <cur_bw>
20001b1e:	8082                	ret

20001b20 <RF_OnChip_DCOC_Cal_Cfg>:
20001b20:	200037b7          	lui	a5,0x20003
20001b24:	577d                	li	a4,-1
20001b26:	f0e78023          	sb	a4,-256(a5) # 20002f00 <cur_bw>
20001b2a:	20003637          	lui	a2,0x20003
20001b2e:	f1860613          	addi	a2,a2,-232 # 20002f18 <g_rf_cfg>
20001b32:	420026b7          	lui	a3,0x42002
20001b36:	02068693          	addi	a3,a3,32 # 42002020 <__StackTop+0x21ffe020>
20001b3a:	4701                	li	a4,0
20001b3c:	45a5                	li	a1,9
20001b3e:	00e65783          	lhu	a5,14(a2)
20001b42:	0792                	slli	a5,a5,0x4
20001b44:	97ba                	add	a5,a5,a4
20001b46:	c29c                	sw	a5,0(a3)
20001b48:	0705                	addi	a4,a4,1
20001b4a:	0609                	addi	a2,a2,2
20001b4c:	0691                	addi	a3,a3,4
20001b4e:	feb718e3          	bne	a4,a1,20001b3e <RF_OnChip_DCOC_Cal_Cfg+0x1e>
20001b52:	420026b7          	lui	a3,0x42002
20001b56:	0c46a783          	lw	a5,196(a3) # 420020c4 <__StackTop+0x21ffe0c4>
20001b5a:	f4000737          	lui	a4,0xf4000
20001b5e:	177d                	addi	a4,a4,-1 # f3ffffff <__StackTop+0xd3ffbfff>
20001b60:	8f7d                	and	a4,a4,a5
20001b62:	200037b7          	lui	a5,0x20003
20001b66:	f247c783          	lbu	a5,-220(a5) # 20002f24 <g_rf_cfg+0xc>
20001b6a:	07ea                	slli	a5,a5,0x1a
20001b6c:	8fd9                	or	a5,a5,a4
20001b6e:	0cf6a223          	sw	a5,196(a3)
20001b72:	8082                	ret

20001b74 <RF_OnChip_RC_Cal_Cfg>:
20001b74:	8082                	ret

20001b76 <RF_OnChip_KVCO_Cal_Cfg>:
20001b76:	8082                	ret

20001b78 <RF_OnChip_Base_Init>:
20001b78:	1151                	addi	sp,sp,-12
20001b7a:	c406                	sw	ra,8(sp)
20001b7c:	c222                	sw	s0,4(sp)
20001b7e:	c026                	sw	s1,0(sp)
20001b80:	42002437          	lui	s0,0x42002
20001b84:	441c                	lw	a5,8(s0)
20001b86:	fc07f793          	andi	a5,a5,-64
20001b8a:	c41c                	sw	a5,8(s0)
20001b8c:	479d                	li	a5,7
20001b8e:	c85c                	sw	a5,20(s0)
20001b90:	4c5c                	lw	a5,28(s0)
20001b92:	7771                	lui	a4,0xffffc
20001b94:	0741                	addi	a4,a4,16 # ffffc010 <__StackTop+0xdfff8010>
20001b96:	8ff9                	and	a5,a5,a4
20001b98:	6711                	lui	a4,0x4
20001b9a:	ce870713          	addi	a4,a4,-792 # 3ce8 <ll_reject_ind_send+0x8e>
20001b9e:	8fd9                	or	a5,a5,a4
20001ba0:	cc5c                	sw	a5,28(s0)
20001ba2:	420014b7          	lui	s1,0x42001
20001ba6:	509c                	lw	a5,32(s1)
20001ba8:	ff010737          	lui	a4,0xff010
20001bac:	177d                	addi	a4,a4,-1 # ff00ffff <__StackTop+0xdf00bfff>
20001bae:	8ff9                	and	a5,a5,a4
20001bb0:	00140737          	lui	a4,0x140
20001bb4:	8fd9                	or	a5,a5,a4
20001bb6:	d09c                	sw	a5,32(s1)
20001bb8:	47b1                	li	a5,12
20001bba:	14f4a823          	sw	a5,336(s1) # 42001150 <__StackTop+0x21ffd150>
20001bbe:	405c                	lw	a5,4(s0)
20001bc0:	2007e793          	ori	a5,a5,512
20001bc4:	c05c                	sw	a5,4(s0)
20001bc6:	400007b7          	lui	a5,0x40000
20001bca:	470d                	li	a4,3
20001bcc:	30e7a023          	sw	a4,768(a5) # 40000300 <__StackTop+0x1fffc300>
20001bd0:	405c                	lw	a5,4(s0)
20001bd2:	0e07e793          	ori	a5,a5,224
20001bd6:	c05c                	sw	a5,4(s0)
20001bd8:	481c                	lw	a5,16(s0)
20001bda:	0ab7e793          	ori	a5,a5,171
20001bde:	c81c                	sw	a5,16(s0)
20001be0:	0e042783          	lw	a5,224(s0) # 420020e0 <__StackTop+0x21ffe0e0>
20001be4:	e3f7f793          	andi	a5,a5,-449
20001be8:	0c07e793          	ori	a5,a5,192
20001bec:	0ef42023          	sw	a5,224(s0)
20001bf0:	0e442783          	lw	a5,228(s0)
20001bf4:	e1f7f793          	andi	a5,a5,-481
20001bf8:	1607e793          	ori	a5,a5,352
20001bfc:	0ef42223          	sw	a5,228(s0)
20001c00:	0d442783          	lw	a5,212(s0)
20001c04:	6705                	lui	a4,0x1
20001c06:	80070713          	addi	a4,a4,-2048 # 800 <__STACK_SIZE+0x400>
20001c0a:	8fd9                	or	a5,a5,a4
20001c0c:	0cf42a23          	sw	a5,212(s0)
20001c10:	364d                	jal	200017b2 <omw_rf_set_high_perf_apply>
20001c12:	0ac42783          	lw	a5,172(s0)
20001c16:	eff7f793          	andi	a5,a5,-257
20001c1a:	0af42623          	sw	a5,172(s0)
20001c1e:	200017b7          	lui	a5,0x20001
20001c22:	f207c783          	lbu	a5,-224(a5) # 20000f20 <rf_wb_sat_th>
20001c26:	10f4ac23          	sw	a5,280(s1)
20001c2a:	6711                	lui	a4,0x4
20001c2c:	fff70793          	addi	a5,a4,-1 # 3fff <ll_conn_update+0x93>
20001c30:	12f4a823          	sw	a5,304(s1)
20001c34:	40a2                	lw	ra,8(sp)
20001c36:	4412                	lw	s0,4(sp)
20001c38:	4482                	lw	s1,0(sp)
20001c3a:	0131                	addi	sp,sp,12
20001c3c:	8082                	ret

20001c3e <RF_OnChip_Cali_Cfg>:
20001c3e:	1151                	addi	sp,sp,-12
20001c40:	c406                	sw	ra,8(sp)
20001c42:	3d75                	jal	20001afe <RF_OnChip_Corner_Cal_Cfg>
20001c44:	3df1                	jal	20001b20 <RF_OnChip_DCOC_Cal_Cfg>
20001c46:	40a2                	lw	ra,8(sp)
20001c48:	0131                	addi	sp,sp,12
20001c4a:	8082                	ret

20001c4c <dynamic_agc_info_get2>:
20001c4c:	200017b7          	lui	a5,0x20001
20001c50:	c387c783          	lbu	a5,-968(a5) # 20000c38 <dynamic_agc_ctrl_status>
20001c54:	cb9d                	beqz	a5,20001c8a <dynamic_agc_info_get2+0x3e>
20001c56:	0a050a63          	beqz	a0,20001d0a <dynamic_agc_info_get2+0xbe>
20001c5a:	42001737          	lui	a4,0x42001
20001c5e:	10072703          	lw	a4,256(a4) # 42001100 <__StackTop+0x21ffd100>
20001c62:	8b05                	andi	a4,a4,1
20001c64:	e305                	bnez	a4,20001c84 <dynamic_agc_info_get2+0x38>
20001c66:	420017b7          	lui	a5,0x42001
20001c6a:	1ec7a703          	lw	a4,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001c6e:	1007a683          	lw	a3,256(a5)
20001c72:	0016e693          	ori	a3,a3,1
20001c76:	10d7a023          	sw	a3,256(a5)
20001c7a:	0ff77713          	zext.b	a4,a4
20001c7e:	10e7a223          	sw	a4,260(a5)
20001c82:	8082                	ret
20001c84:	4705                	li	a4,1
20001c86:	00e78363          	beq	a5,a4,20001c8c <dynamic_agc_info_get2+0x40>
20001c8a:	8082                	ret
20001c8c:	420017b7          	lui	a5,0x42001
20001c90:	1e07a683          	lw	a3,480(a5) # 420011e0 <__StackTop+0x21ffd1e0>
20001c94:	0ff6f713          	zext.b	a4,a3
20001c98:	1e47a783          	lw	a5,484(a5)
20001c9c:	0ff7f593          	zext.b	a1,a5
20001ca0:	07f6f613          	andi	a2,a3,127
20001ca4:	0407f793          	andi	a5,a5,64
20001ca8:	c3cd                	beqz	a5,20001d4a <dynamic_agc_info_get2+0xfe>
20001caa:	04077713          	andi	a4,a4,64
20001cae:	e319                	bnez	a4,20001cb4 <dynamic_agc_info_get2+0x68>
20001cb0:	07f00613          	li	a2,127
20001cb4:	420017b7          	lui	a5,0x42001
20001cb8:	1ec7a683          	lw	a3,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001cbc:	0ff6f693          	zext.b	a3,a3
20001cc0:	0046d793          	srli	a5,a3,0x4
20001cc4:	00f6f713          	andi	a4,a3,15
20001cc8:	07600513          	li	a0,118
20001ccc:	08b56b63          	bltu	a0,a1,20001d62 <dynamic_agc_info_get2+0x116>
20001cd0:	06b00513          	li	a0,107
20001cd4:	00b56c63          	bltu	a0,a1,20001cec <dynamic_agc_info_get2+0xa0>
20001cd8:	8aa1                	andi	a3,a3,8
20001cda:	ea89                	bnez	a3,20001cec <dynamic_agc_info_get2+0xa0>
20001cdc:	0705                	addi	a4,a4,1
20001cde:	0ff77713          	zext.b	a4,a4
20001ce2:	cbb9                	beqz	a5,20001d38 <dynamic_agc_info_get2+0xec>
20001ce4:	17fd                	addi	a5,a5,-1
20001ce6:	0ff7f793          	zext.b	a5,a5
20001cea:	a0b9                	j	20001d38 <dynamic_agc_info_get2+0xec>
20001cec:	07600693          	li	a3,118
20001cf0:	02c6ef63          	bltu	a3,a2,20001d2e <dynamic_agc_info_get2+0xe2>
20001cf4:	06b00693          	li	a3,107
20001cf8:	04c6e063          	bltu	a3,a2,20001d38 <dynamic_agc_info_get2+0xec>
20001cfc:	469d                	li	a3,7
20001cfe:	02f6ed63          	bltu	a3,a5,20001d38 <dynamic_agc_info_get2+0xec>
20001d02:	0785                	addi	a5,a5,1
20001d04:	0ff7f793          	zext.b	a5,a5
20001d08:	a805                	j	20001d38 <dynamic_agc_info_get2+0xec>
20001d0a:	42001737          	lui	a4,0x42001
20001d0e:	10072783          	lw	a5,256(a4) # 42001100 <__StackTop+0x21ffd100>
20001d12:	9bf9                	andi	a5,a5,-2
20001d14:	10f72023          	sw	a5,256(a4)
20001d18:	8082                	ret
20001d1a:	420017b7          	lui	a5,0x42001
20001d1e:	1ec7a703          	lw	a4,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001d22:	0ff77713          	zext.b	a4,a4
20001d26:	00475793          	srli	a5,a4,0x4
20001d2a:	8b3d                	andi	a4,a4,15
20001d2c:	ef05                	bnez	a4,20001d64 <dynamic_agc_info_get2+0x118>
20001d2e:	00078563          	beqz	a5,20001d38 <dynamic_agc_info_get2+0xec>
20001d32:	17fd                	addi	a5,a5,-1
20001d34:	0ff7f793          	zext.b	a5,a5
20001d38:	0792                	slli	a5,a5,0x4
20001d3a:	973e                	add	a4,a4,a5
20001d3c:	0ff77713          	zext.b	a4,a4
20001d40:	420017b7          	lui	a5,0x42001
20001d44:	10e7a223          	sw	a4,260(a5) # 42001104 <__StackTop+0x21ffd104>
20001d48:	8082                	ret
20001d4a:	04077713          	andi	a4,a4,64
20001d4e:	d771                	beqz	a4,20001d1a <dynamic_agc_info_get2+0xce>
20001d50:	420017b7          	lui	a5,0x42001
20001d54:	1ec7a703          	lw	a4,492(a5) # 420011ec <__StackTop+0x21ffd1ec>
20001d58:	0ff77713          	zext.b	a4,a4
20001d5c:	00475793          	srli	a5,a4,0x4
20001d60:	8b3d                	andi	a4,a4,15
20001d62:	d749                	beqz	a4,20001cec <dynamic_agc_info_get2+0xa0>
20001d64:	177d                	addi	a4,a4,-1
20001d66:	0ff77713          	zext.b	a4,a4
20001d6a:	469d                	li	a3,7
20001d6c:	fcf6e6e3          	bltu	a3,a5,20001d38 <dynamic_agc_info_get2+0xec>
20001d70:	0785                	addi	a5,a5,1
20001d72:	0ff7f793          	zext.b	a5,a5
20001d76:	b7c9                	j	20001d38 <dynamic_agc_info_get2+0xec>

20001d78 <omw_rf_cal_apply_core>:
20001d78:	400806b7          	lui	a3,0x40080
20001d7c:	1046a603          	lw	a2,260(a3) # 40080104 <__StackTop+0x2007c104>
20001d80:	20003737          	lui	a4,0x20003
20001d84:	f1870713          	addi	a4,a4,-232 # 20002f18 <g_rf_cfg>
20001d88:	00474783          	lbu	a5,4(a4)
20001d8c:	078e                	slli	a5,a5,0x3
20001d8e:	00574583          	lbu	a1,5(a4)
20001d92:	05a2                	slli	a1,a1,0x8
20001d94:	8fcd                	or	a5,a5,a1
20001d96:	00174583          	lbu	a1,1(a4)
20001d9a:	05ba                	slli	a1,a1,0xe
20001d9c:	8fcd                	or	a5,a5,a1
20001d9e:	fffc05b7          	lui	a1,0xfffc0
20001da2:	8e6d                	and	a2,a2,a1
20001da4:	8fd1                	or	a5,a5,a2
20001da6:	6609                	lui	a2,0x2
20001da8:	0609                	addi	a2,a2,2 # 2002 <otp_invalid_flag+0x2>
20001daa:	8fd1                	or	a5,a5,a2
20001dac:	10f6a223          	sw	a5,260(a3)
20001db0:	1106a783          	lw	a5,272(a3)
20001db4:	87f7f613          	andi	a2,a5,-1921
20001db8:	00774783          	lbu	a5,7(a4)
20001dbc:	17f9                	addi	a5,a5,-2
20001dbe:	079e                	slli	a5,a5,0x7
20001dc0:	8fd1                	or	a5,a5,a2
20001dc2:	10f6a823          	sw	a5,272(a3)
20001dc6:	42002637          	lui	a2,0x42002
20001dca:	460c                	lw	a1,8(a2)
20001dcc:	800807b7          	lui	a5,0x80080
20001dd0:	87f78793          	addi	a5,a5,-1921 # 8007f87f <__StackTop+0x6007b87f>
20001dd4:	8dfd                	and	a1,a1,a5
20001dd6:	00274683          	lbu	a3,2(a4)
20001dda:	0685                	addi	a3,a3,1
20001ddc:	00374783          	lbu	a5,3(a4)
20001de0:	079e                	slli	a5,a5,0x7
20001de2:	00074703          	lbu	a4,0(a4)
20001de6:	076e                	slli	a4,a4,0x1b
20001de8:	8fd9                	or	a5,a5,a4
20001dea:	01369713          	slli	a4,a3,0x13
20001dee:	8fd9                	or	a5,a5,a4
20001df0:	06de                	slli	a3,a3,0x17
20001df2:	8fd5                	or	a5,a5,a3
20001df4:	8fcd                	or	a5,a5,a1
20001df6:	c61c                	sw	a5,8(a2)
20001df8:	8082                	ret

20001dfa <Check_PwrOn_OnBbDmaIrq_Before>:
20001dfa:	400807b7          	lui	a5,0x40080
20001dfe:	47fc                	lw	a5,76(a5)
20001e00:	8b85                	andi	a5,a5,1
20001e02:	cb81                	beqz	a5,20001e12 <Check_PwrOn_OnBbDmaIrq_Before+0x18>
20001e04:	200037b7          	lui	a5,0x20003
20001e08:	f617c783          	lbu	a5,-159(a5) # 20002f61 <stop_to_wait_prv>
20001e0c:	0ff7f793          	zext.b	a5,a5
20001e10:	c391                	beqz	a5,20001e14 <Check_PwrOn_OnBbDmaIrq_Before+0x1a>
20001e12:	8082                	ret
20001e14:	1151                	addi	sp,sp,-12
20001e16:	c406                	sw	ra,8(sp)
20001e18:	2571                	jal	200024a4 <ll_conn_is_connected_before_sleep>
20001e1a:	c909                	beqz	a0,20001e2c <Check_PwrOn_OnBbDmaIrq_Before+0x32>
20001e1c:	200037b7          	lui	a5,0x20003
20001e20:	4705                	li	a4,1
20001e22:	f6e780a3          	sb	a4,-159(a5) # 20002f61 <stop_to_wait_prv>
20001e26:	40a2                	lw	ra,8(sp)
20001e28:	0131                	addi	sp,sp,12
20001e2a:	8082                	ret
20001e2c:	2d4d                	jal	200024de <ll_adv_process_wake_up>
20001e2e:	dd65                	beqz	a0,20001e26 <Check_PwrOn_OnBbDmaIrq_Before+0x2c>
20001e30:	b7f5                	j	20001e1c <Check_PwrOn_OnBbDmaIrq_Before+0x22>

20001e32 <Check_PwrOn_OnBbDmaIrq>:
20001e32:	400807b7          	lui	a5,0x40080
20001e36:	47fc                	lw	a5,76(a5)
20001e38:	8b85                	andi	a5,a5,1
20001e3a:	e391                	bnez	a5,20001e3e <Check_PwrOn_OnBbDmaIrq+0xc>
20001e3c:	8082                	ret
20001e3e:	1151                	addi	sp,sp,-12
20001e40:	c406                	sw	ra,8(sp)
20001e42:	25b5                	jal	200024ae <ll_conn_process_wake_up>
20001e44:	c511                	beqz	a0,20001e50 <Check_PwrOn_OnBbDmaIrq+0x1e>
20001e46:	200037b7          	lui	a5,0x20003
20001e4a:	4705                	li	a4,1
20001e4c:	f4e78523          	sb	a4,-182(a5) # 20002f4a <need_pwr_on>
20001e50:	200037b7          	lui	a5,0x20003
20001e54:	f617c783          	lbu	a5,-159(a5) # 20002f61 <stop_to_wait_prv>
20001e58:	0ff7f793          	zext.b	a5,a5
20001e5c:	e781                	bnez	a5,20001e64 <Check_PwrOn_OnBbDmaIrq+0x32>
20001e5e:	40a2                	lw	ra,8(sp)
20001e60:	0131                	addi	sp,sp,12
20001e62:	8082                	ret
20001e64:	e0003097          	auipc	ra,0xe0003
20001e68:	3a6080e7          	jalr	934(ra) # 520a <ll_sch_check_idle>
20001e6c:	d96d                	beqz	a0,20001e5e <Check_PwrOn_OnBbDmaIrq+0x2c>
20001e6e:	200037b7          	lui	a5,0x20003
20001e72:	4705                	li	a4,1
20001e74:	f6e78023          	sb	a4,-160(a5) # 20002f60 <stop_to_wait>
20001e78:	b7dd                	j	20001e5e <Check_PwrOn_OnBbDmaIrq+0x2c>

20001e7a <recover_bt_clk>:
20001e7a:	200037b7          	lui	a5,0x20003
20001e7e:	f627c783          	lbu	a5,-158(a5) # 20002f62 <trg_clk_cal>
20001e82:	c791                	beqz	a5,20001e8e <recover_bt_clk+0x14>
20001e84:	400007b7          	lui	a5,0x40000
20001e88:	4705                	li	a4,1
20001e8a:	06e78823          	sb	a4,112(a5) # 40000070 <__StackTop+0x1fffc070>
20001e8e:	420007b7          	lui	a5,0x42000
20001e92:	1007d783          	lhu	a5,256(a5) # 42000100 <__StackTop+0x21ffc100>
20001e96:	8b85                	andi	a5,a5,1
20001e98:	c791                	beqz	a5,20001ea4 <recover_bt_clk+0x2a>
20001e9a:	200037b7          	lui	a5,0x20003
20001e9e:	f487c783          	lbu	a5,-184(a5) # 20002f48 <is_bt_clk_en>
20001ea2:	e391                	bnez	a5,20001ea6 <recover_bt_clk+0x2c>
20001ea4:	8082                	ret
20001ea6:	1151                	addi	sp,sp,-12
20001ea8:	c406                	sw	ra,8(sp)
20001eaa:	c222                	sw	s0,4(sp)
20001eac:	400007b7          	lui	a5,0x40000
20001eb0:	0b07a403          	lw	s0,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
20001eb4:	040d                	addi	s0,s0,3
20001eb6:	200037b7          	lui	a5,0x20003
20001eba:	f587a583          	lw	a1,-168(a5) # 20002f58 <sleep_sync_rtc_cnt>
20001ebe:	8522                	mv	a0,s0
20001ec0:	e000a097          	auipc	ra,0xe000a
20001ec4:	c90080e7          	jalr	-880(ra) # bb50 <BT_TIMER_Diff>
20001ec8:	20002737          	lui	a4,0x20002
20001ecc:	67070713          	addi	a4,a4,1648 # 20002670 <VTIMER_Context>
20001ed0:	00675783          	lhu	a5,6(a4)
20001ed4:	07c2                	slli	a5,a5,0x10
20001ed6:	83c1                	srli	a5,a5,0x10
20001ed8:	02a787b3          	mul	a5,a5,a0
20001edc:	30000513          	li	a0,768
20001ee0:	02a7d7b3          	divu	a5,a5,a0
20001ee4:	20003737          	lui	a4,0x20003
20001ee8:	f5c72703          	lw	a4,-164(a4) # 20002f5c <sleep_sync_tick_cnt>
20001eec:	97ba                	add	a5,a5,a4
20001eee:	42000737          	lui	a4,0x42000
20001ef2:	14872823          	sw	s0,336(a4) # 42000150 <__StackTop+0x21ffc150>
20001ef6:	14f72a23          	sw	a5,340(a4)
20001efa:	4785                	li	a5,1
20001efc:	14f70023          	sb	a5,320(a4)
20001f00:	42000737          	lui	a4,0x42000
20001f04:	18474783          	lbu	a5,388(a4) # 42000184 <__StackTop+0x21ffc184>
20001f08:	8b91                	andi	a5,a5,4
20001f0a:	dfed                	beqz	a5,20001f04 <recover_bt_clk+0x8a>
20001f0c:	42000737          	lui	a4,0x42000
20001f10:	10075783          	lhu	a5,256(a4) # 42000100 <__StackTop+0x21ffc100>
20001f14:	07c2                	slli	a5,a5,0x10
20001f16:	83c1                	srli	a5,a5,0x10
20001f18:	0107e793          	ori	a5,a5,16
20001f1c:	10f71023          	sh	a5,256(a4)
20001f20:	4785                	li	a5,1
20001f22:	18f70023          	sb	a5,384(a4)
20001f26:	40a2                	lw	ra,8(sp)
20001f28:	4412                	lw	s0,4(sp)
20001f2a:	0131                	addi	sp,sp,12
20001f2c:	8082                	ret

20001f2e <calc_and_set_sleep_dur>:
20001f2e:	1151                	addi	sp,sp,-12
20001f30:	c406                	sw	ra,8(sp)
20001f32:	c222                	sw	s0,4(sp)
20001f34:	c026                	sw	s1,0(sp)
20001f36:	420007b7          	lui	a5,0x42000
20001f3a:	4685                	li	a3,1
20001f3c:	12d78023          	sb	a3,288(a5) # 42000120 <__StackTop+0x21ffc120>
20001f40:	1007d783          	lhu	a5,256(a5)
20001f44:	8b85                	andi	a5,a5,1
20001f46:	cf85                	beqz	a5,20001f7e <calc_and_set_sleep_dur+0x50>
20001f48:	42000737          	lui	a4,0x42000
20001f4c:	18474783          	lbu	a5,388(a4) # 42000184 <__StackTop+0x21ffc184>
20001f50:	8b89                	andi	a5,a5,2
20001f52:	dfed                	beqz	a5,20001f4c <calc_and_set_sleep_dur+0x1e>
20001f54:	420007b7          	lui	a5,0x42000
20001f58:	1307a683          	lw	a3,304(a5) # 42000130 <__StackTop+0x21ffc130>
20001f5c:	20003737          	lui	a4,0x20003
20001f60:	f4d72c23          	sw	a3,-168(a4) # 20002f58 <sleep_sync_rtc_cnt>
20001f64:	1347a583          	lw	a1,308(a5)
20001f68:	10078793          	addi	a5,a5,256
20001f6c:	20003737          	lui	a4,0x20003
20001f70:	f4b72e23          	sw	a1,-164(a4) # 20002f5c <sleep_sync_tick_cnt>
20001f74:	0807c783          	lbu	a5,128(a5)
20001f78:	0ff7f793          	zext.b	a5,a5
20001f7c:	e7bd                	bnez	a5,20001fea <calc_and_set_sleep_dur+0xbc>
20001f7e:	400007b7          	lui	a5,0x40000
20001f82:	0b87d783          	lhu	a5,184(a5) # 400000b8 <__StackTop+0x1fffc0b8>
20001f86:	8b85                	andi	a5,a5,1
20001f88:	4501                	li	a0,0
20001f8a:	cbb9                	beqz	a5,20001fe0 <calc_and_set_sleep_dur+0xb2>
20001f8c:	400007b7          	lui	a5,0x40000
20001f90:	0b47a403          	lw	s0,180(a5) # 400000b4 <__StackTop+0x1fffc0b4>
20001f94:	200037b7          	lui	a5,0x20003
20001f98:	4705                	li	a4,1
20001f9a:	f4e784a3          	sb	a4,-183(a5) # 20002f49 <is_vtimer_to>
20001f9e:	400007b7          	lui	a5,0x40000
20001fa2:	0b07a583          	lw	a1,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
20001fa6:	8522                	mv	a0,s0
20001fa8:	e000a097          	auipc	ra,0xe000a
20001fac:	ba8080e7          	jalr	-1112(ra) # bb50 <BT_TIMER_Diff>
20001fb0:	87aa                	mv	a5,a0
20001fb2:	50200713          	li	a4,1282
20001fb6:	4501                	li	a0,0
20001fb8:	02f75463          	bge	a4,a5,20001fe0 <calc_and_set_sleep_dur+0xb2>
20001fbc:	00075737          	lui	a4,0x75
20001fc0:	30070713          	addi	a4,a4,768 # 75300 <__FLASH_SIZE+0x35300>
20001fc4:	00f75363          	bge	a4,a5,20001fca <calc_and_set_sleep_dur+0x9c>
20001fc8:	87ba                	mv	a5,a4
20001fca:	40000737          	lui	a4,0x40000
20001fce:	0b072703          	lw	a4,176(a4) # 400000b0 <__StackTop+0x1fffc0b0>
20001fd2:	fdf78513          	addi	a0,a5,-33
20001fd6:	00a707b3          	add	a5,a4,a0
20001fda:	40080737          	lui	a4,0x40080
20001fde:	c35c                	sw	a5,4(a4)
20001fe0:	40a2                	lw	ra,8(sp)
20001fe2:	4412                	lw	s0,4(sp)
20001fe4:	4482                	lw	s1,0(sp)
20001fe6:	0131                	addi	sp,sp,12
20001fe8:	8082                	ret
20001fea:	420007b7          	lui	a5,0x42000
20001fee:	1147a503          	lw	a0,276(a5) # 42000114 <__StackTop+0x21ffc114>
20001ff2:	e000a097          	auipc	ra,0xe000a
20001ff6:	b5e080e7          	jalr	-1186(ra) # bb50 <BT_TIMER_Diff>
20001ffa:	06a05f63          	blez	a0,20002078 <calc_and_set_sleep_dur+0x14a>
20001ffe:	200027b7          	lui	a5,0x20002
20002002:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
20002006:	0067d403          	lhu	s0,6(a5)
2000200a:	01041713          	slli	a4,s0,0x10
2000200e:	8341                	srli	a4,a4,0x10
20002010:	00151793          	slli	a5,a0,0x1
20002014:	00a78433          	add	s0,a5,a0
20002018:	0422                	slli	s0,s0,0x8
2000201a:	02e45433          	divu	s0,s0,a4
2000201e:	200037b7          	lui	a5,0x20003
20002022:	f587a783          	lw	a5,-168(a5) # 20002f58 <sleep_sync_rtc_cnt>
20002026:	943e                	add	s0,s0,a5
20002028:	400007b7          	lui	a5,0x40000
2000202c:	0b87d783          	lhu	a5,184(a5) # 400000b8 <__StackTop+0x1fffc0b8>
20002030:	8b85                	andi	a5,a5,1
20002032:	d7b5                	beqz	a5,20001f9e <calc_and_set_sleep_dur+0x70>
20002034:	400007b7          	lui	a5,0x40000
20002038:	0b47a483          	lw	s1,180(a5) # 400000b4 <__StackTop+0x1fffc0b4>
2000203c:	85a6                	mv	a1,s1
2000203e:	8522                	mv	a0,s0
20002040:	e000a097          	auipc	ra,0xe000a
20002044:	af6080e7          	jalr	-1290(ra) # bb36 <BT_TIMER_TimerPast>
20002048:	e119                	bnez	a0,2000204e <calc_and_set_sleep_dur+0x120>
2000204a:	8426                	mv	s0,s1
2000204c:	b7a1                	j	20001f94 <calc_and_set_sleep_dur+0x66>
2000204e:	85a2                	mv	a1,s0
20002050:	8526                	mv	a0,s1
20002052:	e000a097          	auipc	ra,0xe000a
20002056:	afe080e7          	jalr	-1282(ra) # bb50 <BT_TIMER_Diff>
2000205a:	61900793          	li	a5,1561
2000205e:	f4a7c0e3          	blt	a5,a0,20001f9e <calc_and_set_sleep_dur+0x70>
20002062:	200037b7          	lui	a5,0x20003
20002066:	4705                	li	a4,1
20002068:	f4e784a3          	sb	a4,-183(a5) # 20002f49 <is_vtimer_to>
2000206c:	bf0d                	j	20001f9e <calc_and_set_sleep_dur+0x70>
2000206e:	400007b7          	lui	a5,0x40000
20002072:	0b47a403          	lw	s0,180(a5) # 400000b4 <__StackTop+0x1fffc0b4>
20002076:	bf39                	j	20001f94 <calc_and_set_sleep_dur+0x66>
20002078:	400007b7          	lui	a5,0x40000
2000207c:	0b87d783          	lhu	a5,184(a5) # 400000b8 <__StackTop+0x1fffc0b8>
20002080:	8b85                	andi	a5,a5,1
20002082:	f7f5                	bnez	a5,2000206e <calc_and_set_sleep_dur+0x140>
20002084:	4501                	li	a0,0
20002086:	bfa9                	j	20001fe0 <calc_and_set_sleep_dur+0xb2>

20002088 <System_Pwr_Cfg>:
20002088:	400007b7          	lui	a5,0x40000
2000208c:	4725                	li	a4,9
2000208e:	c3d8                	sw	a4,4(a5)
20002090:	4775                	li	a4,29
20002092:	d398                	sw	a4,32(a5)
20002094:	471d                	li	a4,7
20002096:	d798                	sw	a4,40(a5)
20002098:	6705                	lui	a4,0x1
2000209a:	30270713          	addi	a4,a4,770 # 1302 <__STACK_SIZE+0xf02>
2000209e:	d7d8                	sw	a4,44(a5)
200020a0:	8082                	ret

200020a2 <t1001_sleep_restore_reg_info>:
200020a2:	0ff57793          	zext.b	a5,a0
200020a6:	0ff57513          	zext.b	a0,a0
200020aa:	02b57863          	bgeu	a0,a1,200020da <t1001_sleep_restore_reg_info+0x38>
200020ae:	20003737          	lui	a4,0x20003
200020b2:	f4072603          	lw	a2,-192(a4) # 20002f40 <g_save_buf>
200020b6:	200016b7          	lui	a3,0x20001
200020ba:	f7468693          	addi	a3,a3,-140 # 20000f74 <cr_regs_addr_list>
200020be:	050a                	slli	a0,a0,0x2
200020c0:	9532                	add	a0,a0,a2
200020c2:	4108                	lw	a0,0(a0)
200020c4:	00279713          	slli	a4,a5,0x2
200020c8:	9736                	add	a4,a4,a3
200020ca:	4318                	lw	a4,0(a4)
200020cc:	c308                	sw	a0,0(a4)
200020ce:	0785                	addi	a5,a5,1 # 40000001 <__StackTop+0x1fffc001>
200020d0:	0ff7f793          	zext.b	a5,a5
200020d4:	853e                	mv	a0,a5
200020d6:	feb7e4e3          	bltu	a5,a1,200020be <t1001_sleep_restore_reg_info+0x1c>
200020da:	200037b7          	lui	a5,0x20003
200020de:	f547a783          	lw	a5,-172(a5) # 20002f54 <restore_more_ext_cr_regs>
200020e2:	c799                	beqz	a5,200020f0 <t1001_sleep_restore_reg_info+0x4e>
200020e4:	1151                	addi	sp,sp,-12
200020e6:	c406                	sw	ra,8(sp)
200020e8:	9782                	jalr	a5
200020ea:	40a2                	lw	ra,8(sp)
200020ec:	0131                	addi	sp,sp,12
200020ee:	8082                	ret
200020f0:	8082                	ret

200020f2 <Check_PwrOn_OtpFlash>:
200020f2:	1151                	addi	sp,sp,-12
200020f4:	c406                	sw	ra,8(sp)
200020f6:	45c1                	li	a1,16
200020f8:	4501                	li	a0,0
200020fa:	3765                	jal	200020a2 <t1001_sleep_restore_reg_info>
200020fc:	3cb5                	jal	20001b78 <RF_OnChip_Base_Init>
200020fe:	3681                	jal	20001c3e <RF_OnChip_Cali_Cfg>
20002100:	3bad                	jal	20001e7a <recover_bt_clk>
20002102:	400007b7          	lui	a5,0x40000
20002106:	0b07a703          	lw	a4,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
2000210a:	200037b7          	lui	a5,0x20003
2000210e:	f2e7ac23          	sw	a4,-200(a5) # 20002f38 <clk_cal_tm_af_wakeup>
20002112:	200037b7          	lui	a5,0x20003
20002116:	f4078523          	sb	zero,-182(a5) # 20002f4a <need_pwr_on>
2000211a:	200037b7          	lui	a5,0x20003
2000211e:	f6078023          	sb	zero,-160(a5) # 20002f60 <stop_to_wait>
20002122:	200037b7          	lui	a5,0x20003
20002126:	f60780a3          	sb	zero,-159(a5) # 20002f61 <stop_to_wait_prv>
2000212a:	400807b7          	lui	a5,0x40080
2000212e:	4fdc                	lw	a5,28(a5)
20002130:	ebb9                	bnez	a5,20002186 <Check_PwrOn_OtpFlash+0x94>
20002132:	200037b7          	lui	a5,0x20003
20002136:	f497c783          	lbu	a5,-183(a5) # 20002f49 <is_vtimer_to>
2000213a:	e7b1                	bnez	a5,20002186 <Check_PwrOn_OtpFlash+0x94>
2000213c:	30046073          	csrsi	mstatus,8
20002140:	200037b7          	lui	a5,0x20003
20002144:	f4a7c783          	lbu	a5,-182(a5) # 20002f4a <need_pwr_on>
20002148:	0ff7f793          	zext.b	a5,a5
2000214c:	e3b1                	bnez	a5,20002190 <Check_PwrOn_OtpFlash+0x9e>
2000214e:	200037b7          	lui	a5,0x20003
20002152:	f607c783          	lbu	a5,-160(a5) # 20002f60 <stop_to_wait>
20002156:	0ff7f793          	zext.b	a5,a5
2000215a:	eb9d                	bnez	a5,20002190 <Check_PwrOn_OtpFlash+0x9e>
2000215c:	20003737          	lui	a4,0x20003
20002160:	200036b7          	lui	a3,0x20003
20002164:	10500073          	wfi
20002168:	f4a70793          	addi	a5,a4,-182 # 20002f4a <need_pwr_on>
2000216c:	0007c783          	lbu	a5,0(a5)
20002170:	0ff7f793          	zext.b	a5,a5
20002174:	ef91                	bnez	a5,20002190 <Check_PwrOn_OtpFlash+0x9e>
20002176:	f6068793          	addi	a5,a3,-160 # 20002f60 <stop_to_wait>
2000217a:	0007c783          	lbu	a5,0(a5)
2000217e:	0ff7f793          	zext.b	a5,a5
20002182:	d3ed                	beqz	a5,20002164 <Check_PwrOn_OtpFlash+0x72>
20002184:	a031                	j	20002190 <Check_PwrOn_OtpFlash+0x9e>
20002186:	200037b7          	lui	a5,0x20003
2000218a:	4705                	li	a4,1
2000218c:	f4e78523          	sb	a4,-182(a5) # 20002f4a <need_pwr_on>
20002190:	40a2                	lw	ra,8(sp)
20002192:	0131                	addi	sp,sp,12
20002194:	8082                	ret

20002196 <T1001_ChipSleepCriticalWork>:
20002196:	fa410113          	addi	sp,sp,-92
2000219a:	cc86                	sw	ra,88(sp)
2000219c:	caa2                	sw	s0,84(sp)
2000219e:	200037b7          	lui	a5,0x20003
200021a2:	f427a023          	sw	sp,-192(a5) # 20002f40 <g_save_buf>
200021a6:	200017b7          	lui	a5,0x20001
200021aa:	f7478793          	addi	a5,a5,-140 # 20000f74 <cr_regs_addr_list>
200021ae:	870a                	mv	a4,sp
200021b0:	05078613          	addi	a2,a5,80
200021b4:	4394                	lw	a3,0(a5)
200021b6:	4294                	lw	a3,0(a3)
200021b8:	c314                	sw	a3,0(a4)
200021ba:	0791                	addi	a5,a5,4
200021bc:	0711                	addi	a4,a4,4
200021be:	fec79be3          	bne	a5,a2,200021b4 <T1001_ChipSleepCriticalWork+0x1e>
200021c2:	5782                	lw	a5,32(sp)
200021c4:	9bbd                	andi	a5,a5,-17
200021c6:	d03e                	sw	a5,32(sp)
200021c8:	420007b7          	lui	a5,0x42000
200021cc:	1807c703          	lbu	a4,384(a5) # 42000180 <__StackTop+0x21ffc180>
200021d0:	200037b7          	lui	a5,0x20003
200021d4:	f4e78423          	sb	a4,-184(a5) # 20002f48 <is_bt_clk_en>
200021d8:	400807b7          	lui	a5,0x40080
200021dc:	00c7d703          	lhu	a4,12(a5) # 4008000c <__StackTop+0x2007c00c>
200021e0:	40076713          	ori	a4,a4,1024
200021e4:	00e79623          	sh	a4,12(a5)
200021e8:	6735                	lui	a4,0xd
200021ea:	93e70713          	addi	a4,a4,-1730 # c93e <CS_contextRestore>
200021ee:	d398                	sw	a4,32(a5)
200021f0:	200037b7          	lui	a5,0x20003
200021f4:	f647a503          	lw	a0,-156(a5) # 20002f64 <unused_gpio_mask_when_sleep>
200021f8:	e000a097          	auipc	ra,0xe000a
200021fc:	5f6080e7          	jalr	1526(ra) # c7ee <unused_gpio_mask_parse_and_set>
20002200:	200017b7          	lui	a5,0x20001
20002204:	fc47c503          	lbu	a0,-60(a5) # 20000fc4 <gpio_vdd_pin1>
20002208:	0ff00793          	li	a5,255
2000220c:	04f51963          	bne	a0,a5,2000225e <T1001_ChipSleepCriticalWork+0xc8>
20002210:	200017b7          	lui	a5,0x20001
20002214:	fc57c503          	lbu	a0,-59(a5) # 20000fc5 <gpio_vdd_pin2>
20002218:	0ff00793          	li	a5,255
2000221c:	04f51463          	bne	a0,a5,20002264 <T1001_ChipSleepCriticalWork+0xce>
20002220:	40080437          	lui	s0,0x40080
20002224:	04c45783          	lhu	a5,76(s0) # 4008004c <__StackTop+0x2007c04c>
20002228:	0017e793          	ori	a5,a5,1
2000222c:	04f41623          	sh	a5,76(s0)
20002230:	447c                	lw	a5,76(s0)
20002232:	eff7f793          	andi	a5,a5,-257
20002236:	c47c                	sw	a5,76(s0)
20002238:	12442783          	lw	a5,292(s0)
2000223c:	9bdd                	andi	a5,a5,-9
2000223e:	12f42223          	sw	a5,292(s0)
20002242:	4509                	li	a0,2
20002244:	e000a097          	auipc	ra,0xe000a
20002248:	692080e7          	jalr	1682(ra) # c8d6 <delay_us>
2000224c:	12442783          	lw	a5,292(s0)
20002250:	9bed                	andi	a5,a5,-5
20002252:	12f42223          	sw	a5,292(s0)
20002256:	7479                	lui	s0,0xffffe
20002258:	0ff40413          	addi	s0,s0,255 # ffffe0ff <__StackTop+0xdfffa0ff>
2000225c:	a0b1                	j	200022a8 <T1001_ChipSleepCriticalWork+0x112>
2000225e:	9c8ff0ef          	jal	20001426 <flash_power_off>
20002262:	b77d                	j	20002210 <T1001_ChipSleepCriticalWork+0x7a>
20002264:	9c2ff0ef          	jal	20001426 <flash_power_off>
20002268:	bf65                	j	20002220 <T1001_ChipSleepCriticalWork+0x8a>
2000226a:	8d2ff0ef          	jal	2000133c <VTIMER_ClkCali_Wait>
2000226e:	200037b7          	lui	a5,0x20003
20002272:	f6078123          	sb	zero,-158(a5) # 20002f62 <trg_clk_cal>
20002276:	a0b9                	j	200022c4 <T1001_ChipSleepCriticalWork+0x12e>
20002278:	400807b7          	lui	a5,0x40080
2000227c:	04078423          	sb	zero,72(a5) # 40080048 <__StackTop+0x2007c048>
20002280:	3d8d                	jal	200020f2 <Check_PwrOn_OtpFlash>
20002282:	200037b7          	lui	a5,0x20003
20002286:	f4a7c783          	lbu	a5,-182(a5) # 20002f4a <need_pwr_on>
2000228a:	0ff7f793          	zext.b	a5,a5
2000228e:	0e079663          	bnez	a5,2000237a <T1001_ChipSleepCriticalWork+0x1e4>
20002292:	3971                	jal	20001f2e <calc_and_set_sleep_dur>
20002294:	c555                	beqz	a0,20002340 <T1001_ChipSleepCriticalWork+0x1aa>
20002296:	420007b7          	lui	a5,0x42000
2000229a:	1147a703          	lw	a4,276(a5) # 42000114 <__StackTop+0x21ffc114>
2000229e:	200037b7          	lui	a5,0x20003
200022a2:	f407a783          	lw	a5,-192(a5) # 20002f40 <g_save_buf>
200022a6:	d3d8                	sw	a4,36(a5)
200022a8:	40080737          	lui	a4,0x40080
200022ac:	10472783          	lw	a5,260(a4) # 40080104 <__StackTop+0x2007c104>
200022b0:	8fe1                	and	a5,a5,s0
200022b2:	6685                	lui	a3,0x1
200022b4:	8fd5                	or	a5,a5,a3
200022b6:	10f72223          	sw	a5,260(a4)
200022ba:	200037b7          	lui	a5,0x20003
200022be:	f627c783          	lbu	a5,-158(a5) # 20002f62 <trg_clk_cal>
200022c2:	f7c5                	bnez	a5,2000226a <T1001_ChipSleepCriticalWork+0xd4>
200022c4:	9eeff0ef          	jal	200014b2 <omw_dpslp_bf_slp>
200022c8:	e000a097          	auipc	ra,0xe000a
200022cc:	62e080e7          	jalr	1582(ra) # c8f6 <CS_contextSave>
200022d0:	9e4ff0ef          	jal	200014b4 <omw_dpslp_af_slp>
200022d4:	42002737          	lui	a4,0x42002
200022d8:	435c                	lw	a5,4(a4)
200022da:	9bf5                	andi	a5,a5,-3
200022dc:	c35c                	sw	a5,4(a4)
200022de:	336d                	jal	20002088 <System_Pwr_Cfg>
200022e0:	40080737          	lui	a4,0x40080
200022e4:	10472783          	lw	a5,260(a4) # 40080104 <__StackTop+0x2007c104>
200022e8:	8fe1                	and	a5,a5,s0
200022ea:	6007e793          	ori	a5,a5,1536
200022ee:	10f72223          	sw	a5,260(a4)
200022f2:	200027b7          	lui	a5,0x20002
200022f6:	67078793          	addi	a5,a5,1648 # 20002670 <VTIMER_Context>
200022fa:	0087d703          	lhu	a4,8(a5)
200022fe:	0742                	slli	a4,a4,0x10
20002300:	8341                	srli	a4,a4,0x10
20002302:	00e79323          	sh	a4,6(a5)
20002306:	200037b7          	lui	a5,0x20003
2000230a:	f387a783          	lw	a5,-200(a5) # 20002f38 <clk_cal_tm_af_wakeup>
2000230e:	20003737          	lui	a4,0x20003
20002312:	f3c72703          	lw	a4,-196(a4) # 20002f3c <clk_cal_tm_bf_sleep>
20002316:	8f99                	sub	a5,a5,a4
20002318:	473d                	li	a4,15
2000231a:	f4f77fe3          	bgeu	a4,a5,20002278 <T1001_ChipSleepCriticalWork+0xe2>
2000231e:	4515                	li	a0,5
20002320:	ff5fe0ef          	jal	20001314 <VTIMER_ClkCali_Trigger>
20002324:	200037b7          	lui	a5,0x20003
20002328:	4705                	li	a4,1
2000232a:	f6e78123          	sb	a4,-158(a5) # 20002f62 <trg_clk_cal>
2000232e:	200037b7          	lui	a5,0x20003
20002332:	f387a703          	lw	a4,-200(a5) # 20002f38 <clk_cal_tm_af_wakeup>
20002336:	200037b7          	lui	a5,0x20003
2000233a:	f2e7ae23          	sw	a4,-196(a5) # 20002f3c <clk_cal_tm_bf_sleep>
2000233e:	bf2d                	j	20002278 <T1001_ChipSleepCriticalWork+0xe2>
20002340:	40080437          	lui	s0,0x40080
20002344:	12442783          	lw	a5,292(s0) # 40080124 <__StackTop+0x2007c124>
20002348:	0047e793          	ori	a5,a5,4
2000234c:	12f42223          	sw	a5,292(s0)
20002350:	4509                	li	a0,2
20002352:	e000a097          	auipc	ra,0xe000a
20002356:	584080e7          	jalr	1412(ra) # c8d6 <delay_us>
2000235a:	12442783          	lw	a5,292(s0)
2000235e:	0087e793          	ori	a5,a5,8
20002362:	12f42223          	sw	a5,292(s0)
20002366:	447c                	lw	a5,76(s0)
20002368:	1007e793          	ori	a5,a5,256
2000236c:	c47c                	sw	a5,76(s0)
2000236e:	04c45783          	lhu	a5,76(s0)
20002372:	9bf9                	andi	a5,a5,-2
20002374:	04f41623          	sh	a5,76(s0)
20002378:	a001                	j	20002378 <T1001_ChipSleepCriticalWork+0x1e2>
2000237a:	45d1                	li	a1,20
2000237c:	4541                	li	a0,16
2000237e:	3315                	jal	200020a2 <t1001_sleep_restore_reg_info>
20002380:	200037b7          	lui	a5,0x20003
20002384:	f507a783          	lw	a5,-176(a5) # 20002f50 <qspi_regs_restore_ptr>
20002388:	9782                	jalr	a5
2000238a:	200037b7          	lui	a5,0x20003
2000238e:	f447a783          	lw	a5,-188(a5) # 20002f44 <gpio_regs_restore_before_rel_gpio_hold_ptr>
20002392:	9782                	jalr	a5
20002394:	40080437          	lui	s0,0x40080
20002398:	12442783          	lw	a5,292(s0) # 40080124 <__StackTop+0x2007c124>
2000239c:	0047e793          	ori	a5,a5,4
200023a0:	12f42223          	sw	a5,292(s0)
200023a4:	4509                	li	a0,2
200023a6:	e000a097          	auipc	ra,0xe000a
200023aa:	530080e7          	jalr	1328(ra) # c8d6 <delay_us>
200023ae:	12442783          	lw	a5,292(s0)
200023b2:	0087e793          	ori	a5,a5,8
200023b6:	12f42223          	sw	a5,292(s0)
200023ba:	447c                	lw	a5,76(s0)
200023bc:	1007e793          	ori	a5,a5,256
200023c0:	c47c                	sw	a5,76(s0)
200023c2:	04c45783          	lhu	a5,76(s0)
200023c6:	9bf9                	andi	a5,a5,-2
200023c8:	04f41623          	sh	a5,76(s0)
200023cc:	200037b7          	lui	a5,0x20003
200023d0:	f4c7a783          	lw	a5,-180(a5) # 20002f4c <otp_init_ptr>
200023d4:	9782                	jalr	a5
200023d6:	1f400513          	li	a0,500
200023da:	e000a097          	auipc	ra,0xe000a
200023de:	4fc080e7          	jalr	1276(ra) # c8d6 <delay_us>
200023e2:	400007b7          	lui	a5,0x40000
200023e6:	4721                	li	a4,8
200023e8:	c3d8                	sw	a4,4(a5)
200023ea:	02042023          	sw	zero,32(s0)
200023ee:	40e6                	lw	ra,88(sp)
200023f0:	4456                	lw	s0,84(sp)
200023f2:	05c10113          	addi	sp,sp,92
200023f6:	8082                	ret

200023f8 <omw_sleep_set_force_sleep>:
200023f8:	1131                	addi	sp,sp,-20
200023fa:	c806                	sw	ra,16(sp)
200023fc:	c622                	sw	s0,12(sp)
200023fe:	c426                	sw	s1,8(sp)
20002400:	84aa                	mv	s1,a0
20002402:	c02e                	sw	a1,0(sp)
20002404:	c232                	sw	a2,4(sp)
20002406:	40080437          	lui	s0,0x40080
2000240a:	02042023          	sw	zero,32(s0) # 40080020 <__StackTop+0x2007c020>
2000240e:	121317b7          	lui	a5,0x12131
20002412:	41578793          	addi	a5,a5,1045 # 12131415 <__etext+0x212cdd5>
20002416:	d05c                	sw	a5,36(s0)
20002418:	400007b7          	lui	a5,0x40000
2000241c:	0b07a783          	lw	a5,176(a5) # 400000b0 <__StackTop+0x1fffc0b0>
20002420:	d41c                	sw	a5,40(s0)
20002422:	00c45783          	lhu	a5,12(s0)
20002426:	bff7f793          	andi	a5,a5,-1025
2000242a:	00f41623          	sh	a5,12(s0)
2000242e:	57fd                	li	a5,-1
20002430:	c05c                	sw	a5,4(s0)
20002432:	47ad                	li	a5,11
20002434:	00f40023          	sb	a5,0(s0)
20002438:	4509                	li	a0,2
2000243a:	eb5fe0ef          	jal	200012ee <delay_ms>
2000243e:	4581                	li	a1,0
20002440:	8526                	mv	a0,s1
20002442:	effff097          	auipc	ra,0xeffff
20002446:	3d2080e7          	jalr	978(ra) # 10001814 <t1001_cfg_wakeup_gpio>
2000244a:	4585                	li	a1,1
2000244c:	4502                	lw	a0,0(sp)
2000244e:	effff097          	auipc	ra,0xeffff
20002452:	3c6080e7          	jalr	966(ra) # 10001814 <t1001_cfg_wakeup_gpio>
20002456:	4512                	lw	a0,4(sp)
20002458:	e000a097          	auipc	ra,0xe000a
2000245c:	396080e7          	jalr	918(ra) # c7ee <unused_gpio_mask_parse_and_set>
20002460:	04c45783          	lhu	a5,76(s0)
20002464:	0017e793          	ori	a5,a5,1
20002468:	04f41623          	sh	a5,76(s0)
2000246c:	447c                	lw	a5,76(s0)
2000246e:	eff7f793          	andi	a5,a5,-257
20002472:	c47c                	sw	a5,76(s0)
20002474:	4785                	li	a5,1
20002476:	04f40423          	sb	a5,72(s0)
2000247a:	10500073          	wfi
2000247e:	40c2                	lw	ra,16(sp)
20002480:	4432                	lw	s0,12(sp)
20002482:	44a2                	lw	s1,8(sp)
20002484:	0151                	addi	sp,sp,20
20002486:	8082                	ret

20002488 <hci_core_sleep_check>:
20002488:	200017b7          	lui	a5,0x20001
2000248c:	8e47a783          	lw	a5,-1820(a5) # 200008e4 <bt_dev+0x84>
20002490:	4501                	li	a0,0
20002492:	c391                	beqz	a5,20002496 <hci_core_sleep_check+0xe>
20002494:	8082                	ret
20002496:	200017b7          	lui	a5,0x20001
2000249a:	8dc7a503          	lw	a0,-1828(a5) # 200008dc <bt_dev+0x7c>
2000249e:	00153513          	seqz	a0,a0
200024a2:	bfcd                	j	20002494 <hci_core_sleep_check+0xc>

200024a4 <ll_conn_is_connected_before_sleep>:
200024a4:	200037b7          	lui	a5,0x20003
200024a8:	f707c503          	lbu	a0,-144(a5) # 20002f70 <ll_conn_status>
200024ac:	8082                	ret

200024ae <ll_conn_process_wake_up>:
200024ae:	1151                	addi	sp,sp,-12
200024b0:	c406                	sw	ra,8(sp)
200024b2:	4501                	li	a0,0
200024b4:	e0000097          	auipc	ra,0xe0000
200024b8:	6e0080e7          	jalr	1760(ra) # 2b94 <ll_conn_set_get>
200024bc:	00054703          	lbu	a4,0(a0)
200024c0:	200037b7          	lui	a5,0x20003
200024c4:	f707c783          	lbu	a5,-144(a5) # 20002f70 <ll_conn_status>
200024c8:	4505                	li	a0,1
200024ca:	00f70563          	beq	a4,a5,200024d4 <ll_conn_process_wake_up+0x26>
200024ce:	40a2                	lw	ra,8(sp)
200024d0:	0131                	addi	sp,sp,12
200024d2:	8082                	ret
200024d4:	f39fe0ef          	jal	2000140c <Bt_SleepMode_Check>
200024d8:	00153513          	seqz	a0,a0
200024dc:	bfcd                	j	200024ce <ll_conn_process_wake_up+0x20>

200024de <ll_adv_process_wake_up>:
200024de:	200007b7          	lui	a5,0x20000
200024e2:	7007c503          	lbu	a0,1792(a5) # 20000700 <ll_adv+0x4>
200024e6:	00153513          	seqz	a0,a0
200024ea:	8082                	ret

200024ec <Bt_Controller_SleepMode_Check>:
200024ec:	1151                	addi	sp,sp,-12
200024ee:	c406                	sw	ra,8(sp)
200024f0:	e0009097          	auipc	ra,0xe0009
200024f4:	35c080e7          	jalr	860(ra) # b84c <hci_driver_node_rx_get>
200024f8:	4781                	li	a5,0
200024fa:	c509                	beqz	a0,20002504 <Bt_Controller_SleepMode_Check+0x18>
200024fc:	853e                	mv	a0,a5
200024fe:	40a2                	lw	ra,8(sp)
20002500:	0131                	addi	sp,sp,12
20002502:	8082                	ret
20002504:	e0000097          	auipc	ra,0xe0000
20002508:	f70080e7          	jalr	-144(ra) # 2474 <ll_check_allow_sleep>
2000250c:	4781                	li	a5,0
2000250e:	d57d                	beqz	a0,200024fc <Bt_Controller_SleepMode_Check+0x10>
20002510:	e0003097          	auipc	ra,0xe0003
20002514:	cfa080e7          	jalr	-774(ra) # 520a <ll_sch_check_idle>
20002518:	4785                	li	a5,1
2000251a:	d16d                	beqz	a0,200024fc <Bt_Controller_SleepMode_Check+0x10>
2000251c:	e0009097          	auipc	ra,0xe0009
20002520:	748080e7          	jalr	1864(ra) # bc64 <BtTimer_SleepMode_Check>
20002524:	87aa                	mv	a5,a0
20002526:	bfd9                	j	200024fc <Bt_Controller_SleepMode_Check+0x10>
