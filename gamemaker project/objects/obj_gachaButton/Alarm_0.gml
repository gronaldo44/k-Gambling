if(global.token >= drawCost)
{
// reset anim
	if(instance_exists(obj_anim_3star))
	{
		instance_destroy(obj_anim_3star);
	}
	
	if(instance_exists(obj_anim_4star))
	{
		instance_destroy(obj_anim_4star);
	}
	
	if(instance_exists(obj_anim_5star))
	{
		instance_destroy(obj_anim_5star);
	}
	
	if(instance_exists(obj_gacha_result))
	{
		instance_destroy(obj_gacha_result);
	}
	
	global.token += -drawCost;
    isPulling = true;

//animation of slot machine
	sprite_index = spr_slotmachine;
	image_index = 1;
	alarm_set(4, 10);

	result = floor(random_range(1, 100 + 1));

	show_debug_message(string(result));

//player get a 3 star
	if(result <= 80)
{
	instance_create_layer(x + 0, y + 0, "Gacha", obj_anim_3star);
}
//player get a 5 star
	else
{
	if(result > 95)
{
	instance_create_layer(x + 0, y + 0, "Gacha", obj_anim_5star);
}
//player get a 4 star	
		else
{
	instance_create_layer(x + 0, y + 0, "Gacha", obj_anim_4star);
}
}
}