event_inherited();
spd = 2;
hspd = 0;
vspd = 0;
direc = 0;
dist = noone;
hp = 100;
hp_max = 100;
boss = true;

//contador de ondas
enemy_max = 4;
wave_start = true;
wave = 1;
wave_ene_1 = [obj_medic, obj_aranha, obj_cube_fly, obj_bomber];
wave_ene_2 = [obj_masked, obj_aranha_2, obj_cube_fly_2, obj_bomber_2];
wave_ene_3 = [obj_gas_masked, obj_aranha_3, obj_cube_fly_3, obj_bomber_3];
have_ene = false;

//laser
laser_angle = 0;
laser_acabou = false;

//boom
boom_max = 6;

//timers
timer_throne = 15;

//tempo direc
timer_direc = 0;
timer_direc_max = 15;
//tempo parado
timer_idle = 0;
timer_idle_max = 15;

//tempo andando
timer_walk = 0;
timer_walk_max = 15;

//tempo arrombando
timer_boom = 0;
timer_boom_max = 30;

//tempo catchaw
timer_light = 0;
timer_light_max = 15;

//tempo atirando
timer_shoot = 0;
timer_shoot_max = 15;

state = dono_throne;

var _trono = instance_create_layer(x, y, "Wall", obj_trono_fixed);