//vaariavel com valor da camera
valor = 0;
//movendo a tela
ang = 0;
//fomula que altera o angulo da camera

//altera a posição do viewport
shake_pos = function ()
{
	//valor que estou vovendo
	var _val = random_range(-valor, valor);
	//fazendo o valor voltar a zero
	if (valor != 0)
	{
		//tempo de duração da tremida
		valor = lerp (valor, 0, .2);
		
		//se o valor estiver´proximo de zero sera zerado
		// se não for igual a zero a camera treme
			view_set_xport(0, _val);
			view_set_yport(0, _val);

		if (valor <= 0.1)
		{
			valor = 0;
			view_set_xport(0, 0);
			view_set_yport(0, 0);
	
		}
	}
}

shake_ang = function()
{
	var _val = random_range(-ang, ang);
	if (ang != 0)
	{
		//aumentando o tempo da tremida
		ang = lerp(ang, 0, .25);
		//tremendo a camera
		camera_set_view_angle(view_camera[0], _val);
		
		if (ang <= 0.1)
		{
			ang = 0;
			//garantindo que o angulo sera zerado
			camera_set_view_angle(view_camera[0], 0);
		}
	}
}