
_main:

;glove.c,14 :: 		void main() {
;glove.c,20 :: 		i=1;j=1;m=1;k=1;
	BSF        main_i_L0+0, BitPos(main_i_L0+0)
	BSF        main_j_L0+0, BitPos(main_j_L0+0)
	BSF        main_m_L0+0, BitPos(main_m_L0+0)
	BSF        main_k_L0+0, BitPos(main_k_L0+0)
;glove.c,21 :: 		uart1_init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;glove.c,22 :: 		lcd_init();
	CALL       _Lcd_Init+0
;glove.c,24 :: 		for(;;)
L_main0:
;glove.c,26 :: 		rc=adc_read(1)*0.05;
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
	MOVF       R0+0, 0
	MOVWF      main_rc_L0+0
	MOVF       R0+1, 0
	MOVWF      main_rc_L0+1
;glove.c,27 :: 		lc=adc_read(0)*0.05;
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
	MOVF       R0+0, 0
	MOVWF      main_lc_L0+0
	MOVF       R0+1, 0
	MOVWF      main_lc_L0+1
;glove.c,28 :: 		x=adc_read(4)*0.05;
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
	MOVF       R0+0, 0
	MOVWF      main_x_L0+0
	MOVF       R0+1, 0
	MOVWF      main_x_L0+1
;glove.c,29 :: 		y=adc_read(3)*0.05;
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
	MOVF       R0+0, 0
	MOVWF      main_y_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y_L0+1
;glove.c,30 :: 		if(x>=18)
	MOVLW      128
	XORWF      main_x_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      18
	SUBWF      main_x_L0+0, 0
L__main31:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;glove.c,32 :: 		lcd_out(1,1,"X+");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,33 :: 		uart1_write_text("x+");
	MOVLW      ?lstr2_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,34 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;glove.c,35 :: 		}
L_main3:
;glove.c,36 :: 		if(x<=15)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_x_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVF       main_x_L0+0, 0
	SUBLW      15
L__main32:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;glove.c,38 :: 		lcd_out(1,1,"X-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,39 :: 		uart1_write_text("x-");
	MOVLW      ?lstr4_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,40 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
;glove.c,41 :: 		}
L_main5:
;glove.c,42 :: 		if(y>=18)
	MOVLW      128
	XORWF      main_y_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      18
	SUBWF      main_y_L0+0, 0
L__main33:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;glove.c,44 :: 		lcd_out(1,1,"Y+");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,45 :: 		uart1_write_text("y+");
	MOVLW      ?lstr6_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,46 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
;glove.c,47 :: 		}
L_main7:
;glove.c,48 :: 		if(y<=15)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_y_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       main_y_L0+0, 0
	SUBLW      15
L__main34:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;glove.c,50 :: 		lcd_out(1,1,"Y-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,51 :: 		uart1_write_text("y-");
	MOVLW      ?lstr8_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,52 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;glove.c,53 :: 		}
L_main9:
;glove.c,55 :: 		if(lc<=7&&k==1)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_lc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVF       main_lc_L0+0, 0
	SUBLW      7
L__main35:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
	BTFSS      main_k_L0+0, BitPos(main_k_L0+0)
	GOTO       L_main13
L__main30:
;glove.c,57 :: 		lcd_out(2,1,"L1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,58 :: 		uart1_write_text("l1");
	MOVLW      ?lstr10_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,59 :: 		k=0;
	BCF        main_k_L0+0, BitPos(main_k_L0+0)
;glove.c,60 :: 		m=1;
	BSF        main_m_L0+0, BitPos(main_m_L0+0)
;glove.c,61 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
;glove.c,62 :: 		}
L_main13:
;glove.c,63 :: 		if(lc>=9&&m==1)
	MOVLW      128
	XORWF      main_lc_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      9
	SUBWF      main_lc_L0+0, 0
L__main36:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
	BTFSS      main_m_L0+0, BitPos(main_m_L0+0)
	GOTO       L_main17
L__main29:
;glove.c,65 :: 		lcd_out(2,1,"L2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,66 :: 		uart1_write_text("l2");
	MOVLW      ?lstr12_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,67 :: 		m=0;
	BCF        main_m_L0+0, BitPos(main_m_L0+0)
;glove.c,68 :: 		k=1;
	BSF        main_k_L0+0, BitPos(main_k_L0+0)
;glove.c,69 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
;glove.c,70 :: 		}
L_main17:
;glove.c,71 :: 		if(rc<=12&&i==1)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_rc_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       main_rc_L0+0, 0
	SUBLW      12
L__main37:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
	BTFSS      main_i_L0+0, BitPos(main_i_L0+0)
	GOTO       L_main21
L__main28:
;glove.c,73 :: 		lcd_out(2,1,"r1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,74 :: 		uart1_write_text("r1");
	MOVLW      ?lstr14_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,75 :: 		i=0;
	BCF        main_i_L0+0, BitPos(main_i_L0+0)
;glove.c,76 :: 		j=1;
	BSF        main_j_L0+0, BitPos(main_j_L0+0)
;glove.c,77 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
;glove.c,78 :: 		}
L_main21:
;glove.c,79 :: 		if(rc>=14&&j==1)
	MOVLW      128
	XORWF      main_rc_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      14
	SUBWF      main_rc_L0+0, 0
L__main38:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
	BTFSS      main_j_L0+0, BitPos(main_j_L0+0)
	GOTO       L_main25
L__main27:
;glove.c,81 :: 		lcd_out(2,1,"r2");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_glove+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;glove.c,82 :: 		uart1_write_text("r2");
	MOVLW      ?lstr16_glove+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;glove.c,83 :: 		j=0;
	BCF        main_j_L0+0, BitPos(main_j_L0+0)
;glove.c,84 :: 		i=1;
	BSF        main_i_L0+0, BitPos(main_i_L0+0)
;glove.c,85 :: 		delay_ms(60);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
;glove.c,86 :: 		}
L_main25:
;glove.c,90 :: 		}
	GOTO       L_main0
;glove.c,92 :: 		}
	GOTO       $+0
; end of _main
