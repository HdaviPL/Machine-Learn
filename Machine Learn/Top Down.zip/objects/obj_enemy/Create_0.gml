//permite que os inimigos tomem apenas 1 dano a cada ataque
//talvez tenha sido uma gambiarra grande, mas funciona ent blz
i_frame = 0;
i_frame_max = 8;

//piscar branco/cor que eu escolho toda vez que toma dano
alpha_flash = 1;
hit_timer = 0;
hit_timer_max = 6;

//começar na room
timer_start = 90;

hspd = 0;
vspd = 0;

state = noone;

//já morreu
sala_id = -1;
inimigo_id = -1;

boss = false;