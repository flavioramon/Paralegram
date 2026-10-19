//criando um novo bloco
var novo_bloco = instance_create_layer(x_inicial, y_inicial, "BLOCO", obj_bloco_corpo);
novo_bloco.alvo = alvo;

//resetando outros blocos linkados a ele
for (var i = 0; i < qtd_opcoes; i++)
{
	var opc = ds_list_find_value(lista_opcoes, i)
	
	opc.corpo = false;
	opc.x_corpo = 0;
	opc.y_corpo = 0;
	opc.id_corpo = 0;
	opc.bloco_corpo_id = noone;
		
	layer_add_instance("BLOCO", opc);
}

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
if (instance_exists(qtd_bloco_atual))
{
	qtd_bloco_atual.corpo = false;
	qtd_bloco_atual.bloco_corpo_id = noone;
}

//saindo da lista de conjunto de blocos se estiver dentro dela
if (ds_list_find_index(global.lista_conjunto_bloco, self) != -1) ds_list_delete(global.lista_conjunto_bloco, ds_list_find_index(global.lista_conjunto_bloco, self));