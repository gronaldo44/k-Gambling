show_debug_message(string("You get a 5 star"));

result_2 = floor(random_range(0, 1 + 1));


	
if(result_2 == 0)
{
	ds_map_replace(global.characters, CHARACTER.THE_GIRL, ds_map_find_value(global.characters, CHARACTER.THE_GIRL) + 1);

	show_debug_message(string("You get the girl"));
	audio_play_sound(s5star,1,false);
	
	display_result(5);
}
	
if(result_2 == 1)
{
	ds_map_replace(global.characters, CHARACTER.COW_MAN, ds_map_find_value(global.characters,CHARACTER.COW_MAN) + 1);

	show_debug_message(string("You get a cowman"));
	audio_play_sound(s5star,1,false);
	
	display_result(4);
}