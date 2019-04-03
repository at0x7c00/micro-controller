;Delay(int ms);
;参数ms:毫秒数,使用R0和R1保存
;晶振频率:11.0592MHz

Delay:

_Delay1:
		

HERE:	MOV TL0,#0FCH		;2
		MOV TH0,#04CH		;2
		
		ACALL _Delay0		;2
		SJMP  HERE			;2


_Delay0:
		SETB TR0			;1  启动定时器
AGAIN:	JNB TF0,AGAIN		;X+1监控溢出位
		CLR TR0				;1  停止定时器
		CLR TF0				;1  清空溢出位
		RET					;2

;2+2+2+2+1+1+1+2 = 13
;X + 1 + 13
1ms = 1000us
1.0403us
1000us / 1.0403 = 961
;即需要961次计数来表示1ms

x  + 1 + 13 = 961
所以x = 961 - 14
      = 947
	  = 03B3H
FFFFH - 03B3H = FC4CH


	  
