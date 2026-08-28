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

if hp <= 0{
	instance_create_layer(x,y+12,"Shadows",obj_morte);
	instance_create_layer(x,y,"Shadows",obj_death);
	var _qtd = irandom_range(1,3);
	for(var i = 0; i < _qtd; i++){
		var _x = x + irandom_range(-10,10);
		var _y = y + irandom_range(-10,10);
		var _eng = instance_create_layer(_x,_y,"Items",obj_eng);	
	}
	instance_destroy();	
}

if timer_start <= 0{
	script_execute(state);
}

//virar o lado;
if (obj_player.x - x) != 0{
	image_xscale = sign(obj_player.x - x);
} else{
	image_xscale = 1;	
}