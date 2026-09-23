if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (timer_end > 0){
	timer_end--;	
} else{
	instance_destroy();	
}