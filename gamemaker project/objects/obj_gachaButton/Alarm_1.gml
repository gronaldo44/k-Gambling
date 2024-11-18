show_debug_message(string("You get a 1 star"));

global.gachaPulled += 1;

display_result(1)

result_1 = floor(random_range(0, 2 + 1));

if(result_1 == 0)
{
	global.token += 1;

	show_debug_message(string("You get 1 token"));
}

if(result_1 == 1)
{
	global.token += 5;

	show_debug_message(string("You get 5 token"));
}

if(result_1 == 2)
{
	global.token += 10;

	show_debug_message(string("You get 10 token"));
}