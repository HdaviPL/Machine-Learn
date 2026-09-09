if ((obj_player.arma_equip == object_index) and (instance_exists(obj_melee))){
	
} else{
	var _cor = make_colour_rgb(207,171,81);
if (no_chao){
	#region primeira surface; desenha a área da arma
		if (!surface_exists(surf_mask)){
			surf_mask = surface_create(largura, altura);
		}
		surface_set_target(surf_mask);
		draw_clear_alpha(c_white, 0);
		draw_sprite(sprite_index, image_index, sprite_xoffset, sprite_yoffset);
		surface_reset_target();
	#endregion
	
	#region segunda surface; mantém o brilho somente na área da arma
		if (!surface_exists(surf_result)){
			surf_result = surface_create(largura, altura);
		}
		surface_set_target(surf_result);	
		draw_clear_alpha(c_white, 0);
		draw_surface(surf_mask, 0, 0);
		gpu_set_blendmode_ext(bm_dest_alpha, bm_zero);
		var _x = sprite_xoffset + pos_bright;
		draw_sprite_ext(spr_shine, image_index, _x, sprite_yoffset, 1, 1, 0, _cor, 1);		
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	#endregion
	
	//desenhar as duas surfaces
	draw_surface(surf_mask, x - sprite_xoffset, y - sprite_yoffset);
	draw_surface(surf_result, x - sprite_xoffset, y - sprite_yoffset);
} else{
	draw_self();	
}
	
}