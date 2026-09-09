function robo_idle(){
	sprite_index = spr_robo;
	hspd = 0;
	vspd = 0;
	if (timer_to_dash) > 0{
		timer_to_dash--;
	} else{
		direc = point_direction(x, y, obj_player.x, obj_player.y);
		state = robo_dash;	
	}
}

function robo_dash(){
	sprite_index = spr_robo_dash;
	hspd = lengthdir_x(spd, direc);
	vspd = lengthdir_y(spd, direc);
	
	if abs(hspd) > abs(vspd){
		if (hspd != 0){
			if (sign(hspd) > 0){
				image_angle = 90;
			} else{
				image_angle = 270;		
			}
		}
	} else if abs(hspd) < abs(vspd){
		if (vspd != 0){
			if (sign(vspd) > 0){
				image_angle = 0;
			} else{
				image_angle = 180;		
			}		
		}
	}
	
	var _colh	= instance_place(x + hspd, y, obj_solid);
	var _colv	= instance_place(x, y + vspd, obj_solid);
	if (_colh or _colv){
		if (_colh){
			if (hspd != 0){
				if (hspd > 0){
					image_angle = 90;
				} else if (hspd < 0){
					image_angle = 270;	
				}
			}
		} else if (_colv){
			if (vspd != 0){
				if (vspd > 0){
					image_angle = 0;
				} else if (vspd < 0){
					image_angle = 180;	
				}
			}	
		}
		
		timer_to_shoot = timer_to_shoot_max;
		state = robo_shot;
	}
}

function robo_shot(){
	sprite_index = spr_robo;
	hspd = 0;
	vspd = 0;
	if (timer_to_shoot > 0){
		timer_to_shoot--;	
	} else{
		audio_play_sound(sd_shot, 0, false);
		for(var i = 0; i < 5; i ++){
			var _ang = point_direction(x, y, obj_robo_braco.mira.x, obj_robo_braco.mira.y);
			var _shoot_correct_x = lengthdir_x(-5, _ang + 90);
			var _shoot_correct_y = lengthdir_y(-5, _ang + 90);
			var _shoot_x = x + lengthdir_x(obj_robo_braco.dist_mao, _ang);
			//distância y do centro do player até o lugar onde ela vai sair
			var _shoot_y = y + lengthdir_y(obj_robo_braco.dist_mao, _ang);
			var _shoot = instance_create_layer(_shoot_x + _shoot_correct_x, _shoot_y + _shoot_correct_y, "Enemies", obj_shoot_masked);
			//dificuldade miserável pra pensar nisso
			_shoot.angle =   _ang + (-30 + (i * 15));
		}
		timer_to_dash = timer_to_dash_max;
		state = robo_idle;
	}
}

function robo_death(){
	instance_create_layer(x,y,"Shadows",obj_death_boss);
	audio_play_sound(sd_enemy_death,1,false);
	instance_destroy();
}