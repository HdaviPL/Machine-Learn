x+=hspd;
y+=vspd;

if (inicial_timer > 0){
	inicial_timer--;
}

if place_meeting(x, y, obj_player){
	instance_create_layer(x,y,"Items",obj_get_item);
	global.engrenagens += valor;
	audio_play_sound(sd_coin,1,false);
	instance_destroy();
}

dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dist <= dist_min) and inicial_timer <= 0{
	//engrenagem é sugada
	var _dist = point_direction(x, y, obj_player.x, obj_player.y);
	var _spd_x = lengthdir_x(spd, _dist);
	var _spd_y = lengthdir_y(spd, _dist);
	hspd = lerp(hspd, _spd_x, 0.1);
	vspd = lerp(vspd, _spd_y, 0.1);
	
	var _list = ds_list_create();	
	var _perto = collision_circle_list(x,y,8,obj_mosca, false, true, _list, false);
	var _repul_x = 0;
	var _repul_y = 0;	
	if (_perto) > 0{
		for (var i = 0; i < _perto; i++){
			var _mosca = point_direction(self.x, self.y, _list[| i].x, _list[| i].y);
			if (_list[| i] != self){

				var _x = _mosca + 180;
				var _y = _mosca + 180;
				_repul_x += lengthdir_x( spd, _x);
				_repul_y += lengthdir_y( spd, _y);
			}
		}
			hspd += _repul_x;
			vspd += _repul_y;
	}
	ds_list_destroy(_list);
}



