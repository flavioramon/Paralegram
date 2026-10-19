if (pode_pegar_container && other.ativo)
{
	container = other;
	
	//pegando na area de inicio
	if (collision_rectangle(224, 32, 608, 288, self, true, false)) qtd_containers_sobrando--;
	pode_pegar_container = false;
}
else if (pode_soltar_container)
{
	container = noone;
	
	//soltando na area de inicio
	if (collision_rectangle(224, 32, 608, 288, self, true, false)) qtd_containers_sobrando++;
	pode_soltar_container = false;
}