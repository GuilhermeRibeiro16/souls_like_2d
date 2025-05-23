//maquina de estado para mostrar oque vai fazer

//iniciando a maquina
function estado() constructor
{
	//iniciando o estado
	static inicia = function() {};
	//rodando estado para se mover
	static roda = function() {};
	//finalizando estado
	static finaliza = function() {};
}
//funções para controlar
// inciando estado
function inicia_estado(_estado)
{
	//salvado estado passando em uma variavel
	estado_atual = _estado;
	//iniciando estado atual
	estado_atual.inicia();
}
//rodando o estado atual
function roda_estado()
{
	estado_atual.roda();
}
//trocando estado de parado para outro
function troca_estado(_estado)
{
	//finalizado o esatado atual
	estado_atual.finaliza();
	//rodnado o proximo estado
	estado_atual = _estado;
	//iniando o proximo estado
	estado_atual.inicia();
}

//definindo a sprite
function define_sprite(_dir = 0,_sprite_side, _sprite_front, _sprite_back)
{
	//repitindo codigo pra ser rapido
	var _sprite;
	switch(_dir)
	{
	case 0: _sprite = _sprite_side; break;
	case 1: _sprite = _sprite_back; break;
	case 2: _sprite = _sprite_side; break;
	case 3: _sprite = _sprite_front; break;
	}
	//devolvendo a sprite
	return _sprite;
}