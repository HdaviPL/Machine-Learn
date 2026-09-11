spd = 1.5;
hspd = 0;
vspd = 0;
direc = 0;

//i-frames
i_frame = 0;
i_frame_max = 8;

//vida
hp = 50;
hp_max = 50;

//tiro
angle_tiro = 0;

//timers de states
timer_b_attack = 0;
timer_b_attack_max = 180;

timer_shot_burst = 0;
timer_shot_burst_max = 30;

timer_shoot_exp = 0;
timer_shoot_exp_max = 60;

timer_walk = 0;
timer_walk_max = 60;

timer_start = 90;
//piscar branco/cor que eu escolho toda vez que toma dano
alpha_flash = 1;
hit_timer = 0;
hit_timer_max = 6;

state = loj_shop;

var _mesa = instance_create_layer(x,y+8,"Lojista", obj_mesa);

count_shots = 3;
