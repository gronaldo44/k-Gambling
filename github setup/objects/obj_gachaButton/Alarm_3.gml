show_debug_message(string("You get a 2 star"));

global.gachaPulled += 1;

result_2 = floor(random_range(0, 2 + 1));

if(result_2 == 0)
{
	global.setCharacter("Chip guy", 1);

	show_debug_message(string("You get a chipguy"));
	
	instance_create_layer(960, 590, "Instances", obj_clipguy_result);
}

if(result_2 == 1)
{
	global.setCharacter("Cool chip guy", 1);

	show_debug_message(string("You get a cool chipguy"));
	
	instance_create_layer(960, 590, "Instances", obj_coolclipguy_result);
}

if(result_2 == 2)
{
	global.setCharacter("Cow man", 1);

	show_debug_message(string("You get a cowman"));
	
	instance_create_layer(960, 590, "Instances", obj_cowman_result);
}