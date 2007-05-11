#include Makefile_$(ARCH)$(ABI)

.SUFFIXES :

.SUFFIXES : .ftn .f .c .o .ftn90 .f90 .cdk90

SHELL = /bin/sh

FFLAGS = 

CFLAGS =

OPTIMIZ = -O 2

CPPFLAGS = -I$(ARMNLIB)/include

.PRECIOUS: $(RMNLIB) $(MALIB)

default: hy2pres

.ftn.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<
.ftn90.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

.c.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(CFLAGS)" -src $<

.f.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<
.f90.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<
.cdk90.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<



FDECKS= hy2pres.ftn90 hybrid_to_pres2.ftn hybrid_to_pres3.ftn
OBJECTS= hy2pres.o hybrid_to_pres2.o hybrid_to_pres3.o

FICHIERS = $(FDECKS)

hy2pres: $(OBJECTS)
	r.build -o hy2pres_$(ARCH) -obj $(OBJECTS) -librmn rmn_008
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
	-if [ "*.ftn" != "`echo *.ftn`" ] ; \
	then \
	for i in *.ftn ; \
	do \
	fn=`r.basename $$i '.ftn'`; \
	rm -f $$fn.f; \
	done \
	fi
	rm *.o *.mod
