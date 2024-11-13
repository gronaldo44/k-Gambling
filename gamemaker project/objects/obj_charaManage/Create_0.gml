//global.characters = [0, 0, 0, 0];
//global.charactersName = ["Chip guy", "Cool Chip Guy", "Cow man", "The Girl"];
enum CHARACTER {
	CHIP_GUY = 0,
	COOL_CHIP_GUY = 1,
	COW_MAN = 2,
	THE_GIRL = 3,
	SLOTSY = 4,
	CARBERT = 5
}



global.characters = ds_map_create();
ds_map_add(global.characters, CHARACTER.CHIP_GUY, 0);
ds_map_add(global.characters, CHARACTER.COOL_CHIP_GUY, 0);
ds_map_add(global.characters, CHARACTER.COW_MAN, 0);
ds_map_add(global.characters, CHARACTER.THE_GIRL, 0);
ds_map_add(global.characters, CHARACTER.SLOTSY, 0);
ds_map_add(global.characters, CHARACTER.CARBERT, 0);

//ds_map_replace(characters, "The girl", 1);

//set the number of the character relative
global.char_setCharacter = function(c, _num)
{
	var count = ds_map_find_value(global.characters, c) + _num;
	ds_map_replace(global.characters, c, count);
}

global.char_getValue = function(c){
	return ds_map_find_value(global.characters, c);
}

global.char_getLength = function(){
	return ds_map_size(global.characters);
}

global.char_getCharacterName = function(c)
{
	if(num = 0){return "Chippy"}
	if(num = 1){return "Chipper"}
	if(num = 2){return "Cowman"}
	if(num = 3){return "Yuki"}
	if(num = 4){return "Slotsy"}
	if(num = 5){return "Carbert"}
}

