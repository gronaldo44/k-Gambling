is_locked_room = true;
roomType = ROOM_TYPE.LOCKED;
image_index = roomType;
room_index = -1; // Changed to positive in grid_manager creation
room_level = 1;
room_exp_earned = 0;
room_tokens_earned = 0;
room_tokens_lost = 0;
room_tokens_wagered = 0;
room_character = -1;
room_ability = 0; // Tracks tokens from room abilities
room_progressive_pool = 0; 

// Room-specific variables
room_bad_beat_pool = 0;        // Poker-specific Bad Beat Pool
room_bad_beat_losses = 0;      // Poker-specific Bad Beat Losses
room_baccarat_tie_pot = 0;     // Baccarat-specific Tie Pot
room_baccarat_tie_pot_threshold = 250; // Threshold for Tie Pot Jackpot

// --- Bar Room ---
OnBarUpdate = function() {
	var income_per_update = (6 * room_level) + get_character_ability(room_character, "bar_ability");
    global.gain_tokens(income_per_update, room_character);
    room_tokens_earned += income_per_update;
    global.gain_exp(5);
    room_exp_earned += 5;
};
BarTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate, [], -1);

// --- Blackjack Room ---
OnBlackjackUpdate = function() {
    var base_wager = 22 * room_level;
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
    var base_wager = 50 * room_level;
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
    var base_wager = 90 * room_level;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 56;
    var tie_chance_on_loss = 15;

    // Character ability adjustments
    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    // Adjust values based on abilities
    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    // Determine outcome
    var outcome = irandom_range(1, 100);

    if (outcome <= adjusted_winrate) {
        // House wins
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;

        show_debug_message("House wins in Baccarat!");
    } else {
        // House loses
        var tie_roll = irandom_range(1, 100);
        if (tie_roll <= tie_chance_on_loss) {
            // It's a tie; add to the Tie Pot and no tokens are lost
            room_baccarat_tie_pot += adjusted_wager * 0.1; // 10% of wager goes to Tie Pot
            show_debug_message("It's a tie in Baccarat! Tie Pot: " + string(room_baccarat_tie_pot));
        } else {
            // Regular loss
            global.gain_tokens(-adjusted_lose_amount, room_character);
            room_tokens_lost += adjusted_lose_amount;
            show_debug_message("House loses in Baccarat! " + string(room_index));
        }
    }

    // Add wager to totals
    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    // Check for Tie Pot Jackpot
    if (room_baccarat_tie_pot >= room_baccarat_tie_pot_threshold) {
        // Trigger jackpot payout
        var jackpot_payout = room_baccarat_tie_pot; // Payout full pot
        global.gain_tokens(jackpot_payout, room_character);
        room_tokens_earned += jackpot_payout;
        room_ability += jackpot_payout; // Track only cash-out tokens

        // Reset the Tie Pot
        room_baccarat_tie_pot = 0;
		
		instance_create_layer(x, y, "Animation", obj_token_explosion);

        // Print Jackpot Message
        show_debug_message("Baccarat Tie Pot Jackpot! Payout: " + string(jackpot_payout));
    }
};

// Timer for Baccarat Room
BaccaratTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnBaccaratUpdate, [], -1);

// --- Poker Room ---
OnPokerUpdate = function() {
    var base_wager = 150 * room_level;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 40;

    // Character ability adjustments
    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    // Adjust values
    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    // Determine win or loss
    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    // Update stats and tokens
    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        // House wins: Gain tokens equal to the adjusted win amount
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;
        show_debug_message("House wins in Poker! " + string(room_index));
    } else {
        // House loses: Lose tokens equal to the adjusted lose amount
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;

        
        room_bad_beat_pool += adjusted_wager * 0.1; // 10% of wager goes to the pool
        room_bad_beat_losses += 1; // Increment the loss count

        // Print current bad beat stats
        show_debug_message("House loses in Poker! Bad Beat Pool: " + string(room_bad_beat_pool));
        show_debug_message("Bad Beat Losses: " + string(room_bad_beat_losses));

        
        if (room_bad_beat_losses >= 5) {
            // Trigger the jackpot payout
            global.gain_tokens(room_bad_beat_pool, room_character);
            room_tokens_earned += room_bad_beat_pool;
            room_ability += room_bad_beat_pool; // Track only cash-out tokens

            // Reset the pool and loss count
            room_bad_beat_pool = 0;
            room_bad_beat_losses = 0;
			 if (visible) {
                // Show the animation
                instance_create_layer(x, y, "Animation", obj_token_explosion);
            } else {
                // Hide any pre-existing animations for this room (if applicable)
                with (obj_token_explosion) {
                    if (room_index == other.room_index) {
                        visible = false;
                    }
                }
            }


            show_debug_message("Poker Bad Beat Jackpot Triggered!");
        }
    }

   
};

// Timer for Poker Room
PokerTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnPokerUpdate, [], -1);

OnRouletteUpdate = function() {
    var base_wager = 100 * room_level;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 62;

    // Character ability adjustments
    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    // Adjust values
    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    // Ensure `room_ability` exists for tracking
    if (!variable_instance_exists(self, "room_ability")) {
        room_ability = 0;
    }

    // Determine win or loss
    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        // 1% chance for 35x payout
        if (irandom_range(1, 100) == 1) {
            var jackpot_payout = adjusted_wager * 35;
            global.gain_tokens(jackpot_payout, room_character);
            room_tokens_earned += jackpot_payout;
            room_ability += jackpot_payout; // Track jackpot in special ability earnings
			instance_create_layer(x, y, "Animation", obj_token_explosion);

            show_debug_message("** Jackpot Win! Payout: " + string(jackpot_payout) + " **");
        } else {
            // Regular win
            global.gain_tokens(adjusted_win_amount, room_character);
            room_tokens_earned += adjusted_win_amount;

            show_debug_message("House wins in Roulette! Tokens Earned: " + string(adjusted_win_amount));
        }
    } else {
        // House loses
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;

        show_debug_message("House loses in Roulette! Tokens Lost: " + string(adjusted_lose_amount));
    }

    // Gain experience
    global.gain_exp(50);
    room_exp_earned += 50;
};


RouletteTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnRouletteUpdate, [], -1);

// --- Pachinko Room ---
OnPachinkoUpdate = function() {
    var base_wager = 150 * room_level;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 66;

    // Character ability adjustments
    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");
    var win_multiplier = get_character_ability(room_character, "win_multiplier");

    // Adjust values
    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount * (1 + win_multiplier / 100);
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    // Determine win or loss
    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        // House wins: Gain tokens equal to the adjusted win amount
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;

        // Apply multiplier logic
        var multiplier_roll = irandom_range(1, 1000); // Scale to make it harder for high multipliers
        var multiplier = 1;

        if (multiplier_roll <= 5) { // 0.5% chance for x25
            multiplier = 25;
        } else if (multiplier_roll <= 20) { // 2% for x10
            multiplier = 10;
        } else if (multiplier_roll <= 100) { // 10% for x5
            multiplier = 5;
        }

        if (multiplier > 1) {
            var progressive_reward = adjusted_wager * multiplier;
            global.gain_tokens(progressive_reward, room_character);
            room_ability += progressive_reward; // Track special ability earnings (cash-out rewards)
			instance_create_layer(x, y, "Animation", obj_token_explosion);
            show_debug_message("Pachinko Progressive Jackpot! Multiplier: x" + string(multiplier) + ", Reward: " + string(progressive_reward));
        } else {
            show_debug_message("House wins in Pachinko! " + string(room_index));
        }
    } else {
        // House loses: Lose tokens equal to the adjusted lose amount
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;
        show_debug_message("House loses in Pachinko! " + string(room_index));
    }

    // Gain experience
    global.gain_exp(50);
    room_exp_earned += 50;
};

// Timer for Pachinko Room
PachinkoTimer = time_source_create(time_source_game, 2, time_source_units_seconds, OnPachinkoUpdate, [], -1);


// --- Slots Room ---
OnSlotsUpdate = function() {
    var base_wager = 250 * room_level;
    var base_win_amount = base_wager;
    var base_lose_amount = base_wager;
    var base_winrate = 60;

    // Character ability adjustments
    var wager_bonus = get_character_ability(room_character, "wager_bonus");
    var winrate_bonus = get_character_ability(room_character, "win_rate");
    var loss_reduction = get_character_ability(room_character, "loss_reduction");

    // Adjust values
    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
    var adjusted_win_amount = base_win_amount; // No base multiplier here
    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
    var adjusted_winrate = base_winrate + winrate_bonus;

    // Determine win or loss
    var houseWins = irandom_range(1, 100) <= adjusted_winrate;

    room_tokens_wagered += adjusted_wager;
    global.profit_tokens_wager += adjusted_wager;

    if (houseWins) {
        // House wins: Base payout for standard wins
        global.gain_tokens(adjusted_win_amount, room_character);
        room_tokens_earned += adjusted_win_amount;

        // Slots-specific jackpot logic
        var jackpot_roll = irandom_range(1, 1000); // Harder odds for jackpots
        var jackpot_reward = 0;

        if (jackpot_roll == 1) { // 0.1% chance for mega jackpot
            jackpot_reward = adjusted_wager * 1000; // x50 payout
        } else if (jackpot_roll <= 10) { // 1% chance for mini jackpot
            jackpot_reward = adjusted_wager * 100; // x10 payout
        }

        // Add jackpot reward if applicable
        if (jackpot_reward > 0) {
            global.gain_tokens(jackpot_reward, room_character);
            room_ability += jackpot_reward; // Track special ability earnings
            show_debug_message("Slots Jackpot! Reward: " + string(jackpot_reward));
			instance_create_layer(x, y, "Animation", obj_token_explosion);
        } else {
            show_debug_message("House wins in Slots! " + string(room_index));
        }
    } else {
        // House loses: Lose tokens equal to the adjusted lose amount
        global.gain_tokens(-adjusted_lose_amount, room_character);
        room_tokens_lost += adjusted_lose_amount;

        show_debug_message("House loses in Slots! " + string(room_index));
    }

    // Gain experience
    global.gain_exp(60); // Slightly higher exp gain than Pachinko
    room_exp_earned += 60;
};

// Timer for Slots Room
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
			return("Income: " + string(6 * room_level) + " + (" + string(get_character_ability(room_character, "bar_ability")) + ")" +
				"\n\nTokens Earned: " + string(room_tokens_earned)); 
			
			case ROOM_TYPE.LOBBY:
			return("Net Tokens Profit: " + string(global.profit_tokens) +
				"\nTotal Experience Gained: " + string(global.profit_exp) +
				"\n\nTotal Tokens Earned: " + string(global.profit_tokens_earned) +
				"\nTotal Tokens Lost: " + string(global.profit_tokens_lost) +
				"\nTotal Tokens Wagered: " + string(global.profit_tokens_wager));

		
		case ROOM_TYPE.BLACKJACK:
	        base_wager = 22 * room_level;
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
	                "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		case ROOM_TYPE.CRAPS:
	        base_wager = 50 * room_level;
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
	                "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);
				 
		case ROOM_TYPE.BACCARAT:
		    base_wager = 90 * room_level;
		    base_winrate = 56;
		    base_lose_amount = 90;

		    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
		    var adjusted_winrate = base_winrate + winrate_bonus;
		    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

		    return
		           "Tokens Earned: " + string(room_tokens_earned) +
		           "\nTokens Lost: " + string(room_tokens_lost) +
		           "\nTokens Wagered: " + string(room_tokens_wagered) +
		           "\nBase Wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) + 
		           "\nHouse Winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + 
		           "\nLose Amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) + 
		           "\n\nTie Pot: " + string(room_baccarat_tie_pot) +
		           "\nTie Pot Threshold: " + string(room_baccarat_tie_pot_threshold) + 
		           "\nRoom ability earnings: " + string(room_ability) +
		           "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		case ROOM_TYPE.POKER:
		    base_wager = 150 * room_level;
		    base_winrate = 58;
		    base_lose_amount = 150;

		    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
		    var adjusted_winrate = base_winrate + winrate_bonus;
		    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);
		
		    return     
		           "Tokens earned: " + string(room_tokens_earned) + 
		           "\nTokens lost: " + string(room_tokens_lost) + 
		           "\nTokens wagered: " + string(room_tokens_wagered) +
		           "\nBase wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
		           "\nHouse winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
		           "\nLose amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) + 
		           "\n\nLose pool: " + string(room_bad_beat_pool) + 
		           "\nCurrent loses: " + string(room_bad_beat_losses) + " (Cashout out on 5)\n" +
		           "\nRoom ability earnings: " + string(room_ability) + 
		           "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		case ROOM_TYPE.ROULETTE:
			base_wager = 200 * room_level;
			base_winrate = 62;
			base_lose_amount = 200;

			var adjusted_wager = base_wager * (1 + wager_bonus / 100);
			var adjusted_winrate = base_winrate + winrate_bonus;
			var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

			return "Tokens earned: " + string(room_tokens_earned) +
				    "\nTokens lost: " + string(room_tokens_lost) +
				    "\nTokens wagered: " + string(room_tokens_wagered) +
				    "\nBase wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
				    "\nHouse winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
				    "\nLose amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) +
				    "\n\nRoom ability earnings: " + string(room_ability) +
				    "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		case ROOM_TYPE.PACHINKO:
			    base_wager = 300 * room_level;
			    base_winrate = 66;
			    base_lose_amount = 300;

			    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
			    var adjusted_winrate = base_winrate + winrate_bonus;
			    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

			    return "Tokens earned: " + string(room_tokens_earned) +
			           "\nTokens lost: " + string(room_tokens_lost) +
			           "\nTokens wagered: " + string(room_tokens_wagered) +
			           "\nBase wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
			           "\nHouse winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
			           "\nLose amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) + 
			           "\n\nRoom ability earnings: " + string(room_ability) +
			           "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);

		case ROOM_TYPE.SLOTS:
			    base_wager = 400 * room_level;
			    base_winrate = 60;
			    base_lose_amount = 400;

			    var adjusted_wager = base_wager * (1 + wager_bonus / 100);
			    var adjusted_winrate = base_winrate + winrate_bonus;
			    var adjusted_lose_amount = base_lose_amount * (1 - loss_reduction / 100);

			    return "Tokens earned: " + string(room_tokens_earned) +
			           "\nTokens lost: " + string(room_tokens_lost) +
			           "\nTokens wagered: " + string(room_tokens_wagered) +
			           "\nBase wager: " + string(base_wager) + " + (" + string(wager_bonus) + "%) = " + string(adjusted_wager) +
			           "\nHouse winrate: " + string(base_winrate) + "% + (" + string(winrate_bonus) + "%) = " + string(adjusted_winrate) + "%" +
			           "\nLose amount: " + string(base_lose_amount) + " - (" + string(loss_reduction) + "%) = " + string(adjusted_lose_amount) + 
			           "\n\nRoom ability earnings: " + string(room_ability) +
			           "\n\nProfit: " + string(room_tokens_earned - room_tokens_lost);
		
			default:
	            return "Get_Room_Stats() Not yet implemented.";
		}
};

function get_character_ability(character_id, ability_type) {
    switch (character_id) {
        case CHARACTER.CHIP_GUY:
            if (ability_type == "wager_bonus") return 15;  // +15% to wagers
			if (ability_type == "loss_reduction") return 5;	// 5% loss reduction
            break;

        case CHARACTER.COOL_CHIP_GUY:
            if (ability_type == "win_rate") return 5;      // +5% win rate
            break;

        case CHARACTER.COW_MAN:
            if (ability_type == "wager_bonus") return 100; // +100% to wagers
			if (ability_type == "win_rate") return 2;	// +2% win rate
            break;

        case CHARACTER.THE_GIRL:
			if (ability_type == "wager_bonus") return 20;	// +20% to wagers
            if (ability_type == "loss_reduction") return 50; // 50% reduction
			if (ability_type == "bar_ability") return 100;	// +100 tokens per second on bar
            break; 
			
		case CHARACTER.SLOTSY:
			if (ability_type == "wager_bonus") return 50;	// +50% to wagers
			break;
		
		case CHARACTER.CARBERT:
			if (ability_type == "win_rate") return 1;	// +1% to win rate
			if (ability_type == "wager_bonus") return 5;	// +5% to wagers
			
		case CHARACTER.BENJY:
            if (ability_type == "bar_ability") return 25;	// +25 tokens per second on bar
			if (ability_type == "loss_reduction") return 25;	// 25% loss reduction
            break;

        default:
            return 0; // Default to no effect
    }
	return 0;
}

room_character = -1;          // No character assigned initially
room_character_sprite = noone; // No sprite assigned initially
character_frame = 0;          // Starts on first frame once sprite is attached

daily_update = function()
{

}

npc_animation = noone; 