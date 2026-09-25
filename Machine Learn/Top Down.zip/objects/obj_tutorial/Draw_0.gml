//cor
var _cor = make_colour_rgb(157,101,76);

//desenhos
var _x = room_width/2;
var _y = room_height/2;

//alinhamento dos texto
var _align = 56;

var _align_txt_y1 = 58;
var _align_txt_y2 = 2;
var _align_txt_y3 = 54;

var _align_txt_x1 = 28;
var _align_txt_x2 = 36;
var _align_txt_x3 = 40;
var _align_txt_x4 = 102;
var _align_txt_x5 = 166;
var _txt_scale = 0.5;

#region //sprites
draw_sprite_ext(spr_tutorial_attack,0,_x,_y-_align,1,1,0,_cor,1);

draw_sprite_ext(spr_tutorial_roll,0,_x,_y,1,1,0,_cor,1);

draw_sprite_ext(spr_tutorial_move,0,_x,_y+_align,1,1,0,_cor,1);

draw_sprite_ext(spr_tutorial_heal,0,_x + 128,_y,1,1,0,_cor,1);

draw_sprite_ext(spr_tutorial_bomb,0,_x - 120,_y,1,1,0,_cor,1);


#endregion

#region //textos
draw_set_font(font_nes);

//mover
draw_text_transformed_colour(_x-_align_txt_x3, _y-_align_txt_y3, tut_3, _txt_scale, _txt_scale,0,_cor,_cor,_cor,_cor,1);

//roll
draw_text_transformed_colour(_x-_align_txt_x2, _y+_align_txt_y2, tut_2, _txt_scale, _txt_scale,0,_cor,_cor,_cor,_cor,1);

//attack
draw_text_transformed_colour(_x-_align_txt_x1, _y+_align_txt_y1, tut_1, _txt_scale, _txt_scale,0,_cor,_cor,_cor,_cor,1);

//heal
draw_text_transformed_colour(_x+_align_txt_x4, _y+_align_txt_y2, tut_4, _txt_scale, _txt_scale,0,_cor,_cor,_cor,_cor,1);

//bomb
draw_text_transformed_colour(_x-_align_txt_x5, _y+_align_txt_y2, tut_5, _txt_scale, _txt_scale,0,_cor,_cor,_cor,_cor,1);

#endregion