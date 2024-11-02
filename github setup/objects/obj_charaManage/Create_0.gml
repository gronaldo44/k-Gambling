//global.characters = [0, 0, 0, 0];
//global.charactersName = ["Chip guy", "Cool Chip Guy", "Cow man", "The Girl"];

characters = ds_map_create();
ds_map_add(characters, "Chip guy", 0);
ds_map_add(characters, "Cool chip guy", 0);
ds_map_add(characters, "Cow man", 0);
ds_map_add(characters, "The girl", 0);

ds_map_replace(characters, "The girl", 1);

//set the number of the character relative
global.setCharacter = function(_name, _num)
{
	var count = ds_map_find_value(characters, _name) + _num;
	ds_map_replace(characters, _name, count);
}


