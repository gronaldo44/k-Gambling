//get mouse location
up_key = keyboard_check_pressed(mouse_wheel_down());
down_key = keyboard_check_pressed(mouse_wheel_up());
accept_key = mouse_check_button_pressed(mb_left);
close = keyboard_check_pressed(vk_escape);

if (visible && !allow_accept) {
    allow_accept = true; // Enable accept after the UI has been visible for a frame
}

if (visible && !is_opened) {
    is_opened = true;       // Mark as opened
    allow_accept = false;    // Disable immediate purchases
	
}


//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

if(close){
	visible = false;
	global.uiopen = false;
	global.start_casino();
	pos = 0;               // Reset hover position to the first option
    allow_accept = false;  // Prevent immediate clicks on reopening
    is_opened = false;  
}


//selecting the room
if(accept_key && visible && allow_accept && is_opened){
	switch(pos){
		case 0:
			//spawn in bar room
			if (try_spend_tokens(75)){
				global.set_roomtype(room_loc, ROOM_TYPE.BAR)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
		
		case 1:
			//spawn in black jack room
			if (try_spend_tokens(125)){
				global.set_roomtype(room_loc, ROOM_TYPE.BLACKJACK)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			case 2:
			//spawn in CRAPS room
			if (try_spend_tokens(180)){
				global.set_roomtype(room_loc, ROOM_TYPE.CRAPS)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			case 3:
			//spawn in baccarat room
			if (try_spend_tokens(250)){
				global.set_roomtype(room_loc, ROOM_TYPE.BACCARAT)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			
			case 4:
			//spawn in POKER room
			if (try_spend_tokens(350)){
				global.set_roomtype(room_loc, ROOM_TYPE.POKER)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			case 5:
			//spawn in ROULETTE room
			if (try_spend_tokens(475)){
				global.set_roomtype(room_loc, ROOM_TYPE.ROULETTE)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			case 6:
			//spawn in PACHINKO room
			if (try_spend_tokens(580)){
				global.set_roomtype(room_loc, ROOM_TYPE.PACHINKO)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			case 7:
			//spawn in SLOTS room
			if (try_spend_tokens(700)){
				global.set_roomtype(room_loc, ROOM_TYPE.SLOTS)
				global.uiopen = false;
				visible = false;
                allow_accept = false;
				is_opened = false;
			}
			break;
			
			
	}
}