if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

event_inherited();

if (timer_start <= 0){
	aranha_shot3();
}

if timer_to_walk > 0{
	timer_to_walk--;	
}
if timer_to_idle > 0{
	timer_to_idle--;	
}

if timer_to_shot > 0{
	timer_to_shot--;	
}



if timer_to_shot <= 0{
	timer_to_shot = timer_to_shot_max;	
}