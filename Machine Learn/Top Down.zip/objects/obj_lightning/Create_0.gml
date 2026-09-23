var _angle = irandom_range(-25, 25); 
var _xscale = irandom_range(-1, 1);
image_angle = _angle;
if (_xscale != 0){
	image_xscale = _xscale;
}
timer_end = 12;
audio_play_sound(sd_light,1,false);	