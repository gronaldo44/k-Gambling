//get mouse location
up_key = keyboard_check_pressed(mouse_wheel_down());
down_key = keyboard_check_pressed(mouse_wheel_up());
accept_key = mouse_check_button_pressed(mb_right);
close = keyboard_check_pressed(vk_escape);

//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

if(close){
	visible = false;
	global.uiopen = false;
}

//selecting the room
if(accept_key){
	switch(pos){
		case 0:
			//spawn in bar room
			if (try_spend_tokens(75)){
				global.set_roomtype(room_loc, ROOM_TYPE.BAR)
				global.uiopen = false;
			}
			break;
		
		case 1:
			//spawn in black jack room
			if (try_spend_tokens(125)){
				global.set_roomtype(room_loc, ROOM_TYPE.BLACKJACK)
				global.uiopen = false;
			}
			break;
		case 2:
			//spawn in baccarat room
			if (try_spend_tokens(180)){
				global.set_roomtype(room_loc, ROOM_TYPE.BACCARAT)
				global.uiopen = false;
			}
			break;
		case 3:
			//spawn in craps room
			//if (try_spend_tokens(250)){
			//	global.set_roomtype(room_loc, ROOM_TYPE.BACCARAT)
			//	global.uiopen = false;
			//}
			//break;
		case 4:
			//spawn in poker room
			if (try_spend_tokens(350)){
				global.set_roomtype(room_loc, ROOM_TYPE.POKER)
				global.uiopen = false;
			}
			break;
		case 5:
			//spawn in roulette room
			if (try_spend_tokens(475)){
				global.set_roomtype(room_loc, ROOM_TYPE.ROULETTE)
				global.uiopen = false;
			}
			break;
		case 6:
			//spawn in pachinko room
			if (try_spend_tokens(580)){
				global.set_roomtype(room_loc, ROOM_TYPE.PACHINKO)
				global.uiopen = false;
			}
			break;
		case 7:
			//spawn in Slots room
			if (try_spend_tokens(700)){
				global.set_roomtype(room_loc, ROOM_TYPE.SLOTS)
				global.uiopen = false;
			}
			break;
	}
}