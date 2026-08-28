prox_room = false;
salas_atuais = 0;
sala_atual = 0;
salas_max = 10;
direc_porta = "";
troca_cooldown = 0;
troca_cooldown_max = 30;
sala_bloqueada = false;
inimigo_count = 0;
salas_limpas = [];
andar_atual = 0;
/*se a room é tal, o sprite da sala é tal. 
assim facilita pra balancear a dificuldade dos andares
*/

if room == rm_game_01{	
	spr_atual = spr_room_1;	
	boss = rm_boss_01;	
	andar_atual = 1;
} else if room == rm_game_02{
	spr_atual = spr_room_2;
	boss = rm_boss_02;
	andar_atual = 2;
} else if room == rm_game_03{
	spr_atual = spr_room_3;
	boss = rm_boss_03;	
	andar_atual = 3;
}

//montar a organização das salas
randomize();

frames=[];
for (var i = 0; i < sprite_get_number(spr_atual); i++){
	frames[i] = i;
}

frames = array_shuffle(frames);


//rodar os scripts do padrão sala
while salas_atuais < salas_max{
	room_gerar();
}

for (var _i = 0; _i < salas_max; _i++){
	obj_game.salas_limpas[_i] = false;
}

room_mostrar();



