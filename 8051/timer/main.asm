;Delay(int ms);
;����ms:������,ʹ��R0��R1����
;����Ƶ��:11.0592MHz

Delay:

_Delay1:
		

HERE:	MOV TL0,#0FCH		;2
		MOV TH0,#04CH		;2
		
		ACALL _Delay0		;2
		SJMP  HERE			;2


_Delay0:
		SETB TR0			;1  ������ʱ��
AGAIN:	JNB TF0,AGAIN		;X+1������λ
		CLR TR0				;1  ֹͣ��ʱ��
		CLR TF0				;1  ������λ
		RET					;2

;2+2+2+2+1+1+1+2 = 13
;X + 1 + 13
1ms = 1000us
1.0403us
1000us / 1.0403 = 961
;����Ҫ961�μ�������ʾ1ms

x  + 1 + 13 = 961
����x = 961 - 14
      = 947
	  = 03B3H
FFFFH - 03B3H = FC4CH


	  
