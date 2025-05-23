// Inherit the parent event
event_inherited();
//dano no player
dano_valor = 2;
//distacia do ataque
range = 30;
//distancia
dir = 0;

//pegando spite do slime verde
sprite = 
{
	attack	: spr_slime2_attack,
	death	: spr_slime2_death,
	hurt	: spr_slime2_hurt,
	idle	: spr_slime2_idle,
	walk	: spr_slime2_walk
}
//criando o estado hunt para cançar
estado_attack.inicia = function ()
{
	sprite_index	= sprite.attack;
	image_index		= 0;
	dir		= point_direction(x, y, alvo.x, alvo.y);
}
estado_attack.roda = function()
{
	
	if (image_index >=7)
	{
		var _dir = point_direction(x,y, alvo.x, alvo.y);
		//se movendo na direção do player
		var _x = lengthdir_x(1, dir)
		var _y = lengthdir_y(1, dir)
		//se movendo se não tem parede
		if (!place_meeting(x + _x, y + _y, obj_colisor))
		   {
				x += _x;
				y += _y;
				//mudando a posição do dano para quando cair
				if (instance_exists(dano))
				{
					dano.x = x;
					dano.y = y;
				
				}
		   }
		   //checando o dano
		   if (dano == noone)
		   {
		   dano = instance_create_depth(x, y, depth, obj_dano_inimigo);
		   dano.dano = dano_valor;
		   }
	}
	if (image_index >= image_number - 0.2)
	{
		troca_estado(estado_hunt);
	}
}
estado_attack.finaliza = function()
{
	if (instance_exists(dano))
	{
		instance_destroy(dano);
	}
	dano = noone;
}

//iniciando estado idle
inicia_estado(estado_idle);