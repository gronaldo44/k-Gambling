//get mouse location
up_key = keyboard_check_pressed(vk_enter);
down_key = keyboard_check_pressed(vk_rshift);
accept_key = keyboard_check_pressed(vk_space);

//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

//selecting the room
if(accept_key){
	switch(pos){
		case 0:
			//spawn in front desk
			if (try_spend_tokens(75)){
				global.set_roomtype(room_loc, ROOM_TYPE.LOBBY)
			}
			break;
	
		case 1:
			//spawn in bar room
			if (try_spend_tokens(100)){
				global.set_roomtype(room_loc, ROOM_TYPE.BAR)
			}
			break;
		
		case 2:
			//spawn in black jack room
			if (try_spend_tokens(125)){
				global.set_roomtype(room_loc, ROOM_TYPE.BLACKJACK)
			}
			break;
			case 3:
			//spawn in black jack room
			if (try_spend_tokens(10)){
				global.set_roomtype(room_loc, ROOM_TYPE.BACCARAT)
			}
			break;
	}
}