x += hspd;
y += vspd;

image_angle = angle;

if place_meeting(x,y,obj_wall){
	instance_create_layer(x,y,"Player",obj_destroy_shoot);
	audio_play_sound(sd_hit_wall,1,false);
	instance_destroy();	
}
var _enemy = instance_place(x,y,obj_enemy);
if (_enemy != noone){
	if _enemy.i_frame <= 0{
		_enemy.hp -= dano;
		_enemy.i_frame = _enemy.i_frame_max;
		_enemy.hit_timer = _enemy.hit_timer_max;
		obj_camera.scn_shake = 2;
		audio_play_sound(sd_hitting,1,false);
		var _dano_count = instance_create_layer(x, y, "Items",obj_damage);
		_dano_count.timer = _dano_count.timer_max;
		_dano_count._y = y;
		_dano_count.depth = -500;
		var _spot = instance_create_layer( x, y, "Shadows", obj_bullet_spot);
		instance_destroy();
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
		var _spot = instance_create_layer( x, y, "Shadows", obj_bullet_spot);
		instance_destroy();
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
		var _spot = instance_create_layer( x, y, "Shadows", obj_bullet_spot);
		instance_destroy();
	}
}
