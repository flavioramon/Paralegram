if (global.simulacao)
{
	//tempo
	if (round(sim_seg) < 60) sim_seg += (1/60) * global.game_speed;
	else
	{
		sim_seg = 0;
		sim_min++;
	}
	
	if (round(sim_min) > 60)
	{
		sim_min = 0
		sim_hor ++;
	}

	//terminando a simulacao completamente na fase 4
	if (room == rm_fase4)
	{
		if (global.qtd_container_fase4 <= 0)
		{
			//checando se a simulacao é nova pra guardar informacao
			var nova_sim = true;
		
			for (var i = 0; i < ds_list_size(lista_sim); i++)
			{
				if (ds_list_find_value(lista_sim, i)[3] == obj_bloco_corpo.qtd_bloco_atual.image_index + 1) nova_sim = false;
			}
		
			if (nova_sim)
			{
				var qtd_gan = obj_bloco_corpo.qtd_bloco_atual.image_index + 1;
				var speedup = tempo_1_gan/((sim_min * 60) + sim_seg);
				var eficiencia = speedup/qtd_gan;
				var desempenho = eficiencia * 100;
	
				var info_sim = [sim_seg, sim_min, sim_hor, qtd_gan, speedup, eficiencia, desempenho];
				ds_list_add(lista_sim, info_sim);
	
				sim_hor = 0;
				sim_min = 0;
				sim_seg = 0;
			}
			
			obj_botoes.alarm[1] = 1
		}
	}
}
else if (room == rm_fase4)
{
	//fim da fase 4
	if (!instance_exists(obj_menu) && ds_list_size(lista_sim) >= 3)
	{
		//terminando o jogo
		global.menu_fim_fase = true;
	}
}

//scroll dos blocos
if (mouse_x >= room_width/2 + 5 + 200)
{
	var acrescimo_y = 0;
	
	if (mouse_wheel_up()) acrescimo_y = 50;
	else if (mouse_wheel_down()) acrescimo_y = -50;
	else acrescimo_y = 0;
	
	for (var i = 0; i < ds_list_size(global.lista_conjunto_bloco); i++)
	{
		var bloco = ds_list_find_value(global.lista_conjunto_bloco, i);
		bloco.y += acrescimo_y;
	}
}

//menu final da fase
if ((global.menu_inicio_fase || global.menu_fim_fase))
{
	if (!instance_exists(obj_menu))
	{
		var _menu = instance_create_layer(room_width/2, room_height/2, "MENU", obj_menu);
		_menu.inicio = global.menu_inicio_fase? true: false;
		
		//lista pros graficos
		if (room == rm_fase4) _menu.lista_graficos = lista_sim;
	}
}
else
{
	if (instance_exists(obj_menu))
	{
		if (!obj_menu.tutorial) instance_destroy(obj_menu);
	}
}

//DEBUG
if (keyboard_check_pressed(ord("R")) && room != room_last && !global.simulacao) transicao_rooms(room_next(room), 30, c_black);
else if (keyboard_check_pressed(ord("E")) && room != room_first && !global.simulacao) transicao_rooms(room_previous(room), 30, c_black);