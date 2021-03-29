#
# Makefile for zx_kernel
#

all:  
	make -f Makefile.tracka
	make -f Makefile.trackb
clean:
	make clean -f Makefile.tracka
	make clean -f Makefile.trackb
upload:
	make upload -f Makefile.tracka
	make upload -f Makefile.trackb
