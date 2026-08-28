function medic_idle(){
	sprite_index = spr_medic;
	hspd = 0;
	vspd = 0;
	if (timer_to_idle > 0){
		timer_to_idle--;	
	}
	if (timer_to_idle <= 0){
		idle_timer = idle_timer_max;
		alvo_x = irandom_range(90,-90);
		alvo_y = irandom_range(90,-90);
		direc = point_direction(x, y, obj_player.x, obj_player.y) + alvo_x + alvo_y;
		state = medic_walk;
	}
}

function medic_walk(){
	sprite_index = spr_medic_walk;
	
	hspd = lengthdir_x(spd,direc);
	vspd = lengthdir_y(spd,direc);	

	if shot_timer > 0{
		shot_timer--;	
	}
	
	if shot_timer <= 0{
		state = medic_shot;
	}
	
	if idle_timer > 0{
		idle_timer--;	
	}
	
	if idle_timer <= 0{
		timer_to_idle = timer_to_idle_max;
		state = medic_idle;
	}
}

function medic_shot(){
	sprite_index = spr_medic_walk;
	var _shoot = instance_create_layer(x,y,"Enemies",obj_shoot_medic);
	_shoot.angle = point_direction(x,y,obj_player.x,obj_player.y);
	if shot_timer <= 0{
		shot_timer = shot_timer_max;
		state = medic_idle;	
	}

}
