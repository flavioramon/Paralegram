draw_self();

if (carregando)
{
	if (dir == 0)
	{
		draw_sprite(spr_caixas, image_index, x, y + 32);
		draw_sprite_ext(spr_caixas, image_index, x, y + 32, .75, .75, 0, c_white, 1);
	}
	else if (dir == 1)
	{
		draw_sprite(spr_caixas, image_index, x - 32, y);
		draw_sprite_ext(spr_caixas, image_index, x - 32, y, .75, .75, 0, c_white, 1);
	}
	else if (dir == 2)
	{
		draw_sprite(spr_caixas, image_index, x, y - 32);
		draw_sprite_ext(spr_caixas, image_index, x, y - 32, .75, .75, 0, c_white, 1);
	}
	else
	{
		draw_sprite(spr_caixas, image_index, x + 32, y);
		draw_sprite_ext(spr_caixas, image_index, x + 32, y, .75, .75, 0, c_white, 1);
	}
}