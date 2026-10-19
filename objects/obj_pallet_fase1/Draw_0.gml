var _cor = ativo ? c_white : c_black;
var _alpha = ativo ? 1 : .75;

//se desenhando
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, _cor, _alpha);

//caixa no pallet
if (com_caixa)
{
	draw_sprite_ext(spr_caixas, cor_caixa, x - 16, y, 1, 1, 0, c_white, _alpha);
	draw_sprite_ext(spr_caixas, cor_caixa, x + 16, y, 1, 1, 0, c_white, _alpha);
}

//seta
if (entrega && !com_caixa)
{
	img += .15;
	draw_sprite(spr_seta_feedback, img, x, y);
}