if !instance_exists(alvo){
	instance_destroy();
}
x = alvo.x+correction_h;
y = alvo.y+correction_v;

image_angle = point_direction(x,y,mira.x,mira.y);