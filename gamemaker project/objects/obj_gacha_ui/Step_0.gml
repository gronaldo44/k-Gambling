//get mouse location
up_key = keyboard_check_pressed(mouse_wheel_down());
down_key = keyboard_check_pressed(mouse_wheel_up());
accept_key = mouse_check_button_pressed(mb_left);
close = keyboard_check_pressed(vk_escape);

if (visible && !allow_accept) {
    allow_accept = true; // Enable accept after the UI has been visible for a frame
}

if (visible && !is_opened) {
    is_opened = true;       // Mark as opened
    allow_accept = false;    // Disable immediate purchases
}

//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

if(close){
	visible = false;
	global.uiopen = false;
}

//selecting the room
if(accept_key && visible && allow_accept && is_opened){
	switch(pos){
		case 0:
		global.set_roomChar(room_loc, CHARACTER.CHIP_GUY);
			break;
		case 1:

			global.set_roomChar(room_loc, CHARACTER.COOL_CHIP_GUY);
			break;
		case 2:

			global.set_roomChar(room_loc, CHARACTER.COW_MAN);
			break;
		case 3:

			global.set_roomChar(room_loc, CHARACTER.THE_GIRL);
			break;
		default:
			show_debug_message("Set room char option not yet implemented");
	}
	global.uiopen = false;
	instance_destroy();
	show_debug_message("UI closed. Visible: " + string(visible) + ", UI open: " + string(global.uiopen));

}

