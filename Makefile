#include Makefile_$(EC_ARCH)$(ABI)

.SUFFIXES :

.SUFFIXES : .ftn .f .c .o .ftn90 .f90 .cdk90

SHELL = /bin/sh

FFLAGS = 

CFLAGS =

OPTIMIZ = -O 2
$(info OPTIMIZ is ${OPTIMIZ})

CPPFLAGS = 

.PRECIOUS: $(RMNLIB) $(MALIB)

VER = 115

LIBRMN = 

default: hy2pres

include $(RPN_TEMPLATE_LIBS)/include/makefile_suffix_rules.inc

FDECKS= hy2pres.ftn90 hybref_688.ftn hybstag_to_pres.ftn read_decode_bang.ftn
OBJECTS= hy2pres.o hybref_688.o hybstag_to_pres.o read_decode_bang.o

FICHIERS = $(FDECKS)

hy2pres: $(OBJECTS)
	s.compile -o r.hy2pres_$(VER)-$(BASE_ARCH) -obj $(OBJECTS) -librmn $(LIBRMN) 
clean:
#Faire le grand menage. On enleve tous les fichiers sources\ninutiles et les .o 
	-if [ "*.ftn90" != "`echo *.ftn90`" ] ; \
	then \
	for i in *.ftn90 ; \
	do \
	fn=`r.basename $$i '.ftn90'`; \
	rm -f $$fn.f90; \
	done \
	fi
	if [ "*.cdk90" != "`echo *.cdk90`" ] ; \
	then \
	for i in *.cdk90 ; \
	do \
	fn=`r.basename $$i '.cdk90'`; \
	rm -f $$.f90; \
	done \
	fi
	rm -f *.o *.mod *.f r.hy2pres_$(VER)-$(BASE_ARCH)
