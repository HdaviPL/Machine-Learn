//engrenagens
global.engrenagens = 0;

//timers
timer_restart_max = 120;
timer_restart = timer_restart_max;

/*
array das salas. eles salvam o que cada sala tem (esse é o preço que se paga por fazer
um roguelike.
*/

salas_limpas = array_create(10, false);