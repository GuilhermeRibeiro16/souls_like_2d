// Inherit the parent event
event_inherited();
//criando as sprites do inimigo invocador 
sprite = 
{
	attack	: spr_invocador_attack,
	death	: spr_invocador_death,
	hurt	: spr_invocador_hurt,
	idle	: spr_invocador_idle,
	walk	: spr_invocador_walk
};
//direção
dir = 0;
//variaveis para criar filhos
filhos = [];
//cheacndo a imagem para criar minions
image_index_prev = 0;
contador_ataque = 0;

//se tamanho fizer um boss 
image_xscale = 1.5;
image_yscale = 1.5;

#region estado hunt
estado_hunt.inicia = function ()
{
	//definido sprite
	sprite_index = sprite.walk;
	image_index = 0;
	if (instance_exists(obj_player))
	{
	alvo = obj_player.id;
	dir = point_direction(alvo.x, alvo.y, x, y);
	}
}
estado_hunt.roda = function ()
{
	if (!instance_exists(alvo))
	{
		troca_estado(estado_idle);
		exit;
	}
	
	//definindo velocidade e fujindo do player
	velh = lengthdir_x(1, dir);
	velv = lengthdir_y(1, dir);
	
    // Olhar para o lado certo
    if (velh != 0) xscale = sign(velh);	
	//vendo se estou lonje do player para atacar
	var _dist = point_distance(x, y, alvo.x, alvo.y);
	if (_dist >= 120)
	{
		troca_estado(estado_attack);
	}
}
estado_hunt.finaliza = function()
{
	velh = 0;
	velv = 0;
}
#endregion

#region estado_attack
estado_attack.inicia = function ()
{
	sprite_index = sprite.attack;
	image_index = 0;
}
estado_attack.roda = function ()
{
	if (image_index >= image_index_prev)
	{
	//criando na hora certa
		if (image_index_prev == 0)
		{
			//criando meu gerador de inimigos
		var _filho = instance_create_depth(x, y, depth, obj_gera_inimigo);
		//passando para filho
		_filho.criador = id;
		}
				image_index_prev = image_index;
	}
	else
	{
		contador_ataque++;
		image_index_prev = 0;
		
	}	
	
	if (image_index >=7 )
	{
		velh = lengthdir_x(1, dir);
		velv = lengthdir_y(1, dir);
	}
	else
	{
		velh = 0;
		velv = 0;
	}
	//saindo do estado apos atacar duas vezes
	if (contador_ataque >= 2)
	{
		troca_estado(estado_idle);
	}
}
estado_attack.finaliza = function ()
{
	//criando o metodo para avisar o filho
	var _avisa_filhos = function (_elemento)
	{
		_elemento.alvo = alvo;
		_elemento.gerado = false;
		with (_elemento)
		{
			troca_estado(estado_hunt);
		}
	}
	contador_ataque = 0;
	//avisando aos filhos para atacar pelo vetor dos filhos array
	array_foreach(filhos, _avisa_filhos);
	
	//zerando o vetor para não avisar todos os filhos apos um segundo ataque
	array_resize(filhos, 0);
	
}

#endregion

//iniciando o estado idle
inicia_estado(estado_idle);