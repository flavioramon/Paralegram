var gui_h = display_get_gui_height();
var gui_w = display_get_gui_width();

//desenhando a transicao
draw_set_alpha(alpha);
draw_set_color(cor);

draw_rectangle(0, 0, gui_w, gui_h, false);

draw_set_alpha(1);
draw_set_color(c_white);