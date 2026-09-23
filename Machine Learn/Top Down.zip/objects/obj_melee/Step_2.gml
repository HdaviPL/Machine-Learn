with(obj_player){
	obj_melee.image_angle = item_alvo.image_angle;
	obj_melee.image_yscale = item_alvo.image_yscale;
	obj_melee.x = item_alvo.x;
	obj_melee.y = item_alvo.y;
}

var _enemy = instance_place(x,y,obj_enemy);
if (_enemy != noone){
    if (_enemy.can_damage == true){
		if _enemy.i_frame <= 0{
			_enemy.hp -= dano;
			_enemy.i_frame = _enemy.i_frame_max;
			_enemy.hit_timer = _enemy.hit_timer_max;
			obj_camera.scn_shake = 1;
			audio_play_sound(sd_hitting,1,false);
			var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
			_dano_count.timer = _dano_count.timer_max;
			_dano_count._y = y;
			_dano_count.depth = -500;
		}
	}
}

var _target = instance_place(x,y,obj_target_trainer);
if (_target != noone){
	if _target.i_frame <= 0{
		_target.i_frame = _target.i_frame_max;
		_target.hit_timer = _target.hit_timer_max;
		obj_camera.scn_shake = 2;
		audio_play_sound(sd_hitting,1,false);
		var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
		_dano_count.timer = _dano_count.timer_max;
		_dano_count._y = y;
		_dano_count.depth = -500;
	}
}

var _loj = instance_place(x,y,obj_lojista);
if (_loj != noone){
	if _loj.i_frame <= 0{
		_loj.hp -= dano;
		_loj.i_frame = _loj.i_frame_max;
		_loj.hit_timer = _loj.hit_timer_max;
		_loj.count_shots -= 1;
		obj_camera.scn_shake = 1;
		audio_play_sound(sd_hitting,1,false);
		var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
		_dano_count.timer = _dano_count.timer_max;
		_dano_count._y = y;
		_dano_count.depth = -500;
	}
}