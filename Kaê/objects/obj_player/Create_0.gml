//iniciando estado
estado_idle = new estado();
//iniciando  estado walk
estado_walk = new estado();
//iniciando estado attack
estado_attack = new estado();
//zerando dano
meu_dano = noone;
dano_poise = 6;

//grupo para ficar mais facil de organizar
#region estado_idle

estado_idle.inicia = function()
{
	//definindo a sprite atual com base na direção que eu to olalhando olahdno para direita olahndo para cima	olhando para esquerda	olahdno para baixo deifne sprite e a direção
	var _sprite = define_sprite(dir, spr_player_idle_side, spr_player_idle_front, spr_player_idle_back);
	//ajustando a sprite certa
	sprite_index = _sprite;
	//garantindo que a animação comeca do primeiro frame
	image_index = 0;
}
estado_idle.roda = function()
{
	//achando a condição para sair do estado parado	
	//se eu estiver me movendo, vou para estado walk vendo se o vel é direfente de 0 para se mover
	if (up xor down or left xor rigth)
	{
	troca_estado(estado_walk);
	}
	//estado de ataque
	if (attack)
	{
		troca_estado(estado_attack);
	}

}

#endregion

#region estado walk
estado_walk.inicia = function()
{
	dir		= (point_direction(0,0, rigth - left, down - up) div 90);
	//olhar para onde estiver parado
	//configurando a spreite certa
	sprite_index = define_sprite(dir, spr_player_walk_side, spr_player_walk_front, spr_player_walk_back);
	//animação do comeco
	image_index = 0;
}
estado_walk.roda = function()
{
	dir		= (point_direction(0,0, velh, velv) div 90);
	
	//ajustando o lado que ele olha na x
	if (velh !=0)
	{
	image_xscale = sign(velh);
	}
	//definido a sprite qunado estiver andando
	sprite_index = define_sprite(dir, spr_player_walk_side, spr_player_walk_front, spr_player_walk_back);
	//aplicado a velociade e movendo
	velv = (down - up) * vel;
	velh = (rigth - left) * vel;
	//condição para sair do estado, voltar a ficar parado
	//se eu estou parado vou para idle
	if (velh ==0 && velv ==0)
	{
		troca_estado(estado_idle);
	}
	//estado attack
	if (attack)
	{
		troca_estado(estado_attack);	
	}
}

#endregion

#region estado attack
estado_attack.inicia = function ()
{
	//definindo a spite
	sprite_index = define_sprite(dir,spr_player_attack_side, spr_player_attack_front, spr_player_attack_back);
	//comencando do zero
	image_index = 0;
	//ele para quando ataca para não atacar correndo
	velh = 0;
	velv = 0;
	//definindo o lado de ataque x e y
	var _x = x + lengthdir_x(16, dir * 90);
	var _y = y + lengthdir_y(16, dir * 90);
	//craindo o dano
	meu_dano = instance_create_depth(_x, _y, depth, obj_dano_player);
	//passando o mue poise
	meu_dano.dano_poise = dano_poise;
}
//configurando o estado de ataque
estado_attack.roda = function()
{
//saindo do attack quando acabar animação
if (image_index >= image_number-0.2)
{
	//indo para pardado  troca estado
	troca_estado(estado_idle);
}
}
estado_attack.finaliza = function()
{
	//encerra o dano
	instance_destroy(meu_dano);
}

#endregion

#region iniciando variaveis
//controle
up = noone;
down = noone;
left = noone;
rigth = noone;
attack = noone;
//iniciar parado
velh = 0;
velv = 0;
//velociade
vel = 2;
//controlando para onde esta olhando
dir = 0;

#endregion


//inciando maquina de estado
inicia_estado(estado_idle);