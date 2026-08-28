if (global.pause == true){
	exit;	
}

timer--;
image_alpha = timer / obj_player.roll_ai_dur;

if timer <= 0{
	obj_player.roll_ai_cnt--;	
	instance_destroy();
}