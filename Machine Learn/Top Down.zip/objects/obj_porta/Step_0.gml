switch (room){ //decide pra qual sala vai e SE vai pra uma sala
	case rm_start:
		troca_room = true;
		room_destino = rm_game_01;
		porta_block = false;
	break;
		
	case rm_game_01:
		troca_room = false;
		room_destino = rm_boss_01;
		if (obj_room.sala_atual == 0) and (direc == "down"){
			porta_block = true;			
		} else{
			porta_block = false;			
		}
	break;
		
	case rm_boss_01:
		troca_room = true;
		room_destino = rm_game_02;
		if (direc == "down"){
			porta_block = true;
		}
	break;
		
	case rm_game_02:
		troca_room = false;
		room_destino = rm_boss_02;
		if (obj_room.sala_atual == 0) and (direc == "down"){
			porta_block = true;			
		} else{
			porta_block = false;			
		}
	break;
		
	case rm_boss_02:
		troca_room = true;
		room_destino = rm_game_03;
		if (direc == "down"){
			porta_block = true;
		}
	break;
		
	case rm_game_03:
		troca_room = false;
		room_destino = rm_boss_03;
		if (obj_room.sala_atual == 0) and (direc == "down"){
			porta_block = true;			
		} else{
			porta_block = false;			
		}
	break;
		
	case rm_boss_03:
		troca_room = false;
		if (direc == "down"){
			porta_block = true;
		}
	break;
}	
	var _block = (porta_block == false) and (!instance_exists(obj_room) or obj_room.sala_bloqueada == false);
if (_block){
	sprite_index = spr_porta_closed;
} else if (porta_block == true) or (instance_exists(obj_room) and obj_room.sala_bloqueada == true){
	sprite_index = spr_porta_block;		
}	

if (place_meeting(x, y, obj_player)){
	if (_block){
	sprite_index = spr_porta_open;
	obj_player.input_lock = 60;
	obj_player.direc_enter = direc;
	obj_music.tipo_music = "andar";
	if (!instance_exists(obj_transition)){
		var _transition = instance_create_layer(0, 0, "Instances_room", obj_transition);	
		_transition.troca_room = troca_room;
		_transition.room_destino = room_destino;
		_transition.direc = direc;
	}
	}
}

