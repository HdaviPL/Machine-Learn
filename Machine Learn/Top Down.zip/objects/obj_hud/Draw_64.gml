//cor
var _cor = make_colour_rgb(157,101,76);

//barra
draw_sprite_ext(spr_hud_bar,0,288,0,scale,scale,0,c_white,1);

//moldura do item
draw_sprite_ext(spr_item_hud,0,80,alt_gui,scale,scale,0,c_white,1);

//item
if obj_player.item_alvo != noone{
	draw_sprite_ext(obj_player.item_alvo.sprite_index,0,80,alt_gui,scale,scale,0,c_white,1);
}

//vidas
for (var i = 0; i < obj_player.hp_max; i++){
	var _x = 150 + (i * dist_hp);
	var _frame = 1;
	if i < obj_player.hp{
		_frame = 1
	} else{
		_frame = 0;
	}
	draw_sprite_ext(spr_vida_hud,_frame,_x,alt,scale,scale,0,c_white,1);
}

//engrenagens
draw_set_font(font_nes);
draw_set_colour(_cor);
draw_text_transformed(dist_eng+144,alt_eng-20,string(global.engrenagens),scale,scale,0);
draw_sprite_ext(spr_eng_hud,0,dist_eng+100,alt_eng,scale,scale,0,c_white,1);