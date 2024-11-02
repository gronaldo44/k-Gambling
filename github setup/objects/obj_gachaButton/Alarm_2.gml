show_debug_message(string("You get a 3 star"));
	
	global.setCharacter("The girl", 1);

	show_debug_message(string("You get the girl"));
	
	instance_create_layer(960, 590, "Instances", obj_thegirl_result);