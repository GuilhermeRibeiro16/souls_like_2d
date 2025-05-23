//ajustando a profundidade
depth = -bbox_bottom;
//deixando somente oque eu quero transparente
if(transparente)
{
	//ficando transparente
	if (instance_exists(obj_player))
	{
		//ver se o player esta mais alto
	if (obj_player.y < y)
		{
			//checando se o player esta atras
			if(point_in_rectangle(obj_player.x,obj_player.y, bbox_left -10 ,bbox_top - 25, bbox_right + 10, bbox_top))
			{
			image_alpha = lerp(image_alpha, .5, .05);
			}
			else
			{
				image_alpha = lerp(image_alpha, 1,.1);
			}
		}
	}
}