event_inherited();
spd = 5;
direc = 0;

//vida
hp = 30;
hp_max = 30;

//tiro
angle_tiro = 0;

//timers de states
timer_to_dash = 0;
timer_to_dash_max = 35;

timer_to_idle = 0;
timer_to_idle_max = 32;

timer_to_shoot = 24;
timer_to_shoot_max = 32;
//piscar branco/cor que eu escolho toda vez que toma dano
alpha_flash = 1;
hit_timer = 0;
hit_timer_max = 6;

timer_start = 60;
state = robo_idle;

boss = true;

var _braco = instance_create_layer(x,y,"Enemies",obj_robo_braco);
if (_braco != noone){
	_braco.alvo = self;
	_braco.correction_v = 0;
	_braco.correction_h = 0;
	_braco.mira = obj_player;	
}