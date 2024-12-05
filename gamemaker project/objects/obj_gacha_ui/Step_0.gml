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

// Selecting a character or option
if (accept_key && visible && allow_accept && is_opened) {
    if (pos != 7) {
        // If selecting a character option but no characters are available
        var character_id;
        switch (pos) {
            case 0: character_id = CHARACTER.CHIP_GUY; break;
            case 1: character_id = CHARACTER.COOL_CHIP_GUY; break;
            case 2: character_id = CHARACTER.COW_MAN; break;
            case 3: character_id = CHARACTER.THE_GIRL; break;
            case 4: character_id = CHARACTER.SLOTSY; break;
            case 5: character_id = CHARACTER.CARBERT; break;
            case 6: character_id = CHARACTER.BENJY; break;
        }
        
        if (character_id != undefined && ds_map_find_value(global.characters, character_id) <= 0) {
            show_debug_message("No available characters to select. UI stays open.");
            return; 
        }
    }

  
    switch (pos) {
        case 0: global.set_roomChar(room_loc, CHARACTER.CHIP_GUY); break;
        case 1: global.set_roomChar(room_loc, CHARACTER.COOL_CHIP_GUY); break;
        case 2: global.set_roomChar(room_loc, CHARACTER.COW_MAN); break;
        case 3: global.set_roomChar(room_loc, CHARACTER.THE_GIRL); break;
        case 4: global.set_roomChar(room_loc, CHARACTER.SLOTSY); break;
        case 5: global.set_roomChar(room_loc, CHARACTER.CARBERT); break;
        case 6: global.set_roomChar(room_loc, CHARACTER.BENJY); break;
        case 7:
            
            return; 
        default:
            show_debug_message("Set room char option not yet implemented.");
    }

    // Close the UI only on valid character selection
    global.uiopen = false;
    instance_destroy();
    show_debug_message("UI closed. Visible: " + string(visible) + ", UI open: " + string(global.uiopen));
}