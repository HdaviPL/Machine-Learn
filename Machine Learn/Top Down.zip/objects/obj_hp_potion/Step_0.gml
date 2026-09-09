image_index = 1;
if (place_meeting(x,y,obj_player)){
	if (obj_player.hp_potion < obj_player.hp_potion_max){
		obj_player.sprite_index = spr_player_attack;
		no_chao = false;
		obj_player.hp_potion += 1;
		instance_create_layer(x,y,"Items",obj_get_item);
		audio_play_sound(sd_coin,1,false);
		instance_destroy();
	}
}

event_inherited();