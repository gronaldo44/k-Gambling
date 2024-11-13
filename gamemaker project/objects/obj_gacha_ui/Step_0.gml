//get mouse location
up_key = keyboard_check_pressed(mouse_wheel_down());
down_key = keyboard_check_pressed(mouse_wheel_up());
accept_key = mouse_check_button_pressed(mb_right);
close = keyboard_check_pressed(vk_escape);

//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

if(close){
	visible = false;
	global.uiopen = false;
}

//selecting the room
if(accept_key){
	switch(pos){
		case 0:
			// Chippy
			global.set_roomChar(room_loc, CHARACTER.CHIP_GUY);
			break;
		case 1:
			// Chipper
			global.set_roomChar(room_loc, CHARACTER.COOL_CHIP_GUY);
			break;
		case 2:
			// Cow
			global.set_roomChar(room_loc, CHARACTER.COW_MAN);
			break;
		case 3:
			// Yuki
			global.set_roomChar(room_loc, CHARACTER.THE_GIRL);
			break;
		default:
			show_debug_message("Set room char option not yet implemented");
	}
	global.uiopen = false;
	instance_destroy();
}