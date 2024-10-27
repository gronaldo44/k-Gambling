//get mouse location
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//move through the rooms
pos += up_key - down_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

//selecting the room
if(accept_key){
	switch(pos){
		case 0:
			//spawn in front desk
			global.token -= 75;
			global.purchase_room(room_loc, ROOM_TYPE.LOBBY)
			break;
	
		case 1:
			//spawn in bar room
		
			break;
		
		case 2:
			//spawn in black jack room
		
			break;
	}
}