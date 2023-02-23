##
## EPITECH PROJECT, 2022
## B-ASM-400-MAR-4-1-asmminilibc-thibaut.tran
## File description:
## Makefile
##

SRC	=	strlen.asm	\
		strchr.asm	\
		strrchr.asm	\
		memset.asm	\
		memcpy.asm	\
		strcmp.asm	\
		memmove.asm	\
		strncmp.asm	\
		strcasecmp.asm	\
		strstr.asm	\
		strpbrk.asm	\
		strcspn.asm

OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

all:	$(NAME)

$(NAME):	$(OBJ)
	ld	-shared	-nostdlib	-fPIC	-o	$(NAME)	$(OBJ)

%.o:	%.asm
	nasm	-f	elf64	$<	-o	$@

clean:
	@rm	-f	$(OBJ)

fclean:	clean
	@rm 	-f	$(NAME)

re:	fclean	all

#enlever le gcc -fno-builtin main.c libasm.so -o minilib lors du push
#export LD_LIBRARY_PATH="." à taper à chaque fois avant de lancer le programme