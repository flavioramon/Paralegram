ds_list_clear(global.lista_conjunto_bloco);
ds_list_clear(lista_sim);

global.menu_fim_fase = false;

global.sel = noone;
global.simulacao = false;
global.qtd_container_fase4 = 0;

global.fase3_cor = "amarelo";
global.fase3_qtd_entregue = 0;

global.fase4_qtd_amarelo_pegos = 0;
global.fase4_qtd_azul_pegos = 0;
global.fase4_qtd_vermelho_pegos = 0;

sim_seg = 0;
sim_min = 0;
sim_hor = 0;

dicas = false;

//tela de inicio da fase
if (room == rm_inicial || room == rm_fase1_1 || room == rm_fase2 || room == rm_fase3_1 || room == rm_fase4)
{
	global.menu_inicio_fase = true;
	global.menu_fim_fase = false;
}
else if (room == rm_final)
{
	global.menu_fim_fase = true;
	global.menu_inicio_fase = false;
}
else
{
	global.menu_inicio_fase = false;
	global.menu_fim_fase = false;
}