// Achando a direção entre os dois inimigos
var _dir = point_direction(other.x, other.y, x, y);
// Calculando movimento pequeno para empurrar
var _velh = lengthdir_x(1, _dir);
var _velv = lengthdir_y(1, _dir);
// Checando se não vai colidir com parede (obj_colisor)
if (!place_meeting(x + _velh, y + _velv, obj_colisor))
{
	x += _velh;
	y += _velv;	
}