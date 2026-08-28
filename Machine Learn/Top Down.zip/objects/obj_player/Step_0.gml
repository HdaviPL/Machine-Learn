if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}
#region Timers + Vida
if input_lock > 0{
	input_lock--;	
}
if roll_timer_start > 0{
	roll_timer_start--;	
}
if melee_timer > 0{
	melee_timer--;	
}
if inv_timer > 0{
	inv_timer--;	
}
if shot_timer > 0{
	shot_timer--;	
}
if kb_timer > 0{
	kb_timer--;	
}

if (place_meeting(x,y,obj_enemy) or place_meeting(x,y,obj_projectiles) or place_meeting(x,y,obj_spike))  and (inv_timer <= 0) and (state != player_roll) and (state != player_dead) and (!instance_exists(obj_transition)){
	var inimigo = instance_place(x,y,obj_enemy) or instance_place(x,y,obj_projectiles);
	player_damage(1);
}
#endregion

if keyboard_check_pressed(ord("H")){
	hp = hp_max;	
}

player_inputs();
script_execute(state);

if item_alvo != noone{
	//aponta pro mouse
	var _dist = point_distance(x, y, mouse_x, mouse_y);
	
	if _dist > 10{
		arma_angle = point_direction(x, y, mouse_x, mouse_y);
	}	
	item_alvo.x = x + lengthdir_x(item_alvo.dist_player, arma_angle);
	item_alvo.y = y + lengthdir_y(item_alvo.dist_player, arma_angle);
	item_alvo.image_angle = arma_angle;
	item_alvo.no_chao = false;
	if quick{
		timer_quick--;
		if timer_quick <= 0{
			item_alvo.x = x;
			item_alvo.y = y;
			item_alvo.no_chao = true;
			item_alvo = noone;
			timer_quick = 60;
		}
	}
}


//show_debug_message(state)