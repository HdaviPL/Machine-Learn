function aranha_idle(){
	hspd = 0;
	vspd = 0;
	sprite_index = spr_aranha_idle;
	if timer_to_walk <= 0{
		timer_to_idle = timer_to_idle_max;
		direc = point_direction(x,y,obj_player.x,obj_player.y) + irandom_range(-90,90);
		state = aranha_walk;	
	}
}
function aranha_walk(){
	sprite_index = spr_aranha_walk;
	hspd = lengthdir_x(spd,direc);
	vspd = lengthdir_y(spd,direc);
	if timer_to_idle <= 0{
		timer_to_walk = timer_to_walk_max;
		state = aranha_idle;
	}

}