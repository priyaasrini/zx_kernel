/*
 * zx_uart_io.c
 *
 * Contains IO functions to write to 
 * and read from UARTs
 *
 * Authors : Alex Murashkin
 *           Priyaa Varshinee
 */
 
 /*
  * For DEFINITIONS used in this file, see zx_tasks.h
  */

#include <ts7200.h>
#include <zx_uart_io.h>
#include <zx_kernel_config.h>
#include <zx_irq_device.h>
#include <zx_irq_vic.h>
#include <zx_system_calls.h>

int zx_setfifo( int channel, int state ) {
	int *line, buf;
	switch( channel ) {
	case COM1:
		line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
	        break;
	case COM2:
	        line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
	        break;
	default:
	        return -1;
	        break;
	}
	buf = *line;
	buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
	*line = buf;
	return 0;
}

int zx_initialize_uart2()
{
   /* To print our kernel messages starting from a new line */
   zx_setfifo( COM2, OFF );

   int *reg = (int*)(UART2_CONTROL);
   *reg = (*reg) | 0x00000001;
   
   return 0;
}

int zx_initialize_uart1()
{
  //set fifo
  zx_setfifo( COM1, OFF );

  //set line control register before transmission
  *((unsigned long int *)UART1_LCTRL_L) = 0xFF & BAUD_RATE_DIVISOR;
  *((unsigned long int *)UART1_LCTRL_M) = 0x0;//0xFF00 & BAUD_RATE_DIVISOR >> 8;
  *((unsigned long int *)UART1_LCTRL_H) = UART1_LCRTL_H_CONFIG;

  // enable UART1
  *((unsigned long int *)UART1_CTRL) |= 0x00000001;
  
  zx_init_modem_intr();

  return 0;
}

void zx_print_number( int channel, int num )
{
   int n = 0;
   int dgt;
   unsigned int d = 1;
	int base=10;

   while( (num / d) >= base ) d *= base;
   while( d != 0 ) {
       dgt = num / d;
       num %= d;
       d /= base;
       if( n || dgt > 0 || d == 0 ) {
   	 	zx_putc( channel, dgt + ( dgt < 10 ? '0' : 'a' - 10 ));
         ++n;
      }
   }
}

char zx_read_byte( int channel )
{
   int *flags, *data;
   unsigned char c;

   switch( channel ) {
     case COM1:
          flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
          data = (int *)( UART1_BASE + UART_DATA_OFFSET );
          break;
     case COM2:
          flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
          data = (int *)( UART2_BASE + UART_DATA_OFFSET );
          break;
    default:
          return -1;
          break;
    }
    c = *data;
    
    return c;
}

int zx_write_byte( int channel, char c )
{
   int *flags, *data;
   switch( channel ) {
   case COM1:
        flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
        data = (int *)( UART1_BASE + UART_DATA_OFFSET );
        break;
   case COM2:
        flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
        data = (int *)( UART2_BASE + UART_DATA_OFFSET );
        break;
   default:
        return -1;
        break;
   }    
          
   /* transmit */
   *data = c;   

	return 0;
}

int zx_putc( int channel, char c )
{
   return PutC(channel, c);
} 



char zx_c2x( char ch ) {
	if ( (ch <= 9) ) return '0' + ch;
	return 'a' + ch - 10;
}

int zx_putx( int channel, char c ) {
	char chh, chl;

	chh = zx_c2x( c / 16 );
	chl = zx_c2x( c % 16 );
	zx_putc( channel, chh );
	return zx_putc( channel, chl );
}

int zx_putr( int channel, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) zx_putx( channel, ch[byte] );
	return zx_putc( channel, ' ' );
}

int zx_putstr( int channel, char *str ) {
	while( *str ) {
		if( zx_putc( channel, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void zx_putw( int channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) zx_putc( channel, fc );
	while( ( ch = *bf++ ) ) zx_putc( channel, ch );
}



int zx_a2d( char ch ) {
	if( ch >= '0' && ch <= '9' ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}

char zx_a2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = zx_a2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void zx_ui2a( unsigned int num, unsigned int base, char *bf ) {
	int n = 0;
	int dgt;
	unsigned int d = 1;
	
	while( (num / d) >= base ) d *= base;
	while( d != 0 ) {
		dgt = num / d;
		num %= d;
		d /= base;
		if( n || dgt > 0 || d == 0 ) {
			*bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
			++n;
		}
	}
	*bf = 0;
}

void zx_i2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	zx_ui2a( num, 10, bf );
}



void zx_format ( int channel, char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			zx_putc( channel, ch );
		else {
			lz = 0; w = 0;
			ch = *(fmt++);
			switch ( ch ) {
			case '0':
				lz = 1; ch = *(fmt++);
				break;
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				ch = zx_a2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				zx_putc( channel, va_arg( va, char ) );
				break;
			case 's':
				zx_putw( channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				zx_ui2a( va_arg( va, unsigned int ), 10, bf );
				zx_putw( channel, w, lz, bf );
				break;
			case 'd':
				zx_i2a( va_arg( va, int ), bf );
				zx_putw( channel, w, lz, bf );
				break;
			case 'x':
				zx_ui2a( va_arg( va, unsigned int ), 16, bf );
				zx_putw( channel, w, lz, bf );
				break;
			case '%':
				zx_putc( channel, ch );
				break;
			}
		}
	}
}


void zx_printf( int channel, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        zx_format( channel, fmt, va );
        va_end(va);
}


