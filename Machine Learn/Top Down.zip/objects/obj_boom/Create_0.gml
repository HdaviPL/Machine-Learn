var _angle = irandom(360);
var _xscale = irandom_range(-1, 1);
var _index = irandom(2);
image_angle = _angle;
if (_xscale != 0){
	image_xscale = _xscale;
}
image_index = _index;
image_speed = 0;
scale = 0.1;
timer_end = 60;

obj_camera.scn_shake = 5;