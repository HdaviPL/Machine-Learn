//Checando se o player existe
if instance_exists(alvo){
	if alvo == obj_player{
		camhspd = 0.1;
		camvspd = 0.3;
	}
	x = lerp(x, alvo.x, camhspd);
	y = lerp(y, alvo.y, camvspd);
} else{
	exit;
}

//pegando valores da câmera
var _larg_camera = camera_get_view_width(view_camera[0])
var _alt_camera = camera_get_view_height(view_camera[0])
var _cam_x = x - _larg_camera / 2;
var _cam_y = y - _alt_camera / 2;
_cam_x = clamp(_cam_x, 0, room_width - _larg_camera);
_cam_y = clamp(_cam_y, 0, room_height - _alt_camera);

if scn_shake > 0{
	_cam_x = _cam_x + random_range(-scn_shake, scn_shake);
	_cam_y = _cam_y + random_range(-scn_shake, scn_shake);
	scn_shake = lerp(scn_shake, 0, shake_force);
	if scn_shake < 0.001{
		scn_shake = 0;	
	}
}
//alterando a posição da câmera
camera_set_view_pos(view_camera[0], _cam_x, _cam_y);