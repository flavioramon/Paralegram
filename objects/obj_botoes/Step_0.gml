if (position_meeting(mouse_x, mouse_y, self) && global.sel == noone && !global.menu_fim_fase && !global.menu_inicio_fase)
{
	image_blend = c_red;
	
	if (mouse_check_button_pressed(mb_left))
	{
		switch(image_index)
		{
			case 0: //iniciar simulacao
			{
				if (!instance_exists(obj_menu))
				{
					if (ds_list_size(global.lista_conjunto_bloco) == 1) //1 conjunto de blocos
					{
						if (room == rm_fase4)
						{
							if (instance_exists(obj_bloco_corpo.qtd_bloco_atual))
							{
								if (ds_list_size(obj_bloco_corpo.lista_opcoes) > 0)
								{
									image_index++;
									alarm[0] = room_speed/2;
									global.simulacao = true;
							
									global.qtd_container_fase4 = 9;
							
									//criando os ganchos
									if (obj_bloco_corpo.qtd_bloco_atual != noone)
									{
										for (var i = 0; i < obj_bloco_corpo.qtd_bloco_atual.image_index + 1; i++)
										{
											var gancho = instance_create_layer(256 + (128 * i), 256, "OBJETOS", obj_gancho_fase4);
											gancho.cor = i;
										}
									}
								
									obj_gancho_fase4.alarm[0] = 1;
								}
								else show_message("Insira blocos de comando");
							}
							else show_message("Insira um bloco de condição");
						}
						else //outras fases
						{
							image_index++;
							alarm[0] = room_speed/2;
							global.simulacao = true;
						
							ds_list_find_value(global.lista_conjunto_bloco, 0).id.vez = true;
						}
					}
					else //mais de 1 conjunto de blocos
					{
						show_message("Deve existir apenas 1 conjunto de blocos.")
					}
				}
				
				break;
			}
			
			case 2: //parar simulacao
			{
				if (!instance_exists(obj_menu)) alarm[1] = 1;
				
				break;
			}
			
			case 4: //resetar blocos
			{
				if (!global.simulacao)
				{
					image_index++;
					
					if (show_question("Deseja realmente apagar os blocos?") && !instance_exists(obj_menu))
					{
						with(obj_bloco_corpo) if (escolhido) instance_destroy();
						with(obj_bloco_qtd) if (escolhido) instance_destroy();
						with(obj_bloco_opcoes) if (escolhido) instance_destroy();
					}
					
					alarm[0] = room_speed/2;
				}
				
				break;
			}
			
			case 6: //tutorial
			{
				if (!global.simulacao && !instance_exists(obj_menu))
				{
					image_index++;
					
					var _menu = instance_create_layer(room_width/2, room_height/2, "MENU", obj_menu);
					_menu.tutorial = true;
					
					alarm[0] = room_speed/2;
				}
				
				break;
			}
			
			case 8: //1x - 2x
			{
				image_index++;
				global.game_speed = 2
				
				alarm[0] = room_speed/2;
				
				break;
			}
			
			case 10: //2x - 4x
			{
				image_index++;
				global.game_speed = 4
				
				alarm[0] = room_speed/2;
				
				break;
			}
			
			case 12: //4x - 1x
			{
				image_index++;
				global.game_speed = 1
				
				alarm[0] = room_speed/2;
				
				break;
			}
		}
	}
}
else
{
	image_blend = c_white;
}