if (place_meeting(x, y, obj_player)){
	obj_player.sprite_index = spr_player_attack;
	obj_player.have_ring = true;
	no_chao = false;
	instance_create_layer(x,y,"Items",obj_get_item);
	audio_play_sound(sd_coin,1,false);
	instance_destroy();
}

event_inherited();