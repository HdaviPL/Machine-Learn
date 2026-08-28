global.pause = true;
var _align_x = 284;
var _align_y = 154;
var mx = device_mouse_x_to_gui(0) - _align_x;
var my = device_mouse_y_to_gui(0) - _align_y;

if point_in_rectangle(mx,my,x_gui,y_gui - 100,x_gui + 150,y_gui + 60){
	tam += 0.1;
	tam = clamp(tam,tam_min,tam_max);
	if  mouse_check_button_pressed(mb_left){
		if !instance_exists(obj_transition){
			obj_player.state = player_reset;	
			var _transition = instance_create_layer(0,0,"Instances_room",obj_transition);
			_transition.troca_room = true;
			_transition.room_destino = rm_start;
		}
	}
}else{
	tam -= 0.1;
	tam = clamp(tam,tam_min,tam_max);
}
