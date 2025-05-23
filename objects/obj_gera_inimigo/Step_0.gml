//transparencia
image_alpha += 0.015;
//criando o slime
if (image_alpha >= 1)
{
	  var _inimigo = instance_create_depth(x, y, depth, inimigo);
	  _inimigo.gerado = true;
	  instance_destroy();
	  
	  if (criador)
	  {
		//salvando o inimigo criado na variavel criador
		array_push(criador.filhos, _inimigo);
	  }
}