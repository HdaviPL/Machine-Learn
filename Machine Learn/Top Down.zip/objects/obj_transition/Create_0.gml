tam		= sprite_get_width(spr_transition);
colun	= ceil(display_get_gui_width()/ tam);
lins	= ceil(display_get_gui_height()/ tam);

//animação
img		= 0;
img_spd = (sprite_get_speed(spr_transition) / game_get_speed(gamespeed_fps)*3);

//total da animação
img_num = sprite_get_number(spr_transition) - 1;

//controlar pra saber se ta entrando ou saindo da animação
enter = true;
troca_room = false;
room_destino = noone;
direc = "";
depth = -100;