function loj_shop(){
	sprite_index = spr_lojista_shop;
	hspd = 0;
	vspd = 0;
	if (count_shots <= 0) or (global.free_shop == true){
		with(obj_mesa){
			instance_create_layer(x,y,"Lojista", obj_mesa_exp);
			instance_destroy();
		}
		state = loj_idle;	
	}
}

function loj_idle(){
	hspd = 0;
	vspd = 0;
	sprite_index = spr_lojista_idle;	
	var _attack = irandom_range(0, 2);
	if (_attack == 0){
		angle_tiro = 0;		
		timer_b_attack = timer_b_attack_max;
		state = loj_attack_burst;
	} else if (_attack == 1){
		
		timer_shoot_exp = timer_shoot_exp_max;
		direc = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-90,90);	
		state = loj_attack_exp;		
		
	} else if (_attack == 2){
		timer_walk = timer_walk_max;
		state = loj_walk;		
	}
	
}

function loj_attack_burst(){	
	sprite_index = spr_lojista_walk;
	direc = point_direction(x, y, obj_player.x, obj_player.y);
	hspd = lengthdir_x(spd, direc);
	vspd = lengthdir_y(spd, direc);
	if (timer_b_attack > 0){
		timer_b_attack--;
		timer_shot_burst--;
		if (timer_shot_burst <= 0){
			timer_shot_burst = timer_shot_burst_max;
				for (var i = 0; i < 10; i++){
				var _shoot = instance_create_layer(x, y, "Lojista", obj_shoot_masked);
				_shoot.angle = angle_tiro + (i * 36);

			}
			angle_tiro += 24;
		}
	} else{
		state = loj_idle;			
	}

}
	
function loj_attack_exp(){
	sprite_index = spr_lojista_walk;
	hspd = lengthdir_x(spd, direc);
	vspd = lengthdir_y(spd, direc);
	
	if (timer_shoot_exp > 0){
		timer_shoot_exp--;	
	} else{
		audio_play_sound(sd_shot, 0, false);
		for(var i = 0; i < 5; i ++){
		var _ang = point_direction(x,y,obj_player.x,obj_player.y);
		var _shoot = instance_create_layer(x, y, "Enemies", obj_shoot_masked );
		//dificuldade miserável pra pensar nisso
		_shoot.angle =   _ang + (-30 + (i * 15));
		}
		state = loj_idle;
	}
	
}
	
function loj_walk(){

	if (timer_walk > 0){
		timer_walk--;	
		sprite_index = spr_lojista_walk;
		direc = point_direction(x,y,obj_player.x,obj_player.y);	
		hspd = lengthdir_x(spd, direc);
		vspd = lengthdir_y(spd, direc);
	} else{
		state = loj_idle;	
	}
}
	
function loj_death(){
	instance_create_layer(x,y,"Shadows",obj_death_boss);
	audio_play_sound(sd_enemy_death,1,false);
	global.free_shop = true;	
	instance_destroy();
}