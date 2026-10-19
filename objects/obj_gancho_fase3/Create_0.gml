x_inicial = x;
y_inicial = y;

escala = 1;

container = noone;
qtd_containers_sobrando_inicial = 0;

if (room == rm_fase3_1) qtd_containers_sobrando_inicial = 1;
else if (room == rm_fase3_2) qtd_containers_sobrando_inicial = 2;
else if (room == rm_fase3_3) qtd_containers_sobrando_inicial = 3;

qtd_containers_sobrando = qtd_containers_sobrando_inicial;

alto = true;

opcao = "";

pode_pegar_container = false;
pode_soltar_container = false;

qtd_amarelo = 0;
qtd_azul = 0;
qtd_vermelho = 0;

img = 0;