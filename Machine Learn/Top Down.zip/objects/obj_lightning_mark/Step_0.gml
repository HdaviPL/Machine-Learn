if (!instance_exists(obj_dono)){
	instance_destroy();	
	exit;
}
x += hspd;
y += vspd;

switch (state){
	case "Follow":
		direc = point_direction(x, y, obj_player.x, obj_player.y);
		hspd = lengthdir_x(spd, direc);
		vspd = lengthdir_y(spd, direc);	
		if (place_meeting(x, y, obj_player)){
			state = "Light"
		}
	break;
	
	case "Light":
		hspd = 0; 
		vspd = 0;
		if (timer_create > 0){
			timer_create--;	
		} else{
			instance_create_layer(x, y, "Enemies", obj_lightning);
			instance_destroy();		
		}
	break;
}