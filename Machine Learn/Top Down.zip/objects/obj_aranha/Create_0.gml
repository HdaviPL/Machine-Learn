event_inherited();

hp = 5;

direc = 0;
spd = 3;
timer_to_walk = 0;
timer_to_walk_max = 10;

timer_to_idle = 0;
timer_to_idle_max = 30;

state = aranha_idle;

var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow);
if _shadow != noone{
	_shadow.alvo = self;
	_shadow.correction_v = 13;
	_shadow.correction_h = 0;			
}