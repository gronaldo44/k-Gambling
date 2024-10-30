width = 950;
height = 500;

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 50;

pos = 0;

room_loc = -1;
visible = false;

option[0] = "Tips";
option[1] = "Weekly Report";
option[2] = "Net Profit";

op_length = array_length(option);

global.display_lobby_ui = function(room_index){
	show_debug_message("Displaying lobby info and tips " + string(room_index));
	visible = true;
	room_loc = room_index;
}
