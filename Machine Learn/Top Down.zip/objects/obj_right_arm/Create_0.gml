event_inherited();
spd = 5;
direc = 0;

hp = 35;
hp_max = 35;

timer_idle = 0;
timer_idle_max = 30;

timer_dash = 0;
timer_dash_max = 15;

boss = true;

state = rarm_idle;

var _braco = instance_create_layer(x,y,"Enemies",obj_right_arm_right_arm);
if (_braco != noone){
	_braco.alvo = self;
	_braco.correction_v = 0;
	_braco.correction_h = 0;
	_braco.mira = obj_player;	
}