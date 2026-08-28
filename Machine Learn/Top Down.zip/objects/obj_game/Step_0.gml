if keyboard_check(ord("R")){
	if timer_restart <= 0{
		if !instance_exists(obj_transition){
			obj_player.state = player_reset;
			var _transition = instance_create_layer(0,0,"Instances_room",obj_transition);
			_transition.troca_room = true;
			_transition.room_destino = rm_start;	
		}
	} else{
		timer_restart--;	
	}
}
