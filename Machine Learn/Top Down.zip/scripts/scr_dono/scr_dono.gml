function dono_throne(){
	if (timer_throne > 0){
		timer_throne--;	
	} else{
		state = dono_wave;	
	}
}

function dono_wave(){
	#region ondas
		if (wave == 1){
			for(var i = 0; i < array_length(wave_ene_1); i++){
				if (wave_start == true){
					var _x = irandom_range(-64, 64);
					instance_create_layer(_x + x, y + 32, "Enemies", wave_ene_1[i]);
				}
			}
		
			wave_start = false;
			have_ene = false;
		
			with(obj_enemy){
				if (boss == false){
					obj_dono.have_ene = true;

				}
			}
		
			if (have_ene == false){
				wave_start = true;
				wave = 2;			
			}
		} else if (wave == 2){
			for(var i = 0; i < array_length(wave_ene_2); i++){
				if (wave_start == true){
					var _x = irandom_range(-64, 64);
					instance_create_layer(_x + x, y + 32, "Enemies", wave_ene_2[i]);
				}
			}
		
			wave_start = false;
			have_ene = false;
		
			with(obj_enemy){
				if (boss == false){
					obj_dono.have_ene = true;

				}
			}
		
			if (have_ene == false){
				wave_start = true;
				wave = 3;			
			}
		} else if (wave == 3){
			for(var i = 0; i < array_length(wave_ene_3); i++){
				if (wave_start == true){
					var _x = irandom_range(-64, 64);
					instance_create_layer(_x + x, y + 32, "Enemies", wave_ene_3[i]);
				}
			}
		
			wave_start = false;
			have_ene = false;
		
			with(obj_enemy){
				if (boss == false){
					obj_dono.have_ene = true;

				}
			}
		
			if (have_ene == false){
				wave_start = true;
				wave = 4;			
			}
		} else if (wave == 4){
			if (!instance_exists(obj_trono)){
				instance_destroy(obj_trono_fixed);
				var _throne = instance_create_layer(x, y, "Enemies", obj_trono);
				_throne.depth = 20;
			}
		
			state = dono_follow;
		}
	#endregion
}

function dono_random(){
	hspd = 0;
	vspd = 0;
	sprite_index = spr_dono_idle;

	if (dist <= 35){ //perto
		var _attack = irandom(1);
		if (_attack == 0){ //laser
			laser_acabou = false;
			laser_angle = 0;
			state = dono_laser;
		} else if (_attack == 1){ //boom
			instance_create_layer(x,y, "Shadows", obj_boom_warning);
			timer_boom = timer_boom_max;
			state = dono_boom;	
		}
	} else if (dist >= 75){ //longe
		var _attack = irandom(2); 
		if (_attack == 0){ //follow
			timer_walk = timer_walk_max;
			state = dono_follow;			
		} else if (_attack == 1){ //lightning
			timer_light = timer_light_max;
			mark_chegou = false;
			state = dono_light;
		} else if (_attack == 2){ //shot
			timer_shoot = timer_shoot_max;
			state = dono_shot;
		}
	} else{ //médio
		timer_walk = timer_walk_max;
		state = dono_follow;
	}
}

#region movimentação
//parado
	function dono_idle(){
		if (dist <= 20){
			state = dono_random;
		} else{
			hspd = 0;
			vspd = 0;
			if (timer_idle > 0){
				timer_idle--;	
			} else{
				state = dono_random;
			}
		}
	}
//seguindo
	function dono_follow(){
		if (dist <= 20){
			state = dono_random;
		} else{
			sprite_index = spr_dono_walk;
			if (timer_direc > 0){
				timer_direc--;
			} else{
				var _alvo_x = irandom_range(90,-90);
				var _alvo_y = irandom_range(90,-90);
				direc = point_direction(x, y, obj_player.x, obj_player.y) + _alvo_x + _alvo_y;		
				timer_direc = timer_direc_max;
			}
			hspd = lengthdir_x(spd, direc);
			vspd = lengthdir_y(spd, direc);
			if (timer_walk > 0){
				timer_walk--;	
			} else{
				state = dono_random;	
			}
		}
	}
#endregion

#region ataques
//laser
	function dono_laser(){
		sprite_index = spr_dono_laser;
		if (!instance_exists(obj_laser)){
			var _laser = instance_create_layer(x, y, "Enemies", obj_laser);
			_laser.alvo = self;
			_laser.depth = -10;
			_laser.correction_v = -24;
		}
		laser_angle += 2;
		if (laser_acabou == true){
			state = dono_random;	
		}
	}
	
//tiro
	function dono_shot(){
		sprite_index = spr_dono_shot;
		if (timer_shoot > 0){
			timer_shoot--;	
		} else{
			var _shoot = instance_create_layer(x, y + 20, "Enemies", obj_shoot_masked);
			_shoot.angle = point_direction(x, y, obj_player.x, obj_player.y);
			_shoot.depth = 200;
			state = dono_random;
		}
	}
	
//boom
	function dono_boom(){
		sprite_index = spr_dono_doc;
		if (timer_boom > 0){
			timer_boom--;
		} else{
			for (var i = 0; i < boom_max; ++i) {
				var _boom = instance_create_layer(x, y, "Shadows", obj_boom);
			}
			state = dono_random;	
		}
	}
//lightning
	function dono_light(){
		sprite_index = spr_dono_light;
		if (timer_light > 0){
			timer_light--;
		} else{
			if (!instance_exists(obj_lightning_mark)){
				var _mark = instance_create_layer(x,y, "Shadows", obj_lightning_mark);	
			}
				state = dono_random;	
		}

	}
#endregion

function dono_death(){
	instance_create_layer(x,y,"Shadows",obj_death_boss);
	audio_play_sound(sd_enemy_death,1,false);	
	instance_destroy();
}
