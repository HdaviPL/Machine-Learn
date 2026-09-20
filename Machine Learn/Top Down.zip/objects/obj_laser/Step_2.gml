if (!instance_exists(alvo)){
	instance_destroy();
	exit;
}

//aponta pro mouse

x = alvo.x;
y = alvo.y + correction_v;

image_angle = alvo.laser_angle;

if image_angle >= 359{
	obj_dono.laser_acabou = true;
	instance_destroy();
}