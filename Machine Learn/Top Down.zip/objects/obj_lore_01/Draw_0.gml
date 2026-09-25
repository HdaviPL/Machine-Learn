var _h = -24;
var _y = 224;
var _cor = make_colour_rgb(157,101,76);

draw_set_alpha(1);
draw_set_font(font_nes);
draw_set_colour(_cor);
draw_text_transformed(_h, _y, credits, 0.5, 0.5, 0);
