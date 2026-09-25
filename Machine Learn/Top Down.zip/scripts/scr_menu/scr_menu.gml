function main_menu(){
	if mouse_check_button_released(mb_left) and position_meeting(mouse_x, mouse_y, obj_new_game){
		audio_play_sound(sd_button_click, 0, false);
		var _transition = instance_create_layer(0, 0, "Instances_room", obj_transition);
		_transition.troca_room = true;
		_transition.room_destino = rm_lore_01;
	}
	if mouse_check_button_released(mb_left) and position_meeting(mouse_x, mouse_y, obj_config){
		audio_play_sound(sd_button_click, 0, false);
		state = config_menu;
	}
	if mouse_check_button_released(mb_left)	and position_meeting(mouse_x, mouse_y, obj_exit){
		audio_play_sound(sd_button_click, 0, false);
		game_end();
	}
}
function config_menu(){	
	#region //mudar resolução: 640x360
	if mouse_check_button_released(mb_left) and position_meeting(mouse_x, mouse_y, obj_res640){
		audio_play_sound(sd_button_click, 0, false);
		var res_width = 640;
		var res_height = 360;

		// Aplica o tamanho da janela
		window_set_size(res_width, res_height);
	}
	#endregion
	
	#region //mudar resolução: 1280x720
	if mouse_check_button_released(mb_left) and position_meeting(mouse_x, mouse_y, obj_res1280){
		audio_play_sound(sd_button_click, 0, false);
		var res_width = 1280;
		var res_height = 720;

		// Aplica o tamanho da janela
		window_set_size(res_width, res_height);
	}
	#endregion
	
	#region //deixa em tela cheia/tira
	if mouse_check_button_released(mb_left) and position_meeting(mouse_x, mouse_y, obj_resolution_full){
		audio_play_sound(sd_button_click, 0, false);
		if window_get_fullscreen()
		{
			window_set_fullscreen(false);
		}
		else
		{
			window_set_fullscreen(true);
		}
	}
	#endregion
	
	#region //volta para o menu principal
		if mouse_check_button_released(mb_left) and position_meeting(mouse_x, mouse_y, obj_voltar){
			audio_play_sound(sd_button_click, 0, false);
			state = main_menu;
		}
	#endregion
}