draw_self();

//desenhando os textos
draw_set_halign(fa_left);
draw_set_valign(fa_center);

draw_set_font(fnt_geral);

if (room == rm_fase4)
{
	draw_text(x + 36, y + 18, "SE");
	draw_text(x + 132, y + 18, "ENTÃO");
}
else
{
	draw_text(x + 16, y + 18, "PARA");
	draw_text(x + 132, y + 18, "ENTÃO");
}

draw_text(x + 8, y + 80 + (30 * (clamp(qtd_opcoes, 0, limite_qtd_opcoes - 1))), "FIMSE");

draw_set_halign(-1);
draw_set_valign(-1);

draw_set_font(-1);

//debug colisao
//draw_line(x + 64, y + 6, x + 127, y + 27); //qtd
//draw_line(x + 34, y + 50 + (30 * (clamp(qtd_opcoes, 0, 9))), x + 191, y + 50 + (30 * (clamp(qtd_opcoes, 0, 9)))); //opcao