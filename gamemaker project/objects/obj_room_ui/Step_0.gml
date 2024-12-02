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

// Allow removing characters from rooms
if (visible){
	if (room_loc >= 0){
		if (global.get_roomChar(room_loc) >= 0){
			option[3] = "Remove Character";
		} else {
			option[3] = "Character";	
		}
	}
}

switch(pos){
	case 0:
		break;
	case 1:
		break;
	case 2:
		if(accept_key && visible && allow_accept && is_opened){
			if (global.grid_TryUpgradeRoom(room_loc)){
				visible = false;
				global.uiopen = false;
			}
		}
		break;
	case 3:
		if(accept_key && visible && allow_accept && is_opened){
			visible = false;
			var room_employee = global.get_roomChar(room_loc);
			if (room_employee < 0){
				show_debug_message("Created Character Selection " + string(x) + ", " + string(y));
				var gacha_ui = instance_create_layer(x, y, "UI", obj_gacha_ui);
				gacha_ui.room_loc = room_loc;
			} else {
				global.remove_roomChar(room_loc);
				global.uiopen = false;
			}
		}
		break;
}
