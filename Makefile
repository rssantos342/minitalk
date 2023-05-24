# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ride-sou <ride-sou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/13 10:05:12 by ride-sou          #+#    #+#              #
#    Updated: 2023/05/24 10:39:39 by ride-sou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk.a

SRC = server.c client.c \

OBJS = ${SRC:.c=.o}

RM = rm -f
CFLAGS = -Wall -Wextra -Werror
MAKE = make -C
PRINTF_PATH = ft_printf/libftprintf.a

all:    ${NAME}

.c.o:
		cc ${CFLAGS} -c $< -o ${<:.c=.o}

$(NAME):    ${OBJS}
			${MAKE} ft_printf
			cp ${PRINTF_PATH} ${NAME}
			ar rcs ${NAME} ${OBJS}

clean:	
		${MAKE} ft_printf clean
		${RM} ${OBJS}

fclean:	clean
		${MAKE} ft_printf fclean
		${RM} ${NAME}

re:     fclean all

.PHONY: all clean fclean re