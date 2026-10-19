draw_self();

if (carregando)
{
	var sprite_pallet = (room == rm_fase2)? spr_pallet_fase2: spr_pallet_fase3;
	var cor_pallet = (room == rm_fase2)? image_index: cor_pallet_fase3;
	var distancia = (room == rm_fase2)? 24: -24;
    
	if (dir == 0) draw_sprite_ext(sprite_pallet, cor_pallet, x, y - distancia, 1, 1, 180, c_white, 1);
	else if (dir == 1) draw_sprite_ext(sprite_pallet, cor_pallet, x + distancia, y, 1, 1, 90, c_white, 1);
	else if (dir == 2) draw_sprite_ext(sprite_pallet, cor_pallet, x, y + distancia, 1, 1, 0, c_white, 1);
	else draw_sprite_ext(sprite_pallet, cor_pallet, x - distancia, y, 1, 1, 270, c_white, 1);
}