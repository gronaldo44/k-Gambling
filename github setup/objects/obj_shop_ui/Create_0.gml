width = 264;
height = 104;

op_border = 8;
op_space = 50;

pos = 0;

room_loc = -1;
visible = false;

option[0] = "[75] Lobby";
option[1] = "[100] Bar Room";
option[2] = "[125] Black Jack Room"

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