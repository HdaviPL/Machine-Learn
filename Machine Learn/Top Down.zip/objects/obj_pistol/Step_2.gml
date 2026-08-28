if (!instance_exists(alvo)){
	instance_destroy();
	exit;
}

//aponta pro mouse
var _dist = point_distance(alvo.x, alvo.y, mira.x, mira.y);
	
if _dist > 10{
	alvo.arma_angle = point_direction(alvo.x, alvo.y, mira.x, mira.y);
}

x = alvo.x + lengthdir_x(dist, alvo.arma_angle);
y = alvo.y + lengthdir_y(dist, alvo.arma_angle);

image_angle = alvo.arma_angle;
	
if image_angle > 90 and image_angle < 270{
	image_yscale = -1;
} else{
	image_yscale = 1;	
}