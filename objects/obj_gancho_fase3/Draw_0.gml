//suportes
draw_sprite_ext(spr_suporte_gancho_fase4, 0, 48, y, 1.2, 1.2, 0, c_white, 1);
draw_sprite_ext(spr_suporte_gancho_fase4, 1, 784, y, -1.2, 1.2, 0, c_white, 1);

//container segurado
if (container != noone) draw_sprite_ext(spr_container_fase3, container.image_index, x, y, escala, escala, 0, c_white, 1);

//gancho
draw_sprite_ext(sprite_index, 0, x, y, escala, escala, 0, c_white, 1);

//seta antes da fase comecar
if (!global.simulacao)
{
	img += .15;
	draw_sprite(spr_seta_feedback, img, x, y - 24);
}