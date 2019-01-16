ASMSOURCES = WalkTest.asm              \
             initreg.asm

#-------------------------------------------------------------------------------
CL65	= cl65
LD65	= ld65
OBJECTS   = $(addprefix objs/,$(notdir $(ASMSOURCES:.asm=.o)))
LIBRARIES =
#-------------------------------------------------------------------------------

all :	$(OBJECTS) $(LIBRARIES)
	$(LD65) -o WalkTest.smc --config WalkTest.cfg --obj $(OBJECTS)

.SUFFIXES : .asm .o

objs/%.o : %.asm
	$(CL65) -t none -o objs/$*.o -c $*.asm

clean :
	rm -f objs/*.o
	rm -f *.smc
