#region variaveis
//criando tempo para vasculhar
tempo_estado = game_get_speed(gamespeed_fps) + 15;
timer_estado = tempo_estado;
//CRIANDO DISTANCIA DE ATACK
range = 10;

//criando estrutura slime diferente
sprite =
{
	attack	: spr_Blue_slime_attack,
	death	: spr_Blue_slime_death,
	hurt	: spr_Blue_slime_hurt,
	idle	: spr_Blue_slime_idle,
	walk	: spr_Blue_slime_walk
};
//escolhendo local para andar
destino_x = 0;
destino_y = 0;
//escolahendo player
alvo = noone;
// Inherit the parent event
event_inherited();
estado_hunt = new estado();
//tudo que vier aqui em baixo e sobescrito somente do slime
#endregion

#region estado_idle
estado_idle.inicia = function()
{
	//definir a sprite parado
	sprite_index = sprite.idle;
	//começando do zero
	image_index = 0;
	//resetando tempo
	timer_estado = tempo_estado;
	
}
estado_idle.roda = function()
{
	//diminuindo o timer do estado
	timer_estado--;
	var _tempo = irandom(timer_estado);
	//se o tempo for menor igual a zero muda de estado
	if (_tempo <= tempo_estado * .01)
	{
		var _estado_novo = choose(estado_idle, estado_walk,);
		troca_estado(_estado_novo);
	}
}
#endregion

#region estado_walk
estado_walk.inicia = function()
{
	sprite_index = sprite.walk;
	image_index = 0;
	timer_estado = tempo_estado; 
	//ESCOLHENDO local no mapa alertorio
	destino_x = irandom(room_width);
	destino_y = irandom(room_height);
	//definindo o xscale com base no x
	xscale = sign (destino_x - x);
}
estado_walk.roda =function()
{
	//diminuindo o timer do estado
	timer_estado--;
	var _tempo = irandom(timer_estado);
	//se o tempo for menor igual a zero muda de estado
	if (_tempo <= 5)
	{
		var _estado_novo = choose(estado_idle, estado_walk);
		//troca_estado(_estado_novo);
	}
	//procurando player desviado do cloisor
	mp_potential_step_object(destino_x, destino_y, 1, obj_colisor);
	
	
}
#endregion

#region estado_hunt
estado_hunt.inicia = function()
{
	sprite_index = sprite.walk;
	image_index = 0;
	if (instance_exists(obj_player))
	{
		alvo = obj_player.id;
	}	
	//criando o meu aviso
	cria_aviso();
	}
estado_hunt.roda = function()
{
	//se o alvo não exite ficar parado
	if (!instance_exists(obj_player))
	{
		alvo = noone;
		troca_estado(estado_idle);
	}
	//cacando player
	mp_potential_step_object(alvo.x, alvo.y, 1, obj_colisor);
	//chamndo ataque quando estiver perto
	var _dist = point_distance(x, y, alvo.x, alvo.y);
	if ( _dist <= range )
	{
		troca_estado(estado_attack);
	}
	//definindo o xscale
	xscale = sign(alvo.x - x);
	//avisando outros inimigos
	var _n = instance_number(object_index);
	//chamando todos 
	for (var i = 0; i <_n; i++)
	{
		//checando
		var _slime = instance_find( object_index, i)
		if (_slime == id)
		{
			//vazio
		}
		else
		{
			//checando se esta perseguindo
			if (_slime.alvo != alvo)
			{
				//vendo se esta perto
				var _dist = point_distance(x, y, _slime.x, _slime.y);
				if (_dist < 90 )
				//ajudando
				with(_slime)
				{
					troca_estado(estado_hunt);
				}
			}
		}
	}
}#endregion

#region estado_attack
estado_attack.inicia = function()
{
	sprite_index = sprite.attack;
	image_index = 0;
}
estado_attack.roda = function()
{
	//rempo de ataque
	if (image_index >= image_number - .5)
	{
		troca_estado(estado_idle);
	}
}
estado_attack.finaliza = function()
{
	alvo = noone;
}
#endregion

#region estado_hurt
estado_hurt.inicia = function()
{
	sprite_index = sprite.hurt;
	image_index = 0;
}
estado_hurt.roda = function()
{
	//saindo do dano
	//se tem vida vai para idle
	//checando se a animação acabou
	if (image_index >= image_number - .5)
	{
		if (vida>0)
		{
			troca_estado(estado_hunt);
		}
		else //sem vida
		{
			troca_estado(estado_death);
		}
	}
}
//depois que finaliza zero o poise
estado_hurt.finaliza = function()
{
	if (poise < 1)
	{
		poise = poise_max;
	}
}
#endregion

#region estado_death
estado_death.inicia = function()
{
	sprite_index = sprite.death;
	image_index = 0;
	
	dead = true;
}
estado_death.roda = function()
{
	//morrendo
	if (image_index >= image_number - .5)
	{
		instance_destroy();
	}
}
#endregion
