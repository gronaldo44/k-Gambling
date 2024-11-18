roomType = ROOM_TYPE.LOCKED;
image_index = roomType;
room_index = -1;	// changed to positive in grid_manager creation
room_level = 1;
room_exp_earned = 0;
room_tokens_earned = 0;
room_tokens_lost = 0;
room_tokens_wagered = 0;
room_character = -1;

// TODO upgrade room stats

// Bar OnUpdate
OnBarUpdate = function()
{
	global.gain_tokens(6, room_character);
	room_tokens_earned += 6;
	
	global.gain_exp(5);
	room_exp_earned += 5;
}
BarTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate, [], -1);

// Blackjack OnUpdate
OnBlackjackUpdate = function()
{
	var wager = 20;
	var winrate = 52;
	wager = get_char_ability_wager(wager);
	winrate = get_char_ability_wr(winrate);
	
    var houseWins = irandom_range(1, 100) <= winrate;
	
	room_tokens_wagered += wager;
	global.profit_tokens_wager += wager;

    if (houseWins) {
		global.gain_tokens(wager, room_character);
		room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
		// lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
		room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

	var exp_per_update = 15;
    global.gain_exp(exp_per_update);
	room_exp_earned += exp_per_update;
}
BlackjackTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnBlackjackUpdate, [], -1)

OnCrapsUpdate = function()
{
    var wager = 50;
    var winrate = 54;
    wager = get_char_ability_wager(wager);
    winrate = get_char_ability_wr(winrate);

    var houseWins = irandom_range(1, 100) <= winrate;

    room_tokens_wagered += wager;
    global.profit_tokens_wager += wager;

    if (houseWins) {
        global.gain_tokens(wager, room_character);
        room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
        // lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
        room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

    var exp_per_update = 35;
    global.gain_exp(exp_per_update);
    room_exp_earned += exp_per_update;
}
CrapsTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnCrapsUpdate, [], -1);


OnBaccaratUpdate = function()
{
    var wager = 90;
    var winrate = 56;
    wager = get_char_ability_wager(wager);
    winrate = get_char_ability_wr(winrate);

    var houseWins = irandom_range(1, 100) <= winrate;

    room_tokens_wagered += wager;
    global.profit_tokens_wager += wager;

    if (houseWins) {
        global.gain_tokens(wager, room_character);
        room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
        // lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
        room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

    var exp_per_update = 35;
    global.gain_exp(exp_per_update);
    room_exp_earned += exp_per_update;
}
BaccaratTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnBaccaratUpdate, [], -1);

OnPokerUpdate = function()
{
    var wager = 150;
    var winrate = 58;
    wager = get_char_ability_wager(wager);
    winrate = get_char_ability_wr(winrate);

    var houseWins = irandom_range(1, 100) <= winrate;

    room_tokens_wagered += wager;
    global.profit_tokens_wager += wager;

    if (houseWins) {
        global.gain_tokens(wager, room_character);
        room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
        // lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
        room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

    var exp_per_update = 50;
    global.gain_exp(exp_per_update);
    room_exp_earned += exp_per_update;
}
PokerTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnPokerUpdate, [], -1);

OnRouletteUpdate = function()
{
    var wager = 200;
    var winrate = 62;
    wager = get_char_ability_wager(wager);
    winrate = get_char_ability_wr(winrate);

    var houseWins = irandom_range(1, 100) <= winrate;

    room_tokens_wagered += wager;
    global.profit_tokens_wager += wager;

    if (houseWins) {
        global.gain_tokens(wager, room_character);
        room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
        // lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
        room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

    var exp_per_update = 50;
    global.gain_exp(exp_per_update);
    room_exp_earned += exp_per_update;
}
RouletteTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnRouletteUpdate, [], -1);

OnPachinkoUpdate = function()
{
    var wager = 300;
    var winrate = 66;
    wager = get_char_ability_wager(wager);
    winrate = get_char_ability_wr(winrate);

    var houseWins = irandom_range(1, 100) <= winrate;

    room_tokens_wagered += wager;
    global.profit_tokens_wager += wager;

    if (houseWins) {
        global.gain_tokens(wager, room_character);
        room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
        // lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
        room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

    var exp_per_update = 50;
    global.gain_exp(exp_per_update);
    room_exp_earned += exp_per_update;
}
PachinkoTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnPachinkoUpdate, [], -1);

OnSlotsUpdate = function()
{
    var wager = 400;
    var winrate = 72;
    wager = get_char_ability_wager(wager);
    winrate = get_char_ability_wr(winrate);

    var houseWins = irandom_range(1, 100) <= winrate;

    room_tokens_wagered += wager;
    global.profit_tokens_wager += wager;

    if (houseWins) {
        global.gain_tokens(wager, room_character);
        room_tokens_earned += wager;
        show_debug_message("House wins! " + string(room_index));
    } else {
        // lose_tokens(wager, character)
        global.gain_tokens(-wager, room_character);
        room_tokens_lost += wager;
        show_debug_message("House loses! " + string(room_index));
    }

    var exp_per_update = 50;
    global.gain_exp(exp_per_update);
    room_exp_earned += exp_per_update;
}
SlotsTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnSlotsUpdate, [], -1);

// Starts this room's OnUpdate
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
			
			case ROOM_TYPE.BACCARAT:
            show_debug_message("Starting BACCARAT room " + string(room_index));
            time_source_start(BaccaratTimer);
            break;
			
			case ROOM_TYPE.POKER:
            show_debug_message("Starting POKER room " + string(room_index));
            time_source_start(PokerTimer);
            break;
			
			case ROOM_TYPE.ROULETTE:
            show_debug_message("Starting POKER room " + string(room_index));
            time_source_start(RouletteTimer);
            break;
			
			case ROOM_TYPE.PACHINKO:
            show_debug_message("Starting PACHINKO room " + string(room_index));
            time_source_start(PachinkoTimer);
            break;
			
			case ROOM_TYPE.SLOTS:
            show_debug_message("Starting SLOTS room " + string(room_index));
            time_source_start(SlotsTimer);
            break;
			
			case ROOM_TYPE.CRAPS:
            show_debug_message("Starting CRAPS room " + string(room_index));
            time_source_start(CrapsTimer);
            break;
			
		default:
			show_debug_message("StartRoom() not implemented yet " + string(room_index));
			break;
	}
}

// Stops this room's OnUpdate
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
			
			case ROOM_TYPE.BACCARAT:
            show_debug_message("Pausing BACCARAT room " + string(room_index));
            time_source_pause(BaccaratTimer);
            break;
			
			case ROOM_TYPE.POKER:
            show_debug_message("Pausing POKER room " + string(room_index));
            time_source_pause(PokerTimer);
            break;
			
			case ROOM_TYPE.ROULETTE:
            show_debug_message("Pausing ROULETTE room " + string(room_index));
            time_source_pause(RouletteTimer);
            break;
			
			case ROOM_TYPE.PACHINKO:
            show_debug_message("Pausing PACHINKO room " + string(room_index));
            time_source_pause(PachinkoTimer);
            break;
			
			case ROOM_TYPE.SLOTS:
            show_debug_message("Pausing SLOTS room " + string(room_index));
            time_source_pause(SlotsTimer);
            break;
			
			case ROOM_TYPE.CRAPS:
            show_debug_message("Pausing PACHINKO room " + string(room_index));
            time_source_pause(CrapsTimer);
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
				
				
		case ROOM_TYPE.BACCARAT:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 56%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
				
				case ROOM_TYPE.POKER:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 58%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
				
				case ROOM_TYPE.ROULETTE:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 62%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
				
					case ROOM_TYPE.PACHINKO:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 66%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
				
				case ROOM_TYPE.SLOTS:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 70%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
				
				case ROOM_TYPE.CRAPS:
			return("Tokens Earned: " + string(room_tokens_earned) +
				"\nTokens Lost: " + string(room_tokens_lost) +
				"\nTokens Wagered: " + string(room_tokens_wagered) +
				"\nHouse Winrate: 54%" +
				"\n\nExperience Gained: " + string(room_exp_earned) +
				"\nProfit: " + string(room_tokens_earned - room_tokens_lost));
				
				 
		
		default:
			return("Get_Room_Stats() Not yet implemented.");
	}
}

get_char_ability_wager = function(wager){
	switch (room_character) {
		case CHARACTER.CHIP_GUY:
			wager = ceil(wager * 1.5);
			break;
		
		case CHARACTER.COOL_CHIP_GUY:
			wager *= 2;
			break;
		
		case CHARACTER.COW_MAN:
			wager *= 5;
			break;
		
		case CHARACTER.THE_GIRL:
			wager *= 2;
			break;
	}
	return wager;
}

get_char_ability_wr = function(wr){
	switch (room_character) {
		case CHARACTER.CHIP_GUY:
			break;
		
		case CHARACTER.COOL_CHIP_GUY:
			wr += 1;
			break;
		
		case CHARACTER.COW_MAN:
			break;
		
		case CHARACTER.THE_GIRL:
			break;
	}	
	return wr;
}

