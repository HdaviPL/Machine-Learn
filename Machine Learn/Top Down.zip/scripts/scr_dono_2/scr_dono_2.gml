function dono_2_intro(){
	can_damage = false;
	image_alpha += 0.01;
	if (image_alpha >= 1){
		if (timer_inicial > 0){
			timer_inicial--;	
		} else{
			can_damage = true;
			state = dono_2_random;	
		}
	}
}

function dono_2_random(){
	sprite_index = spr_dono_2;
	if (timer_random > 0){
		timer_random--;	
	} else{
		var _attack = irandom(3);
		if (_attack == 0){
			leque_angle = 0;
			timer_attack = timer_attack_max;
			state = dono_2_leque;	
		} else if (_attack == 1){
			timer_attack = timer_attack_max;
			state = dono_2_tele;		
		} else if (_attack == 2){
			timer_attack = timer_attack_max;
			state = dono_2_laser;		
		} else if (_attack == 3){
			canon_dead = false;
			state = dono_2_canon;		
		}
	}
}

#region ataques
//leque
	function dono_2_leque(){
		if (timer_attack > 0){
			timer_attack--;
			if (timer_shoot_exp > 0){
				timer_shoot_exp--;	
			} else{
				sprite_index = spr_dono_2_attack;
				audio_play_sound(sd_shot, 0, false);
				for(var i = 0; i < 25; i ++){
					var _shoot = instance_create_layer(x, y + mouth_y, "Enemies", obj_shoot_masked );
					//dificuldade miserável pra pensar nisso
					_shoot.angle = leque_angle + (-70 + (i * 15));
				}
				leque_angle += 5;
				timer_shoot_exp = timer_shoot_exp_max;
			}
		} else{
			timer_random = timer_random_max;
			state = dono_2_random;
		}
	}
//teleguiado
	function dono_2_tele(){
		if (timer_attack > 0){
			timer_attack--;
			if (timer_shoot_tele > 0){
				timer_shoot_tele--;	
			} else{
				sprite_index = spr_dono_2_attack;
				audio_play_sound(sd_shot, 0, false);
				for(var i = 0; i < 1; i ++){
					var _shoot = instance_create_layer(x, y + mouth_y, "Enemies", obj_shoot_masked );
					//dificuldade miserável pra pensar nisso
					_shoot.angle = point_direction(x, y, obj_player.x, obj_player.y);
					_shoot.spd = 5;
				}
				timer_shoot_tele = timer_shoot_tele_max;
			}
		} else{
			timer_random = timer_random_max;
			state = dono_2_random;
		}
	}
//laser
	function dono_2_laser(){
		sprite_index = spr_dono_2_attack;
		if (timer_attack > 0){
			timer_attack--;	
			audio_play_sound(sd_laser,1,false);	
			if (!instance_exists(obj_laser_2)){
				var _laser = instance_create_layer(x + 1, y + 16, "Enemies", obj_laser_2);
				_laser.depth = -1;
				_laser.alvo = self;
			}
		} else{
			timer_random = timer_random_max;
			state = dono_2_random;	
		}
	}
//canhão
	function dono_2_canon(){
		if (!instance_exists(obj_canon_base)){
			if (canon_dead == false){
				can_damage = false;
				var _x = room_width/2;
				var _y = room_height/2;
				instance_create_layer(_x, _y, "Enemies", obj_canon_base);	
			}	
		}
		if (canon_dead == true){
			can_damage = true;
			state = dono_2_random;
		}
	}
#endregion

function dono_2_death(){
	can_damage = false;
	if (bright_timer > 0){
		bright_timer--;
	}else {
		bright_timer = bright_timer_max;
		for (var i = 0; i < 1; i++){
			var _bright = instance_create_layer(irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom),"Enemies",obj_spark);
			_bright.depth = -10;
		}
		audio_play_sound(sd_shot,1,false);
	}
	obj_camera.scn_shake = 3;
	if (timer_death > 0){
		timer_death--;
	} else{
		image_alpha -= 0.01;
		if (image_alpha <= 0.01){
			var _transition = instance_create_layer(0, 0, "Instances_room", obj_transition);
			_transition.troca_room = true;
			_transition.room_destino = rm_end;
			instance_destroy();	
		}
	}
}