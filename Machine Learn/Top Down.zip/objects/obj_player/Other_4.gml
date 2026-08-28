global.pause = false;
if (direc_enter != ""){
	with(obj_porta){
		var _align = 32
		if (obj_player.direc_enter == "down") and (direc == "up"){
			obj_player.x = x
			obj_player.y = y + _align;
		} else if (obj_player.direc_enter == "up") and (direc == "down"){
			obj_player.x = x;
			obj_player.y = y - _align;
		}
	}
}

if room != rm_start{
	if arma_equip != noone{
		var _arma_nova = instance_create_layer(obj_player.x,obj_player.y,"Items", obj_player.arma_equip);
		item_alvo = _arma_nova;	
		_arma_nova.sprite_index = _arma_nova.sprite_equip;	
		_arma_nova.no_chao = false;	
	}
}