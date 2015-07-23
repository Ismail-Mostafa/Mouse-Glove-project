
_main:

;MyProject.c,14 :: 		void main() {
;MyProject.c,25 :: 		i=1;j=1;m=1;k=1;
	BSF        main_i_L0+0, BitPos(main_i_L0+0)
	BSF        main_j_L0+0, BitPos(main_j_L0+0)
	BSF        main_m_L0+0, BitPos(main_m_L0+0)
	BSF        main_k_L0+0, BitPos(main_k_L0+0)
;MyProject.c,26 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,27 :: 		uart1_write('m');
	MOVLW      109
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,28 :: 		lcd_init();
	CALL       _Lcd_Init+0
;MyProject.c,30 :: 		for(;;)
L_main0:
;MyProject.c,32 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;MyProject.c,33 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main3:
	MOVLW      128
	XORWF      main_zz_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      20
	SUBWF      main_zz_L0+0, 0
L__main44:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;MyProject.c,35 :: 		ave[zz]=adc_read(1)*0.05;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FLOC__main+0
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;MyProject.c,36 :: 		sum=ave[zz]+sum;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      main_sum_L0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_sum_L0+1, 1
;MyProject.c,33 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;MyProject.c,37 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,38 :: 		sum=sum/20;
	MOVLW      20
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_sum_L0+0, 0
	MOVWF      R0+0
	MOVF       main_sum_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_sum_L0+0
	MOVF       R0+1, 0
	MOVWF      main_sum_L0+1
;MyProject.c,39 :: 		rc=sum;
	MOVF       R0+0, 0
	MOVWF      main_rc_L0+0
	MOVF       R0+1, 0
	MOVWF      main_rc_L0+1
;MyProject.c,41 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;MyProject.c,42 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main6:
	MOVLW      128
	XORWF      main_zz_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      20
	SUBWF      main_zz_L0+0, 0
L__main45:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,44 :: 		ave[zz]=adc_read(0)*0.05;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FLOC__main+0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;MyProject.c,45 :: 		sum=ave[zz]+sum;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      main_sum_L0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_sum_L0+1, 1
;MyProject.c,42 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;MyProject.c,46 :: 		}
	GOTO       L_main6
L_main7:
;MyProject.c,47 :: 		sum=sum/20;
	MOVLW      20
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_sum_L0+0, 0
	MOVWF      R0+0
	MOVF       main_sum_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_sum_L0+0
	MOVF       R0+1, 0
	MOVWF      main_sum_L0+1
;MyProject.c,48 :: 		lc=sum;
	MOVF       R0+0, 0
	MOVWF      main_lc_L0+0
	MOVF       R0+1, 0
	MOVWF      main_lc_L0+1
;MyProject.c,50 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;MyProject.c,51 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main9:
	MOVLW      128
	XORWF      main_zz_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      20
	SUBWF      main_zz_L0+0, 0
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;MyProject.c,53 :: 		ave[zz]=adc_read(4)*0.05;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FLOC__main+0
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;MyProject.c,54 :: 		sum=ave[zz]+sum;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      main_sum_L0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_sum_L0+1, 1
;MyProject.c,51 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;MyProject.c,55 :: 		}
	GOTO       L_main9
L_main10:
;MyProject.c,56 :: 		sum=sum/20;
	MOVLW      20
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_sum_L0+0, 0
	MOVWF      R0+0
	MOVF       main_sum_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_sum_L0+0
	MOVF       R0+1, 0
	MOVWF      main_sum_L0+1
;MyProject.c,57 :: 		x=sum;
	MOVF       R0+0, 0
	MOVWF      main_x_L0+0
	MOVF       R0+1, 0
	MOVWF      main_x_L0+1
;MyProject.c,59 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;MyProject.c,60 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main12:
	MOVLW      128
	XORWF      main_zz_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      20
	SUBWF      main_zz_L0+0, 0
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;MyProject.c,62 :: 		ave[zz]=adc_read(3)*0.05;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FLOC__main+0
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;MyProject.c,63 :: 		sum=ave[zz]+sum;
	MOVF       main_zz_L0+0, 0
	MOVWF      R0+0
	MOVF       main_zz_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_ave_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      main_sum_L0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_sum_L0+1, 1
;MyProject.c,60 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;MyProject.c,64 :: 		}
	GOTO       L_main12
L_main13:
;MyProject.c,65 :: 		sum=sum/20;
	MOVLW      20
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_sum_L0+0, 0
	MOVWF      R0+0
	MOVF       main_sum_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_sum_L0+0
	MOVF       R0+1, 0
	MOVWF      main_sum_L0+1
;MyProject.c,66 :: 		y=sum;
	MOVF       R0+0, 0
	MOVWF      main_y_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y_L0+1
;MyProject.c,70 :: 		x1=x/0.05;
	MOVF       main_x_L0+0, 0
	MOVWF      R0+0
	MOVF       main_x_L0+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      main_x1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_x1_L0+1
;MyProject.c,71 :: 		y1=y/0.05;
	MOVF       main_y_L0+0, 0
	MOVWF      R0+0
	MOVF       main_y_L0+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      122
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      main_y1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y1_L0+1
;MyProject.c,72 :: 		if(x>=18)
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      18
	SUBWF      main_x_L0+0, 0
L__main48:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
;MyProject.c,74 :: 		lcd_out(1,1,"X+");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,75 :: 		uart1_write_text("x+=");
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,76 :: 		x1=x1-360;
	MOVLW      104
	SUBWF      main_x1_L0+0, 0
	MOVWF      R0+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_x1_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_x1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_x1_L0+1
;MyProject.c,77 :: 		uart1_write(x1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,78 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,79 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;MyProject.c,80 :: 		}
L_main15:
;MyProject.c,81 :: 		if(x<=15)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_x_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       main_x_L0+0, 0
	SUBLW      15
L__main49:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;MyProject.c,83 :: 		lcd_out(1,1,"X-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,84 :: 		uart1_write_text("x-=");
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,85 :: 		x1=307-x1;
	MOVF       main_x1_L0+0, 0
	SUBLW      51
	MOVWF      R0+0
	MOVF       main_x1_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_x1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_x1_L0+1
;MyProject.c,86 :: 		uart1_write(x1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,87 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,88 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
	NOP
;MyProject.c,89 :: 		}
L_main17:
;MyProject.c,90 :: 		if(y>=18)
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      18
	SUBWF      main_y_L0+0, 0
L__main50:
	BTFSS      STATUS+0, 0
	GOTO       L_main19
;MyProject.c,92 :: 		lcd_out(1,1,"Y+");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,93 :: 		uart1_write_text("y+");
	MOVLW      ?lstr6_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,94 :: 		y1=y1-360;
	MOVLW      104
	SUBWF      main_y1_L0+0, 0
	MOVWF      R0+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_y1_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_y1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y1_L0+1
;MyProject.c,95 :: 		uart1_write(y1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,96 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,97 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
	NOP
;MyProject.c,98 :: 		}
L_main19:
;MyProject.c,99 :: 		if(y<=15)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_y_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       main_y_L0+0, 0
	SUBLW      15
L__main51:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
;MyProject.c,101 :: 		lcd_out(1,1,"Y-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,102 :: 		uart1_write_text("y-");
	MOVLW      ?lstr8_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,103 :: 		y1=307-y1;
	MOVF       main_y1_L0+0, 0
	SUBLW      51
	MOVWF      R0+0
	MOVF       main_y1_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_y1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y1_L0+1
;MyProject.c,104 :: 		uart1_write(y1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,105 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MyProject.c,106 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	NOP
	NOP
;MyProject.c,107 :: 		}
L_main21:
;MyProject.c,109 :: 		if(lc<=8&&k==1)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_lc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       main_lc_L0+0, 0
	SUBLW      8
L__main52:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
	BTFSS      main_k_L0+0, BitPos(main_k_L0+0)
	GOTO       L_main25
L__main42:
;MyProject.c,111 :: 		lcd_out(2,1,"L1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,112 :: 		uart1_write_text("l1");
	MOVLW      ?lstr10_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,113 :: 		k=0;
	BCF        main_k_L0+0, BitPos(main_k_L0+0)
;MyProject.c,114 :: 		m=1;
	BSF        main_m_L0+0, BitPos(main_m_L0+0)
;MyProject.c,115 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	NOP
	NOP
;MyProject.c,116 :: 		}
L_main25:
;MyProject.c,117 :: 		if(lc>=10&&m==1)
	MOVLW      128
	XORWF      main_lc_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      10
	SUBWF      main_lc_L0+0, 0
L__main53:
	BTFSS      STATUS+0, 0
	GOTO       L_main29
	BTFSS      main_m_L0+0, BitPos(main_m_L0+0)
	GOTO       L_main29
L__main41:
;MyProject.c,119 :: 		lcd_out(2,1,"L2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,120 :: 		uart1_write_text("l2");
	MOVLW      ?lstr12_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,121 :: 		m=0;
	BCF        main_m_L0+0, BitPos(main_m_L0+0)
;MyProject.c,122 :: 		k=1;
	BSF        main_k_L0+0, BitPos(main_k_L0+0)
;MyProject.c,123 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	NOP
	NOP
;MyProject.c,124 :: 		}
L_main29:
;MyProject.c,125 :: 		if(rc<=12&&i==1)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_rc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       main_rc_L0+0, 0
	SUBLW      12
L__main54:
	BTFSS      STATUS+0, 0
	GOTO       L_main33
	BTFSS      main_i_L0+0, BitPos(main_i_L0+0)
	GOTO       L_main33
L__main40:
;MyProject.c,127 :: 		lcd_out(2,4,"r1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,128 :: 		uart1_write_text("r1");
	MOVLW      ?lstr14_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,129 :: 		i=0;
	BCF        main_i_L0+0, BitPos(main_i_L0+0)
;MyProject.c,130 :: 		j=1;
	BSF        main_j_L0+0, BitPos(main_j_L0+0)
;MyProject.c,131 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	NOP
	NOP
;MyProject.c,132 :: 		}
L_main33:
;MyProject.c,133 :: 		if(rc>=14&&j==1)
	MOVLW      128
	XORWF      main_rc_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      14
	SUBWF      main_rc_L0+0, 0
L__main55:
	BTFSS      STATUS+0, 0
	GOTO       L_main37
	BTFSS      main_j_L0+0, BitPos(main_j_L0+0)
	GOTO       L_main37
L__main39:
;MyProject.c,135 :: 		lcd_out(2,4,"r2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,136 :: 		uart1_write_text("r2");
	MOVLW      ?lstr16_MyProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MyProject.c,137 :: 		j=0;
	BCF        main_j_L0+0, BitPos(main_j_L0+0)
;MyProject.c,138 :: 		i=1;
	BSF        main_i_L0+0, BitPos(main_i_L0+0)
;MyProject.c,139 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	NOP
	NOP
;MyProject.c,140 :: 		}
L_main37:
;MyProject.c,143 :: 		}
	GOTO       L_main0
;MyProject.c,145 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
