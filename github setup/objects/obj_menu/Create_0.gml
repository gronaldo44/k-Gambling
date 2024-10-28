width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

count = 0;

for(var i = 0; i < global.characters_length; i++)
{
	if(global.characters[i] != 0){
		str = global.characterName[count] + " " + string(global.characters[count]);
		option[count] = str;
		count++;
	}		
}

op_length = array_length(option);

if(op_length <= 0){
	option[0] = "You have no Characters";
}

op_length = array_length(option);

