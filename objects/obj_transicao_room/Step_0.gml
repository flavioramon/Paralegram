if (estado == 0)
{
	timer ++;
	
	if (timer >= duracao)
	{
		room_goto(room_alvo);
		estado = 1;
	}
}
else if (estado == 1)
{
	timer --;
	
	if (timer <= 0) instance_destroy();
}

alpha = timer/duracao;