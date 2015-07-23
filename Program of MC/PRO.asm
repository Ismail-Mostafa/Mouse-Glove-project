
_main:

;PRO.c,16 :: 		void main() {
;PRO.c,27 :: 		i=1;j=1;m=1;k=1;
	BSF        main_i_L0+0, BitPos(main_i_L0+0)
	BSF        main_j_L0+0, BitPos(main_j_L0+0)
	BSF        main_m_L0+0, BitPos(main_m_L0+0)
	BSF        main_k_L0+0, BitPos(main_k_L0+0)
;PRO.c,28 :: 		uart1_init(9600);// 9600 BITRATE
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PRO.c,29 :: 		uart1_write('m');
	MOVLW      109
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,30 :: 		lcd_init();
	CALL       _Lcd_Init+0
;PRO.c,32 :: 		for(;;)
L_main0:
;PRO.c,34 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;PRO.c,35 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main3:
	MOVLW      128
	XORWF      main_zz_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      20
	SUBWF      main_zz_L0+0, 0
L__main43:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;PRO.c,37 :: 		ave[zz]=adc_read(1)*0.05;
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
;PRO.c,38 :: 		sum=ave[zz]+sum;
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
;PRO.c,35 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;PRO.c,39 :: 		}
	GOTO       L_main3
L_main4:
;PRO.c,40 :: 		sum=sum/20;
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
;PRO.c,41 :: 		rc=sum;
	MOVF       R0+0, 0
	MOVWF      main_rc_L0+0
	MOVF       R0+1, 0
	MOVWF      main_rc_L0+1
;PRO.c,43 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;PRO.c,44 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main6:
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
	GOTO       L_main7
;PRO.c,46 :: 		ave[zz]=adc_read(0)*0.05;
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
;PRO.c,47 :: 		sum=ave[zz]+sum;
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
;PRO.c,44 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;PRO.c,48 :: 		}
	GOTO       L_main6
L_main7:
;PRO.c,49 :: 		sum=sum/20;
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
;PRO.c,50 :: 		lc=sum;
	MOVF       R0+0, 0
	MOVWF      main_lc_L0+0
	MOVF       R0+1, 0
	MOVWF      main_lc_L0+1
;PRO.c,52 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;PRO.c,53 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main9:
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
	GOTO       L_main10
;PRO.c,55 :: 		ave[zz]=adc_read(4)*0.05;
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
;PRO.c,56 :: 		sum=ave[zz]+sum;
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
;PRO.c,53 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;PRO.c,57 :: 		}
	GOTO       L_main9
L_main10:
;PRO.c,58 :: 		sum=sum/20;
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
;PRO.c,59 :: 		y=sum;
	MOVF       R0+0, 0
	MOVWF      main_y_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y_L0+1
;PRO.c,61 :: 		sum=0;
	CLRF       main_sum_L0+0
	CLRF       main_sum_L0+1
;PRO.c,62 :: 		for(zz=0;zz<20;zz++)
	CLRF       main_zz_L0+0
	CLRF       main_zz_L0+1
L_main12:
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
	GOTO       L_main13
;PRO.c,64 :: 		ave[zz]=adc_read(3)*0.05;
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
;PRO.c,65 :: 		sum=ave[zz]+sum;
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
;PRO.c,62 :: 		for(zz=0;zz<20;zz++)
	INCF       main_zz_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_zz_L0+1, 1
;PRO.c,66 :: 		}
	GOTO       L_main12
L_main13:
;PRO.c,67 :: 		sum=sum/20;
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
;PRO.c,68 :: 		x=sum;
	MOVF       R0+0, 0
	MOVWF      main_x_L0+0
	MOVF       R0+1, 0
	MOVWF      main_x_L0+1
;PRO.c,72 :: 		x1=x/0.05;
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
;PRO.c,73 :: 		y1=y/0.05;
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
;PRO.c,74 :: 		if(x>=18)
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      18
	SUBWF      main_x_L0+0, 0
L__main47:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
;PRO.c,76 :: 		lcd_out(1,1,"X+");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,77 :: 		uart1_write_text("x+=");
	MOVLW      ?lstr2_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,78 :: 		x1=x1-360;
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
;PRO.c,79 :: 		uart1_write(x1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,80 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,81 :: 		delay_ms(100);
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
;PRO.c,82 :: 		}
L_main15:
;PRO.c,83 :: 		if(x<=15)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_x_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       main_x_L0+0, 0
	SUBLW      15
L__main48:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
;PRO.c,85 :: 		lcd_out(1,1,"X-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,86 :: 		uart1_write_text("x-=");
	MOVLW      ?lstr4_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,87 :: 		x1=307-x1;
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
;PRO.c,88 :: 		uart1_write(x1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,89 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,90 :: 		delay_ms(100);
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
;PRO.c,91 :: 		}
L_main17:
;PRO.c,92 :: 		if(y>=18)
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      18
	SUBWF      main_y_L0+0, 0
L__main49:
	BTFSS      STATUS+0, 0
	GOTO       L_main19
;PRO.c,94 :: 		lcd_out(1,1,"Y+");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,95 :: 		uart1_write_text("y+=");
	MOVLW      ?lstr6_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,96 :: 		y1=y1-360;
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
;PRO.c,97 :: 		uart1_write(y1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,98 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,99 :: 		delay_ms(100);
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
;PRO.c,100 :: 		}
L_main19:
;PRO.c,101 :: 		if(y<=15)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_y_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVF       main_y_L0+0, 0
	SUBLW      15
L__main50:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
;PRO.c,103 :: 		lcd_out(1,1,"Y-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,104 :: 		uart1_write_text("y-=");
	MOVLW      ?lstr8_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,105 :: 		y1=307-y1;
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
;PRO.c,106 :: 		uart1_write(y1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,107 :: 		uart1_write(';');
	MOVLW      59
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PRO.c,108 :: 		delay_ms(100);
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
;PRO.c,109 :: 		}
L_main21:
;PRO.c,111 :: 		if(lc<=8&&k==1)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_lc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       main_lc_L0+0, 0
	SUBLW      8
L__main51:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
	BTFSS      main_k_L0+0, BitPos(main_k_L0+0)
	GOTO       L_main25
L__main42:
;PRO.c,113 :: 		lcd_out(2,1,"L1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,114 :: 		uart1_write_text("l1");
	MOVLW      ?lstr10_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,115 :: 		k=0;
	BCF        main_k_L0+0, BitPos(main_k_L0+0)
;PRO.c,116 :: 		m=1;
	BSF        main_m_L0+0, BitPos(main_m_L0+0)
;PRO.c,117 :: 		delay_ms(100);
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
;PRO.c,118 :: 		}
L_main25:
;PRO.c,119 :: 		if(lc>=10&&m==1)
	MOVLW      128
	XORWF      main_lc_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      10
	SUBWF      main_lc_L0+0, 0
L__main52:
	BTFSS      STATUS+0, 0
	GOTO       L_main29
	BTFSS      main_m_L0+0, BitPos(main_m_L0+0)
	GOTO       L_main29
L__main41:
;PRO.c,121 :: 		lcd_out(2,1,"L2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,122 :: 		uart1_write_text("l2");
	MOVLW      ?lstr12_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,123 :: 		m=0;
	BCF        main_m_L0+0, BitPos(main_m_L0+0)
;PRO.c,124 :: 		k=1;
	BSF        main_k_L0+0, BitPos(main_k_L0+0)
;PRO.c,125 :: 		delay_ms(100);
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
;PRO.c,126 :: 		}
L_main29:
;PRO.c,127 :: 		if(rc<=12&&i==1)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_rc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       main_rc_L0+0, 0
	SUBLW      12
L__main53:
	BTFSS      STATUS+0, 0
	GOTO       L_main33
	BTFSS      main_i_L0+0, BitPos(main_i_L0+0)
	GOTO       L_main33
L__main40:
;PRO.c,129 :: 		lcd_out(2,4,"r1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,130 :: 		uart1_write_text("r1");
	MOVLW      ?lstr14_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,131 :: 		i=0;
	BCF        main_i_L0+0, BitPos(main_i_L0+0)
;PRO.c,132 :: 		j=1;
	BSF        main_j_L0+0, BitPos(main_j_L0+0)
;PRO.c,133 :: 		delay_ms(100);
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
;PRO.c,134 :: 		}
L_main33:
;PRO.c,135 :: 		if(rc>=14&&j==1)
	MOVLW      128
	XORWF      main_rc_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      14
	SUBWF      main_rc_L0+0, 0
L__main54:
	BTFSS      STATUS+0, 0
	GOTO       L_main37
	BTFSS      main_j_L0+0, BitPos(main_j_L0+0)
	GOTO       L_main37
L__main39:
;PRO.c,137 :: 		lcd_out(2,4,"r2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_PRO+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PRO.c,138 :: 		uart1_write_text("r2");
	MOVLW      ?lstr16_PRO+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;PRO.c,139 :: 		j=0;
	BCF        main_j_L0+0, BitPos(main_j_L0+0)
;PRO.c,140 :: 		i=1;
	BSF        main_i_L0+0, BitPos(main_i_L0+0)
;PRO.c,141 :: 		delay_ms(100);
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
;PRO.c,142 :: 		}
L_main37:
;PRO.c,145 :: 		}
	GOTO       L_main0
;PRO.c,147 :: 		}
	GOTO       $+0
; end of _main
