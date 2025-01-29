##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Main Makefile for my_radar
##

MAIN = main.c
SRC_OBJ = $(MAIN:.c=.o)
NAME = hashtable
LIBMY = libmy.a
INCLUDE = -Iinclude -Ilib/my
CFLAGS += -Wall -Wextra $(INCLUDE)

all: $(NAME)

$(NAME): $(SRC_OBJ)
	make -C lib/my
	make -C src/
	gcc -o $(NAME) $(SRC_OBJ) src/*.o $(LIBMY) $(CFLAGS)

debug: CFLAGS += -g
debug: $(NAME)

clean:
	rm -f $(SRC_OBJ)
	make -C lib/my clean
	make -C src/ clean

fclean: clean
	rm -f $(NAME)
	rm -f $(LIBMY)
	make -C lib/my fclean
	make -C src/ fclean

re: fclean all