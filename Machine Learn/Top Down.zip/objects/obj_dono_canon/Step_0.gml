if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (hp <= 0){
	state = canon_death;	
}



event_inherited();

