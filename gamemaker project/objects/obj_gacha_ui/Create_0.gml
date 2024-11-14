width = 950;
height = 500;

allow_accept = false;
is_opened = false;

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 100;

pos = 0;

room_loc = -1;
visible = true;

option[0] = "Chippy";
option[1] = "Chipper"
option[2] = "CowMan"
option[3] = "Yuki"

op_length = array_length(option);

// spends tokens if the player can afford to
function try_get_character(cost){
	var can_afford = ds_map_find_value(global.characters, CHARACTER.CHIP_GUY) >= cost;
	if (can_afford){
		global.token -= cost;	
	}
	return can_afford;
}