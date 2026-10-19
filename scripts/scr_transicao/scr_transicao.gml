function transicao_rooms(room_, duracao_, cor_)
{
	var inst = instance_create_depth(0, 0, -1000, obj_transicao_room);

	with (inst)
	{
		room_alvo = room_;
		duracao = duracao_;
		cor = cor_;
	}
}