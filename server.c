/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ride-sou <ride-sou@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/24 08:24:29 by ride-sou          #+#    #+#             */
/*   Updated: 2023/05/29 15:09:44 by ride-sou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	sigusr_handler(int signal)
{
	static int				bit_server = 0;
	static unsigned char	c = 0;

	if (signal == SIGUSR1)
	{
		c = c | (0x01 << bit_server);
		bit_server++;
	}
	else if (signal == SIGUSR2)
		bit_server++;
	if (bit_server == 8)
	{
		ft_printf("%c", c);
		bit_server = 0;
		c = 0;
	}
}

int	main(int ac, char **av)
{
	int	pid;

	(void)av;
	if (ac != 1)
	{
		ft_printf("Try <./server>\n");
		return (1);
	}
	pid = getpid();
	ft_printf("Server PID: %i\n", pid);
	ft_printf("Waiting messagem from client...\n");
	while (ac == 1)
	{
		signal(SIGUSR1, sigusr_handler);
		signal(SIGUSR2, sigusr_handler);
	}
	return (0);
}
