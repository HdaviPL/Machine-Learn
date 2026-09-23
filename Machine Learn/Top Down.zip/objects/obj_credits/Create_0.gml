#region	destruir tudo
	with(obj_player){
		instance_destroy();
	}

	with(obj_hud){
		instance_destroy();
	}

	with(obj_effect_suj){
		instance_destroy();
	}

	with(obj_game){
		instance_destroy();
	}

	with(obj_camera){
		instance_destroy();
	}

	with(obj_gun){
		instance_destroy();
	}

	with(obj_white_gun){
		instance_destroy();
	}
#endregion

credits = ["MACHINE LEARN","","PROGRAMADOR:\n\DAVI PEREIRA","","ARTISTAS:\n\DAVI PEREIRA\n\MATHEUS PEREIRA","","COMPOSITORES:\n\DAVI PEREIRA\n\MATHEUS PEREIRA","","GAME TESTERS:\n\BRUNO VINICIUS\n\YAGO DE ASSIS\n\PROF. PEDRO","","AGRADECIMENTOS ESPECIAIS\n\BRUNO VINICIUS\n\PROF. PEDRO\n\PROFA. THAYS","","ADEUS GAMEMAKER..."];

indice = 0;
timer = 0;
alpha = 0;
aupc = 0.1;
scale = 3;
state = credits_fadein;