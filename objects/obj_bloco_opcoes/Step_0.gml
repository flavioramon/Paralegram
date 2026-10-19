if (!global.menu_fim_fase && !global.menu_inicio_fase && !instance_exists(obj_menu))
{
	//mouse movendo ele
	if (position_meeting(mouse_x, mouse_y, self) && global.sel == noone && !global.simulacao)
	{
		if (mouse_check_button_pressed(mb_left) && opc_cima == noone && bloco_corpo_id == noone)
		{
			global.sel = self;
			layer_add_instance("BLOCO_OUTLINE", self);
	
			if (!escolhido)
			{
				var nova_opc = instance_create_layer(x_inicial, y_inicial, "BLOCO", obj_bloco_opcoes);
				nova_opc.opcao = opcao;
				nova_opc.alvo = alvo;
		
				escolhido = true;
			}
	
			if (x_mouse_diff == 0) x_mouse_diff = mouse_x - x;
			if (y_mouse_diff == 0) y_mouse_diff = mouse_y - y;
		}
		else if (mouse_check_button_pressed(mb_right) && (bloco_corpo_id != noone || opc_cima != noone || opc_baixo != noone))
		{
			//tirando do bloco principal
			if (bloco_corpo_id != noone && instance_exists(bloco_corpo_id))
			{
				if (ds_list_find_value(bloco_corpo_id.lista_opcoes, id_corpo) == self.id)
				{
					bloco_corpo_id.qtd_opcoes--;
					ds_list_delete(bloco_corpo_id.lista_opcoes, id_corpo);
				}
			}
		
			//tirando de cima/baixo
			if (opc_cima != noone)
			{
				opc_cima.opc_baixo = noone;
				opc_cima = noone;
			}
			else if (opc_baixo != noone)
			{
				opc_baixo.opc_cima = noone;
				opc_baixo.corpo = false;
				opc_baixo = noone;
			}
	
			//corpo = false;
			x_corpo = 0;
			y_corpo = 0;
			id_corpo = -1;
			bloco_corpo_id = noone;
		
			if (x_mouse_diff == 0) x_mouse_diff = mouse_x - x;
			if (y_mouse_diff == 0) y_mouse_diff = mouse_y - y;
		
			global.sel = self;
			layer_add_instance("BLOCO_OUTLINE", self);
		}
	}
}
else if (global.sel == self)
{
	global.sel = noone;
	layer_add_instance("BLOCO", self);
	
	x_mouse_diff = 0;
	y_mouse_diff = 0;
}

//depth
if (global.sel != noone && escolhido && global.sel != self) depth = 150

//---------------------------------------- COLIDINDO COM OS BLOCOS --------------------------------------
if (global.sel == self)
{
	x = mouse_x - x_mouse_diff;
	y = mouse_y - y_mouse_diff;
}
else if (global.sel != noone && escolhido && room != rm_fase4) //----------------- COLIDINDO COM OUTROS BLOCOS --------------------------
{
	//--------------------------------------------- OPCOES -----------------------------------------
	//cima
	var col_opc_cima = collision_line(x, y - 25, x + 40, y - 5, obj_bloco_opcoes, true, false);
	
	if (col_opc_cima && global.sel.id == col_opc_cima && mouse_check_button_released(mb_left) && opc_cima == noone && col_opc_cima.escolhido && col_opc_cima.bloco_corpo_id == noone && col_opc_cima.opc_baixo == noone && bloco_corpo_id == noone)
	{
		opc_cima = col_opc_cima;
		col_opc_cima.opc_baixo = self.id;
		
		col_opc_cima.x = x;
		col_opc_cima.y = y - 30;
	}

	//baixo
	var col_opc_baixo = collision_line(x, y + 35, x + 40, y + 55, obj_bloco_opcoes, true, false);
	
	if (col_opc_baixo && global.sel.id == col_opc_baixo && mouse_check_button_released(mb_left) && opc_baixo == noone && col_opc_baixo.escolhido && col_opc_baixo.bloco_corpo_id == noone && col_opc_baixo.opc_cima == noone && bloco_corpo_id == noone)
	{
		opc_baixo = col_opc_baixo;
		col_opc_baixo.opc_cima = self.id;
		
		col_opc_baixo.x = x;
		col_opc_baixo.y = y + 30;
	}
	
	//--------------------------------------------- CORPO -----------------------------------------
	//cima
	var col_opc_cima = collision_line(x, y - 25, x + 40, y - 5, obj_bloco_corpo, true, false);
	
	if (col_opc_cima && global.sel.id == col_opc_cima && mouse_check_button_released(mb_left) && opc_cima == noone && col_opc_cima.escolhido && col_opc_cima.opc_baixo == noone && bloco_corpo_id == noone)
	{
		opc_cima = col_opc_cima;
		col_opc_cima.opc_baixo = self.id;
		
		col_opc_cima.x = x;
		
		if (col_opc_cima.qtd_opcoes == 0) col_opc_cima.y = y - 90;
		else col_opc_cima.y = y - 90 - (30 * (col_opc_cima.qtd_opcoes));
	}

	//baixo
	var col_opc_baixo = collision_line(x, y + 35, x + 40, y + 55, obj_bloco_corpo, true, false);
	
	if (col_opc_baixo && global.sel.id == col_opc_baixo && mouse_check_button_released(mb_left) && opc_baixo == noone && col_opc_baixo.escolhido && col_opc_baixo.opc_cima == noone && bloco_corpo_id == noone)
	{
		opc_baixo = col_opc_baixo;
		col_opc_baixo.opc_cima = self.id;
		
		col_opc_baixo.x = x;
		col_opc_baixo.y = y + 30;
	}
}

//--------------------------------------- LISTA CONJUNTO BLOCOS ----------------------------------
if (opc_cima == noone && bloco_corpo_id == noone)
{
	if (escolhido && ds_list_find_index(global.lista_conjunto_bloco, self) == -1) ds_list_add(global.lista_conjunto_bloco, self);
}
else if (ds_list_find_index(global.lista_conjunto_bloco, self) != -1) ds_list_delete(global.lista_conjunto_bloco, ds_list_find_index(global.lista_conjunto_bloco, self));

//-------------------------------------- RODANDO NA SIMULACAO QUANDO FOR A VEZ --------------------
if (global.simulacao)
{
	if (vez)
	{
		mostrar_triangulo_verde = true;
		
		opc_da_vez(opcao);
		alarm[0] = room_speed/global.game_speed; //passando a vez pro bloco de baixo
		vez = false;
	}
}
else
{
	vez = false;
	mostrar_triangulo_verde = false;
}

//movendo o bloco de baixo
if (instance_exists(opc_baixo))
{
	opc_baixo.x = x;
	opc_baixo.y = y + 30;
	
	if (global.sel == self || corpo)
	{
		opc_baixo.corpo = true;
	
		//brilhando ele
		layer_add_instance("BLOCO_OUTLINE", opc_baixo);
	}
	else
	{
		layer_add_instance("BLOCO", opc_baixo);
		opc_baixo.corpo = false;
	}
}

//movendo
if (global.sel == self)
{
	x = mouse_x - x_mouse_diff;
	y = mouse_y - y_mouse_diff;
}
else if (bloco_corpo_id != noone)
{
	x = x_corpo;
	y = y_corpo;
}
else if (layer_get_name(layer) != "BLOCO_OUTLINE")
{
	//se destruindo ao sair da area de edicao
	if ((x < room_width/2 + 5  + 220 && escolhido) || (x + sprite_width > room_width)) instance_destroy();
}