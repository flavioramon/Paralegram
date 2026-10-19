draw_self();

//botoes escolher image index
if (!escolhido && room != rm_fase4)
{
	draw_rectangle(x - 32, y, x - 8, y + sprite_height, true);
	draw_triangle(x - 12, y + 4, x - 12, y + sprite_height - 4, x - 30, y + sprite_height/2, false);
	
	draw_rectangle(x + 34 + sprite_width, y, x + 8 + sprite_width, y + sprite_height, true);
	draw_triangle(x + 12 + sprite_width, y + 4, x + 12 + sprite_width, y + sprite_height - 4, x + 30 + sprite_width, y + sprite_height/2, false);
}