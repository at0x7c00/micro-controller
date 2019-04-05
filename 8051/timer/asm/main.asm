;Delay(unsigned int ms);
;参数ms:毫秒数,使用R0和R1保存
		
		ORG 0
FORVER:
		MOV R1,#0E8H
		MOV R0,#3H
		ACALL Delay
		CPL P2.0
		SJMP FORVER
Delay:
		;ms--
		CLR C				;1
		MOV A,R1			;1
		SUBB A,#01H			;2
		JNC NEXT 			;2
		MOV R1,#0FFH		;2有借位，低位设置成FF
NEXT:		
		MOV R1,A			;1保存低位
		
		MOV A,R0			;1
		SUBB A,#00H			;2有借位，则高位减1
		MOV R0,A			;1保存高位
		
		CJNE R1,#0H,HERE	;3高位或者低位不为零，则执行定时器
		CJNE R0,#0H,HERE	;3
		
		SJMP EXIT			;2 ms==0，退出循环，函数退出
		
HERE:	MOV TL0,#39H		;2
		MOV TH0,#0FCH		;2
		MOV TMOD,#01H		;2
		
		SETB TR0			;1  启动定时器
AGAIN:	JNB TF0,AGAIN		;X+1监控溢出位
		CLR TR0				;1  停止定时器
		CLR TF0				;1  清空溢出位
		
		SJMP Delay			;2
EXIT:
		RET					;2
		END