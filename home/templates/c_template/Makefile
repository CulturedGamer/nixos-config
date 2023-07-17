CC = gcc
FLAGS = -m64 -std=c99 -pedantic -Wall -Wshadow -Wpointer-arith -Wcast-qual \
    -Wstrict-prototypes -Wmissing-prototypes
IN = main.c
OUT = bin/program

all:
	${CC} ${IN} -o ${OUT} ${FLAGS}

clean:
	rm -rf ${OUT}
	${CC} ${IN} -o ${OUT} ${FLAGS}

run:
	${CC} ${IN} -o ${OUT} ${FLAGS}
	./${OUT}

clr:
	rm -rf ${OUT}
	${CC} ${IN} -o ${OUT} ${FLAGS}
	./${OUT}

debug:
	${CC} ${IN} -o ${OUT} -g ${FLAGS}
	gdb ${OUT}
