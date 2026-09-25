if (timer_started > 0){
	timer_started--;	
} else{
	if (keyboard_check(vk_anykey)){
		var _transition = instance_create_layer(0, 0, "Instances_room", obj_transition);
		_transition.troca_room = true;
		_transition.room_destino = rm_lore_02;			
	}
}