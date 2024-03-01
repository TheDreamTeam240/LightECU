##
## EPITECH PROJECT, 2023
## LightECU
## File description:
## Makefile
##

NAME = lightecu

INCLUDE_DIR = ./include
SRC_DIR = ./src
OBJ_DIR = ./obj
BIN_DIR = ./bin

SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
BIN = $(BIN_DIR)/$(NAME).out

CC = avr-gcc
CFLAGS = -Wall -Wextra -Werror -I$(INCLUDE_DIR)
LDFLAGS =

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJ)

fclean: clean

re: fclean all

.PHONY: all clean fclean re
