draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_center);

draw_set_font(fnt_geral);

//desenhando o texto da opcao
switch(opcao)
{
	//fase 1
	case "virar_esquerda": draw_text(x + 8, y + sprite_height/2, "VIRAR À ESQUERDA"); break;
	case "virar_direita": draw_text(x + 8, y + sprite_height/2, "VIRAR À DIREITA"); break;
	case "andar_frente": draw_text(x + 8, y + sprite_height/2, room == rm_fase2 ? "MOVER FRENTE" : "ANDAR FRENTE"); break;
	case "andar_atras": draw_text(x + 8, y + sprite_height/2, "ANDAR TRÁS"); break;
	
	//fase 2
	case "comunicar_IA": draw_text(x + 8, y + sprite_height/2, "COMUNICAR"); break;
	
	//fase 3
	case "andar_direita": draw_text(x + 8, y + sprite_height/2, "MOVER DIREITA"); break;
	case "andar_esquerda": draw_text(x + 8, y + sprite_height/2, "MOVER ESQUERDA"); break;
	case "andar_cima": draw_text(x + 8, y + sprite_height/2, "MOVER CIMA"); break;
	case "andar_baixo": draw_text(x + 8, y + sprite_height/2, "MOVER BAIXO"); break;
	case "pegar_soltar_container": draw_text(x + 8, y + sprite_height/2, "PEGAR OU SOLTAR"); break;
	
	//fase 4
	case "buscar_container": draw_text(x + 8, y + sprite_height/2, "IR AO PÁTIO"); break;
	case "subir_container": draw_text(x + 8, y + sprite_height/2, "PEGAR CONTAINER"); break;
	case "entregar_container": draw_text(x + 8, y + sprite_height/2, "IR AO NAVIO"); break;
	case "descer_container": draw_text(x + 8, y + sprite_height/2, "SOLTAR CONTAINER"); break;
}

draw_set_halign(-1);
draw_set_valign(-1);

draw_set_font(-1);

//draw_text(x + 100, y, opc_cima)
//draw_text(x + 100, y + 40, opc_baixo)

//draw_line(x, y + 35, x + 40, y + 65);//b
//draw_line(x, y - 35, x + 40, y - 5);//c