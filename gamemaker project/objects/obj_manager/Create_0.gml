global.isPrepare = true;
global.level = 1;
global.exp = 0;
global.weeklyprofit = 0;
global.weeklyloss = 0;
global.daytimer = 0;
global.days = 0;
global.token = 100;
global.gachaPulled = 0;
global.uiopen = false;
global.new_room_cost = 50;

// profit is used like the word total/net here
global.profit_tokens = 0;
global.profit_exp = 0;
global.profit_tokens_wager = 0;
global.profit_tokens_lost = 0;
global.profit_tokens_earned = 0;
// global.gamespeed = 1;

global.is_gacha = false

global.gain_tokens = function(tokens, char){
	switch (char) {
		case CHARACTER.CHIP_GUY:
			tokens += 1;
			break;
		
		case CHARACTER.COOL_CHIP_GUY:
			tokens += 2;
			break;
		
		case CHARACTER.COW_MAN:
			tokens += ceil(tokens * 0.15);
			break;
		
		case CHARACTER.THE_GIRL:
			tokens += ceil(tokens * 0.25);
			break;
	}
	
	global.token += tokens;
	global.profit_tokens += tokens;
	if (tokens > 0){
		global.profit_tokens_earned += tokens;
	} else {
		global.profit_tokens_lost += tokens;
	}
}

global.gain_exp = function(exp_gained){
	global.exp += exp_gained;
	global.profit_exp += exp_gained;
	while (global.exp >= (power(2, global.level - 1) * 100)){
		level_up()
	}
}

function level_up(){
	global.exp -= global.level * 100;
	global.level++;
	show_debug_message("Level Up: " + string(global.level));
	//obj_level_display.image_index = 0;
	
	// level 1
	if (global.level == 1){
		global.token += 100;
		//obj_level_display.image_index = 0;
	}
	
	// level 2
	if (global.level == 2){
		//obj_level_display.image_index = 1;
	}
	
	// level 3
	if (global.level == 3){
		//obj_level_display.image_index = 2;
	}
	
	// level 4
	if (global.level == 4){
		//obj_level_display.image_index = 3;
	}
	
	// level 5
	if (global.level == 5){
		//obj_level_display.image_index = 4;
	}
	
	// level 6
		if (global.level == 6){
		//obj_level_display.image_index = 5;
	}
	
	// level 7
		if (global.level == 7){
		//obj_level_display.image_index = 6;
	}
	
}