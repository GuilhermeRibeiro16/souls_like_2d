instance_destroy();
//shake na tela
obj_screenshake.ang = 3;
obj_screenshake.valor += 3;
with(other)
{
	//troca_estado(estado_hit);
	lida_dano(other.dano);
}