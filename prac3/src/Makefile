DEPS=binning.h Makefile
.PHONY=clean zip

default: run-icpc

src-gcc: par-gcc vec-gcc vec_and_mem-gcc all-gcc

src-icpc: par-icpc vec-icpc vec_and_mem-icpc all-icpc

%-gcc: %.cpp $(DEPS)
	g++ -std=c++20 -Wall -O3 -march=native -mtune=native -fopt-info-all=$@.opt-info -fopenmp $< -o $@

%-icpc: %.cpp $(DEPS)
	icpc -std=c++20 -Wall -O2 -march=native -mtune=native -qopt-report=5 -qopt-report-file=$@.optrpt -qopenmp $< -o $@

run-gcc: src-gcc
	./par-gcc
	./vec-gcc
	./vec_and_mem-gcc
	./all-gcc

run-icpc: src-icpc
	./par-icpc
	./vec-icpc
	./vec_and_mem-icpc
	./all-icpc

clean:
	rm -rf par-gcc vec-gcc vec_and_mem-gcc all-gcc \
	       par-gcc.opt-info vec-gcc.opt-info vec_and_mem-gcc.opt-info all-gcc.opt-info \
	       par-icpc vec-icpc vec_and_mem-icpc all-icpc \
	       par-icpc.optrpt vec-icpc.optrpt vec_and_mem-icpc.optrpt all-icpc.optrpt

zip:
	zip packed.zip all.cpp par.cpp vec_and_mem.cpp vec.cpp Makefile binning.h
