if (timer_end > 0){
	timer_end--;
} else{
	if (!instance_exists(obj_transition)){
		var _transition = instance_create_layer(0, 0, "Instances_room", obj_transition);
		_transition.troca_room = true;
		_transition.room_destino = rm_menu;	
	}
}