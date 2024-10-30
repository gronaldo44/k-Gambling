roomType = ROOM_TYPE.LOCKED;
image_index = roomType;
room_index = -1;	// changed to positive in grid_manager creation
room_level = 1;
room_exp_earned = 0;
room_tokens_earned = 0;
room_tokens_lost = 0;
room_tokens_wagered = 0;
// character = "";


OnBarUpdate = function()
{
	global.token += 6;	
	global.profit_tokens += 6;
	global.profit_tokens_earned += 6;
	room_tokens_earned += 6;
	
	global.gain_exp(5);
	room_exp_earned += 5;
}
BarTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate, [], -1);

OnBlackjackUpdate = function()
{
	var wager = 20;
	var winrate = 52;
	
	// Generate a random outcome: assume house wins 52% of the time for simulation
    var houseWins = irandom_range(1, 100) <= winrate; // 52% chance for house to win
	
	// wager = get_char_ability_wager(wager, character);
	// winrate = get_char_ability_wr(winrate, character);
	room_tokens_wagered += wager;
	global.profit_tokens_wager += wager;

    if (houseWins) {
		// gain_tokens(wager, character)
        global.token += wager; // House wins, increase tokens
		global.profit_tokens += wager;
		global.profit_tokens_earned += wager;
		room_tokens_earned += wager;
        show_debug_message("House wins! Tokens increased by 20.");
    } else {
		// lose_tokens(wager, character)
        global.token -= wager; // House loses, decrease tokens
		global.profit_tokens -= wager;
		global.profit_tokens_lost += wager;
		room_tokens_lost += wager;
        show_debug_message("House loses! Tokens decreased by 20.");
    }

	var exp_per_update = 15;
    global.gain_exp(exp_per_update);
	room_exp_earned += exp_per_update;
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

get_room_stats = function(){
		switch (roomType) {
		case ROOM_TYPE.OPEN:
			// nothing for now
			break;
		
		case ROOM_TYPE.BAR:
			return("Tokens Earned: " + string(room_tokens_earned) + 
				"\nExperience Gained: " + string(room_exp_earned));
		
		case ROOM_TYPE.LOBBY:
			return("Net Tokens Profit: " + string(global.profit_tokens) +
				"\nTotal Experience Gained: " + string(global.profit_exp) +
				"\n\nTotal Tokens Earned: " + string(global.profit_tokens_earned) +
				"\nTotal Tokens Lost: " + string(global.profit_tokens_lost) +
				"\nTotal Tokens Wagered: " + string(global.profit_tokens_wager));
		
		case ROOM_TYPE.BLACKJACK:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 52%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
		
		default:
			return("Not yet implemented.");
	}
}