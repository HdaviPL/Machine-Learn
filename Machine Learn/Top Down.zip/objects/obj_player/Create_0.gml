//movimentação
spd = 2;
hspd = 0;
vspd = 0;

//vida
hp = 5;
hp_max = 5;

//knockback
kb_timer = 0;
kb_timer_max = 15;

kb_started = false;
kb_force = 4;
kb_dir = 0;

//rolada
roll_timer_start = 0;
roll_timer_start_max = 30;
spd_roll = 4;
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
item_alvo = obj_gun_0;
arma_equip = obj_gun_0;
timer_quick = 60;
arma_need_criar = false;

direc_enter = "";

state = player_free;

#region	//criar a sombra (isso foi uma misera de fazer)
var _shadow = instance_create_layer(x,y,"Shadows",obj_shadow)
if _shadow != noone{
	_shadow.alvo = obj_player;
	_shadow.correction_v = 13;
	_shadow.correction_h = 0;
	_shadow.side = sign(image_xscale);
}
#endregion