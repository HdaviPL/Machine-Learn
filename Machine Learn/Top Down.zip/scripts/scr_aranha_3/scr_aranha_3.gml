function aranha_idle3(){
	hspd = 0;
	vspd = 0;
	sprite_index = spr_aranha_idle_3;
	if timer_to_walk <= 0{
		timer_to_idle = timer_to_idle_max;
		direc = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-90,90);
		state = aranha_walk3;	
	}
}

function aranha_walk3(){
	sprite_index = spr_aranha_walk_3;
	hspd = lengthdir_x(spd,direc);
	vspd = lengthdir_y(spd,direc);
	if timer_to_idle <= 0{
		timer_to_walk = timer_to_walk_max;
		state = aranha_idle3;
	}

}

function aranha_shot3(){
	if (timer_to_shot == timer_to_shot_max){
		audio_play_sound(sd_shot, 0, false);
		var _ang = point_direction(x, y, obj_aranha_canon.mira.x, obj_aranha_canon.mira.y);
		var _shoot_x = x + lengthdir_x(obj_aranha_canon.dist_mao, _ang);
		//distância y do centro do player até o lugar onde ela vai sair
		var _shoot_y = y + lengthdir_y(obj_aranha_canon.dist_mao, _ang);
		var _shoot = instance_create_layer(_shoot_x, _shoot_y, "Enemies", obj_shoot_masked);
		_shoot.angle = point_direction(x,y,obj_player.x,obj_player.y);
		_shoot.spd = 3;
		timer_to_walk = timer_to_walk_max;
		state = aranha_idle3;
	}
}