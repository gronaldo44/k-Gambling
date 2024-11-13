width = 950;
height = 500;

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 100;

pos = 0;

room_loc = -1;
visible = false;

option[0] = "Info";
option[1] = "Stats";
option[2] = "Upgrade";
option[3] = "Character"

op_length = array_length(option);

global.display_room_ui = function(room_index, roomType){
	show_debug_message("Displaying room info and tips " + string(room_index));
	show_debug_message(string(room_index) + " is Casino Room type " + string(roomType));
	visible = true;
	room_loc = room_index;
	room_type = roomType;
}
