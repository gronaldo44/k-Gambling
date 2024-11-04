show_debug_message(string("You get a 2 star"));

global.gachaPulled += 1;

result_2 = floor(random_range(0, 2 + 1));

if(result_2 == 0)
{
	ds_map_replace(global.characters, "Chip guy", ds_map_find_value(global.characters,"Chip guy") + 1);

	show_debug_message(string("You get a chipguy"));
	
	instance_create_layer(960, 590, "Instances", obj_clipguy_result);
}

if(result_2 == 1)
{
	ds_map_replace(global.characters, "Cool chip guy", ds_map_find_value(global.characters,"Cool chip guy") + 1);

	show_debug_message(string("You get a cool chipguy"));
	
	instance_create_layer(960, 590, "Instances", obj_coolclipguy_result);
}

if(result_2 == 2)
{
	ds_map_replace(global.characters, "Cow man", ds_map_find_value(global.characters,"Cow man") + 1);

	show_debug_message(string("You get a cowman"));
	
	instance_create_layer(960, 590, "Instances", obj_cowman_result);
}