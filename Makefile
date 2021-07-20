C_FILES := $(wildcard src/*.c)
OBJ_FILES := $(addprefix obj/,$(notdir $(C_FILES:.c=.o)))
LD_FLAGS :=
CC_FLAGS := -Wall -Wextra -g
ODIR = obj_64
dummy_build_folder := $(shell mkdir -p $(ODIR))

main: $(OBJ_FILES)
	gcc $(LD_FLAGS) -o $@ $^

obj/%.o: src/%.c
	gcc $(CC_FLAGS) -c -o $@ $<

clean:
	rm -rf main ./obj/*.o

run:
	./main

valgrind:
	valgrind --track-origins=yes --leak-check=full ./main
