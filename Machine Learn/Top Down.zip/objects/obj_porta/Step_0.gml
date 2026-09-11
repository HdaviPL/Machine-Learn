switch (room){ //decide pra qual sala vai e SE vai pra uma sala
	case rm_start:
		obj_music.tipo_music = "silence";
		troca_room = true;
		room_destino = rm_game_01;
		porta_block = false;
	break;
		
	case rm_game_01:
		obj_music.tipo_music = "andar";
		troca_room = false;
		room_destino = rm_loja_01;
	break;
	
	case rm_loja_01:
		troca_room = true;
		room_destino = rm_boss_01;
		if (instance_exists(obj_lojista) and (obj_lojista.count_shots <= 0)){
			obj_music.tipo_music = "loja boss";
			if (direc == "up"){
				porta_block = true;
			}	
		} else{
			if (direc == "up"){
			obj_music.tipo_music = "loja";
				porta_block = false;
			}				
		}
	break;
		
	case rm_boss_01:
		troca_room = true;
		room_destino = rm_game_02;
		if (instance_exists(obj_robo)){
			obj_music.tipo_music = "boss";
			if (direc == "up"){
				porta_block = true;
			}	
		} else{
			if (direc == "up"){
			obj_music.tipo_music = "silence";
				porta_block = false;
			}			
		}
	break;
		
	case rm_game_02:
		obj_music.tipo_music = "andar";
		troca_room = false;
		room_destino = rm_loja_02;
	break;
	
	case rm_loja_02:
		troca_room = true;
		room_destino = rm_boss_02;
		if (instance_exists(obj_lojista) and (obj_lojista.count_shots <= 0)){
			obj_music.tipo_music = "loja boss";
			if (direc == "up"){
				porta_block = true;
			}	
		} else{
			if (direc == "up"){
				obj_music.tipo_music = "loja";
				porta_block = false;
			}				
		}
	break;	
	
	case rm_boss_02:
		obj_music.tipo_music = "boss";
		troca_room = true;
		room_destino = rm_game_03;
	break;
		
	case rm_game_03:
		obj_music.tipo_music = "andar";
		troca_room = false;
		room_destino = rm_loja_03;
	break;
	
	case rm_loja_03:
		troca_room = true;
		room_destino = rm_boss_03;
		if (instance_exists(obj_lojista) and (obj_lojista.count_shots <= 0)){
			obj_music.tipo_music = "loja boss";
			if (direc == "up"){
				porta_block = true;
			}	
		} else{
			if (direc == "up"){
			obj_music.tipo_music = "loja";
				porta_block = false;
			}				
		}
	break;
	
	case rm_boss_03:
		obj_music.tipo_music = "boss";
		troca_room = false;
	break;
}	

if (direc == "down"){
	porta_block = true;
}

	var _block = (porta_block == false) and (!instance_exists(obj_room) or obj_room.sala_bloqueada == false);
if (_block){
	sprite_index = spr_porta_closed;
} else if (porta_block == true) or (instance_exists(obj_room) and obj_room.sala_bloqueada == true){
	sprite_index = spr_porta_block;		
}	

if (place_meeting(x, y, obj_player)) and (obj_player.item_alvo != noone){
	if (_block){
	sprite_index = spr_porta_open;
	obj_player.input_lock = 90;
	obj_player.direc_enter = direc;
	if (!instance_exists(obj_transition)){
		var _transition = instance_create_layer(0, 0, "Instances_room", obj_transition);	
		_transition.troca_room = troca_room;
		_transition.room_destino = room_destino;
		_transition.direc = direc;
	}
	}
}

