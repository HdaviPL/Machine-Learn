if (global.pause == true){
	exit;	
}

if !instance_exists(alvo){
	instance_destroy();
}
x = alvo.x+correction_h * alvo.image_xscale;
y = alvo.y+correction_v;
