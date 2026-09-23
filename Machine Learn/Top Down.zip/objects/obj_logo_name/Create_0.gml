y_inicial = y;
tempo = 0;

var _hat = instance_create_layer(x - 10, y, "Instances_room", obj_logo_hat);
_hat.depth = depth + 1;

var _bg = instance_create_layer(x, y, "Instances_room", obj_logo_bg);
_bg.depth = depth + 5;