/*
 * uart.h
 *Read adn Write Fucntions declarations
 */

//UART1 registers
#define UART1_LCTRL_H 0x808C0008
#define UART1_LCTRL_M 0x808C000C
#define UART1_LCTRL_L 0x808C0010
#define UART1_CTRL    0x808C0014
#define UART1_FLAG    0x808C0018
#define UART1_DATA    0x808C0000
#define UART1_BUSY    0x00000004

#define UART1_TXFF_MASK 0x00000020
#define UART1_CTS_MASK  0x00000001
#define UART1_BUSY_MASK 0x00000008

#define UART1_BAUD_RATE   2400
#define FUARTCLK          7372800 //UART clock frequency
#define BAUD_RATE_DIVISOR ((FUARTCLK/(16*UART1_BAUD_RATE))-1) // in this case 191

// stop bit - 2
// parity - none
// FIFO   - disabled
// bits per frame  - 8
#define UART1_LCRTL_H_CONFIG 0x68



typedef char *va_list;

#define __va_argsiz(t)	\
		(((sizeof(t) + sizeof(int) - 1) / sizeof(int)) * sizeof(int))

#define va_start(ap, pN) ((ap) = ((va_list) __builtin_next_arg(pN)))

#define va_end(ap)	((void)0)

#define va_arg(ap, t)	\
		 (((ap) = (ap) + __va_argsiz(t)), *((t*) (void*) ((ap) - __va_argsiz(t))))

#define COM1	0
#define COM2	1

#define ON	1
#define	OFF	0


int zx_initialize_uart2();
int zx_initialize_uart1();
void zx_print_number( int channel, int num );
char zx_read_byte( int channel );
int zx_putc( int channel, char c );
void zx_printf( int channel, char *fmt, ... );
int zx_write_byte( int channel, char c );
int zx_putstr( int channel, char *str );
