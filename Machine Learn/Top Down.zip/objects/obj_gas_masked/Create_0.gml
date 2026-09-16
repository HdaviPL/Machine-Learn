event_inherited();

hp = 9;
prox = 200;
spd = 1.8;

alvo_x = noone;
alvo_y = noone;
direc = 0;

shot_timer = 0;
shot_timer_max = 80;

shot_timer_start = 0;
shot_timer_start_max = 60;

idle_timer = 0;
idle_timer_max = 60;

timer_to_idle = 0;
timer_to_idle_max = 10;
arma_angle = 0;

var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow);
if _shadow != noone{
	_shadow.alvo = self;
	_shadow.correction_v = 13;
	_shadow.correction_h = -1.5;			
}

var _pistol = instance_create_layer(x,y,"Enemies",obj_pistol);
if _pistol != noone{
	_pistol.depth = -10;
	_pistol.alvo = self;
	_pistol.correction_v = 0;
	_pistol.correction_h = 0;
	_pistol.mira = obj_player;	
}
state = gas_masked_idle;