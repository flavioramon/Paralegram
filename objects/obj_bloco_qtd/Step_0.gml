if (!global.menu_fim_fase && !global.menu_inicio_fase && !instance_exists(obj_menu))
{
	//mouse movendo ele
	if (position_meeting(mouse_x, mouse_y, self) && global.sel == noone && !global.simulacao)
	{
		if (mouse_check_button_pressed(mb_left) && bloco_corpo_id == noone)
		{
			global.sel = self;
			layer_add_instance("BLOCO_OUTLINE", self);
	
			if (!escolhido)
			{
				var nova_opc = instance_create_layer(x_inicial, y_inicial, "BLOCO", obj_bloco_qtd);
				nova_opc.image_index = image_index;
			
				escolhido = true;
			}
	
			if (x_mouse_diff == 0) x_mouse_diff = mouse_x - x;
			if (y_mouse_diff == 0) y_mouse_diff = mouse_y - y;
		}
		else if (mouse_check_button_pressed(mb_right) && bloco_corpo_id != noone)
		{
			//tirando do bloco principal
			if (instance_exists(bloco_corpo_id))
			{
				bloco_corpo_id.qtd_bloco_qtd--;
				bloco_corpo_id.qtd_bloco_atual = noone;
			}
		
			bloco_corpo_id = noone;
	
			corpo = false;
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
	
	depth = 149
}


//depth
if (global.sel != noone && escolhido && global.sel != self) depth = 150

//soltando
//if (mouse_check_button_released(mb_left) && global.sel == self)
//{
//	global.sel = noone;
//	layer_add_instance("BLOCO", self);
	
//	x_mouse_diff = 0;
//	y_mouse_diff = 0;
//}

//mudando de image_index com o botao
if (room != rm_fase4 && !escolhido && !global.menu_fim_fase && !global.menu_inicio_fase && !instance_exists(obj_menu))
{
	if (x - 32 < mouse_x && mouse_x < x - 8 && y < mouse_y && mouse_y < y + sprite_height && mouse_check_button_pressed(mb_left))
	{
		if (image_index > 0) image_index--;
		else image_index = 9;
	}
	else if (x + 8 + sprite_width < mouse_x && mouse_x < x + 32 + sprite_width && y < mouse_y && mouse_y < y + sprite_height && mouse_check_button_pressed(mb_left))
	{
		if (image_index < 9) image_index++;
		else image_index = 0;
	}
}

//movendo
if (global.sel == self)
{
	x = mouse_x - x_mouse_diff;
	y = mouse_y - y_mouse_diff;
}
else if (corpo)
{
	x = x_corpo;
	y = y_corpo;
}
else
{
	//se destruindo ao sair da area de edicao
	if ((x < room_width/2 + 5  + 220 && escolhido) || (x + sprite_width > room_width)) instance_destroy();
}