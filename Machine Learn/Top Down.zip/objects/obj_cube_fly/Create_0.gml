event_inherited();

hp = 5;
spd = 1.5;

var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow);
if  _shadow != noone{
	_shadow.alvo = self;
	_shadow.correction_v = 16;
	_shadow.correction_h = 0;			
}

timer_to_fly = 0;
timer_to_fly_max = 120;

timer_to_idle = 0;
timer_to_idle_max = 180;

state = cube_idle;