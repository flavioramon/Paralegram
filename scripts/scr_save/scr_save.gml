//script pra atualizar o json
function atualizar_json()
{
	//criando o mapa do save
	var map_ = ds_map_create();
	
	//NOME E SOBRENOME
	map_[? "Nome"] = ds_map_find_value(global.map_json, "nome");
	
	//PONTUAÇÕES FASES
	var _array_fases = [rm_fase1_1, rm_fase1_2, rm_fase1_3, rm_fase2,
						rm_fase3_1, rm_fase3_2, rm_fase3_3, rm_fase4];
						
	for (var i = 0; i < array_length(_array_fases); i++)
	{
		var _nome_fase = room_get_name(_array_fases[i]);
		
		//arrumando o nome pro json
		var _nome_fase_limpo = string_replace_all(_nome_fase, "rm_fase", "Fase ");
		
		if (ds_map_exists(global.map_json, _nome_fase)) map_[? _nome_fase_limpo] = ds_map_find_value(global.map_json, _nome_fase);
		else map_[? _nome_fase_limpo] = 0;
	}
	
	//PONTUAÇÃO FINAL
	var _nome_fase = room_get_name(rm_final);
	
	if (ds_map_exists(global.map_json, _nome_fase)) map_[? "Pontos Totais"] = ds_map_find_value(global.map_json, _nome_fase);
	else map_[? "Pontos Totais"] = 0;
	
	
	
	
	//SALVANDO
	//pegandoa pasta "saves" e criando se n existir
    var pasta_saves = working_directory + "saves\\";
    if (!directory_exists(pasta_saves)) directory_create(pasta_saves);
    
    //caminho completo do arquivo json
    var caminho_arquivo = pasta_saves + "save.json";
    
    //salvando JSON como texto pra ficar legivel
    var file = file_text_open_write(caminho_arquivo);
    file_text_write_string(file, json_encode(map_));
    file_text_close(file);
    
    //destruindo o ds map
    ds_map_destroy(map_);
}