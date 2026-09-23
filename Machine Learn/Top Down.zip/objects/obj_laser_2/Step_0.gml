if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (!instance_exists(alvo)){
	instance_destroy();
	exit;
}
if (timer_end > 0){
	timer_end--;	
} else{
	image_xscale -= scale;	
	image_yscale -= scale;
	if (image_xscale <= 0.1) and (image_yscale <= 0.1){
		instance_destroy();
	}
}

y = alvo.y + 16;