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
	
var _inimigo = place_meeting(x,y,obj_enemy) or place_meeting(x,y,obj_projectiles) or (place_meeting(x,y,obj_lojista) and obj_lojista.state != loj_shop) or place_meeting(x,y,obj_exp);

if (_inimigo or place_meeting(x,y,obj_spike))  and (inv_timer <= 0) and (state != player_roll) and (state != player_dead) and (!instance_exists(obj_transition)){
	audio_play_sound(sd_hurt, 1, false);
	player_damage(1);
}
#endregion

#region curar

if (keyboard_check_pressed(ord("H"))) and (hp_potion > 0) and (hp < hp_max){
	hp_potion -= 1;
	hp +=1;	
}

#endregion

player_inputs();

script_execute(state);


#region rolar
if (roll) and (roll_timer_start <= 0){
	state = player_roll;	
} 
#endregion

#region sistema de arma (a misera mais miseravel que existe)
if (item_alvo != noone) and (arma_equip != noone){
	if instance_exists(item_alvo){
		//aponta pro mouse
		var _dist = point_distance(x, y, mouse_x, mouse_y);
	
		if _dist > 10{
			arma_angle = point_direction(x, y, mouse_x, mouse_y);
		}
	
		item_alvo.x = x + lengthdir_x(item_alvo.dist_player, arma_angle);
		item_alvo.y = y + lengthdir_y(item_alvo.dist_player, arma_angle);
		item_alvo.image_angle = arma_angle;
		item_alvo.no_chao = false;
		item_alvo.depth = -10
		if quick{
			timer_quick--;
			if timer_quick <= 0{
				sprite_index = spr_player_attack;
				item_alvo.x = x;
				item_alvo.y = y;
				item_alvo.no_chao = true;
				item_alvo = noone;
				timer_quick = 60;
			}
		}
	}
}
#endregion

#region	//criar a sombra (isso foi uma misera de fazer)
var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow)
if _shadow != noone{
	_shadow.alvo = obj_player;
	_shadow.correction_v = 13;
	_shadow.correction_h = 0;
	_shadow.side = sign(image_xscale);
}
#endregion