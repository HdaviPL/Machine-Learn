cat = {
	
}

cat.ranged ={
	"1": [obj_gun_0, obj_gun_1],
	"2": [obj_gun_2, obj_gun_3],
	"3": [obj_gun_4, obj_gun_5]
}

cat.melee ={
	"1": obj_cano,
	"2": obj_faca,
	"3": obj_espada
}

cat.pass ={
	"1": [obj_hp_potion, obj_heart, obj_bomb_item],
	"2": [obj_dmg_up, obj_speed_boots, obj_glasses_balled, obj_bomb_item],
	"3": [obj_ring, obj_gta_vi, obj_dirty_boots, obj_bomb_item]
}

price = {
	"obj_gun_0":			15,	
	"obj_gun_1":			15,	
	"obj_gun_2":			20,	
	"obj_gun_3":			25,	
	"obj_gun_4":			30,	
	"obj_gun_5":			35,
	"obj_cano":				5,
	"obj_faca":				10,
	"obj_espada":			25,
	"obj_hp_potion":		15,
	"obj_bomb_item":		10,
	"obj_heart":			5,
	"obj_speed_boots":		10,
	"obj_dmg_up":			25,
	"obj_dirty_boots":		30,
	"obj_glasses_balled":	10,
	"obj_ring":				15,
	"obj_gta_vi":			50
}

sprites = {
	"obj_gun_0":			spr_arma_0,	
	"obj_gun_1":			spr_arma_1,	
	"obj_gun_2":			spr_arma_2,	
	"obj_gun_3":			spr_arma_3,	
	"obj_gun_4":			spr_arma_4,	
	"obj_gun_5":			spr_arma_5,
	"obj_cano":				spr_cano,
	"obj_faca":				spr_faca,
	"obj_espada":			spr_espada,
	"obj_hp_potion":		spr_hp_potion,	
	"obj_bomb_item":		spr_bomb_item,
	"obj_heart":			spr_heart,
	"obj_speed_boots":		spr_speed_boots,
	"obj_dmg_up":			spr_dmg_up,
	"obj_dirty_boots":		spr_dirty_boots,
	"obj_glasses_balled":	spr_glasses_balled,
	"obj_ring":				spr_ring,
	"obj_gta_vi":			spr_gta_vi
}

final_price = noone;
item = noone;
comprou = false;
sprite_item = noone;
lista = noone;
andar = 1;

if (room == rm_loja_01){
	andar = 1;	
} else if (room == rm_loja_02){
	andar = 2;	
} else if (room == rm_loja_03){
	andar = 3;	
}

switch andar{
	case 1:
		if (catalogo == "ranged"){
			lista = variable_struct_get(cat.ranged, "1");
		} else if (catalogo == "melee"){
			lista = variable_struct_get(cat.melee, "1");				
		} else if (catalogo == "pass"){
			lista = variable_struct_get(cat.pass, "1");			
		}
	break;
	
	case 2:
		if (catalogo == "ranged"){
			lista = variable_struct_get(cat.ranged, "2");	
		} else if (catalogo == "melee"){
			lista = variable_struct_get(cat.melee, "2");				
		} else if (catalogo == "pass"){
			lista = variable_struct_get(cat.pass, "2");		
		}	
	break;	
	
	case 3:
		if (catalogo == "ranged"){
			lista = variable_struct_get(cat.ranged, "3");	
		} else if (catalogo == "melee"){
			lista = variable_struct_get(cat.melee, "3");				
		} else if (catalogo == "pass"){
			lista = variable_struct_get(cat.pass, "3");		
		}
	break;
}
if (is_array(lista)){
	var _item = irandom(array_length(lista) - 1);
	item = lista[_item];
} else{
	item = lista;
}

show_debug_message(object_get_name(item));