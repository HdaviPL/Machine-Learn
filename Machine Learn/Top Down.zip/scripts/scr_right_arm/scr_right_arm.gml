function rarm_idle(){
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
	hspd = lengthdir_x(spd, direc);
	vspd = lengthdir_y(spd, direc);
	if (timer_dash > 0){
		timer_dash--;
	} else{
		timer_idle = timer_idle_max;
		state = rarm_idle;
	}
}

function rarm_shot(){
	
}

function rarm_death(){
	instance_create_layer(x,y,"Shadows",obj_death_boss);
	audio_play_sound(sd_enemy_death,1,false);
	instance_destroy();
}