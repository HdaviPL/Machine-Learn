var _gui_w = (display_get_gui_width()/2);
var _gui_h = (display_get_gui_height()/2);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

var _col = make_colour_rgb(77, 35, 44);
draw_set_colour(_col);
draw_set_alpha(alpha);
draw_set_font(font_nes);
draw_text_transformed(_gui_w, _gui_h, credits[indice], scale, scale,0);
draw_set_alpha(1);

// Sempre restaura o alinhamento
draw_set_halign(fa_left);
draw_set_valign(fa_top);