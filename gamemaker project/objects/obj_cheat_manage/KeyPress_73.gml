if(instance_exists(obj_charaManage)){
	ds_map_replace(global.characters, CHARACTER.CHIP_GUY, ds_map_find_value(global.characters,CHARACTER.CHIP_GUY) + 1);
}