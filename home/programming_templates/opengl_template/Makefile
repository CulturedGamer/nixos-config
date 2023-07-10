cc = gcc
in = src/main.c src/glad.c
libs = -lglfw
flags = -m64 -std=c99 -Wall -Wshadow -Wpointer-arith -Wcast-qual \
    -Wstrict-prototypes -Wmissing-prototypes
out = bin/program

all:
	${cc} ${in} -o ${out} ${libs} ${flags}

clean:
	rm -rf ${out}
	${cc} ${in} -o ${out} ${libs} ${flags}

run:
	${cc} ${in} -o ${out} ${libs} ${flags}
	./${out}

clr:
	rm -rf ${out}
	${cc} ${in} -o ${out} ${libs} ${flags}
	./${out}

debug:
	${cc} ${in} -o ${out} ${libs} ${flags} -g
	gdb ${out}
