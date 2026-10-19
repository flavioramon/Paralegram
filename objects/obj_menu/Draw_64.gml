var r_w = room_width;
var r_h = room_height;

//definindo a sprite de explicacao
var _id = 0;

if (room == rm_fase1_1) _id = 0;
else if (room == rm_fase2) _id = 1;
else if (room == rm_fase3_1) _id = 2;
else if (room == rm_fase4) _id = 3;

var _sprite_explicacao = obj_control.fase_info[_id].sprite;
var _nome_fase = obj_control.fase_info[_id].nome;
var _habilidade_fase = obj_control.fase_info[_id].habilidade;
var _objetivo_fase = obj_control.fase_info[_id].objetivo;

var w_b = sprite_get_width(spr_menu_botao);
var h_b = sprite_get_height(spr_menu_botao);

//desenhando
draw_set_color(c_black);
draw_set_font(fnt_geral);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

//tela fundo preta
draw_set_alpha(.6);
if (room != rm_fase4 || mostrou_graficos || inicio || tutorial) draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_alpha(alpha);

//TUTORIAL
if (tutorial)
{
	//se desenhando
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, alpha);
	
	//texto do botao
	var _texto_botao1 = tutorial_atual == -1 ? "SAIR" : "VOLTAR";
			
	if (tutorial_atual == -1) //escolher tutorial
	{
		draw_text_transformed(x, 100, "Tutoriais", 3, 3, 0);
		
		//tutoriais
		var _total = ds_list_size(lista_tutoriais);
		var _colunas_max = 3;
		var _espacamento = 30;

		for (var i = 0; i < _total; i++)
		{
		    //calcula linha e coluna
		    var _row = i div _colunas_max;
		    var _col = i mod _colunas_max;
    
		    //quantos botoes tem nessa linha especifica
		    var _botoes_na_linha = min(_colunas_max, _total - (_row * _colunas_max));
    
		    //offset: se a linha estiver cheia, o offset é 0
		    var _offset_centralizado = ((_colunas_max - _botoes_na_linha) * (w_b + _espacamento)) / 2;

		    //calculo do x e y
		    var _x = (x - (w_b + _espacamento)) + (_col * (w_b + _espacamento)) + _offset_centralizado;
		    var _y = y - (1.5 * (h_b + _espacamento)) + (_row * (h_b + _espacamento));
    
		    var _tamanho_botao = 1;
		    var _tutorial = ds_list_find_value(lista_tutoriais, i);

		    //verificação de clique
		    if (point_in_rectangle(mouse_x, mouse_y, _x - w_b/2, _y - h_b/2, _x + w_b/2, _y + h_b/2))
		    {
		        _tamanho_botao = 1.1;
		        if (mouse_check_button_pressed(mb_left))
		        {
		            tutorial_atual = i;
		            alarm[0] = 1;
		        }
		    }

		    //desenho
		    draw_sprite_ext(spr_menu_botao, 0, _x, _y, _tamanho_botao, _tamanho_botao, 0, c_white, alpha);
		    draw_text_color(_x, _y, _tutorial[0], c_black, c_black, c_black, c_black, alpha);
		}
	}
	else //mostrando o tutorial escolhido
	{
		//infos
		var _tutorial = ds_list_find_value(lista_tutoriais, tutorial_atual);
		
		//nome do tutorial
		draw_text_transformed(x, 100, _tutorial[0], 3, 3, 0);
	
		//video
		var _video_data = video_draw();
		var _video_status = _video_data[0];
	
		//video rodando normalmente
		if (_video_status == 0)
		{
			var _video_surface = _video_data[1];
				
			var _v_w = surface_get_width(_video_surface);
			var _v_h = surface_get_height(_video_surface);
				
			var _divisor = array_contains([3, 10], tutorial_atual) ? .5 : 1.5;
			_divisor = array_contains([8, 9], tutorial_atual) ? 2 : _divisor;
				
			draw_surface_stretched(_video_surface, x - _v_w/(_divisor * 2), y - _v_h/(_divisor * 2), _v_w/_divisor, _v_h/_divisor);
		}
		
		draw_set_halign(fa_left);
		
		//texto esquerda
		draw_text_ext_transformed(x - 460 - 100, y, _tutorial[1], 16, 200, 1.25, 1.25, 0);
		
		//texto direita
		draw_text_ext_transformed(x + 450 - 100, y, _tutorial[3], 16, 200, 1.25, 1.25, 0);
		
		draw_set_halign(fa_center);
	}
	
	//botao de sair/voltar
	draw_sprite_ext(spr_menu_botao, 0, x_botao1, y_botoes, tam_b1, tam_b1, 0, c_white, alpha);
	draw_text_transformed_color(x_botao1, y_botoes, _texto_botao1, tam_b1, tam_b1, 0, c_black, c_black, c_black, c_black, alpha);
}
else if (!inicio) //FIM DE FASE
{
	if (room != rm_fase4 && room != rm_final) //outras fases
	{
		//se desenhando
		draw_sprite_ext(sprite_index, 0, 400, 300, .5, .5, 0, c_white, alpha);
	
		//estrelas vazias e pontuação minimas
		for (var i = 0; i < 3; i++)
		{
			var _y_extra = (i == 1)? -25 : 0;
			
			//estrelas
			draw_sprite_ext(spr_estrelas, 0, 400 - 100 + (i * 100), 300 - 50 + _y_extra, .5, .5, 0, c_white, alpha);
			
			//pontuacao minima
			var _minimo = 0
			
			if (criterios != noone)
			{
				if (i == 0) _minimo = criterios.p_1_estrela;
				else if (i == 1) _minimo = criterios.p_2_estrelas;
				else _minimo = criterios.p_3_estrelas;
			}
	
			draw_text_transformed(400 - 100 + (i * 100), 300 - 50 + _y_extra + 55, _minimo, 1.5, 1.5, 0)
		}
		
		//preenchendo as estrelas
		if (alpha >= 1)
		{
			for (var i = 0; i < qtd_estrelas_fase; i++)
			{
				var _y_extra = (i == 1)? -25 : 0;
				
				//animacao
				var _escala = 0;
				var _rot = 0;
				
				if (qtd_estrelas_na_tela < i) continue;
				else if (qtd_estrelas_na_tela <= i + 1)
				{
					var _progresso = (qtd_estrelas_na_tela - i)/2;
					
					_escala = _progresso;
					_rot = ((_progresso / .025) * 9);
				}
				else
				{
					_escala = .5;
					_rot = 0;
				}
				
				draw_sprite_ext(spr_estrelas, 1, 400 - 100 + (i * 100), 300 - 50 + _y_extra, _escala, _escala, _rot, c_white, alpha);
			}
			
			qtd_estrelas_na_tela += .025;
		}
		
		//mensagem de fase concluida
		draw_text_transformed(400, 150, "FASE CONCLUÍDA", 1.5, 1.5, 0);
		
		//quadrado da pontuacao
		draw_sprite_ext(sprite_index, 1, 400, 300, .75, .75, 0, c_white, alpha);
		
		//pontuacao
		draw_text_transformed(400, 300 + 40, "PONTUAÇÃO", 1, 1, 0);
		draw_text_transformed_color(400, 300 + 75, global.pontuacao_fase, 1, 1, 0, c_white, c_white, c_white, c_white, 1);

		//botoes
		draw_sprite_ext(spr_menu_botao, 0, x_botao1, y_botoes, tam_b1, tam_b1, 0, c_white, alpha);
		draw_text_transformed_color(x_botao1, y_botoes, "REINICIAR", tam_b1, tam_b1, 0, c_black, c_black, c_black, c_black, alpha);

		draw_sprite_ext(spr_menu_botao, 0, x_botao2, y_botoes, tam_b2, tam_b2, 0, c_white, alpha);
		draw_text_transformed_color(x_botao2, y_botoes, "CONTINUAR", tam_b2, tam_b2, 0, c_black, c_black, c_black, c_black, alpha);
	}
	else if (room == rm_fase4) //fase 4
	{
		if (!mostrou_graficos) //botao para mostrar os graficos
		{
			//botao de mostrar os graficos
			draw_sprite_ext(spr_menu_botao, 0, 650, 800, tam_b3, tam_b3, 0, c_white, alpha);
			draw_text_transformed_color(650, 800, "VER GRÁFICOS", tam_b3, tam_b3, 0, c_black, c_black, c_black, c_black, alpha);
		}
		else //mostrando os graficos
		{
			//se desenhando
			draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, alpha);
		
			//grafico
			criar_todos_graficos(150, 50, obj_control.lista_sim);
		
			//botao de continuar
			draw_sprite_ext(spr_menu_botao, 0, 3 * r_w/4, r_h/2, tam_b2, tam_b2, 0, c_white, alpha);
			draw_text_transformed_color(3 * r_w/4, r_h/2, "CONTINUAR", tam_b2, tam_b2, 0, c_black, c_black, c_black, c_black, alpha);
		}
	}
	else //room final
	{
		//se desenhando
		draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, alpha);
	
		//quadrado da pontuacao
		draw_sprite_ext(sprite_index, 1, x, y + 150, 1, 1, 0, c_white, alpha);
		
		//mensagem de fase concluida
		draw_text_transformed(x, 75, "Você completou o", 2, 2, 0);
		
		//logo do jogo
		draw_sprite_ext(spr_paralegram_logo, 0, x, y - 100, .5, .5, 0, c_white, alpha);

		//pontuacao
		draw_text_transformed(x, y + 200, "PONTUAÇÃO TOTAL", 1.5, 1.5, 0);
		draw_text_transformed_color(x, y + 250, global.pontuacao_total, 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
	}
}
else //INICIO DE FASE
{
	//se desenhando
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, alpha);

	if (room != rm_inicial) //outras rooms
	{
		//nome da fase
		draw_text_transformed(x, 80, _nome_fase, 2, 2, 0);
		
		//foto da fase
		draw_sprite_ext(_sprite_explicacao, 0, r_w/2, r_h/2 - 75, .75, .75, 0, c_white, alpha);
	
		//habilidade e objetivo da fase
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		
		draw_text_ext_transformed(x - 475, y - 275, "Habilidade:", 16, 250, 1.6, 1.6, 0);
		draw_text_ext_transformed(x + 475, y - 275, "Objetivo:", 16, 250, 1.6, 1.6, 0);
		
		draw_set_halign(fa_left);
		draw_text_ext_transformed(x - 475 - 150, y - 250, _habilidade_fase, 16, 250, 1.25, 1.25, 0);
		draw_text_ext_transformed(x + 475 - 150, y - 250, string_delete(_objetivo_fase, 0, 11), 16, 250, 1.25, 1.25, 0);
		
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
	
		//botao de continuar
		draw_sprite_ext(spr_menu_botao, 0, x_botao2, y_botoes, tam_b2, tam_b2, 0, c_white, alpha);
		draw_text_transformed_color(x_botao2, y_botoes, "CONTINUAR", tam_b2, tam_b2, 0, c_black, c_black, c_black, c_black, alpha);
	}
	else //room inicial
	{
		//texto de boas vindas
		draw_text_transformed(x, 100, "Bem-vindo(a) ao:", 3, 3, 0);
		
		//logo do jogo
		draw_sprite_ext(spr_paralegram_logo, 0, x, y, .75, .75, 0, c_white, alpha);
		
		//botao de voltar
		draw_sprite_ext(spr_menu_botao, 0, x_botao1, y_botoes, tam_b1, tam_b1, 0, c_white, alpha);
		draw_text_transformed_color(x_botao1, y_botoes, "TUTORIAL", tam_b1, tam_b1, 0, c_black, c_black, c_black, c_black, alpha);
		
		//botao de iniciar jogo
		draw_sprite_ext(spr_menu_botao, 0, x_botao2, y_botoes, tam_b2, tam_b2, 0, c_white, alpha);
		draw_text_transformed_color(x_botao2, y_botoes, "INICIAR JOGO", tam_b2, tam_b2, 0, c_black, c_black, c_black, c_black, alpha);
	}
}

draw_set_font(-1);
draw_set_valign(-1);
draw_set_halign(-1);

draw_set_alpha(1);