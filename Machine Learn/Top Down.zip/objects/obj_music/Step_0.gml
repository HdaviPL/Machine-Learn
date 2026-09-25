if (tipo_music == "silence"){
	grupo_music = music.silence;	
} else if (tipo_music == "boss"){
	grupo_music = music.boss;		
} else if (tipo_music == "loja"){
	grupo_music = music.loja;	
} else if (tipo_music == "loja boss"){
	grupo_music = music.loja_boss;	
} else if (tipo_music == "andar"){
	grupo_music = music.andar;	
} else if (tipo_music == "menu"){
	grupo_music = music.menu;	
} else if (tipo_music == "credits"){
	grupo_music = music.credits;	
} 

if instance_exists(obj_room){
	andar_atual = obj_room.andar_atual;	
}

switch (andar_atual){
	case 1:
	//pega a struct que está atrelado ao grupo_music e premite 
	//que escolha uma string dentro dele.
	//isso permite padronizar a escolha das opções de musica. fica bem massa
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
	if (music_prox != noone){
		music_id = audio_play_sound(music_atual,1,true);
	}
}
