#region lado esquerdo da hud

	#region itens
		//cor
		var _cor = make_colour_rgb(157,101,76);

		//barra
		draw_sprite_ext(spr_hud_bar, 0, 288, 0, scale, scale, 0, c_white, 1);

		//moldura do item
		draw_sprite_ext(spr_moldura_val, 0, 1, alt_gui, scale, scale, 0, c_white, 1);

		//item
		if (obj_player.item_alvo != noone) and (instance_exists(obj_player.item_alvo)){
			draw_sprite_ext(obj_player.item_alvo.sprite_index, 0, dist_item, alt_gui_item, scale_item, scale_item, 0, c_white, 1);
		}
		
		//poções de hp
		var _f_hp_potion = 0;
		if (obj_player.hp_potion > 0){
			_f_hp_potion = 1;	
		} else{
			_f_hp_potion = 0;	
		}
		
		draw_set_font(font_nes);
		draw_set_colour(_cor);
		draw_text_transformed(dist_hp_potion + 16, alt_hp_potion - 20, ":" +  string(obj_player.hp_potion), scale, scale, 0);
		draw_sprite_ext(spr_hp_potion, _f_hp_potion, dist_hp_potion, alt_hp_potion, scale_hp, scale_hp, 0, c_white, 1);
		
		
		
	#endregion
	
	#region vidas

		for (var i = 0; i < obj_player.hp_max; i++){
			var _x = 16 + (i * dist_hp);
			var _frame = 1;
			if i < obj_player.hp{
				_frame = 1
			} else{
				_frame = 0;
			}
			draw_sprite_ext(spr_vida_hud,_frame,_x,alt,scale,scale,0,c_white,1);
		}

	#endregion

	#region engrenagens

		draw_set_font(font_nes);
		draw_set_colour(_cor);
		draw_text_transformed(dist_eng + 40, alt_eng-20, string(global.engrenagens), scale, scale, 0);
		draw_sprite_ext(spr_eng_hud, 0, dist_eng, alt_eng, scale, scale, 0, c_white, 1);

	#endregion

#endregion

#region lado direito da hud

	#region molduras

		//molduras do andar
		draw_sprite_ext(spr_moldura_txt, 0, dist_room_mold, alt_room_mold_andar, scale, scale, 0, c_white, 1);
		draw_sprite_ext(spr_moldura_val, 0, dist_room_mold, alt_room_mold_andar_val, scale, scale, 0, c_white, 1);

		//molduras da sala
		draw_sprite_ext(spr_moldura_txt, 0, dist_room_mold, alt_room_mold_andar + 296, scale, scale, 0, c_white, 1);
		draw_sprite_ext(spr_moldura_val, 0, dist_room_mold, alt_room_mold_andar_val + 296, scale, scale, 0, c_white, 1);

		//molduras da morte
		draw_sprite_ext(spr_moldura_txt, 0, dist_room_mold, alt_room_mold_andar + 592, scale, scale, 0, c_white, 1);
		draw_sprite_ext(spr_moldura_val, 0, dist_room_mold, alt_room_mold_andar_val + 592, scale, scale, 0, c_white, 1);

		//moldura do tempo
		draw_sprite_ext(spr_moldura_txt, 0, dist_room_mold, alt_room_tempo, scale, scale, 0, c_white, 1);

	#endregion

	#region textos
	
		//textos
		draw_set_font(font_nes);
		draw_set_colour(_cor);

		//desenhar texto do andar
		draw_text_transformed(dist_room_andar, alt_room_andar, "-ANDAR-", scale-1, scale-1, 0);
		draw_text_transformed(dist_room_andr, alt_room_andr, andar, scale_numb, scale_numb, 0);

		//desenhar texto da sala
		draw_text_transformed(dist_room_sala, alt_room_sala, "-SALA-", scale-1, scale-1, 0);

		//desenhar morte
		draw_text_transformed(dist_room_morte, alt_room_morte, "-MORTES-", scale-1, scale-1, 0);
		draw_text_transformed(dist_room_mor, alt_room_mor, obj_player.mortes, scale_numb, scale_numb, 0);
		
		//desenhar tempo
		draw_text_transformed(dist_room_temp, alt_room_temp, string(obj_game.mint) + "M:" + string(obj_game.sec) + "S:" + string(obj_game.msec) + "MS" , scale-1.5, scale-1.5, 0);

		if (!instance_exists(obj_room)){
			draw_text_transformed(dist_room_sal, alt_room_sal, sala, scale_numb, scale_numb, 0);
		} else{
			andar = obj_room.andar_atual;
			//desenhar a sala atual
			sala = string(obj_room.sala_atual + 1);
			draw_text_transformed(dist_room_sal, alt_room_sal, sala, scale_numb, scale_numb, 0);
		}
	#endregion

#endregion
