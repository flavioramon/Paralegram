//gancho
var angulo_gancho = y_gancho >= 256? 90: 0;

draw_sprite_ext(spr_gancho_fase3, 0, x, y_gancho, .5, .5, angulo_gancho, c_white, 1);

//corpo da maquina
draw_sprite(sprite_index, 1, x, y);
draw_sprite(sprite_index, 0, x, y);