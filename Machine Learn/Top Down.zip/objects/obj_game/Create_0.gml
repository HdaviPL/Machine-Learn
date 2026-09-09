//fonte dos danos
global.font = font_add_sprite(spr_font_damage, ord("0"), true, 1);

//engrenagens
global.engrenagens = 0;

//lojista
global.free_shop = false;

//timers
timer_restart_max = 120;
timer_restart = timer_restart_max;

/*
array das salas. eles salvam o que cada sala tem (esse é o preço que se paga por fazer
um roguelike.
*/

salas_limpas = array_create(10, false);

mint = 0;
sec = 0;
msec = 0;	

//montar a organização das salas
randomize();