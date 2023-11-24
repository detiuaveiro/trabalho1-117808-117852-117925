# make              # to compile files and create the executables
# make pgm          # to download example images to the pgm/ dir
# make setup        # to setup the test files in test/ dir
# make tests        # to run basic tests
# make clean        # to cleanup object files and executables
# make cleanobj     # to cleanup object files only

CFLAGS = -Wall -O2 -g -lm

PROGS = imageTool imageTest

TESTS = test1 test2 test3 test4 test5 test6 test7 test8 test9

# Default rule: make all programs
all: $(PROGS)

imageTest: imageTest.o image8bit.o instrumentation.o error.o -lm

imageTest.o: image8bit.h instrumentation.h -lm

imageTool: imageTool.o image8bit.o instrumentation.o error.o -lm

imageTool.o: image8bit.h instrumentation.h -lm

# Rule to make any .o file dependent upon corresponding .h file
%.o: %.h

pgm:
	wget -O- https://sweet.ua.pt/jmr/aed/pgm.tgz | tar xzf -

.PHONY: setup
setup: test/

test/:
	wget -O- https://sweet.ua.pt/jmr/aed/test.tgz | tar xzf -
	@#mkdir -p $@
	@#curl -s -o test/aed-trab1-test.zip https://sweet.ua.pt/mario.antunes/aed/test/aed-trab1-test.zip
	@#unzip -q -o test/aed-trab1-test.zip -d test/

test1: $(PROGS) setup
	./imageTool test/original.pgm neg save neg.pgm
	cmp neg.pgm test/neg.pgm
	@echo "Test 1: Result compared"


test2: $(PROGS) setup
	./imageTool test/original.pgm thr 128 save thr.pgm
	cmp thr.pgm test/thr.pgm

test3: $(PROGS) setup
	./imageTool test/original.pgm bri .33 save bri.pgm
	cmp bri.pgm test/bri.pgm

test4: $(PROGS) setup
	./imageTool test/original.pgm rotate save rotate.pgm
	cmp rotate.pgm test/rotate.pgm

test5: $(PROGS) setup
	./imageTool test/original.pgm mirror save mirror.pgm
	cmp mirror.pgm test/mirror.pgm

test6: $(PROGS) setup
	./imageTool test/original.pgm crop 100,100,100,100 save crop.pgm
	cmp crop.pgm test/crop.pgm
test7: $(PROGS) setup
	./imageTool test/small.pgm test/original.pgm paste 100,100 save paste.pgm
	cmp paste.pgm test/paste.pgm

test8: $(PROGS) setup
	./imageTool test/small.pgm test/original.pgm blend 100,100,.33 save blend.pgm
	cmp blend.pgm test/blend.pgm

test9: $(PROGS) setup
	./imageTool test/original.pgm blur 7,7 save blur.pgm
	cmp blur.pgm test/blur.pgm

# Locate with sub-image size 500x500
test10: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,500,500 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 100,100,500,500 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate
	
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 200,200,500,500 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate
	
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 300,300,500,500 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate
	
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 400,400,500,500 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate

# Locate with sub-image size 100x100
test11: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,100,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 100,100,100,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate
	
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 200,200,100,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate
	
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 300,300,100,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate
	
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 400,400,100,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate

# Locate with sub-image size 200x100 and varing size
test12: $(PROGS) setup
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 300,400,200,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 300,525,200,100 save crop2.pgm
	./imageTool pgm/large/ireland_03_1600x1200.pgm crop2.pgm locate

# Count blur function comparisons with sub-image size growing
test13: $(PROGS) setup
	./imageTool pgm/medium/mandrill_512x512.pgm crop 0,0,100,100 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/medium/mandrill_512x512.pgm crop 0,0,200,200 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/small/art4_300x300.pgm blur 7,7 save blur1.pgm

	./imageTool pgm/medium/mandrill_512x512.pgm crop 0,0,400,400 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/medium/mandrill_512x512.pgm crop 0,0,500,500 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,600,600 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,700,700 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,800,800 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,900,900 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

	./imageTool pgm/large/ireland_03_1600x1200.pgm crop 0,0,1000,1000 save crop2.pgm
	./imageTool crop2.pgm blur 7,7 save blur2.pgm

.PHONY: tests
tests: $(TESTS)

# Make uses builtin rule to create .o from .c files.

cleanobj:
	rm -f *.o

clean: cleanobj
	rm -f $(PROGS)

