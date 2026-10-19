var _cor = ativo ? c_white : c_black;
var _alpha = ativo ? 1 : .75;

//se desenhando
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, _cor, _alpha);