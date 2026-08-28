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
		scn_shake = 3;
		_enemy.hp -= dano;
		_enemy.i_frame = _enemy.i_frame_max;
		_enemy.hit_timer = _enemy.hit_timer_max;
		obj_camera.scn_shake = 2;
		audio_play_sound(sd_hitting,1,false);
		instance_destroy();
	}
}