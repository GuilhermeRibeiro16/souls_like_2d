//criando lista para inimigos
var _lista = ds_list_create();
var _qtd = instance_place_list(x, y, obj_inimigo_pai, _lista, false);
//pegando o inimigo da lista
for (var i = 0; i < ds_list_size(_lista); i++)
{
	//pegando o inimigo atual
	var _atual = _lista[| i];
	//checando se o inimigo esta na lista
	var _existe = array_contains(lista_inimigos, _atual);
	//adicinando o inimigo na lista
	if (!_existe)
	{
		array_push(lista_inimigos, _atual);
		//dano
		with(_atual)
		{
			if (!dead)
			{
			//lidando com o dano e poise
			lida_dano(, other.dano_poise);
			}
		}
	}
}

//depois eu zero a lista
ds_list_destroy(_lista);