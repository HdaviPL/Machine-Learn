if (timer > 0){
	timer--;
	_y -= 0.5;
} else if (timer <= 0){
	opc-= 0.1;
	if opc <= 0{
		instance_destroy();
	}
}

