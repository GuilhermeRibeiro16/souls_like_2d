//se não tem pai destroi
if (!pai) instance_destroy();

if(!instance_exists(pai)) instance_destroy();
//chamando pai
x = pai.x;
y = pai.bbox_top;
image_alpha -= 0.02;

if (image_alpha <= 0) instance_destroy();