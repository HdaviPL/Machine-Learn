if !instance_exists(obj_player){
	exit;	
}

if place_meeting(x,y,obj_player) and obj_player.item{
	if obj_player.item_alvo != noone{
		var _arma_ant = obj_player.item_alvo;
		_arma_ant.no_chao = true;
		obj_player.item_alvo = noone;
	}
	obj_player.item_alvo = self;
	obj_player.arma_equip = object_index;
	no_chao = false;
}

if no_chao == true{
	image_angle = 0;	
}

if image_angle > 90 and image_angle < 270{
	image_yscale = -1;
} else{
	image_yscale = 1;	
}
