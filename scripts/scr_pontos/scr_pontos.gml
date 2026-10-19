///@description calcula a pontuaçao da fase
function calcula_pontos()
{
	//criterios
	var _criterios_estrela = [
		{p_1_estrela: 550, p_2_estrelas: 600, p_3_estrelas: 640}, //fase 1.1
		{p_1_estrela: 510, p_2_estrelas: 560, p_3_estrelas: 600}, //fase 1.2 
		{p_1_estrela: 350, p_2_estrelas: 400, p_3_estrelas: 440}, //fase 1.3 
		{p_1_estrela: 710, p_2_estrelas: 760, p_3_estrelas: 800}, //fase 2
		{p_1_estrela: 780, p_2_estrelas: 830, p_3_estrelas: 870}, //fase 3.1
		{p_1_estrela: 680, p_2_estrelas: 730, p_3_estrelas: 770}, //fase 3.2
		{p_1_estrela: 450, p_2_estrelas: 500, p_3_estrelas: 540}, //fase 3.3
		{p_1_estrela: 500, p_2_estrelas: 500, p_3_estrelas: 500}, //fase 4
	];
	
	var _qtd_blocos = 0;
	var _estrelas = 0;
	
	//definindo a room
	var _room = 0;
	
	if (room == rm_fase1_1) _room = 0;
	else if (room == rm_fase1_2) _room = 1;
	else if (room == rm_fase1_3) _room = 2;
	else if (room == rm_fase2) _room = 3;
	else if (room == rm_fase3_1) _room = 4;
	else if (room == rm_fase3_2) _room = 5;
	else if (room == rm_fase3_3) _room = 6;
	else if (room == rm_fase4) _room = 7;
	
	//calculando a qtd de blocos
	with (obj_bloco_corpo)
	{
		if (escolhido && qtd_bloco_atual != noone)
		{
			//se o x == 1, multiplica por 2 a quantidade de blocos, pois é como se n tivesse usado o loop
			var _multiplicador = qtd_bloco_atual.image_index + 1 != 1 ? 1 : 2;
			
			_qtd_blocos += qtd_opcoes * (qtd_bloco_atual.image_index + 1) * _multiplicador;
		}
	}
	
	with (obj_bloco_opcoes)
	{
		if (escolhido && bloco_corpo_id == noone) _qtd_blocos += 2;
	}
	
	//calculando a pontuacao
	global.pontuacao_fase = max(0, 1000 - _qtd_blocos * 10);
	
	//fase 4
	if (room == rm_fase4) global.pontuacao_fase = 500;
	
	//calculando as estrelas
	var _fase = _criterios_estrela[_room];
	
	if (global.pontuacao_fase >= _fase.p_3_estrelas) _estrelas = 3;
	else if (global.pontuacao_fase >= _fase.p_2_estrelas) _estrelas = 2;
	else if (global.pontuacao_fase >= _fase.p_1_estrela) _estrelas = 1;
	else _estrelas = 0;
	
	//retornando a qtd de estrelas
	return [_estrelas, _fase];
}