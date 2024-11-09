//global.characters = [0, 0, 0, 0];
//global.charactersName = ["Chip guy", "Cool Chip Guy", "Cow man", "The Girl"];
enum CHARACTER {
	CHIP_GUY = 0,
	COOL_CHIP_GUY = 1,
	COW_MAN = 2,
	THE_GIRL = 3
}



global.characters = ds_map_create();
ds_map_add(global.characters, CHARACTER.CHIP_GUY, 0);
ds_map_add(global.characters, CHARACTER.COOL_CHIP_GUY, 0);
ds_map_add(global.characters, CHARACTER.COW_MAN, 0);
ds_map_add(global.characters, CHARACTER.THE_GIRL, 0);

//ds_map_replace(characters, "The girl", 1);

//set the number of the character relative
global.setCharacter = function(c, _num)
{
	var count = ds_map_find_value(characters, c) + _num;
	ds_map_replace(characters, c, count);
}

global.getValue = function(c){
	return ds_map_find_value(characters, c);
}

global.getLength = function(){
	return ds_map_size(characters);
}

