function esc_opcao(opc_atual, id_bloco, lista)
{
	//retirando o triangulo verde do anterior
	var id_anterior = id_bloco - 1 < 0 ? ds_list_size(lista) - 1 : id_bloco - 1;
	
	ds_list_find_value(lista, id_anterior).mostrar_triangulo_verde = false;
	
	//mostrando o triangulo verde se for apenas 1 gancho
	if (instance_exists(obj_bloco_corpo))
	{
		if (obj_bloco_corpo.qtd_bloco_atual.image_index + 1 == 1) ds_list_find_value(lista, id_bloco).mostrar_triangulo_verde = true;
	}
	
	//aplicando a opcao
	switch(opc_atual)
	{
		//fase 4
		case "buscar_container":
		{
			var _pode_pegar = false;
			
			if (cor == 0 && global.fase4_qtd_amarelo_pegos != 3) _pode_pegar = true;
			if (cor == 1 && global.fase4_qtd_azul_pegos != 3) _pode_pegar = true;
			if (cor == 2 && global.fase4_qtd_vermelho_pegos != 3) _pode_pegar = true;
			
			if (!instance_exists(collision_point(x_cor_patio, y, obj_gancho_fase4, false, true)) && _pode_pegar) x = x_cor_patio;
			else y_gancho = y - 20;
			
			if (x == x_cor_patio)
			{
				if (y_gancho > y_cor_patio) y_gancho -= vel_gancho * global.game_speed;
				else qtd_opc_atual += 1;
			}
			
			break;
		}
		
		case "subir_container":
		{
			//pegando o container
			var _container = collision_point(x_cor_patio, y_gancho, obj_container_fase4, false, false);
			if (instance_exists(_container) && y_gancho < 256)
			{
				container_pego = _container;
				
				if (cor == 0) global.fase4_qtd_amarelo_pegos += 1;
				else if (cor == 1) global.fase4_qtd_azul_pegos += 1;
				else if (cor == 2) global.fase4_qtd_vermelho_pegos += 1;
				
				qtd_opc_atual += 1;
			}
						
			break;
		}
		
		case "entregar_container":
		{
			var x_cor_barco = 0;
			
			for (var i = 0; i < 4; i++)
			{
				x_cor_barco = 192 + (128 * i);
				
				//procurando um lugar vago pra engregar o container
				if (!position_meeting(x_cor_barco, y_cor_barco, obj_container_fase4))
				{
					//vendo se tem algum gancho na posicao
					if (!instance_exists(collision_point(x_cor_barco, y, obj_gancho_fase4, false, true)))
					{
						x = x_cor_barco;
						break;
					}
					else if (global.fase4_qtd_amarelo_pegos == 3 && global.fase4_qtd_azul_pegos == 3 && global.fase4_qtd_vermelho_pegos == 3)
					{
						x = x_cor_barco;
						break;
					}
				}
				else if (instance_exists(container_pego))
				{
					//tem um container no lugar de entrega, porem é o container q ta sendo entregado
					if (position_meeting(x_cor_barco, y_cor_barco, container_pego))
					{
						x = x_cor_barco;
						break;
					}
				}
			}
	
			if (x == x_cor_barco)
			{
				if (y_gancho < y_cor_barco) y_gancho += vel_gancho * global.game_speed;
				else
				{
					y_gancho = y_cor_barco;
					qtd_opc_atual += 1;
				}
			}
			
			break;
		}
		
		case "descer_container":
		{
			//soltando o container se tiver
			if (container_pego != noone && y_gancho == y_cor_barco)
			{
				global.qtd_container_fase4 -= 1;
				
				container_pego = noone;
				
				qtd_opc_atual += 1;
			}
			
			break;
		}
	}
}

///@description gancho_movimentos(qtd_opcoes, lista_opcoes)
function gancho_movimentos(qtd_opc, lista)
{
	if (qtd_opc_atual < qtd_opc)
	{
		//salvando cada opcao
		for (var i = 0; i <= qtd_opc; i++)
		{
			var _bloco = ds_list_find_value(lista, i);
			if (instance_exists(_bloco))
			{
				if (i == 0) var opc_1 = _bloco.opcao;
				else if (i == 1) var opc_2 = _bloco.opcao;
				else if (i == 2) var opc_3 = _bloco.opcao;
				else if (i == 3) var opc_4 = _bloco.opcao;
			}
		}
	
		//opcao atual
		switch(qtd_opc_atual)
		{
			case 0: if (opc_1 != "") esc_opcao(opc_1, 0, lista); break;
			case 1: if (opc_2 != "") esc_opcao(opc_2, 1, lista); break;
			case 2: if (opc_3 != "") esc_opcao(opc_3, 2, lista); break;
			case 3: if (opc_4 != "") esc_opcao(opc_4, 3, lista); break;
		}
	}
	else qtd_opc_atual = 0;
}