if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

//definindo colisão horizontal
var _colh	= instance_place(x+hspd, y, obj_solid);

//se colidir horizontalmente
if (_colh){
	
	//direita
	if (hspd > 0){
		x = _colh.bbox_left + (x - bbox_right);
	}
	
	//esquerda
	if (hspd < 0){
		x = _colh.bbox_right + (x - bbox_left);
	}
	
	//se colidir, para
	hspd = 0;
}

x += hspd;

//definindo colisão vertical
var _colv	= instance_place(x, y + vspd, obj_solid);

//se colidir verticalmente
if (_colv){
	
	//baixo para cima
	if (vspd > 0){
		y = _colv.bbox_top + (y - bbox_bottom);
	}
	
	//cima para baixo
	if (vspd < 0){
		y = _colv.bbox_bottom + (y - bbox_top);
	}
	

	//parando	
	vspd = 0;
} 

y += vspd;