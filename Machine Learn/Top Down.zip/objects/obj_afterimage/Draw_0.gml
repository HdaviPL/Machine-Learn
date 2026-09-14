draw_self();
if (obj_player.have_glasses){
	var _col = make_colour_rgb(57,11,27);
	gpu_set_fog(true,_col,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,_col,image_alpha);
	gpu_set_fog(false,_col,0,0)
} else{
	draw_set_colour(c_white);	
}