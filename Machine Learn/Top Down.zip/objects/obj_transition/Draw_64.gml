//cor
var _cor = make_colour_rgb(0,0,0);

//linhas
for (var i = 0; i < lins; i++){
	//colunas
	for	(var ii = 0; ii < colun; ii++){
		
		//limite
		var _img = min(max(0,img - i), img_num);
		
		//célula
		draw_sprite_ext(spr_transition,_img, ii * tam, i * tam,1,1,0,_cor,1);
	}
}