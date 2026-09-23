event_inherited();
hspd = 0;
vspd = 0;
spd = 2;

hp = 200;
hp_max = 200;
boss = true;
image_alpha = 0;
state = dono_2_intro;
mouth_y = 16;

//voo
y_inicial = y;
tempo = 0;


//leque
leque_angle = 270;

//canon
canon_dead = false;

//timers
timer_inicial = 120;

timer_random = 0;
timer_random_max = 100;
//duração de todos os ataques
timer_attack = 0;
timer_attack_max = 300;

//leque
timer_shoot_exp = 0;
timer_shoot_exp_max = 20;

//teleguiado
timer_shoot_tele = 0;
timer_shoot_tele_max = 5;

//morte
timer_death = 300;

bright_timer = 0;
bright_timer_max = 5;
var _hat = instance_create_layer(x, y, "Enemies", obj_dono_hat);
_hat.alvo = self;
_hat.depth = -1;