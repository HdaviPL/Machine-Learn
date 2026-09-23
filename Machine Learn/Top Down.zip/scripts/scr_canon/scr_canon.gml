function canon_idle(){
	image_angle = 0;
	angle = 0;
	if (timer_idle > 0){
		timer_idle--;
	} else{
		timer_shot = timer_shot_max;
		state = canon_shot;	
	}
}

function canon_shot(){
	if (timer_shot > 0){
		timer_shot--;
		if (timer_shooting > 0){
			timer_shooting--;
		} else{
			audio_play_sound(sd_shot, 0, false);
	        for (var i = 0; i < 4; i++){
	            var _shoot = instance_create_layer(x, y, "Enemies", obj_shoot_masked);
	            _shoot.depth = 100;
				_shoot.angle = (i * 90) + angle;
	        }
			angle += 15;
			image_angle = angle;
			timer_shooting = timer_shooting_max;
		}
	} else{
		timer_idle = timer_idle_max;
		state = canon_idle;
	}
}

function canon_death(){
	obj_dono_2.canon_dead = true;
	instance_create_layer(x,y,"Shadows",obj_death_boss);
	audio_play_sound(sd_enemy_death,1,false);
	instance_destroy();
}