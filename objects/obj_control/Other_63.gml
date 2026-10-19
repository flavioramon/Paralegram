var _id = async_load[? "id"];

if (_id == id_async_nome)
{
    var _status = async_load[? "status"];

    //clickou ok
    if (_status)
    {
		var _nome = async_load[? "result"];
		var _tamanho_max_nome = 15;
		
		
		//nome vazio
		if (string_length(string_trim(_nome)) == 0)
		{
			show_message("Insira um nome válido.");
			id_async_nome = get_string_async("Digite o seu primero nome:", "");
		}
		else if (string_length(_nome) > _tamanho_max_nome) //nome muito grande
		{
			show_message("Seu nome deve ter no máximo " + string(_tamanho_max_nome) + " letras.");
			id_async_nome = get_string_async("Digite o seu primero nome:", "");
		}
		else //valido
		{
			ds_map_add(global.map_json, "nome", _nome);
		
			inseriu_nome = true;
		}
    }
    else //cancelou
    {
        show_message("A entrada do nome foi cancelada.");
		
		//pedindo o nome denovo
		id_async_nome = get_string_async("Digite o seu primero nome:", "");
    }
}