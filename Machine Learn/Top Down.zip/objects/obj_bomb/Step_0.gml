if (timer_bomb > 0){
	timer_bomb--;	
} else{
	instance_create_layer(x, y, "Items", obj_exp_player);
	instance_create_layer(x, y, "Shadows", obj_exp_dirty);
	instance_destroy();
}