show_debug_message(string("You get a 3 star"));
	global.characters[3] = global.characters[3] + 1;

	show_debug_message(string("You get the girl"));
	
	instance_create_layer(960, 590, "Instances", obj_thegirl_result);