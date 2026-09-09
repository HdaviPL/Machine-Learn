if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (hp <= 0){
	sprite_index = spr_bombardeiro;
	hspd = 0;
	vspd = 0;
	instance_create_layer(x, y, "Enemies", obj_exp);
	instance_destroy();
}
event_inherited();