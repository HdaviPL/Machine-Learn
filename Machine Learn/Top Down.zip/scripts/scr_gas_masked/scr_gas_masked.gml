function gas_masked_idle(){
	sprite_index = spr_gas_masked;
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
		state = gas_masked_walk;
	}
}

function gas_masked_walk(){
	sprite_index = spr_gas_masked_walk;
	
	hspd = lengthdir_x(spd,direc);
	vspd = lengthdir_y(spd,direc);	

	if shot_timer > 0{
		shot_timer--;	
	}
	if shot_timer <= 0{
		state = gas_masked_shot;
	}
	
	if idle_timer > 0{
		idle_timer--;	
	}
	if idle_timer <= 0{
		state = gas_masked_idle;
	}
}

function gas_masked_shot(){
	hspd = 0;
	vspd = 0;
	sprite_index = spr_gas_masked_shot;
	var _angle = point_direction(x, y, obj_pistol.mira.x, obj_pistol.mira.y);
	var _shoot_x = x + lengthdir_x(8 +  obj_pistol.dist, _angle);
	//distância y do centro do player até o lugar onde ela vai sair
	var _shoot_y = y + lengthdir_y((-5) + obj_pistol.dist, _angle);
	
	var _shoot = instance_create_layer(_shoot_x,_shoot_y,"Player",obj_shoot_masked);
	_shoot.angle = point_direction(x,y,obj_player.x,obj_player.y);
	_shoot.spd = 5;


	if shot_timer <= 0{
		shot_timer = shot_timer_max;
		state = gas_masked_idle;	
	}

}
