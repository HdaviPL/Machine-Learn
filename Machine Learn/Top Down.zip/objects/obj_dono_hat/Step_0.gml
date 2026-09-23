if (!instance_exists(alvo)){
	instance_destroy();
	exit;
}

image_alpha = alvo.image_alpha;
x = alvo.x;
y = alvo.y;