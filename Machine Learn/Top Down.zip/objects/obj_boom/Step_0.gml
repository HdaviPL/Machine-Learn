if (global.pause == true){
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

