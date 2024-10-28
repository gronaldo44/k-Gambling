width = 264;
height = 104;

op_border = 8;
op_space = 50;

pos = 0;

room_loc = -1;
visible = false;

option[0] = "Front Desk";
option[1] = "Bar Room";
option[2] = "Black Jack Room"

op_length = array_length(option);

global.display_shop_ui = function(room_index){
	show_debug_message("Displaying shop for room " + string(room_index));
	visible = true;
	room_loc = room_index;
}