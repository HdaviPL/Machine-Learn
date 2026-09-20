if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}
	
//velocidade do dash
spd_roll = spd + 1;

#region Timers + Dano
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
if timer_dirty > 0{
	timer_dirty--;	
}
	
var _inimigo = place_meeting(x,y,obj_enemy) or place_meeting(x,y,obj_projectiles) or (place_meeting(x,y,obj_lojista) and obj_lojista.state != loj_shop) or place_meeting(x,y,obj_exp) or place_meeting(x,y,obj_exp_player);

if (_inimigo or place_meeting(x,y,obj_spike))  and (inv_timer <= 0) and (state != player_roll) and (state != player_dead) and (!instance_exists(obj_transition)){
	audio_play_sound(sd_hurt, 1, false);
	player_damage(1);
}
#endregion

#region usar itens
	if (keyboard_check_pressed(ord("H"))) and (hp_potion > 0) and (hp < hp_max){
		hp_potion -= 1;
		hp +=1;	
	}
	
	if (mouse_check_button_pressed(mb_middle)) and (bomb > 0){
		bomb -= 1;
		instance_create_layer(x, y, "Items", obj_bomb);	
	}
#endregion

#region testes (apagar depois)
if (keyboard_check_pressed(ord("K"))){
	y = room_height - 244;
}
#endregion

#region item effects
//botas sujas
if (have_dirty == true) and (hspd != 0 or vspd != 0){
	if timer_dirty <= 0{
		timer_dirty = timer_dirty_max;	
		instance_create_layer(x, y + 13, "Shadows", obj_dirty);
	}
}
//óculos
if (have_glasses == true){
	var _enemy = instance_place(x, y, obj_enemy);
	if ((_enemy) and (state == player_roll) and (_enemy.i_frame <= 0)){
		_enemy.i_frame = _enemy.i_frame_max;
		_enemy.hit_timer = _enemy.hit_timer_max;
		_enemy.hp -= dano_dash;
		var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
		_dano_count.timer = _dano_count.timer_max;
		_dano_count.exib = dano_dash;
		_dano_count._y = y;
		_dano_count.depth = -500;
	}
}
//anel
if (have_ring == true){
	if (!instance_exists(obj_ring_light)){
		var _anel = instance_create_layer(x, y, "Shadows", obj_ring_light);
		_anel.image_alpha = 0.5;
		_anel.depth = 100;
		_anel.alvo = self;
		_anel.corection_v = 4;
	}
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