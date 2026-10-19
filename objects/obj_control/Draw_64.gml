if (room != rm_inicial && room != rm_final)
{
	//variaveis
	var r_w = room_width;
	var r_h = room_height;
	
	draw_set_font(fnt_geral);
	draw_set_color(c_aqua);
	
	//dica da fase
	var _id = 0;

	if (room == rm_fase1_1 || room == rm_fase1_2 || room == rm_fase1_3) _id = 0;
	else if (room == rm_fase2) _id = 1;
	else if (room == rm_fase3_1 || room == rm_fase3_2 || room == rm_fase3_3) _id = 2;
	else if (room == rm_fase4) _id = 3;
	
	var _objetivo_fase = fase_info[_id].objetivo;

	//------------------------------------------ AREA DICAS --------------------------------------------
	draw_rectangle_color(-1, r_h/2 - 5 + 250, r_w/2 - 5, r_h, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
	
	if (room == rm_fase4)
	{
		if (ds_list_size(lista_sim) > 0)
		{
			for (var i = 0; i < ds_list_size(lista_sim); i++)
			{
				var temp_seg = "";
				var temp_min = "";
				var temp_hor = "";
				var lista = ds_list_find_value(lista_sim, i);

				if (round(lista[0]) < 10) temp_seg = "0" + string(round(lista[0]));
				else temp_seg = string(round(lista[0]));

				if (lista[1] < 10) temp_min = "0" + string(lista[1]);
				else temp_min = string(lista[1]);

				if (lista[2] < 10) temp_hor = "0" + string(lista[2]);
				else temp_hor = string(lista[2]);

				var sim_temp_total = temp_hor + " : " + temp_min + " : " + temp_seg;

				draw_set_color(c_white);

				//TEMPO DE CADA SIMULACAO
				//1, 2 e 3 ganchos
				if (lista[3] == 1) draw_text(5, r_h/2 - 5 + 250 + 15 + 10, "Tempo de simulação com um gancho = " + sim_temp_total);
				else if (lista[3] == 2) draw_text(5, r_h/2 - 5 + 250 + 15 + 30, "Tempo de simulação com dois ganchos = " + sim_temp_total);				
				else if (lista[3] == 3) draw_text(5, r_h/2 - 5 + 250 + 15 + 50, "Tempo de simulação com três ganchos = " + sim_temp_total);
			}
		}
		else draw_text_ext_transformed(5, r_h/2 - 5 + 250 + 15, _objetivo_fase, 16, 750, 1, 1, 0);
	}
	else draw_text_ext_transformed(5, r_h/2 - 5 + 250 + 15, _objetivo_fase, 16, 750, 1, 1, 0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	//-------------------------------------------- LINHAS DIVISAO -----------------------------------------
	//vertical
	draw_rectangle_color(r_w/2 - 5, 0, r_w/2 + 5, r_h, c_black, c_black, c_black, c_black, false);

	//horizontal
	draw_rectangle_color(0, r_h/2 - 5 + 250, r_w/2, r_h/2 + 5 + 250, c_black, c_black, c_black, c_black, false);

	//-------------------------------------------- TEMPO SIMULACAO -----------------------------------------
	//retangulo
	draw_rectangle_color(r_w/2 - 5 - 100, 10, r_w/2 - 5 - 10, 40, c_black, c_black, c_black, c_black, false);

	//tempos
	draw_set_color(c_yellow);

	var temp_seg = "";
	var temp_min = "";
	var temp_hor = "";

	if (round(sim_seg) < 10) temp_seg = "0" + string(round(sim_seg));
	else temp_seg = string(round(sim_seg));

	if (sim_min < 10) temp_min = "0" + string(sim_min);
	else temp_min = string(sim_min);

	if (sim_hor < 10) temp_hor = "0" + string(sim_hor);
	else temp_hor = string(sim_hor);

	draw_text(r_w/2 - 5 - 93, 27, temp_hor + " : " + temp_min + " : " + temp_seg);

	draw_set_font(-1);
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
}