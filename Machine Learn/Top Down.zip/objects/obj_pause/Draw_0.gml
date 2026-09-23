if (global.pause == true) and (!instance_exists(obj_retry)){
	depth = -1000;
	draw_set_alpha(0.5);
	draw_rectangle_colour(0,0, 2000, 2000, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	if (timer_name > 0){
		timer_name--;	
	} else{
		timer_name = timer_name_max;	
	}
	if (timer_name > timer_name_max/2){
		var _x = room_width/2;
		var _y = room_height/2;
		depth = -1000;
		draw_sprite(spr_paused, 0, _x, _y);	
	}
}