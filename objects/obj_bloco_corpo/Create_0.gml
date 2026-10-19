image_speed = 0;

limite_qtd_opcoes = room == rm_fase4? 4 : 10;

qtd_opcoes = 0;
qtd_bloco_qtd = 0;

lista_opcoes = ds_list_create();
opc_cima = noone;
opc_baixo = noone;

qtd_bloco_atual = noone;

escolhido = false;

x_mouse_diff = 0;
y_mouse_diff = 0;

corpo = false;

x_corpo = 0;
y_corpo = 0;

vez = false;
alvo = noone;

timer_opc = 0;
rep_atual = 1;
opc_atual = 0;

x_inicial = x;
y_inicial = y;