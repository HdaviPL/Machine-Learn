#region Idle
function player_idle(){
	sprite_index = spr_player_idle;
	hspd = 0;
	vspd = 0;
	if (right) or (left) or (up) or (down){
		state = player_free;	
	}
	
		//bugs de flip da enquanto segura A e D corrigidos
	if (right and left){
		state = player_idle;	
	}
	if (up and down){
		state = player_idle;	
	}
	//atacar melee
	if (attack) and (item_alvo != noone) and (melee_timer <= 0) and (item_alvo.is_melee){
		state = player_attack_melee;	
	}	
	//atacar ranged
	if (attack) and (item_alvo != noone) and (shot_timer <= 0) and (item_alvo.is_ranged){
		state = player_attack_shot;	
	}	
}
#endregion

#region Free
function player_free(){	
	sprite_index = spr_player_walk;
	
	hspd = (right - left);
	vspd = (down - up);
	
	if (hspd != 0 and vspd != 0){
		var _hip = sqrt(sqr(hspd) + sqr(vspd));	
		hspd /= _hip;
		vspd /= _hip;
	}
	
	hspd *= spd;
	vspd *= spd;
	
	if (hspd != 0 or vspd != 0){
		last_dir_x = (right - left);
		last_dir_y = (down - up);
	}
	if hspd != 0{
		image_xscale = sign(hspd);
	}
	if (hspd == 0 and vspd == 0){
		state = player_idle;	
	}

	//atacar melee
	if (attack) and (item_alvo != noone) and (melee_timer <= 0) and (item_alvo.is_melee){
		state = player_attack_melee;	
	}	
	//atacar ranged
	if (attack) and (item_alvo != noone) and (shot_timer <= 0) and (item_alvo.is_ranged){
		state = player_attack_shot;	
	}	
}
#endregion

#region Roll
function player_roll(){
	
	sprite_index = spr_player_roll;
	if hspd != 0{
		image_xscale = sign(hspd);
	}
	if roll_timer <= 0{
		audio_play_sound(sd_dash,1,false);
		roll_x = last_dir_x;
		roll_y = last_dir_y;
		roll_timer = roll_timer_max;
		roll_ai_timer = 0;
		roll_ai_cnt = 0;
	}
	
	hspd = roll_x;
	vspd = roll_y;
	
	if (hspd != 0 and vspd != 0){
		var _hip = sqrt(sqr(hspd) + sqr(vspd));	
		hspd /= _hip;
		vspd /= _hip;
	}
	
	hspd *= spd_roll;
	vspd *= spd_roll;
	
	//copias do player
	roll_ai_timer--;
	if roll_ai_timer <=0{
		
		if roll_ai_cnt < roll_ai_max{
			var _ai = instance_create_layer(x,y,"Player",obj_afterimage);
			_ai.sprite_index = sprite_index;
			_ai.image_index  = image_index;
			_ai.image_xscale = image_xscale;
			_ai.image_yscale = image_yscale;
			_ai.image_angle  = image_angle;
			_ai.timer = roll_ai_dur;
			roll_ai_cnt++;
			
		}
		roll_ai_timer = roll_ai_int;	
	}
	
	roll_timer--;

	if roll_timer <= 0{
		hspd = 0;
		vspd = 0;
		roll_timer_start = roll_timer_start_max;
		state = player_free;
	}
	
}
#endregion

#region Morto
function player_dead(){
	hspd = 0;
	vspd = 0;
	if !instance_exists(obj_retry){
		instance_create_layer(0, 0, "Instances_room", obj_retry);
	}
}
#endregion

#region Melee
function player_attack_melee(){
	sprite_index = spr_player_attack;
	audio_play_sound(sd_melee_attack,1,false);
	if !instance_exists(obj_melee){
		var _melee = instance_create_layer(12 + item_alvo.dist_player,item_alvo.y,"Player",obj_melee);
		_melee.dano = item_alvo.dano + dano;
	}
	melee_timer = melee_timer_max;
	
	state = player_free;
}
#endregion

#region Shot
function player_attack_shot(){
	sprite_index = spr_player_attack;
	audio_play_sound(sd_shot,1,false);
	
	#region cria a faísca
	//calcula o angulo para sair direto da boca da misera arma (nao apaga isso foi uma p0rra de fazer)
		var _angle_spark = point_direction(x, y, mouse_x, mouse_y);
		var _spark_x = item_alvo.x;
		var _spark_y = item_alvo.y;
		var _spark = instance_create_layer(_spark_x,_spark_y,"Player",obj_spark_gun);
		_spark.image_angle = point_direction(x,y,mouse_x,mouse_y);
	#endregion	
	
	#region cria a bala
	var _angle = point_direction(x, y, mouse_x, mouse_y);
	//distância x do centro do player até o lugar onde ela vai sair
	var _shoot_x = x + lengthdir_x(8 + item_alvo.dist_player, _angle);
	//distância y do centro do player até o lugar onde ela vai sair
	var _shoot_y = y + lengthdir_y(item_alvo.dist_player, _angle);
	//criar a instancia da arma
	
	for (var i = 0; i < item_alvo.qtd_tiros; i ++){
		var _shoot = instance_create_layer(_shoot_x,_shoot_y,"Player",obj_shoot_player);
		//decidir para aonde a bala vai
		var _ang = point_direction(x,y,mouse_x,mouse_y);
		if (arma_equip == obj_gun_4){
			_shoot.angle = _ang + ((i * 15 - 22.5));
		} else{
			_shoot.angle = _ang;			
		}		
		_shoot.dano = item_alvo.dano + dano;
		_shoot.spd	= item_alvo.spd;
	}
	#endregion
	
	//volar pro estado free
	if shot_timer <= 0{
		shot_timer = item_alvo.cooldown;
		state = player_free;
	}

}
#endregion

#region health
function player_damage(dano){
	if (inv_timer <= 0){
		hp -= dano;
		inv_timer = inv_timer_max;
		kb_timer = kb_timer_max;
		kb_started = false;
		var _enemy = instance_place(x, y, obj_enemy);
		var _proj = instance_place(x, y, obj_projectiles);
		if _enemy != noone{
			kb_dir = point_direction(_enemy.x, _enemy.y, x, y);
		} else if _proj != noone{
			kb_dir = point_direction(_proj.x, _proj.y, x, y);
		}
		obj_camera.scn_shake = 5;
	}
	if hp <= 0{
		state = player_dead;
	} else if !(place_meeting(x,y,obj_spike)){
		state = player_knockback;	
	}
}
#endregion

#region	knockback
function player_knockback(){
	
	if !kb_started{
		kb_started = true;
		
		hspd = lengthdir_x(kb_force, kb_dir);
		vspd = lengthdir_y(kb_force, kb_dir);
	}
	
	if kb_timer <= 0{
		kb_started = false;
		hspd = 0;
		vspd = 0;
		state = player_free;
	}
}
#endregion
 
#region Inputs 
function player_inputs(){
	//movimentação
	right	=	keyboard_check(inputs.right);
	left	=	keyboard_check(inputs.left);
	down	=	keyboard_check(inputs.down);
	up		=	keyboard_check(inputs.up);
	roll	=	keyboard_check_pressed(inputs.roll);
	item	=	keyboard_check_pressed(inputs.item);
	quick	=	keyboard_check(inputs.quick);
	attack	=	mouse_check_button(inputs.attack);

	if input_lock > 0{
		right	=	false;
		left	=	false;
		down	=	false;
		up		=	false;
		roll	=	false;
		item	=	false;
		quick	=	false;
		attack	=	false;
	}
}
#endregion

#region Reset
function player_reset(){
	bomb = 1;
	have_ring = false;
	have_glasses = false;
	have_dirty = false;
	spd = 2;
	dano = 0;
	hp = 6;
	hp_max = 6;
	hspd = 0;
	vspd = 0;
	inv_timer = 0;
	kb_timer = 0;
	kb_started = 0;
	roll_timer = 0;
	roll_timer_start = 0;
	roll_x = 0;
	roll_y = 0;
	roll_ai_timer = 0;
	roll_ai_cnt = 0;
	melee_timer = 0;
	shot_timer = 0;
	arma_equip = obj_cano;
	direc_enter = "";
	input_lock = 40;
	global.engrenagens = 0;
	global.free_shop = false;
	state = player_free;
}
#endregion