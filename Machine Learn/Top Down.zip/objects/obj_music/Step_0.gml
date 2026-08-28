if (tipo_music == "andar"){
	grupo_music = music.andar;	
} else if (tipo_music == "boss"){
	grupo_music = music.boss;		
}

if instance_exists(obj_room){
	andar_atual = obj_room.andar_atual;	
}

switch (andar_atual){
	case 1:
music_prox = variable_struct_get(grupo_music, "1");	
	
	break;

	case 2:
music_prox = variable_struct_get(grupo_music, "2");
	
	break;
	
	case 3:
music_prox = variable_struct_get(grupo_music, "3");
	
	break;

}

if (music_atual != music_prox){
	if (music_atual != noone){
		audio_stop_sound(music_id);
	}
	music_atual = music_prox;
	music_id = audio_play_sound(music_atual,1,true);
}

