/// @description mudando de vez
vez = false;

timer_opc = 0;
opc_atual = 0;
rep_atual = 1;

if (opc_baixo != noone) opc_baixo.vez = true;
else obj_botoes.alarm[1] = room_speed;