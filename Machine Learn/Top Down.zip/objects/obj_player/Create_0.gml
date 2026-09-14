//movimentação
spd = 2;
hspd = 0;
vspd = 0;
spd_max = 5;

dano = 0;

//vida
hp = 6;
hp_max = 6;

//knockback
kb_timer = 0;
kb_timer_max = 15;

kb_started = false;
kb_force = 4;
kb_dir = 0;

//rolada
roll_timer_start = 0;
roll_timer_start_max = 30;
spd_roll = noone;
roll_x = 0;
roll_y = 0;
roll_timer = 0;
roll_timer_max = 24;

//efeito da rolada
roll_ai_timer = 0;
roll_ai_max = 5; //maximo de copias que podem ter na tela
roll_ai_int = 3; //intervalo de tempo entre cada uma
roll_ai_dur = 8; //duração delas
roll_ai_cnt = 0; //quantidade das copia

//última direção, server para rolar mesmo se estiver parado e agr pode 
//"salvar" a ultima direção e continuar rolando
last_dir_x = 1;
last_dir_y = 0;

//invencibilidade
inv_timer =0;
inv_timer_max = 60;

//travar controles
input_lock = 0;

//melee
melee_timer = 0;
melee_timer_max = 24;

//ranged
shot_timer = 0;
arma_angle = 0;

//struct
inputs = {
	up: ord("W"),
	down: ord("S"),
	right: ord("D"),
	left: ord("A"),
	item: ord("E"),
	roll: vk_space,
	attack: mb_left,
	quick: vk_control
}

right	=	false;
left	=	false;
down	=	false;
up		=	false;
roll	=	false;
quick	=	false;

//itens
item_alvo = noone;
arma_equip = obj_cano;
timer_quick = 24;

#region itens passivos
	//tem botas sujas?
	have_dirty = false;
	timer_dirty = 0;
	timer_dirty_max = 6;

	//tem óculos bolados?
	have_glasses = false;
	dano_dash = 1;

	//tem anel?
	have_ring = false;
	
	//poções
	hp_potion = 0;
	hp_potion_max = 8;
	
	//bombas
	bomb = 1;
	bomb_max = 5;
#endregion


direc_enter = "";

state = player_free;

mortes = 0;