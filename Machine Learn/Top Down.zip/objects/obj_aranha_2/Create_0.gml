event_inherited();

hp = 6;

direc = 0;
spd = 3;
timer_to_walk = 0;
timer_to_walk_max = 10;

timer_to_idle = 0;
timer_to_idle_max = 30;

timer_to_shot = 0;
timer_to_shot_max = 90;

state = aranha_idle2;

var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow);
if _shadow != noone{
	_shadow.alvo = self;
	_shadow.correction_v = 13;
	_shadow.correction_h = 0;			
}

var _canon = instance_create_layer(x,y,"Enemies",obj_aranha_canon);
if (_canon != noone){
	_canon.alvo = self;
	_canon.correction_v = -2;
	_canon.correction_h = 0;
	_canon.mira = obj_player;	
	_canon.depth = -10
}