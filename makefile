# Big Header

NAME = template

# Compiler

CC = gcc
CFLAGS = -Wall -Wextra -Werror
DEBUG = # -g3

# Directories

DIR_SRC = src
DIR_OBJ = .obj
DIR_INC = includes
DIR_LIBS = libs

# Files

SRC = main.c

OBJ = $(addprefix $(DIR_OBJ)/, $(SRC:.c=.o))

# Libraries
# -L$(DIR_LIBS)

# Compilation

all: compile 

compile: $(NAME)

$(NAME): $(OBJ)
	@$(CC) $(CFLAGS) $(DEBUG) -o $@ $^
	@echo "Compilation done"

$(DIR_OBJ)/%.o: $(DIR_SRC)/%.c
	@mkdir -p $(DIR_OBJ)
	@$(CC) $(CFLAGS) $(DEBUG) -I$(DIR_INC) -o $@ -c $<

# Cleaning

clean:
	@rm -rf $(DIR_OBJ)
	@echo "Objects removed"

fclean: clean
	@rm -f $(NAME)
	@echo "Executable removed"

re: fclean all

# Debug

debug:
	$(eval DEBUG = -g3)

.PHONY: all compile clean fclean re debug