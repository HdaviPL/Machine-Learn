#region timers
if i_frame > 0{
	i_frame--;	
}
if hit_timer > 0{
	hit_timer--;	
}
if timer_start > 0{
	timer_start--;	
}
#endregion

if (hp <= 0) and (boss == false){
		instance_create_layer(x,y+12,"Shadows",obj_morte);
		instance_create_layer(x,y,"Shadows",obj_death);
		#region dropar coisas
			var _drop = irandom(2);
			if (_drop != 0){
				if (_drop == 1){
					#region dropar poções
							var _qtd = irandom_range(0,1);
							for(var i = 0; i < _qtd; i++){
								var _x = x + irandom_range(-10,10);
								var _y = y + irandom_range(-10,10);
								var _eng = instance_create_layer(_x,_y,"Items",obj_hp_potion);	
							}
						#endregion					
				} else if (_drop == 2){
					#region dropar engrenagens
							var _qtd = irandom_range(1,2);
							for(var i = 0; i < _qtd; i++){
								var _x = x + irandom_range(-10,10);
								var _y = y + irandom_range(-10,10);
								var _eng = instance_create_layer(_x,_y,"Items",obj_eng);	
							}
						#endregion				
				}
			}
		#endregion
		audio_play_sound(sd_enemy_death,1,false);
		instance_destroy();	
}

if timer_start <= 0{
	script_execute(state);
}

if (boss == false){
	//virar o lado;
	if (obj_player.x - x) != 0{
		image_xscale = sign(obj_player.x - x);
	} else{
		image_xscale = 1;	
	}
}