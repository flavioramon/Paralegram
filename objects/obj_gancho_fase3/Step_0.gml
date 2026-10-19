escala = alto ? 1.2: 1;

if (container != noone)
{
	container.image_xscale = escala;
	container.image_yscale = escala;
	
	container.x = x;
	container.y = y;
}

//verificando quando acabou
if (qtd_containers_sobrando == 0 && container == noone)
{
	qtd_amarelo = 0;
	qtd_azul = 0;
	qtd_vermelho = 0;
	
	with (obj_container_fase3)
	{
		if (image_index == 0 && collision_rectangle(96 + 16, 416 + 16, 224 - 16, 672 - 16, self, true, false)) other.qtd_amarelo++;
		else if (image_index == 1 && collision_rectangle(352 + 16, 416 + 16, 480 - 16, 672 - 16, self, true, false)) other.qtd_azul++;
		else if (image_index == 2 && collision_rectangle(608 + 16, 416 + 16, 736 - 16, 672 - 16, self, true, false)) other.qtd_vermelho++;
	}
	
	if ((qtd_amarelo == 3 && room == rm_fase3_1) || (qtd_azul == 3 && room == rm_fase3_2) || (qtd_vermelho == 3 && room == rm_fase3_3))
	{
		//terminando o jogo
		global.menu_fim_fase = true;
		global.simulacao = false;
	}
}
