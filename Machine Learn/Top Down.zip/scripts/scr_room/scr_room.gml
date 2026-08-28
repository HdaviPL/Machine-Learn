function room_gerar(){
	salas[salas_atuais] ={
		frame: frames[salas_atuais],
		up:		-1,
		down:	-1
	}

	salas_atuais+=1;	
}

function room_mostrar(){
	var _frame = salas[sala_atual].frame;	
	
	//pega os valores do desenho da room
	largura = sprite_get_width(spr_atual);
	altura = sprite_get_height(spr_atual);
	
	//cria a surface (espécie de folha onde o desenho da room vai ser aplicado)
	surf = surface_create(largura,altura);
	surface_set_target(surf);

	//aqui ele desenha o sprite no frame atual do desenho da room
	draw_clear_alpha(c_black, 0);
	draw_sprite(spr_atual,_frame,0,0);
	surface_reset_target();

	//pega os valores da surface criada
	var _w = surface_get_width(surf);
	var _h = surface_get_height(surf);

	/*
	cria um buffer (é como se fosse uma caixa que guarda os dados da cor do pixel pra serem lidos dps. 
	nesse caso é o dado da cor do pixel (n sei se é isso pq eu to aprendendo pelo manual do 
	gamemaker enquanto faço, ent releve!!!))
	*/
	buffer_room = buffer_create(_w * _h * 4,buffer_fixed,1);
	
	buffer_get_surface(buffer_room,surf,0)
	
	//limpar a memoria da surface pra n travar a bomba toda
	surface_free(surf);

	/*
	aqui é pra ler o buffer. dá pra perceber o quanto o ingles é importante só olhando
	pro nome dessas funções. todas fazem exatamente o que diz no nome delas
	*/
	buffer_seek(buffer_room,buffer_seek_start,0);

	for (var ii = 0; ii<14;ii++){ //percorrer a grid da tela na vertical
		for (var i=0;i<22;i++){ //percorrer a grid da tela na horizontal ate o final e depois passar para a vertical e fazer a mesma coisa 23 vezes
			var _x = i; //saber o valor da célula horizontalmente
			var _y = ii; //saber o valor da célula verticalmente
		
			var _pixel = buffer_peek(buffer_room, 4 * (_x + _y * _w),buffer_u32); //saber a posição do pixel desenhado

			//foi uma desgraça entender como isso funciona, mas peguei o jeito.
			var _r = (_pixel & $ff);		//saber o quão avermelhado é o pixel (vai de 0 a 255, delimitado pelo $ff)
			var _g = (_pixel >> 8) & $ff;	//saber o quão azulado o pixel é, no mesmo esquema do de cima
			var _b = (_pixel >> 16) & $ff;	//saber o quão verde o pixel é, no mesmo esquema do de cima
			var _a = (_pixel >> 24) & $ff;	//saber o quão transparente o pixel é, no mesmo esquema do de cima
		
			//fazer as cores aparecerem
			col = make_colour_rgb(_r,_g,_b);
		
			//correção das bordas
			var _pos_y = (_y * 16)+64;
			var _pos_x = (_x * 16)+16;
		
		
			//desenhar o espinho na posição e se a cor for vermelho		
			if (_r == 255) and (_g == 0) and (_b == 0) and (_a == 255){
				instance_create_layer(_pos_x,_pos_y,"Spikes",obj_spike);	
			}
			   
			//desenhar um obstáculo na posição e se a cor for roxo
			if (_r == 128) and (_g == 0) and (_b == 255) and (_a == 255){
				instance_create_layer(_pos_x,_pos_y,"Obs",obj_obs);	
			}
				
			//desenhar um buraco na posição e se a cor for preto
			if (_r == 0) and (_g == 0) and (_b == 0) and (_a == 255){
				var _hole = instance_create_layer(_pos_x,_pos_y,"Holes",obj_hole);;	
				_hole.borda = true;
				if _y > 0{
					var _pixel_cima = buffer_peek(buffer_room, 4 * (_x + (_y - 1) * _w),buffer_u32);
					var _r_cima = (_pixel_cima & $ff),
						_g_cima = (_pixel_cima >> 8) & $ff,
						_b_cima = (_pixel_cima >> 16) & $ff,
						_a_cima = (_pixel_cima >> 24) & $ff;
					if (_r_cima == 0) and (_g_cima == 0) and (_b_cima == 0) and (_a_cima == 255){
						_hole.borda = false;
					} else{
						_hole.borda = true;
					}	
				}
				
				if _y < _h - 1{
					var _pixel_baixo = buffer_peek(buffer_room, 4 * (_x + (_y + 1) * _w),buffer_u32);
					#region borda baixo
					var _r_baixo = (_pixel_baixo & $ff),
						_g_baixo = (_pixel_baixo >> 8) & $ff,
						_b_baixo = (_pixel_baixo >> 16) & $ff,
						_a_baixo = (_pixel_baixo >> 24) & $ff;
					if (_r_baixo == 0) and (_g_baixo == 0) and (_b_baixo == 0) and (_a_baixo == 255){
						_hole.borda_down = false;
					} else{
						_hole.borda_down = true;
					}
					#endregion	
				}
			}
				
			//desenhar água na posição e se a cor for azul
			if (_r == 0) and (_g == 128) and (_b == 255) and (_a == 255){
				var _agua = instance_create_layer(_pos_x,_pos_y,"Holes",obj_water);	
				    _agua.borda = false;
				    _agua.borda_down = false;
				if _y > 0{
					var _pixel_cima = buffer_peek(buffer_room, 4 * (_x + (_y - 1) * _w),buffer_u32);
					#region borda cima
					var _r_cima = (_pixel_cima & $ff),
						_g_cima = (_pixel_cima >> 8) & $ff,
						_b_cima = (_pixel_cima >> 16) & $ff,
						_a_cima = (_pixel_cima >> 24) & $ff;
					if (_r_cima == 0) and (_g_cima == 128) and (_b_cima == 255) and (_a_cima == 255){
						_agua.borda = false;
					} else{
						_agua.borda = true;
					}
					#endregion
				}
				
				if _y < _h - 1{
					var _pixel_baixo = buffer_peek(buffer_room, 4 * (_x + (_y + 1) * _w),buffer_u32);
					#region borda baixo
					var _r_baixo = (_pixel_baixo & $ff),
						_g_baixo = (_pixel_baixo >> 8) & $ff,
						_b_baixo = (_pixel_baixo >> 16) & $ff,
						_a_baixo = (_pixel_baixo >> 24) & $ff;
					if (_r_baixo == 0) and (_g_baixo == 128) and (_b_baixo == 255) and (_a_baixo == 255){
						_agua.borda_down = false;
					} else{
						_agua.borda_down = true;
					}
					#endregion	
				}
			}
				
			//desenhar um médico na posição e se a cor for laranja
			if (_r == 255) and (_g == 128) and (_b == 0) and (_a == 255) and (obj_game.salas_limpas[sala_atual] == false){
				var _medic = instance_create_layer(_pos_x,_pos_y,"Enemies",obj_medic);	
				_medic.sala_id = sala_atual;
				_medic.inimigo_id = inimigo_count;
				inimigo_count+=1;			
			}
			
			//desenhar uma aranha na posição e se a cor for amarelo
			if (_r == 255) and (_g == 255) and (_b == 0) and (_a == 255) and (obj_game.salas_limpas[sala_atual] == false){
				var _arac = instance_create_layer(_pos_x,_pos_y,"Enemies",obj_aranha);	
				_arac.sala_id = sala_atual;
				_arac.inimigo_id = inimigo_count;
				inimigo_count+=1;			
			}
			
			//desenhar um masked na posição e se a cor for verde
			if (_r == 0) and (_g == 255) and (_b == 0) and (_a == 255) and (obj_game.salas_limpas[sala_atual] == false){
				var _masked = instance_create_layer(_pos_x,_pos_y,"Enemies",obj_masked);	
				_masked.sala_id = sala_atual;
				_masked.inimigo_id = inimigo_count;
				inimigo_count+=1;			
			}
			
			//desenhar uma cube_fly na posição e se a cor for rosa
			if (_r == 255) and (_g == 0) and (_b == 255) and (_a == 255) and (obj_game.salas_limpas[sala_atual] == false){
				var _cubo = instance_create_layer(_pos_x,_pos_y,"Enemies",obj_cube_fly);	
				_cubo.sala_id = sala_atual;
				_cubo.inimigo_id = inimigo_count;
				inimigo_count+=1;
			}
		}
	}
	buffer_delete(buffer_room);
}

function room_limpar(){
	with(obj_spike){
		instance_destroy();	
	}
	with(obj_water){
		instance_destroy();	
	}
	with(obj_hole){
		instance_destroy();	
	}
	with(obj_obs){
		instance_destroy();	
	}
	with(obj_eng){
		instance_destroy();	
	}
	with(obj_morte){
		instance_destroy();	
	}
}

