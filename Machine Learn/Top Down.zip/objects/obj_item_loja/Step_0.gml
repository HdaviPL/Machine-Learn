if (global.free_shop == true){
	final_price = 0;	
} else{
	var _nome_item = object_get_name(item);
	final_price = variable_struct_get(price, _nome_item);	
}

var _nome_sprite = object_get_name(item);
sprite_item = variable_struct_get(sprites, _nome_sprite);


if (place_meeting(x, y, obj_player)) and comprou == false{
	if (global.engrenagens >= final_price){
		comprou = true;
		global.engrenagens -= final_price;
		instance_create_layer(x, y,"Items", item);
		instance_destroy(self);
	}
}