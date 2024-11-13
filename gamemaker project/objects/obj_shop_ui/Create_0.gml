width = 950;
height = 500;

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 100;

pos = 0;

room_loc = -1;
visible = false;

option[0] = "Bar";
option[1] = "Blackjack"
option[2] = "Craps"
option[3] = "Baccart"
option[4] = "Poker"
option[5] = "Roulette"
option[6] = "Pachinko"
option[7] = "Slots"

op_length = array_length(option);

global.display_shop_ui = function(room_index){
	show_debug_message("Displaying shop for room " + string(room_index));
	visible = true;
	room_loc = room_index;
}

// spends tokens if the player can afford to
function try_spend_tokens(cost){
	var can_afford = global.token >= cost;
	if (can_afford){
		global.token -= cost;	
	}
	return can_afford;
}