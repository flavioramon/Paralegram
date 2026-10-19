if (!global.menu_fim_fase && !global.menu_inicio_fase && !instance_exists(obj_menu))
{
	//mouse movendo ele
	if (position_meeting(mouse_x, mouse_y, self) && global.sel == noone && !global.simulacao)
	{
		if (mouse_check_button_pressed(mb_left) && opc_cima == noone)
		{
			global.sel = self;
			layer_add_instance("BLOCO_OUTLINE", self);
	
			if (!escolhido)
			{
				if (room != rm_fase4)
				{
					var novo_corpo = instance_create_layer(x_inicial, y_inicial, "BLOCO", obj_bloco_corpo);
					novo_corpo.alvo = alvo;
				}
		
				escolhido = true;
			}
	
			if (x_mouse_diff == 0) x_mouse_diff = mouse_x - x;
			if (y_mouse_diff == 0) y_mouse_diff = mouse_y - y;
		}
		else if (mouse_check_button_pressed(mb_right) && (opc_cima != noone || opc_baixo != noone))
		{
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

if (global.sel == self)
{
	x = mouse_x - x_mouse_diff;
	y = mouse_y - y_mouse_diff;
}
else if (global.sel != noone && escolhido) //----------------- COLIDINDO COM OUTROS BLOCOS --------------------------
{
	//-------------------------------------------- GANCHO --------------------------------------------
	var col_qtd = collision_line(x + 64, y + 6, x + 127, y + 27, obj_bloco_qtd, true, false);
	
	if (col_qtd && global.sel.id == col_qtd && mouse_check_button_released(mb_left) && qtd_bloco_qtd < 1 && col_qtd.escolhido)
	{
		qtd_bloco_qtd++;
		qtd_bloco_atual = col_qtd;
		col_qtd.bloco_corpo_id = self;
	}
	
	//-------------------------------------------- OPCOES ---------------------------------------------
	//na lista
	var col_opc = collision_line(x + 34, y + 50 + (30 * (clamp(qtd_opcoes, 0, limite_qtd_opcoes - 1))), x + 191, y + 50 + (30 * (clamp(qtd_opcoes, 0, limite_qtd_opcoes - 1))), obj_bloco_opcoes, true, false);
	
	if (col_opc && global.sel.id == col_opc && mouse_check_button_released(mb_left) && qtd_opcoes < limite_qtd_opcoes && col_opc.escolhido && col_opc.opc_cima == noone && col_opc.opc_baixo == noone)
	{
		qtd_opcoes++;
		
		ds_list_add(lista_opcoes, col_opc);
		col_opc.bloco_corpo_id = self.id;
	}
	
	if (room != rm_fase4)
	{
		//fora da lista
		//cima
		var col_opc_cima = collision_line(x, y - 30, x + 40, y, obj_bloco_opcoes, true, false);
	
		if (col_opc_cima && global.sel.id == col_opc_cima && mouse_check_button_released(mb_left) && col_opc_cima.escolhido && opc_cima == noone && col_opc_cima.opc_baixo == noone)
		{
			opc_cima = col_opc_cima;
			col_opc_cima.opc_baixo = self.id;
		
			col_opc_cima.x = x;
			col_opc_cima.y = y - 30;
		}

		//baixo
		var col_opc_baixo = collision_line(x, y + 90 + (30 * qtd_opcoes), x + 40, y + 120 + (30 * qtd_opcoes), obj_bloco_opcoes, true, false);
	
		if (col_opc_baixo && global.sel.id == col_opc_baixo && mouse_check_button_released(mb_left) && col_opc_baixo.escolhido && opc_baixo == noone && col_opc_baixo.opc_cima == noone)
		{
			opc_baixo = col_opc_baixo;
			col_opc_baixo.opc_cima = self.id;
		
			col_opc_baixo.x = x;
			if (qtd_opcoes == 0) col_opc_baixo.y = y + 90;
			else col_opc_baixo.y = y + 90 + (30 * (qtd_opcoes));
		}
	
	//-------------------------------------------- CORPO ---------------------------------------------
		//cima
		var col_corpo_cima = collision_line(x, y - 25, x + 40, y - 5, obj_bloco_corpo, true, false);
	
		if (col_corpo_cima && global.sel.id == col_corpo_cima && mouse_check_button_released(mb_left) && col_corpo_cima.escolhido && opc_cima == noone && col_corpo_cima.opc_baixo == noone)
		{
			opc_cima = col_corpo_cima;
			col_corpo_cima.opc_baixo = self.id;
		
			col_corpo_cima.x = x;
		
			if (col_corpo_cima.qtd_opcoes == 0) col_corpo_cima.y = y - 90;
			else col_corpo_cima.y = y - 90 - (30 * (col_corpo_cima.qtd_opcoes));
		}
	
		//baixo
		var col_corpo_baixo = collision_line(x, y + 95 + (30 * qtd_opcoes), x + 40, y + 125 + (30 * qtd_opcoes), obj_bloco_corpo, true, false);
	
		if (col_corpo_baixo && global.sel.id == col_corpo_baixo && mouse_check_button_released(mb_left) && col_corpo_baixo.escolhido && opc_baixo == noone && col_corpo_baixo.opc_cima == noone)
		{
			opc_baixo = col_corpo_baixo;
			col_corpo_baixo.opc_cima = self.id;
		
			col_corpo_baixo.x = x;
			if (qtd_opcoes == 0) col_corpo_baixo.y = y + 90;
			else col_corpo_baixo.y = y + 90 + (30 * (qtd_opcoes));
		}
	}
}

//movendo as opcoes e qtds com o bloco (atualizando as posicoes)
//qtd repeticao/gancho
if (instance_exists(qtd_bloco_atual))
{
	qtd_bloco_atual.x_corpo = x + 62;
	qtd_bloco_atual.y_corpo = y + 4;
	qtd_bloco_atual.corpo = true;
	
	if (layer_get_name(layer) == "BLOCO_OUTLINE") layer_add_instance("BLOCO_OUTLINE", qtd_bloco_atual);
	else layer_add_instance("BLOCO", qtd_bloco_atual);
}

//opcoes dentro da lista
for (var i = 0; i < qtd_opcoes; i++)
{
	var opc = ds_list_find_value(lista_opcoes, i)
	
	opc.corpo = true;
	opc.x_corpo = x + 32;
	opc.y_corpo = y + 32 + (30 * i);
	opc.id_corpo = i;
	
	if (layer_get_name(layer) == "BLOCO_OUTLINE") layer_add_instance("BLOCO_OUTLINE", opc);
	else layer_add_instance("BLOCO", opc);
}

//opcoes fora da lista
//baixo
if (instance_exists(opc_baixo))
{
	opc_baixo.x = x;
	if (qtd_opcoes == 0) opc_baixo.y = y + 90;
	else opc_baixo.y = y + 90 + (30 * clamp(qtd_opcoes, 0, limite_qtd_opcoes - 1));
	
	if (global.sel == self || corpo) 
	{
		layer_add_instance("BLOCO_OUTLINE", opc_baixo);
		opc_baixo.corpo = true;
	}
	else
	{
		layer_add_instance("BLOCO", opc_baixo);
		opc_baixo.corpo = false;
	}
}

//--------------------------------- LISTA CONJUNTO BLOCOS ----------------------------------
if (opc_cima == noone)
{
	if (escolhido && ds_list_find_index(global.lista_conjunto_bloco, self) == -1) ds_list_add(global.lista_conjunto_bloco, self);
}
else if (ds_list_find_index(global.lista_conjunto_bloco, self) != -1) ds_list_delete(global.lista_conjunto_bloco, ds_list_find_index(global.lista_conjunto_bloco, self));

//----------------------------- RODANDO NA SIMULACAO QUANDO FOR A VEZ --------------------
if (global.simulacao)
{
	if (room != rm_fase4 && vez)
	{
		if (instance_exists(qtd_bloco_atual))
		{
			var max_rep = qtd_bloco_atual.image_index + 1;
			var max_opc = ds_list_size(lista_opcoes);
		
			if (timer_opc > 0)
			{
				if (rep_atual <= max_rep) timer_opc--;
			}
			else //rodando a possivel opcao
			{
				if (opc_atual < max_opc) //ainda tem opcao sobrando
				{
					var _opcao_da_vez = ds_list_find_value(lista_opcoes, opc_atual);
					_opcao_da_vez.mostrar_triangulo_verde = true;
					
					opc_da_vez(_opcao_da_vez.opcao);
					
					opc_atual++;
					timer_opc = room_speed/global.game_speed;
					_opcao_da_vez.alarm[0] = room_speed/global.game_speed;
				}
				else //nao tem mais opcao sobrando
				{
					if (rep_atual < max_rep) //ainda tem repeticao pra rodar
					{
						rep_atual++;
						opc_atual = 0;
					}
					else alarm[0] = 1; //acabaram as repeticoes, passando a vez
				}
			}
		}
		else alarm[0] = 1; //nao tem bloco de quantidade
	}
}
else
{
	vez = false;

	timer_opc = 0;
	opc_atual = 0;
	rep_atual = 1;
}

//------------------------------------- IMAGEM ------------------------------------------
image_index = clamp(qtd_opcoes, 0, limite_qtd_opcoes - 1);

//------------------------------ SAINDO DA AREA DE EDICAO ------------------------
if (global.sel != self && !corpo && layer_get_name(layer) != "BLOCO_OUTLINE")
{
	//se destruindo ao sair da area de edicao
	if ((x < room_width/2 + 5 + 220 && escolhido) || (x + sprite_width > room_width)) instance_destroy();
}

//---------------------------------- VERIFICANDO OS BLOCOS --------------------
for (var i = 0; i < ds_list_size(lista_opcoes); i++)
{
	var obj = ds_list_find_value(lista_opcoes, i);
	if (obj.bloco_corpo_id != id)
	{
		ds_list_delete(lista_opcoes, i);
		qtd_opcoes--;
	}
}

if (opc_cima != noone && opc_cima.object_index == obj_bloco_opcoes)
{
	if (opc_cima.bloco_corpo_id != noone)
	{
		opc_cima.opc_baixo = noone;
		opc_cima = noone;
	}
}

if (opc_baixo != noone && opc_baixo.object_index == obj_bloco_opcoes)
{
	if (opc_baixo.bloco_corpo_id != noone)
	{
		opc_baixo.opc_cima = noone;
		opc_baixo = noone;
	}
}