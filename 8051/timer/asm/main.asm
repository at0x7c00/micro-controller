;Delay(unsigned int ms);
;����ms:������,ʹ��R0��R1����
		
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
		MOV R1,#0FFH		;2�н�λ����λ���ó�FF
NEXT:		
		MOV R1,A			;1�����λ
		
		MOV A,R0			;1
		SUBB A,#00H			;2�н�λ�����λ��1
		MOV R0,A			;1�����λ
		
		CJNE R1,#0H,HERE	;3��λ���ߵ�λ��Ϊ�㣬��ִ�ж�ʱ��
		CJNE R0,#0H,HERE	;3
		
		SJMP EXIT			;2 ms==0���˳�ѭ���������˳�
		
HERE:	MOV TL0,#39H		;2
		MOV TH0,#0FCH		;2
		MOV TMOD,#01H		;2
		
		SETB TR0			;1  ������ʱ��
AGAIN:	JNB TF0,AGAIN		;X+1������λ
		CLR TR0				;1  ֹͣ��ʱ��
		CLR TF0				;1  ������λ
		
		SJMP Delay			;2
EXIT:
		RET					;2
		END