show_debug_message(string("You get a 4 star"));

global.gachaPulled += 1;



result_2 = floor(random_range(0, 3 + 1));

if(result_2 == 0)
{
	ds_map_replace(global.characters, CHARACTER.CHIP_GUY, ds_map_find_value(global.characters,CHARACTER.CHIP_GUY) + 1);

	show_debug_message(string("You get a chipguy"));
	
	display_result(2);
}

if(result_2 == 1)
{
	ds_map_replace(global.characters, CHARACTER.COOL_CHIP_GUY, ds_map_find_value(global.characters,CHARACTER.COOL_CHIP_GUY) + 1);

	show_debug_message(string("You get a cool chipguy"));
	
	display_result(3);
}

if(result_2 == 2)
{
	ds_map_replace(global.characters, CHARACTER.SLOTSY, ds_map_find_value(global.characters,CHARACTER.SLOTSY) + 1);

	show_debug_message(string("You get a slotsy"));
	
	display_result(6);
}

if(result_2 == 3)
{
	ds_map_replace(global.characters, CHARACTER.CARBERT, ds_map_find_value(global.characters,CHARACTER.CARBERT) + 1);

	show_debug_message(string("You get a carbert"));
	
	display_result(7);
}