function bomber2_follow(){
	sprite_index = spr_bombardeiro_walk_2
	direc = point_direction(x, y, obj_player.x, obj_player.y);
	hspd = lengthdir_x( spd,direc);
	vspd = lengthdir_y( spd,direc);
	if (point_distance(x,y,obj_player.x,obj_player.y) <= dist){
		exp_timer = exp_timer_max;
		state = bomber2_exp;
	}
}

function bomber2_exp(){
	sprite_index = spr_bombardeiro_2;
	hspd = 0;
	vspd = 0;
	if (exp_timer > 0){
		exp_timer--;	
	} else{
		instance_create_layer(x, y, "Enemies", obj_exp);
		instance_destroy();
	}
}
