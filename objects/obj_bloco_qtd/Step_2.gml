//soltando do mouse
if ((mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) && global.sel == self)
{
	layer_add_instance("BLOCO", self);
	
	x_mouse_diff = 0;
	y_mouse_diff = 0;
	global.sel = noone;
	
	depth = 149
}