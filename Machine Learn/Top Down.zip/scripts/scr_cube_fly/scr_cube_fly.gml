function cube_idle(){
	if timer_to_fly <= 0{
		timer_to_idle = timer_to_idle_max;
		state = cube_fly;
	}
}

function cube_fly(){
	direc = point_direction(x,y,obj_player.x,obj_player.y);
	hspd = lengthdir_x(spd,direc);
	vspd = lengthdir_y(spd,direc);
	
	if timer_to_idle <= 0{
		timer_to_fly = timer_to_fly_max;
		state = cube_idle;	
	}
}