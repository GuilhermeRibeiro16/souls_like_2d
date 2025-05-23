//olhando para o lado certo
xscale = 1;
//deixando morto permanente 
dead = false;
//iniciando movimentação
velh = 0;
velv = 0;
//iniciando os estados padrao dos inimigos
poise = poise_max; //quantas porradas aguenta antes de cair
//variavel para gerar filhos
gerado = false;
//criando aviso
cria_aviso = function ()
{
	var _aviso = instance_create_depth(x, y, depth, obj_aviso)
	_aviso.pai = id;
}
//lidando com o dano
lida_dano = function(_dano = 1, _poise = 1)
{
	//diminuindo a vida
	vida -= _dano;
	//diminuido o poise
	poise = max(poise - _poise, 0);
	//codição para mudar de estado, indo para hurt quando zerar
	if (poise <= 0 or estado_atual != estado_attack)
	{
	//indo para o estado de hurt
	troca_estado(estado_hurt);
	
	}
}
estado_idle = new estado();
estado_walk = new estado();
estado_attack = new estado();
estado_hurt = new estado();
estado_death = new estado();
//iniciando  estado idle como padrão. como esta no script
inicia_estado(estado_idle);
