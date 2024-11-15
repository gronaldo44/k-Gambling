if(global.is_gacha == true){
	alarm_set(0, 10);
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
}
