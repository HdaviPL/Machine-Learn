if (borda_down == true) and (borda == true){
	sprite_index = spr_water_out_center;
} else if (borda_down == true) and (borda == false){
	sprite_index = spr_water_out_down;	
} else if (borda_down == false) and (borda == true){
	sprite_index = spr_water_out;
} else if (borda_down == false) and (borda == false){
	sprite_index = spr_water;	
}
