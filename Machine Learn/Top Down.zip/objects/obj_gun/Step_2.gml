if !instance_exists(obj_player){
	exit;	
}

if place_meeting(x,y,obj_player) and obj_player.item{
	obj_player.sprite_index = spr_player_attack;
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
depth = 200;
	if (pos_bright < pos_length){
		pos_bright += spd_bright;
	}
	
	if (pos_bright >= pos_length){
		if (timer_bright_reset > 0){
			timer_bright_reset--;	
		}
		if (timer_bright_reset) <= 0{
			timer_bright_reset = timer_bright_reset_max;
			pos_bright = pre_length;
		}
	}
	image_angle = 0;	
}

if image_angle > 90 and image_angle < 270{
	image_yscale = -1;
} else{
	image_yscale = 1;	
}
