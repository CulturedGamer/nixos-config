cc = g++
in = src/main.cpp
flags = -pedantic -Wall -Wextra -Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2 -Winit-self -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wnoexcept -Wold-style-cast -Woverloaded-virtual -Wredundant-decls -Wshadow -Wsign-conversion -Wsign-promo -Wstrict-null-sentinel -Wstrict-overflow=5 -Wswitch-default -Wundef -Werror -Wno-unused
out = bin/program

all:
	${cc} ${in} -o ${out} ${flags}

clean:
	rm -rf ${out}
	${cc} ${in} -o ${out} ${flags}

run:
	${cc} ${in} -o ${out} ${flags}
	./${out}

clr:
	rm -rf ${out}
	${cc} ${in} -o ${out} ${flags}
	./${out}

debug:
	${cc} ${in} -o ${out} ${flags} -g
	gdb ${out}
