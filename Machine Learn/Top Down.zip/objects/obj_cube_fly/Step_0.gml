if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if timer_to_fly > 0{
	timer_to_fly--;	
}

if timer_to_idle > 0{
	timer_to_idle--;	
}

event_inherited();