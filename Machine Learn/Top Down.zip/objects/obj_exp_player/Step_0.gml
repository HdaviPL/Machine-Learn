obj_camera.scn_shake = 4;
obj_camera.shake_force = 6;

var _enemy = instance_place(x,y,obj_enemy);
if (_enemy != noone){
	if (_enemy.can_damage == true){
		if (_enemy.i_frame <= 0){
			_enemy.i_frame = _enemy.i_frame_max;
			_enemy.hit_timer = _enemy.hit_timer_max;
			_enemy.hp -= dano;
			obj_camera.scn_shake = 2;
			var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
			_dano_count.timer = _dano_count.timer_max;
			_dano_count._y = y;
			_dano_count.exib = dano;
			_dano_count.depth = -500;
		}
	}
}
	
var _loj = instance_place(x,y,obj_lojista);
if (_loj != noone){
	if (_loj.i_frame <= 0){
		_loj.i_frame = _loj.i_frame_max;
		_loj.hit_timer = _loj.hit_timer_max;
		_loj.hp -= dano;
		_loj.count_shots -= 1;
		obj_camera.scn_shake = 2;
		var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
		_dano_count.timer = _dano_count.timer_max;
		_dano_count._y = y;
		_dano_count.exib = dano;
		_dano_count.depth = -500;
	}
}
	
var _target = instance_place(x,y,obj_target_trainer);
if (_target != noone){
	if (_target.i_frame <= 0){
		_target.i_frame = _target.i_frame_max;
		_target.hit_timer = _target.hit_timer_max;
		obj_camera.scn_shake = 2;
		var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
		_dano_count.timer = _dano_count.timer_max;
		_dano_count._y = y;
		_dano_count.exib = dano;
		_dano_count.depth = -500;
	}
}