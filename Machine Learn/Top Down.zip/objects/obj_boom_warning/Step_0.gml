if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (obj_dono.timer_boom <= 0){
	instance_destroy();
}