if (global.pause == true){
	image_speed = 0;
	exit;	
} else{
	image_speed = 1;
}

if (hp <= 0){
	state = dono_2_death;	
}

tempo += 0.1;
y = y_inicial + (2 * sin(tempo));

event_inherited();