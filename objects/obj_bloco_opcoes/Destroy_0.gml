//deslinkando dos outros blocos
if (instance_exists(opc_baixo))
{
	opc_baixo.corpo = false;
	opc_baixo.opc_cima = noone;
}
if (instance_exists(opc_cima))
{
	opc_cima.corpo = false;
	opc_cima.opc_baixo = noone;
}

//saindo da lista de conjunto de blocos se estiver dentro dela
if (ds_list_find_index(global.lista_conjunto_bloco, self) != -1) ds_list_delete(global.lista_conjunto_bloco, ds_list_find_index(global.lista_conjunto_bloco, self));