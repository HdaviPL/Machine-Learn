//clareando
function credits_fadein(){
	alpha += aupc;
	if (alpha >= 1){
	timer = 120;
		state = credits_fadehold;	
	}

}
//segura
function credits_fadehold(){
	timer--;
	if (timer <= 0){
		if (indice >= array_length(credits) - 1){
			alpha = 1;
			if keyboard_check_pressed(vk_anykey){
				game_restart();
			}
		} else{
		state = credits_fadeout;	
		}
	}

}
//escurecendo

function credits_fadeout(){
	alpha -= aupc;
	if alpha <= 0{
		indice++;
		alpha = 0;			
		state = credits_fadein;	
	}
}