roomType = ROOM_TYPE.LOCKED;
image_index = roomType;
room_index = -1; // Changed to positive in grid_manager creation
room_level = 1;
room_exp_earned = 0;
room_tokens_earned = 0;
room_tokens_lost = 0;
room_tokens_wagered = 0;
room_character = -1;

// Room-specific variables
room_bad_beat_pool = 0;        // Poker-specific Bad Beat Pool
room_bad_beat_losses = 0;      // Poker-specific Bad Beat Losses
room_baccarat_tie_pot = 0;     // Baccarat-specific Tie Pot
room_baccarat_tie_pot_threshold = 500; // Threshold for Tie Pot Jackpot

// --- Bar Room ---
OnBarUpdate = function() {
    global.gain_tokens(6, room_character);
    room_tokens_earned += 6;
    global.gain_exp(5);
    room_exp_earned += 5;
};
BarTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate, [], -1);

// --- Blackjack Room ---
OnBlackjackUpdate = function() {
    var base_wager = 22;
    var base_win_amount = base_wager;
    var base_lose_amount = 20;
    var base_winrate = 52;

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Blackjack! " + string(room_index));
    } else {
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;
        show_debug_message("House loses in Blackjack! " + string(room_index));
    }

    global.gain_exp(15);
    room_exp_earned += 15;
};
BlackjackTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnBlackjackUpdate, [], -1);

// --- Craps Room ---
OnCrapsUpdate = function() {
    var base_wager = 50;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 54;

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Craps! " + string(room_index));
    } else {
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;
        show_debug_message("House loses in Craps! " + string(room_index));
    }

    global.gain_exp(35);
    room_exp_earned += 35;
};
CrapsTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnCrapsUpdate, [], -1);

// --- Baccarat Room ---
OnBaccaratUpdate = function() {
    var base_wager = 90;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 56;
    var tie_chance_on_loss = 15; // 15% chance for a tie on loss

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var outcome = irandom_range(1, 100);

    if (outcome <= adjusted_winrate) {
        // House wins
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;

        // Add to the tie pot (from house win wager)
        room_baccarat_tie_pot += adjusted_wager * 0.1; // 10% of wager
        show_debug_message("House wins in Baccarat! Tie Pot: " + string(room_baccarat_tie_pot));
    } else {
        // House loses
        var tie_roll = irandom_range(1, 100);
        if (tie_roll <= tie_chance_on_loss) {
            // Loss converted to tie
            room_baccarat_tie_pot += adjusted_wager * 0.05; // 5% of wager
            show_debug_message("It's a tie in Baccarat! Tie Pot: " + string(room_baccarat_tie_pot));
        } else {
            // Regular loss
            global.gain_tokens(-adjusted_lose_amount, room_character);
            room_tokens_lost += adjusted_lose_amount;
            show_debug_message("House loses in Baccarat! " + string(room_index));
        }
    }

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    // Check for Tie Pot Jackpot
    if (room_baccarat_tie_pot >= room_baccarat_tie_pot_threshold) {
        // Trigger jackpot payout
        global.gain_tokens(room_baccarat_tie_pot, room_character);
        room_tokens_earned += room_baccarat_tie_pot;

        // Reset the Tie Pot
        room_baccarat_tie_pot = 0;
        show_debug_message("Baccarat Tie Pot Jackpot Triggered! Room: " + string(room_index));
    }
};
BaccaratTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnBaccaratUpdate, [], -1);

// --- Poker Room ---
OnPokerUpdate = function() {
    var base_wager = 150;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 58;

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Poker!");
    } else {
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;

        room_bad_beat_pool += adjusted_wager * 0.1;
        room_bad_beat_losses += 1;

        if (room_bad_beat_losses >= 5) {
            global.gain_tokens(room_bad_beat_pool, room_character);
            room_tokens_earned += room_bad_beat_pool;

            room_bad_beat_pool = 0;
            room_bad_beat_losses = 0;
            show_debug_message("Poker Bad Beat Jackpot Triggered!");
        }
    }
};
PokerTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnPokerUpdate, [], -1);


// --- Roulette Room ---
OnRouletteUpdate = function() {
    var base_wager = 200;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 62;

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Roulette! " + string(room_index));
    } else {
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;
        show_debug_message("House loses in Roulette! " + string(room_index));
    }

    global.gain_exp(50);
    room_exp_earned += 50;
};
RouletteTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnRouletteUpdate, [], -1);

// --- Pachinko Room ---
OnPachinkoUpdate = function() {
    var base_wager = 300;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 66;

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Pachinko! " + string(room_index));
    } else {
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;
        show_debug_message("House loses in Pachinko! " + string(room_index));
    }

    global.gain_exp(50);
    room_exp_earned += 50;
};
PachinkoTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnPachinkoUpdate, [], -1);

// --- Slots Room ---
OnSlotsUpdate = function() {
    var base_wager = 400;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 72;

    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Slots! " + string(room_index));
    } else {
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;
        show_debug_message("House loses in Slots! " + string(room_index));
    }

    global.gain_exp(50);
    room_exp_earned += 50;
};
SlotsTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnSlotsUpdate, [], -1);

// --- Start and Stop Functions ---
start_room = function() {
    switch (roomType) {
        case ROOM_TYPE.BAR: time_source_start(BarTimer); break;
        case ROOM_TYPE.BLACKJACK: time_source_start(BlackjackTimer); break;
        case ROOM_TYPE.CRAPS: time_source_start(CrapsTimer); break;
        case ROOM_TYPE.BACCARAT: time_source_start(BaccaratTimer); break;
        case ROOM_TYPE.POKER: time_source_start(PokerTimer); break;
        case ROOM_TYPE.ROULETTE: time_source_start(RouletteTimer); break;
        case ROOM_TYPE.PACHINKO: time_source_start(PachinkoTimer); break;
        case ROOM_TYPE.SLOTS: time_source_start(SlotsTimer); break;
        default: show_debug_message("StartRoom not implemented for " + string(roomType));
    }
};

stop_room = function() {
    switch (roomType) {
        case ROOM_TYPE.BAR: time_source_pause(BarTimer); break;
        case ROOM_TYPE.BLACKJACK: time_source_pause(BlackjackTimer); break;
        case ROOM_TYPE.CRAPS: time_source_pause(CrapsTimer); break;
        case ROOM_TYPE.BACCARAT: time_source_pause(BaccaratTimer); break;
        case ROOM_TYPE.POKER: time_source_pause(PokerTimer); break;
        case ROOM_TYPE.ROULETTE: time_source_pause(RouletteTimer); break;
        case ROOM_TYPE.PACHINKO: time_source_pause(PachinkoTimer); break;
        case ROOM_TYPE.SLOTS: time_source_pause(SlotsTimer); break;
        default: show_debug_message("StopRoom not implemented for " + string(roomType));
    }
};

get_room_stats = function() {
    var base_wager = 0; // Default base wager
    var base_winrate = 0; // Default base win rate
    var wager_bonus = 0; // Bonus to wager from character
    var winrate_bonus = 0; // Bonus to win rate from character
    var base_lose_amount = 0;
    var loss_reduction = 0;
    var adjusted_wager = 0;
    var adjusted_winrate = 0;
    var adjusted_lose_amount = 0;


    // Get character abilities
    if (room_character >= 0) {
        wager_bonus = get_character_ability(room_character, "wager_bonus");
        winrate_bonus = get_character_ability(room_character, "win_rate");
		loss_reduction = get_character_ability(room_character, "loss_reduction");
    }

    // Adjusted values
    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;
	
	
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
            base_wager = 22;
            base_winrate = 52;
            base_lose_amount = 20;

            var adjusted_wager = base_wager * (1 + wager_bonus / 100);
            var adjusted_winrate = base_winrate + winrate_bonus;
            var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

            return "Tokens Earned: " + string(room_tokens_earned) +
                   "\nTokens Lost: " + string(room_tokens_lost) +
                   "\nTokens Wagered: " + string(room_tokens_wagered) +
                   "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
                   "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
                   "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
                   "\n\nExperience Gained: " + string(room_exp_earned) +
                   "\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		case ROOM_TYPE.CRAPS:
            base_wager = 50;
            base_winrate = 54;
            base_lose_amount = 50;

            var adjusted_wager = base_wager * (1 + wager_bonus / 100);
            var adjusted_winrate = base_winrate + winrate_bonus;
            var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

            return "Tokens Earned: " + string(room_tokens_earned) +
                   "\nTokens Lost: " + string(room_tokens_lost) +
                   "\nTokens Wagered: " + string(room_tokens_wagered) +
                   "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
                   "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
                   "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
                   "\n\nExperience Gained: " + string(room_exp_earned) +
                   "\nProfit: " + string(room_tokens_earned - room_tokens_lost);
				 
	case ROOM_TYPE.BACCARAT:
    base_wager = 90;
    base_winrate = 56;
    base_lose_amount = 90;

    adjusted_wager = base_wager * (1 + wager_bonus / 100);
    adjusted_winrate = base_winrate + winrate_bonus;
    adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

    return "Tokens Earned: " + string(room_tokens_earned) +
           "\nTokens Lost: " + string(room_tokens_lost) +
           "\nTokens Wagered: " + string(room_tokens_wagered) +
           "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
           "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
           "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
           "\nBaccarat Tie Pot: " + string(room_baccarat_tie_pot) +
           "\nTie Pot Threshold: " + string(room_baccarat_tie_pot_threshold) +
           "\n\nExperience Gained: " + string(room_exp_earned) +
           "\nProfit: " + string(room_tokens_earned - room_tokens_lost);


       case ROOM_TYPE.POKER:
		base_wager = 150;
		base_winrate = 58;
		base_lose_amount = 150;

    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

    return "Tokens Earned: " + string(room_tokens_earned) +
           "\nTokens Lost: " + string(room_tokens_lost) +
           "\nTokens Wagered: " + string(room_tokens_wagered) +
           "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
           "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
           "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
           "\n\nBad Beat Pool: " + string(room_bad_beat_pool) +
           "\nBad Beat Losses: " + string(room_bad_beat_losses) +
           "\nBad Beat Jackpot at 5 losses!" +
           "\n\nExperience Gained: " + string(room_exp_earned) +
           "\nProfit: " + string(room_tokens_earned - room_tokens_lost);

        case ROOM_TYPE.ROULETTE:
            base_wager = 200;
            base_winrate = 62;
			base_lose_amount = 200;
			
            var adjusted_wager = base_wager * (1 + wager_bonus / 100);
            var adjusted_winrate = base_winrate + winrate_bonus;
            return "Tokens Earned: " + string(room_tokens_earned) +
                   "\nTokens Lost: " + string(room_tokens_lost) +
                   "\nTokens Wagered: " + string(room_tokens_wagered) +
                   "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
                   "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
				    "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
                   "\n\nExperience Gained: " + string(room_exp_earned) +
                   "\nProfit: " + string(room_tokens_earned - room_tokens_lost);

        case ROOM_TYPE.PACHINKO:
            base_wager = 300;
            base_winrate = 66;
			base_lose_amount = 300;
			
            var adjusted_wager = base_wager * (1 + wager_bonus / 100);
            var adjusted_winrate = base_winrate + winrate_bonus;
            return "Tokens Earned: " + string(room_tokens_earned) +
                   "\nTokens Lost: " + string(room_tokens_lost) +
                   "\nTokens Wagered: " + string(room_tokens_wagered) +
                   "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
                   "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
				    "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
                   "\n\nExperience Gained: " + string(room_exp_earned) +
                   "\nProfit: " + string(room_tokens_earned - room_tokens_lost);

        case ROOM_TYPE.SLOTS:
            base_wager = 400;
            base_winrate = 72;
			base_lose_amount = 400;
			
            var adjusted_wager = base_wager * (1 + wager_bonus / 100);
            var adjusted_winrate = base_winrate + winrate_bonus;
            return "Tokens Earned: " + string(room_tokens_earned) +
                   "\nTokens Lost: " + string(room_tokens_lost) +
                   "\nTokens Wagered: " + string(room_tokens_wagered) +
                   "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
                   "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
				    "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
                   "\n\nExperience Gained: " + string(room_exp_earned) +
                   "\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		
		default:
            return "Get_Room_Stats() Not yet implemented.";
    }
};

function get_character_ability(character_id, ability_type) {
    switch (character_id) {
        case CHARACTER.CHIP_GUY:
            if (ability_type == "wager_bonus") return 10;  // +10% to wagers
            break;

        case CHARACTER.COOL_CHIP_GUY:
            if (ability_type == "win_rate") return 2;      // +2% win rate
            break;

        case CHARACTER.COW_MAN:
            if (ability_type == "wager_bonus") return 100; // +100% to wagers
            break;

        case CHARACTER.THE_GIRL:
            if (ability_type == "loss_reduction") return 50; // 50% reduction
            break;

        default:
            return 0; // Default to no effect
    }
    return 0; // Default return for undefined ability_type
}

room_character = -1;          // No character assigned initially
room_character_sprite = noone; // No sprite assigned initially

daily_update = function()
{

}

