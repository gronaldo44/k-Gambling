if(instance_exists(obj_charaManage)){
ds_map_replace(global.characters, CHARACTER.BENJY, ds_map_find_value(global.characters,CHARACTER.BENJY) + 1);
}