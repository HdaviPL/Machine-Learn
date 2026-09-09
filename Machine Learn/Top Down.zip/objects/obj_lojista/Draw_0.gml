draw_self();

var _color = make_colour_rgb(207, 171, 81);

if hit_timer > 0{	
	gpu_set_fog(true,_color,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,_color,alpha_flash)
	gpu_set_fog(false,_color,0,0);
} else {	
	draw_set_colour(c_white);
}
