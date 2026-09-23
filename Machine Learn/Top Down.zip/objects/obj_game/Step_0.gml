
if (instance_exists(obj_pause)){
	if (global.pause == true){
		exit;	
	}
}
if (instance_exists(obj_player)){
	if keyboard_check(ord("R")){
		if timer_restart <= 0{
			if !instance_exists(obj_transition){
				var _transition = instance_create_layer(0,0,"Instances_room",obj_transition);
				_transition.troca_room = true;
				_transition.room_destino = rm_start;
				obj_player.state = player_reset;	
			}
		} else{
			timer_restart--;	
		}
	}
	
	if (msec < 60) and (obj_player.hp > 0){
		msec += 1;
	}

	if (msec >= 60){
		msec = 0;
		sec += 1;
	}

	if (sec >= 60){
		sec = 0;
		mint += 1;
	}
}
