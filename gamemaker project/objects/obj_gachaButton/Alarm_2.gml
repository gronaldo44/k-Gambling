show_debug_message(string("You get a 5 star"));

result_2 = floor(random_range(0, 1 + 1));

instance_create_layer(x + 0, y + 0, "Gacha", obj_anim_5star);
	
if(result_2 == 0)
{
	ds_map_replace(global.characters, CHARACTER.THE_GIRL, ds_map_find_value(global.characters, CHARACTER.THE_GIRL) + 1);

	show_debug_message(string("You get the girl"));
	
	instance_create_layer(960, 590, "Gacha", obj_thegirl_result);
}
	
if(result_2 == 1)
{
	ds_map_replace(global.characters, CHARACTER.COW_MAN, ds_map_find_value(global.characters,CHARACTER.COW_MAN) + 1);

	show_debug_message(string("You get a cowman"));
	
	instance_create_layer(960, 590, "Gacha", obj_cowman_result);
}