if (place_meeting(x,y,obj_player)){
	if (obj_player.spd < obj_player.spd_max){
		obj_player.sprite_index = spr_player_attack;
		no_chao = false;
		obj_player.spd += 1;
		instance_create_layer(x,y,"Items",obj_get_item);
		audio_play_sound(sd_coin,1,false);
		instance_destroy();
	}
}
event_inherited();