//ajustando a colisao e profundidade
depth = -y;
//input
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down)or keyboard_check(ord("S"));
left = keyboard_check(vk_left)or keyboard_check(ord("A"));
rigth = keyboard_check(vk_right)or keyboard_check(ord("D"));
attack = keyboard_check_pressed(vk_space);
//rodando a minha maquina de estado
roda_estado();