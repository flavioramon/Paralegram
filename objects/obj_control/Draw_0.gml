if (room != rm_inicial && room != rm_final)
{
	//variaveis
	var r_w = room_width;
	var r_h = room_height;

	//escolha dos blocos
	//retangulo area edicao
	draw_rectangle_color(r_w/2 + 5, 0, r_w, r_h, c_gray, c_gray, c_gray, c_gray, false);

	//retangulo das opcoes
	draw_rectangle_color(r_w/2 + 5, 0, r_w/2 + 5 + 220, r_h, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
}

////grafico de teste
//var _lista_teste = ds_list_create();
//ds_list_add(_lista_teste, [53.80, 0, 0, 1, 3.03, 3.03, 302.92]);
//ds_list_add(_lista_teste, [30.53, 0, 0, 2, 5.34, 2.67, 266.87]);
//ds_list_add(_lista_teste, [18.63, 0, 0, 3, 8.75, 2.92, 291.54]);

//criar_todos_graficos(25, 25, _lista_teste);

//var _lista_teste2 = ds_list_create();
//ds_list_add(_lista_teste2, [43, 2, 0, 1, 1.0, 1.0, 100]);
//ds_list_add(_lista_teste2, [27, 1, 0, 2, 1.8, 0.9, 93]);
//ds_list_add(_lista_teste2, [49, 0, 0, 4, 3.3, 0.82, 83]);

//criar_todos_graficos(room_width/2 + 25, 25, _lista_teste2);