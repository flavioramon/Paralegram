if (other.carregando && !global.menu_fim_fase && !global.menu_inicio_fase)
{
	other.carregando = false;
	
	//terminar a fase
	global.menu_fim_fase = true;
	global.simulacao = false;
}