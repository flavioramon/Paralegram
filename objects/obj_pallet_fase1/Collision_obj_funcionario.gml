if (other.carregando && other.image_index == cor_caixa && !global.menu_fim_fase && !global.menu_inicio_fase)
{
	other.carregando = false;
	
	if (!com_caixa) com_caixa = true;
	
	global.menu_fim_fase = true;
	global.simulacao = false;
}