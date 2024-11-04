show_debug_message(string("You get a 3 star"));
	
	ds_map_replace(global.characters, "The girl", ds_map_find_value(global.characters, "The girl") + 1);

	show_debug_message(string("You get the girl"));
	
	instance_create_layer(960, 590, "Instances", obj_thegirl_result);