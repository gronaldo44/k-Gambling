if(instance_exists(obj_charaManage)){
ds_map_replace(global.characters, CHARACTER.COOL_CHIP_GUY, ds_map_find_value(global.characters,CHARACTER.COOL_CHIP_GUY) + 1);
}