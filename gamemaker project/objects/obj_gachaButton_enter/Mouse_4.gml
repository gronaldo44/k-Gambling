if(global.level >= 1)
{
	global.stop_casino();
	layer_set_visible("Gacha", true);
	layer_set_visible("GachaBG", true);
	layer_set_visible("slotmachine", true);
	layer_set_visible("anim", true);
	global.is_gacha = true;
}