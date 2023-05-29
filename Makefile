# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ride-sou <ride-sou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/13 10:05:12 by ride-sou          #+#    #+#              #
#    Updated: 2023/05/29 13:25:06 by ride-sou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk.a

SRC_SERVER = server.c
SRC_CLIENT = client.c \

OBJ_SERVER = ${SRC_SERVER:.c=.o}
OBJ_CLIENT = ${SRC_CLIENT:.c=.o}

RM = rm -f
CFLAGS = -Wall -Wextra -Werror
MAKE = make -C
PRINTF_PATH = ft_printf/libftprintf.a

all:    ${NAME}

$(NAME):    ${OBJ_SERVER} ${OBJ_CLIENT}
			${MAKE} ft_printf
			cp ${PRINTF_PATH} ${NAME}
			ar rcs ${NAME} ${OBJ_SERVER} ${OBJ_CLIENT}
			cc ${CFLAGS} ${OBJ_SERVER} ${NAME} -o server
			cc ${CFLAGS} ${OBJ_CLIENT} ${NAME} -o client

clean:	
		${MAKE} ft_printf clean
		${RM} ${OBJ_SERVER} ${OBJ_CLIENT}

fclean: clean
		${MAKE} ft_printf fclean
		${RM} ${NAME} server client

re:     fclean all

.PHONY: all clean fclean re

.SILENT: