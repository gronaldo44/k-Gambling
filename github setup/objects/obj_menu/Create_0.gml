width = 750;
height = 600;

op_border = 15;
op_space = 50;

pos = 0;

count = 0;

/**
for(var i = 0; i <  array_length(global.characters); i++)
{
	if(global.characters[i] != 0){
		str = string(global.characters[i]) + "x " + global.charactersName[i];
		option[count] = str;
		count++;
	}		
}
**/

for(var key = ds_map_find_first(global.characters); key != undefined; key = ds_map_find_next(global.characters, key)){
	num = ds_map_find_value(global.characters, key) != 0
	if(num != 0){
		str = string(num) + "x " + string(key);
		option[count] = str;
		count++;
	}
}

if(count <= 0){
	option[0] = "You have no Characters";
}

op_length = array_length(option);

