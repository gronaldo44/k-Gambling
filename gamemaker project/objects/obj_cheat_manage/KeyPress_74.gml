if(instance_exists(obj_charaManage)){
ds_map_replace(global.characters, CHARACTER.SLOTSY, ds_map_find_value(global.characters,CHARACTER.SLOTSY) + 1);
}