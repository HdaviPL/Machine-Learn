depth = 200;
//brilho
pre_length = -24;
spd_bright = 1;
pos_length = 40;
pos_bright = pre_length;

//surfaces
surf_mask = -1;
surf_result = -1;

largura = sprite_get_width(sprite_index);
altura = sprite_get_height(sprite_index);

timer_bright_reset = 0;
timer_bright_reset_max = 24;

is_melee = false;
is_ranged = true;

cooldown = 24;
dano = 1;
sprite_equip = noone;
dist_player = 20;
spd  = 1;

qtd_tiros = 1;

no_chao = true;