//movimentacao empilhadeira IA
function vez_emp_IA(comunicar = false)
{
	with (empilhadeira_IA)
	{
		//empilhadeira_usuario
		if (comunicar && x != 384 && ((empilhadeira_usuario.y >= 352 && empilhadeira_usuario.y <= 416 && empilhadeira_usuario.dir == 2) || (empilhadeira_usuario.y <= 352 && empilhadeira_usuario.y >= 288 && empilhadeira_usuario.dir == 0)))
		{
			parou_IA = true;
		}
		
		if (parou_IA)
		{
			if (empilhadeira_usuario.y != 352 && (empilhadeira_usuario.y == 416 && empilhadeira_usuario.dir != 2) || (empilhadeira_usuario.y == 288 && empilhadeira_usuario.dir != 0))
			{
				parou_IA = false;
			}
		}
		
		if (!parou_IA)
		{
			if (x > 128 && dir == 1) x -= 64;
			else if (x == 128 && dir != 3) dir ++;
			else if (x < 640 && dir == 3) x += 64;
			else if (x == 640 && dir != 1) dir --;
		}
	}
}

//define as opcoes
function opc_da_vez(opc_atual)
{
	var passo_w = alvo.sprite_width;
	var passo_h = alvo.sprite_height;
	var emp = false;
	
	if (alvo == empilhadeira_usuario) emp = true;

	switch(opc_atual)
	{
		//virando o alvo pra esquerda
		case "virar_esquerda":
		{
			if (instance_exists(alvo))
			{
				if (alvo.dir >= 1) alvo.dir--;
				else alvo.dir = 3;
				
				if (emp) vez_emp_IA();
			}
			
			break;
		}
		
		//virando o alvo pra direita
		case "virar_direita":
		{
			if (instance_exists(alvo))
			{
				if (alvo.dir <= 2) alvo.dir++;
				else alvo.dir = 0;
				
				
				if (emp) vez_emp_IA();
			}
				
			break;
		}
		
		//andando pra frente
		case "andar_frente":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					if (dir == 0 && !place_meeting(x, y + 1, obj_parede_invisivel_colisao)) y += passo_h;
					else if (dir == 1 && !place_meeting(x - 1, y, obj_parede_invisivel_colisao)) x -= passo_w;
					else if (dir == 2 && !place_meeting(x, y - 1, obj_parede_invisivel_colisao)) y -= passo_h;
					else if (dir == 3 && !place_meeting(x + 1, y, obj_parede_invisivel_colisao)) x += passo_w;
				}
				
				if (emp) vez_emp_IA();
			}
			
			break;
		}
		
		//andando pra tras
		case "andar_atras":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					if (dir == 0 && !place_meeting(x, y - 1, obj_parede_invisivel_colisao)) y -= passo_h;
					else if (dir == 1 && !place_meeting(x + 1, y, obj_parede_invisivel_colisao)) x += passo_w;
					else if (dir == 2 && !place_meeting(x, y + 1, obj_parede_invisivel_colisao)) y += passo_h;
					else if (dir == 3 && !place_meeting(x - 1, y, obj_parede_invisivel_colisao)) x -= passo_w;
				}
			}
				
			break;
		}
		
		//comunicando com a ia
		case "comunicar_IA":
		{
			if (instance_exists(alvo))
			{
				vez_emp_IA(true);
			}
				
			break;
		}
		
		//verificando e pegando o pallet na fase 3
		case "verificar_pegar_caminhao":
		{
			if (instance_exists(alvo))
			{
				//verificando colisao
				if (place_meeting(alvo.x, alvo.y, obj_caminhao_fase3) && alvo.x >= 416 && !alvo.carregando && !alvo.pode_pegar_pallet_fase3)
				{
					alvo.pode_pegar_pallet_fase3 = true;
				}
			}
				
			break;
		}
		
		//FASE 4
		//andando pra direita
		case "andar_direita":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					if (!place_meeting(x + 33, y, obj_parede_invisivel_colisao)) x += passo_w;
				}
			}
			
			break;
		}
		
		//andando pra esquerda
		case "andar_esquerda":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					if (!place_meeting(x - 33, y, obj_parede_invisivel_colisao)) x -= passo_w;
				}
			}
				
			break;
		}
		
		//andando pra cima
		case "andar_cima":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					if (!place_meeting(x, y - 33, obj_parede_invisivel_colisao)) y -= passo_h;
				}
			}
			
			break;
		}
		
		//andando pra baixo
		case "andar_baixo":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					if (!place_meeting(x, y + 33, obj_parede_invisivel_colisao)) y += passo_h;
				}
			}
				
			break;
		}
			
		//pegar ou soltar container
		case "pegar_soltar_container":
		{
			if (instance_exists(alvo))
			{
				with(alvo)
				{
					//vendo quando containers o gancho ta colidindo
					var lista_containers_colididos = ds_list_create();
					
					collision_rectangle_list(x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2, obj_container_fase3, false, false, lista_containers_colididos, false);
					
					if (ds_list_size(lista_containers_colididos) == 1)
					{
						opcao = container == noone ? "pegar" : "soltar";
						
						alarm[0] = 1;
					}
					
					ds_list_destroy(lista_containers_colididos);
				}
			}
				
			break;
		}
	}
}