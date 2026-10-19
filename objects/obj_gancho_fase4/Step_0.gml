//tem container pra pegar
if (global.qtd_container_fase4 > 0)
{
	if (cor == 0 && container_pego == noone) //amarelo
	{
		 if (global.fase4_qtd_amarelo_pegos == 3 && global.fase4_qtd_vermelho_pegos != 3) cor = 1;
	
		 y_cor_barco = 496;
	 
		 x_cor_patio = global.fase4_qtd_amarelo_pegos == 0? 240: 272;
		 y_cor_patio = global.fase4_qtd_amarelo_pegos == 0 || global.fase4_qtd_amarelo_pegos == 2? 64: 128;
	}

	if (cor == 1 && container_pego == noone) //azul
	{
		if (global.fase4_qtd_azul_pegos == 3 && global.fase4_qtd_vermelho_pegos != 3) cor = 2;
	
		 y_cor_barco = 464;
	 
		 x_cor_patio = global.fase4_qtd_azul_pegos == 0 || global.fase4_qtd_azul_pegos == 1? 368: 400;
		 y_cor_patio = global.fase4_qtd_azul_pegos == 0 || global.fase4_qtd_azul_pegos == 2? 128: 64;
	}

	if (cor == 2 && container_pego == noone) //vermelho
	{
		if (global.fase4_qtd_vermelho_pegos == 3 && global.fase4_qtd_amarelo_pegos != 3) cor = 0;
	
		 y_cor_barco = 432;
	 
		 x_cor_patio = global.fase4_qtd_vermelho_pegos == 0? 496: 528;
		 y_cor_patio = global.fase4_qtd_vermelho_pegos == 0 || global.fase4_qtd_vermelho_pegos == 1? 128: 64;
	}

	//opcoes
	gancho_movimentos(ds_list_size(obj_bloco_corpo.lista_opcoes), obj_bloco_corpo.lista_opcoes);
	
	//container pego
	if (container_pego != noone)
	{
		container_pego.x = x;
		container_pego.y = y_gancho;
	}
}