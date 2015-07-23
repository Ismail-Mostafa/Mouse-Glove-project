#line 1 "F:/MOUSE GLOVE FINAL PRO 2/PRO.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

void main() {
bit i,j,k,m;
int rc;
int lc;
int x;
int y;
int x1;
int y1;
int ave[20];
int zz;
int sum;
i=1;j=1;m=1;k=1;
uart1_init(9600);
uart1_write('m');
lcd_init();

for(;;)
{
sum=0;
for(zz=0;zz<20;zz++)
 {
ave[zz]=adc_read(1)*0.05;
sum=ave[zz]+sum;
 }
 sum=sum/20;
 rc=sum;

sum=0;
for(zz=0;zz<20;zz++)
 {
ave[zz]=adc_read(0)*0.05;
sum=ave[zz]+sum;
 }
 sum=sum/20;
 lc=sum;

sum=0;
for(zz=0;zz<20;zz++)
 {
ave[zz]=adc_read(4);
sum=ave[zz]+sum;
 }
 sum=sum/20;
 y1=sum;
 y=sum*0.05;

sum=0;
for(zz=0;zz<20;zz++)
 {
ave[zz]=adc_read(3) ;
sum=ave[zz]+sum;
 }
 sum=sum/20;
 x1=sum;
 x=sum*0.05;





if(x>=18)
{
lcd_out(1,1,"X+");
uart1_write_text("x+");
x1=x1-360;
uart1_write(x1);
uart1_write(';');
delay_ms(100);
}
if(x<=15)
{
lcd_out(1,1,"X-");
uart1_write_text("x-");
x1=307-x1;
uart1_write(x1);
uart1_write(';');
delay_ms(100);
}
if(y>=18)
{
lcd_out(1,1,"Y+");
uart1_write_text("y+");
y1=y1-360;
uart1_write(y1);
uart1_write(';');
delay_ms(100);
}
if(y<=15)
{
lcd_out(1,1,"Y-");
uart1_write_text("y-");
y1=307-y1;
uart1_write(y1);
uart1_write(';');
delay_ms(100);
}

if(lc<=8&&k==1)
{
lcd_out(2,1,"L1");
uart1_write_text("l1");
k=0;
m=1;
delay_ms(50);
}
if(lc>=10&&m==1)
{
lcd_out(2,1,"L2");
uart1_write_text("l2");
m=0;
k=1;
delay_ms(50);
}
if(rc<=12&&i==1)
{
lcd_out(2,4,"r1");
uart1_write_text("r1");
i=0;
j=1;
delay_ms(50);
}
if(rc>=14&&j==1)
{
lcd_out(2,4,"r2");
uart1_write_text("r2");
j=0;
i=1;
delay_ms(50);
}


}

}
