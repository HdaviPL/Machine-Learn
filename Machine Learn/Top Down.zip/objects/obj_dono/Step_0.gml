if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (hp <= 0){
	state = dono_death;	
}

dist = point_distance(x, y, obj_player.x, obj_player.y);	

event_inherited();

