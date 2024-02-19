DIR		:=	$(shell pwd)

HDRD	:=	$(DIR)/hdr
HDR		:=
HDR		:=	$(HDR:%.hpp=$(HDRD)/%.hpp)

SRCD	:=	$(DIR)/src
SRC		:=	main.cpp
SRC		:=	$(SRC:%.cpp=$(SRCD)/%.cpp)

OBJD	:=	$(DIR)/obj
OBJ		:=	$(SRC:$(SRCD)/%.cpp=$(OBJD)/%.o)

SDLL	:=	$(shell sdl2-config --libs)
SDLI	:=	$(shell sdl2-config --cflags)

CFLAGS	:=	-Wall -Wextra -Werror -Wshadow -g
CC		:=	c++

NAME	:=	undefined_yet

all			:	$(NAME)

$(NAME)		:	$(OBJ)
				$(CC) $(CFLAGS) $(SDLL) $^ -o $@

$(OBJD)/%.o	:	$(SRCD)/%.cpp | $(OBJD)
				$(CC) $(CFLAGS) -I$(HDRD) $(SDLI) -c $< -o $@

$(OBJD)		:
				mkdir $(OBJD)

clean		:
				rm -rf $(OBJD)

fclean		:	clean
				rm -rf $(NAME)

re			:	fclean all

.PHONY		:	all clean fclean re
				
