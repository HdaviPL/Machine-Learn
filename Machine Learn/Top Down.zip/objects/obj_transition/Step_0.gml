if (enter){
	//animação
	img += img_spd;
	//preencher todas as colunas
	if (img - img_num > colun + 5){
		enter = false;
		if (troca_room == true){
			obj_player.arma_need_criar = true;
			room_goto(room_destino);
			if (room_destino == rm_start){
				var _x = room_width/2;
				var _y = room_height/2 + 100;
				obj_player.x = _x;
				obj_player.y = _y;
				with (obj_retry){
					if (obj_player.state != player_dead){
						exit;	
					}
					instance_destroy();
				}
			}
			exit;
		} else{
			obj_room.direc_porta = direc;		
			obj_room.prox_room = true;
		}
	}
} else{
	global.pause = false;
	img -= img_spd;	
	if (img < -5){		
	instance_destroy();
	}
}