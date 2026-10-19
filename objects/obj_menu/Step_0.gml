if (alpha < 1) alpha += .05;

//calculando os pontos
if (!calculou_pontos && !inicio && room != rm_final)
{
	var _resultados = calcula_pontos();
	
	criterios = _resultados[1]
	qtd_estrelas_fase = _resultados[0];
	
	calculou_pontos = true;
}

var w_b = sprite_get_width(spr_menu_botao);
var h_b = sprite_get_height(spr_menu_botao);

if (tutorial) //tutorial
{
	x_botao1 = x;
	y_botoes = y + 350;
}
else if (!inicio) //final
{
	if (room == rm_fase4)
	{
		x_botao2 = 1200;
		y_botoes = y;
	}
	else
	{
		x_botao1 = 200;
		
		x_botao2 = 400 + 200;
		y_botoes = 300 + 150;
	}
}
else if (room == rm_inicial) //inicio
{
	x_botao1 = x - 150;
	
	x_botao2 = x + 150;
	y_botoes = y + 350;
}

//BOTAO REINICIAR/TUTORIAL (1)
if (obj_control.inseriu_nome && !instance_exists(obj_transicao_room) && mouse_x >= x_botao1 - w_b/2 && mouse_x <= x_botao1 + w_b/2 && mouse_y >= y_botoes - h_b/2 && mouse_y <= y_botoes + h_b/2)
{
	if (!inicio) tam_b1 = 1;
	else tam_b1 = 1.2;
	
	if (mouse_check_button_pressed(mb_left) && !mostrou_graficos)
	{
		if (tutorial) //saindo do tutorial
		{
			if (tutorial_atual == -1) //saindo de fato da tela de tutorial
			{
				if (room == rm_inicial) tutorial = false;
				else instance_destroy();
			}
			else //voltando pro menu de escolher tutorial
			{
				video_close();
				
				tutorial_atual = -1;
			}
		}
		else if (!inicio) //resetando a pontuacao e a fase
		{
			global.pontuacao_fase = 0;
			global.menu_fim_fase = false;
		
			transicao_rooms(room, 30, c_black);
		}
		else if (room == rm_inicial) //abrindo tutorial
		{
			if (!tutorial) tutorial = true;
		}
	}
}
else 
{
	if (!inicio) tam_b1 = .75;
	else tam_b1 = 1;
}

//BOTAO CONTINUAR (2)
if (obj_control.inseriu_nome && !instance_exists(obj_transicao_room) && mouse_x >= x_botao2 - w_b/2 && mouse_x <= x_botao2 + w_b/2 && mouse_y >= y_botoes - h_b/2 && mouse_y <= y_botoes + h_b/2)
{
	if (!inicio && !mostrou_graficos) tam_b2 = 1;
	else tam_b2 = 1.2;
	
	if (mouse_check_button_pressed(mb_left))
	{
		if (!inicio && !tutorial) //aplicando a pontuacao
		{
			//aplicando na pontuacao total
			global.pontuacao_total += global.pontuacao_fase;
			
			//salvando no json a pontuacao da fase e total
			if (!ds_map_exists(global.map_json, room_get_name(room))) ds_map_add(global.map_json, room_get_name(room), global.pontuacao_fase);
			else ds_map_replace(global.map_json, room_get_name(room), global.pontuacao_fase);
			
			if (!ds_map_exists(global.map_json, room_get_name(rm_final))) ds_map_add(global.map_json, room_get_name(rm_final), global.pontuacao_total);
			else ds_map_replace(global.map_json, room_get_name(rm_final), global.pontuacao_total);
			
			//atualizando o save
			atualizar_json();
			
			//resetando
			global.pontuacao_fase = 0;
			global.menu_fim_fase = false;
		
			//mudando de room
			transicao_rooms(room_next(room), 30, c_black);
		}
		else
		{
			if (room != rm_inicial) global.menu_inicio_fase = false;
			else if (!tutorial)
			{
				transicao_rooms(room_next(room), 30, c_black); //ja mostrou o tutorial
			}
		}
	}
}
else
{
	if (!inicio && !mostrou_graficos) tam_b2 = .75;
	else tam_b2 = 1;
}

//BOTAO MOSTRAR GRAFICO (3)
if (obj_control.inseriu_nome && !instance_exists(obj_transicao_room) && room == rm_fase4 && !mostrou_graficos && mouse_x >= 650 - w_b/2 && mouse_x <= 650 + w_b/2 && mouse_y >= 800 - h_b/2 && mouse_y <= 900 + h_b/2)
{
	tam_b3 = 1;
	
	if (mouse_check_button_pressed(mb_left) && !tutorial) mostrou_graficos = true;
}
else tam_b3 = .75;
