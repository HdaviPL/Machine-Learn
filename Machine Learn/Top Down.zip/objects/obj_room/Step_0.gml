//diminui o timer
if troca_cooldown > 0{
	troca_cooldown--;	
}

//faz a bobonica toda
if (prox_room == true) and (troca_cooldown <= 0){
	switch (direc_porta){
		case "up":
			if sala_atual != (salas_max-1){
				sala_atual +=1;				
			} else{
				room_goto(loja);
				exit;
			}
		break;		
		
		case "down":
			if sala_atual != (0){
				sala_atual -=1;
			}
		break;
	}
	
	troca_cooldown = troca_cooldown_max;
	room_limpar();
	room_mostrar();
	//teleporta o miseravel pra porta oposta a que ele entrou
	with(obj_porta){
		var _align = 32
		if (direc == "down") and (obj_room.direc_porta == "up"){
			obj_player.x = x
			obj_player.y = y - _align;
		} else if (direc == "up") and (obj_room.direc_porta == "down"){
			obj_player.x = x;
			obj_player.y = y + _align;
		}
	}
	
	prox_room = false;
}
	sala_bloqueada = false;	
with (obj_enemy){
	if (sala_id == obj_room.sala_atual){	
		obj_room.sala_bloqueada = true; 
	}
}

if (sala_bloqueada == false){
	obj_game.salas_limpas[sala_atual] = true;
}

