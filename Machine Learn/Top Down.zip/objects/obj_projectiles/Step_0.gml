if place_meeting(x,y,obj_wall){
	instance_create_layer(x,y,"Enemies",obj_destroy_shoot);
	instance_destroy();	
}