OBJS = ./build/vga/vga.o \
        ./build/sgl/sgl.o \
        ./build/io/io.asm.o

INCLUDES = -I./io -I./vga -I./sgl
FLAGS = -g -ffreestanding -falign-jumps -falign-functions -falign-labels -falign-loops \
        -fstrength-reduce -fomit-frame-pointer -finline-functions -Wno-unused-function -fno-builtin \
        -Werror -Wno-unused-label -Wno-cpp -Wno-unused-parameter -nostdlib -nostartfiles -nodefaultlibs -Wall -O0 -Iinc

all: ${OBJS}

./build/io/io.asm.o: ./io/io.asm
    nasm -f elf -g ./io/io.asm  -o ./build/io/io.asm.o

./build/vga/vga.o: ./vga/vga.c
    i686-elf-gcc $(INCLUDES) $(FLAGS) -std=gnu99 -c ./vga/vga.c -o ./build/vga/vga.o

./build/sgl/sgl.o: ./sgl/sgl.c
    i686-elf-gcc $(INCLUDES) $(FLAGS) -std=gnu99 -c ./sgl/sgl.c -o ./build/sgl/sgl.o

clean:
    rm -rf $(OBJS)