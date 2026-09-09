if no_chao == true{
	if (pos_bright < pos_length){
		pos_bright += spd_bright;
	}
	
	if (pos_bright >= pos_length){
		if (timer_bright_reset > 0){
			timer_bright_reset--;	
		}
		if (timer_bright_reset) <= 0{
			timer_bright_reset = timer_bright_reset_max;
			pos_bright = pre_length;
		}
	}
}