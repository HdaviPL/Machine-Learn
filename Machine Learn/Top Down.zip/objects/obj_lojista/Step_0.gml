if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

#region timers
if i_frame > 0{
	i_frame--;	
}
if hit_timer > 0{
	hit_timer--;	
}
if timer_start > 0{
	timer_start--;	
}
#endregion

if (hp <= 0){
	state = loj_death;	
}

if (timer_start <= 0){
	script_execute(state);
}
