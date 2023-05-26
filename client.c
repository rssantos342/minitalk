/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ride-sou <ride-sou@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/24 08:24:25 by ride-sou          #+#    #+#             */
/*   Updated: 2023/05/26 08:28:06 by ride-sou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_send_bits(int pid, char *str)
{
	int	bit;
	int c;

	bit = 0;
	while(*str)
	{
		c = *(str);
		while (bit < 8)
		{
			if ((c << bit) & 0b10000000)
				kill(pid, SIGUSR1);
			else
				kill(pid, SIGUSR2);
			bit++;
			usleep(100);
		}
		str++;
		bit = 0;
	}
}

int	main(int ac, char **av)
{
	int	pid;

	if (ac != 3)
	{	
		ft_printf("Try <./client> <server id> and <string>\n");
		return (1);
	}
	else
	{
		pid = ft_atoi(av[1]);
		ft_send_bits(pid, av[2]);
	}
	return (0);
}
