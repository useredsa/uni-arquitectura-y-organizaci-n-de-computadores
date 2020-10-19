# GCC Instructions
# -march=native Selects the target (matching the current machine)
# -mtune=native Allows optimization for specific processors (matching the current machine)
# -ftree-vectorize Enables the vectorizer (enabled by default with -O3)
# Clang Instructions
# Same flags are available but vectorization is enabled by default

CXX=gcc
FLAGS_NOVEC=-Wall -O2 -march=native -mtune=native
FLAGS=$(FLAGS_NOVEC) -ftree-vectorize
FLAGS_O3=-Wall -O3 -march=native -mtune=native

# CXX=clang
# FLAGS=-Wall -O2 -march=native -mtune=native
# FLAGS_NOVEC=$(FLAGS) -fno-tree-vectorize
# FLAGS_O3=-Wall -O3 -march=native -mtune=native

EXECS-RAW=helloflops1 helloflops1-novec helloflops1-O3 helloflops2 hellomem
EXECS=$(shell for p in $(EXECS-RAW); do printf "%s" "$$p-$(CXX) "; done)

default: all

all: $(EXECS)

%-$(CXX): %.c
	$(CXX) $(FLAGS) -o $@ $<

hellomem-$(CXX):  hellomem.c
	$(CXX) $(FLAGS) -fopenmp -o $@ $<

copy-$(CXX):  copy.cc
	$(CXX) $(FLAGS) -fopenmp -o $@ $<

helloflops1-novec-$(CXX):  helloflops1.c
	$(CXX) $(FLAGS_NOVEC) -o $@ $<

helloflops1-O3-$(CXX):  helloflops1.c
	$(CXX) $(FLAGS_O3) -o $@ $<

helloflops2-$(CXX):  helloflops2.c
	$(CXX) $(FLAGS_O3) -fopenmp -o $@ $<

.PHONY: clean
clean:
	rm -f $(EXECS)

run: $(EXECS)
	for i in $(EXECS) ; do \
		echo ./$$i ;\
		./$$i ;\
	done ;\
	echo ./helloflops2-$(CXX) 8 ;\
	./helloflops2-$(CXX) 8

debug:
	echo $(EXECS)
