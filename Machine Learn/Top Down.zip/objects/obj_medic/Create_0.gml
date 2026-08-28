event_inherited();

hp = 3;
prox = 200;
spd = 1;

alvo_x = noone;
alvo_y = noone;
direc = 0;

shot_timer = 0;
shot_timer_max = 80;

idle_timer = 0;
idle_timer_max = 60;

timer_to_idle = 0;
timer_to_idle_max = 10;

shot_timer_start = 0;
shot_timer_start_max = 60;

var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow);
if _shadow != noone{
	_shadow.alvo = self;
	_shadow.correction_v = 13;
	_shadow.correction_h = -1.5;			
}

var _staff = instance_create_layer(x,y,"Enemies",obj_staff);
if _staff != noone{
	_staff.depth = -10;
	_staff.alvo = self;
	_staff.correction_v = 0;
	_staff.correction_h = 0;
	_staff.mira = obj_player;
}

state = medic_idle;