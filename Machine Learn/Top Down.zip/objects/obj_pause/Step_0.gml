if keyboard_check_pressed(vk_escape) and (!instance_exists(obj_retry)){
	timer_name = 0;
	global.pause = !global.pause;	
}

