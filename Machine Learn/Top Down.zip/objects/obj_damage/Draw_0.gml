var _cor = make_colour_rgb(255,255,255);
draw_get_alpha();
draw_set_alpha(opc);
draw_set_font(global.font);
draw_set_colour(_cor);
draw_text_transformed(x, _y, obj_player.item_alvo.dano, 1, 1, 0);
draw_set_alpha(1);