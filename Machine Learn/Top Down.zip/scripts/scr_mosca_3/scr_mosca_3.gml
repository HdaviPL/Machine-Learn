function mosca3_fly(){
	
	direc = point_direction(x,y,obj_player.x,obj_player.y);
	hspd = lengthdir_x(spd,direc);
	vspd = lengthdir_y(spd,direc);
	
	var _list = ds_list_create();	
	var _perto = collision_circle_list(x,y,8,obj_mosca_3, false, true, _list, false);
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