if (comprou == false){
	var _cor = make_colour_rgb(157,101,76);
	draw_sprite(sprite_item, image_index, x, y);
	draw_set_font(font_nes);
	draw_set_colour(_cor);
	if (final_price < 10){
		var _preco = "0" + string(final_price);	
		draw_text_transformed(x - 12, y + 16, _preco, 0.75, 0.75, 0);
	}  else{
		draw_text_transformed(x - 12, y + 16, final_price, 0.75, 0.75, 0);		
	}

}