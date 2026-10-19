//funcao que desenha o grafico indivudualmente
function desenhar_grafico(_x, _y, _descricao_grafico, _descricao_eixo_y, _eixo_x, _eixo_y, _tempo)
{
	//pegando o maior valor do eixo y
	var _valor_maximo_eixo_y = max(_eixo_y[0], _eixo_y[1], _eixo_y[2]);
	
	//pegando o valor limite da tabela
	var _limite_eixo_y = _valor_maximo_eixo_y >= 10 ? ceil(_valor_maximo_eixo_y / 10) * 10 : ceil(_valor_maximo_eixo_y);
	
	//divisao do eixo y (serao 10 divisoes)
	var _divisao_eixo_y = _limite_eixo_y/10;
	
	//espaco entre as linhas
	var _espaco_linhas_eixo_x = 90;
	var _espaco_linhas_eixo_y = 25;
	
	//tamanho do grafico
	var _w_grafico = 400;
	var _h_grafico = 400;
	
	//grafico
	//draw_set_valign(fa_middle);
	//draw_set_halign(fa_center);
	//draw_set_font(fnt_geral);
	draw_set_color(c_black);
	
	//descricao do grafico
	draw_text_transformed(_x + _w_grafico/2, _y, _descricao_grafico, 1, 1, 0);
	
	//descricao do eixo y
	draw_text_transformed(_x, _y + _h_grafico/2.5, _descricao_eixo_y, .85, .85, 90);
	
	//descricao do eixo x
	draw_text_transformed(_x + _w_grafico/2, _y + _h_grafico/1.3, "Nº de núcleos (Cores)", .85, .85, 0);
	
	//linhas eixo y
	for (var i = 0; i <= 10; i++)
	{
		//numero
		draw_text_transformed(_x + 25, _y + 20 + (i * _espaco_linhas_eixo_y), string_format(_limite_eixo_y - (i * _divisao_eixo_y), 0, 1), .75, .75, 0)
		
		//linha
		draw_line_color(_x + 25, _y + 25 + (i * _espaco_linhas_eixo_y), _x + 25 + _w_grafico/1.125, _y + 25 + (i * _espaco_linhas_eixo_y), c_black, c_black);
	}
	
	//linhas eixo x
	for (var i = 0; i < 3; i++)
	{
		//pulando pra nao mostrar o resultado de 1 nucleo (quando nao for o tempo)
		if (i == 0 && !_tempo) continue;
		
		//altura do quadrado
		var _altura_max = 10 * _espaco_linhas_eixo_y; //altura total disponível do gráfico
		var _altura = (_eixo_y[i] / _limite_eixo_y) * _altura_max; //altura do quadrado

		//quantidade de nucleos
		draw_text_transformed(_x + 15 + _espaco_linhas_eixo_x * (i + 1), _y + 35 + (10 * _espaco_linhas_eixo_y), _eixo_x[i], .75, .75, 0);
		
		//quadrados eixo y
		draw_rectangle_color(_x + 15 + (_espaco_linhas_eixo_x * (i + 1)) - 25, _y + 25 + (10 * _espaco_linhas_eixo_y),
				_x + 15 + (_espaco_linhas_eixo_x * (i + 1)) + 25, _y + 25 + (10 * _espaco_linhas_eixo_y) - _altura,
				c_blue, c_blue, c_blue, c_blue, false);
	}
	
	//resetando as coisas
	//draw_set_valign(-1);
	//draw_set_halign(-1);
	//draw_set_font(-1);
	draw_set_color(c_white);
}

//funcao que cria os graficos da fase 5 e 6
function criar_todos_graficos(_x, _y, _lista)
{
	//item da ds_list é assim: [sim_seg, sim_min, sim_hor, qtd_gan, speedup, eficiencia, desempenho];
	
	//ordenando por gancho
	var _array = [];
	
	for (var i = 0; i < ds_list_size(_lista); i++)
	{
		var _item = ds_list_find_value(_lista, i);
		var _indice = _item[3] > 2 ? 2 : _item[3] - 1;
		
		_array[_indice] = _item;
	}
	
	var _tempos = [];
	var _ganchos = [];
	var _speedup = [];
	var _eficiencia = [];
	var _desempenho = [];
	
	//criando os arrays
	for (var i = 0; i < array_length(_array); i++)
	{
		var _item = _array[i];
		
		_ganchos[i] = _item[3];
		_tempos[i] = _item[0] + _item[1] * 60 + _item[2] * 3600; //segundo, minuto, hora
		_eficiencia[i] = _item[5];
		_speedup[i] = _item[4];
		_desempenho[i] = _item[6];
	}
	
	//tela branca do fundo
	draw_rectangle_color(_x, _y, _x + 810, _y + 753.3, c_white, c_white, c_white, c_white, false);
	
	//desenhando os graficos
	desenhar_grafico(_x + 20, _y + 20, "Tempo conforme o número de núcleos", "Tempo de processamento (segundos)", _ganchos, _tempos, true);
	desenhar_grafico(_x + 425, _y + 20, "Eficiência conforme o número de núcleos", "Eficiência", _ganchos, _eficiencia, false);
	desenhar_grafico(_x + 20, _y + 400, "Speedup conforme o número de núcleos", "Speedup", _ganchos, _speedup, false);
	desenhar_grafico(_x + 425, _y + 400, "Desempenho conforme o número de núcleos", "Desempenho", _ganchos, _desempenho, false);
	
	//ds_list_destroy(_lista);
}