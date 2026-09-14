function rarm_idle(){
	sprite_index = spr_right_arm_idle;
	hspd = 0;
	vspd = 0;
	if (timer_idle > 0){
		timer_idle--;	
	} else{
		timer_dash = timer_dash_max;
		direc = point_direction(x, y, obj_player.x, obj_player.y);
		state = rarm_dash;
	}
}

function rarm_dash(){
	sprite_index = spr_right_arm_walk;
	hspd = lengthdir_x(spd, direc);
	vspd = lengthdir_y(spd, direc);
	if (timer_dash > 0){
		timer_dash--;
	} else{
		var _attack = irandom_range(0, 1);
		if (_attack == 0){
			state = rarm_shot;
		} else if (_attack == 1){
			angle_tiro = 0;		
			state = rarm_shot_burst;
		}
	}
}

function rarm_shot_burst(){
	sprite_index = spr_right_arm_idle;
	hspd = 0;
	vspd = 0;
	if (timer_shot_burst > 0){
		timer_shot_burst--;
	} else{
		audio_play_sound(sd_shot, 0, false);
		timer_shot_burst = timer_shot_burst_max;
		for (var i = 0; i < 10; i++){
			var _ang = point_direction(x, y, obj_right_arm_right_arm.mira.x, obj_right_arm_right_arm.mira.y);
			
			var _shoot_correct_x = lengthdir_x(-5, _ang + 90);
			var _shoot_correct_y = lengthdir_y(-5, _ang + 90);
			var _shoot_x = x + lengthdir_x(obj_right_arm_right_arm.dist_mao, _ang);
			//distância y do centro do player até o lugar onde ela vai sair
			var _shoot_y = y + lengthdir_y(obj_right_arm_right_arm.dist_mao, _ang);
			var _shoot = instance_create_layer(_shoot_x + _shoot_correct_x, _shoot_y + _shoot_correct_y, "Enemies", obj_shoot_masked);
			_shoot.angle = angle_tiro + (i * 36);
		}
		angle_tiro += 24;
		timer_idle = timer_idle_max;
		state = rarm_idle;		
	}
}

function rarm_shot(){
	sprite_index = spr_right_arm_idle;
	hspd = 0;
	vspd = 0;
	audio_play_sound(sd_shot, 0, false);
	var _ang = point_direction(x, y, obj_right_arm_right_arm.mira.x, obj_right_arm_right_arm.mira.y);
	var _shoot_correct_x = lengthdir_x(-5, _ang + 90);
	var _shoot_correct_y = lengthdir_y(-5, _ang + 90);
	var _shoot_x = x + lengthdir_x(obj_right_arm_right_arm.dist_mao, _ang);
	var _shoot_y = y + lengthdir_y(obj_right_arm_right_arm.dist_mao, _ang);
	var _shoot = instance_create_layer(_shoot_x + _shoot_correct_x, _shoot_y + _shoot_correct_y, "Enemies", obj_shoot_masked);
	_shoot.angle = point_direction(x, y, obj_player.x, obj_player.y);	
	timer_idle = timer_idle_max;
	state = rarm_idle;
}

function rarm_death(){
	instance_create_layer(x,y,"Shadows",obj_death_boss);
	audio_play_sound(sd_enemy_death,1,false);
	instance_destroy();
}