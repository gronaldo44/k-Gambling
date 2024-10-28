roomType = ROOM_TYPE.LOCKED;
image_index = roomType;
room_index = -1;	// changed to positive in grid_manager creation

OnBarUpdate = function()
{
	global.token += 6;	
	global.gain_exp(5);
}
BarTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate, [], -1);

OnBlackjackUpdate = function()
{
	// Generate a random outcome: assume house wins 52% of the time for simulation
    var houseWins = irandom_range(1, 100) <= 52; // 52% chance for house to win

    if (houseWins) {
        global.token += 20; // House wins, increase tokens
        show_debug_message("House wins! Tokens increased by 20.");
    } else {
        global.token -= 20; // House loses, decrease tokens
        show_debug_message("House loses! Tokens decreased by 20.");
    }

    global.gain_exp(15);
}
BlackjackTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnBlackjackUpdate, [], -1);

start_room = function() {
	switch (roomType) {
		case ROOM_TYPE.OPEN:
			// nothing for now
			break;
		
		case ROOM_TYPE.BAR:
			// start making money
			show_debug_message("Starting BAR room " + string(room_index));
			time_source_start(BarTimer);
			break;
		
		case ROOM_TYPE.LOBBY:
			global.gain_exp(0);
			// display_tips_ui(room_index);
			break;
		
		case ROOM_TYPE.BLACKJACK:
			// display_room_ui(room_index, roomType);
			show_debug_message("Starting BLACKJACK room " + string(room_index));
			time_source_start(BlackjackTimer);
			break;
	}
}

stop_room = function() {
		switch (roomType) {
		case ROOM_TYPE.OPEN:
			// nothing for now
			break;
		
		case ROOM_TYPE.BAR:
			// start making money
			show_debug_message("Pausing BAR room " + string(room_index));
			time_source_pause(BarTimer);
			break;
		
		case ROOM_TYPE.LOBBY:
			// display_tips_ui(room_index);
			break;
		
		case ROOM_TYPE.BLACKJACK:
			// display_room_ui(room_index, roomType);
			show_debug_message("Pausing BLACKJACK room " + string(room_index));
			time_source_pause(BlackjackTimer);
			break;
	}
}