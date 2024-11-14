show_debug_message(string("You get a 4 star"));

global.gachaPulled += 1;

instance_create_layer(x + 0, y + 0, "Gacha", obj_anim_4star);

result_2 = floor(random_range(0, 3 + 1));

if(result_2 == 0)
{
	ds_map_replace(global.characters, CHARACTER.CHIP_GUY, ds_map_find_value(global.characters,CHARACTER.CHIP_GUY) + 1);

	show_debug_message(string("You get a chipguy"));
	
	instance_create_layer(960, 590, "Gacha", obj_clipguy_result);
}

if(result_2 == 1)
{
	ds_map_replace(global.characters, CHARACTER.COOL_CHIP_GUY, ds_map_find_value(global.characters,CHARACTER.COOL_CHIP_GUY) + 1);

	show_debug_message(string("You get a cool chipguy"));
	
	instance_create_layer(960, 590, "Gacha", obj_coolclipguy_result);
}

if(result_2 == 2)
{
	ds_map_replace(global.characters, CHARACTER.SLOTSY, ds_map_find_value(global.characters,CHARACTER.SLOTSY) + 1);

	show_debug_message(string("You get a slotsy"));
	
	instance_create_layer(960, 590, "Gacha", obj_slotsy2_result);
}

if(result_2 == 3)
{
	ds_map_replace(global.characters, CHARACTER.CARBERT, ds_map_find_value(global.characters,CHARACTER.CARBERT) + 1);

	show_debug_message(string("You get a carbert"));
	
	instance_create_layer(960, 590, "Gacha", obj_carbert_result);
}