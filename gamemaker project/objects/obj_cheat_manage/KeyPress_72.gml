if(instance_exists(obj_charaManage)){
	ds_map_replace(global.characters, CHARACTER.THE_GIRL, ds_map_find_value(global.characters, CHARACTER.THE_GIRL) + 1);
}
