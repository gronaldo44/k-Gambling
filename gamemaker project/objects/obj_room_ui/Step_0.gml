//get mouse location
up_key = keyboard_check_pressed(vk_enter);
down_key = keyboard_check_pressed(vk_rshift);
//accept_key = keyboard_check_pressed(vk_space);
close = keyboard_check_pressed(vk_backspace);

//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

if(close){
	visible = false;
	global.uiopen = false;
}

//selecting the room
//if(accept_key){
	//visible = false;
	//switch(pos){
		//case 0:
			//Display tips
			
			//break;
	
		//case 1:
			//Display Weekly Report
			//break;
		
		//case 2:
			//Display Net Porfit stats
			//break;
	//}
//}