/// @description parando a simulacao
if (image_index == 2)
{
	image_index++;
	global.simulacao = false;
	global.qtd_container_fase4 = 0; //container
	
	//resetando o timer
	obj_control.sim_seg = 0;
	obj_control.sim_min = 0;
	obj_control.sim_hor = 0;
	
	//destruindo/arrumando os objetos de cada fase
	if (room == rm_fase1_3 || room == rm_fase1_1 || room == rm_fase1_2) //fase 1_1, 1_2, 1_3
	{
		//retornando o funcionario pro lugar original
		with(obj_funcionario)
		{
			x = x_inic;
			y = y_inic;
			dir = 0;
			carregando = false;
		}
		
		with(obj_pallet_fase1)
		{
			if (entrega) com_caixa = false;
		}
		
		with(obj_pilha_caixas)
		{
			image_index = image_index_inicial;
		}
	}
	else if (room == rm_fase2) //fase 2
	{
		if (instance_exists(empilhadeira_usuario))
		{
			empilhadeira_usuario.x = empilhadeira_usuario.x_inic;
			empilhadeira_usuario.y = empilhadeira_usuario.y_inic;
			empilhadeira_usuario.dir = 2;
			empilhadeira_usuario.carregando = false;
		}
					
		if (instance_exists(empilhadeira_IA))
		{
			empilhadeira_IA.x = empilhadeira_IA.x_inic;
			empilhadeira_IA.y = empilhadeira_IA.y_inic;
			empilhadeira_IA.dir = 1;
			empilhadeira_IA.parou_IA = false;
		}
		
		if (instance_exists(pallet_fase2_usuario)) pallet_fase2_usuario.image_alpha = 1;
	}
	else if (room == rm_fase3_1 || room == rm_fase3_2 || room == rm_fase3_3) //fase 3_1, 3_2, 3_3
	{
		with(obj_gancho_fase3)
		{
			container = noone;
			qtd_containers_sobrando = qtd_containers_sobrando_inicial;
		
			x = x_inicial;
			y = y_inicial;
		}
		
		with(obj_container_fase3)
		{
			x = x_inicial;
			y = y_inicial;
		}
	}
	else if (room == rm_fase4) //fase 4
	{
		global.fase4_qtd_amarelo_pegos = 0;
		global.fase4_qtd_azul_pegos = 0;
		global.fase4_qtd_vermelho_pegos = 0;

		//destruindo os ganchos
		if (instance_exists(obj_gancho_fase4)) instance_destroy(obj_gancho_fase4);
		
		//voltando os containers pro lugar original
		with (obj_container_fase4)
		{
			x = x_inicial;
			y = y_inicial;
			image_angle = angulo_inicial;
		}
	}
	
	alarm[0] = room_speed/2;
}