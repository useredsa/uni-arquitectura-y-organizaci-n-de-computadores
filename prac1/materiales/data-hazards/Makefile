SUMAFLOPS=$(wildcard sumaflops*.c)
EXECS=$(SUMAFLOPS:.c=)
EXECS-GCC=$(SUMAFLOPS:.c=-gcc)
EXECS-CLANG=$(SUMAFLOPS:.c=-clang)

IMPROVED=$(wildcard sumaflops-improved*.c)
ASSEMBLYS=$(IMPROVED:.c=-gcc.s) $(IMPROVED:.c=-clang.s)

default: all

all: $(EXECS-GCC) $(EXECS-CLANG) $(ASSEMBLYS)

%-gcc: %.c
	gcc -Wall -O3 -march=native -mtune=native -o $@ $<

%-gcc.s: %.c
	gcc -Wall -O3 -march=native -mtune=native -S -o $@ $<

%-clang: %.c
	clang -Wall -O3 -march=native -mtune=native -o $@ $<

%-clang.s: %.c
	clang -Wall -O3 -march=native -mtune=native -S -o $@ $<

.PHONY: clean
clean:
	rm -f $(EXECS-GCC) $(EXECS-CLANG) $(ASSEMBLYS)


run-gcc: $(EXECS-GCC)
	for i in $(SUMAFLOPS:.c=-gcc) ; do \
		echo ./$$i ;\
		./$$i ;\
	done

run-clang: $(EXECS-CLANG)
	for i in $(SUMAFLOPS:.c=-clang) ; do \
		echo ./$$i ;\
		./$$i ;\
	done

run-all: run-gcc run-clang
