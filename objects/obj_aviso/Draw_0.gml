//colocando cor
draw_set_color(c_red);
//colocando no centro
draw_set_halign(1);
draw_set_valign(1);
//colocando uma esclamação no desenho
draw_text(x, bbox_top - 10, "!");
//chamando a fonte
draw_set_font(fnt_aviso);
//chamando transparencia
draw_set_alpha(image_alpha);

//resentando
draw_set_color(-1);
//colocando no centro
draw_set_halign(-1);
draw_set_valign(-1);
//chamando a fonte
draw_set_font(fnt_aviso);
//chamando transparecnia
draw_set_alpha(1);