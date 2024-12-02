enum ROOM_TYPE {	// frame for this room on the sprite
	OPEN = 0,
	LOCKED = 1,
	BAR = 2,
	LOBBY = 3,
	BLACKJACK = 4,
	BACCARAT = 5,
	PACHINKO = 6,
	POKER = 7,
	ROULETTE = 8,
	SLOTS = 9,
	CRAPS = 10,
}

// Set room positions in a 2x4 grid
grid_width = 4;		// Number of columns in the grid
grid_height = 2;	// Number of rows in the grid
tile_size = 410;	// Size of each room in pixels (width/height)
grid_rooms = array_create(grid_width * grid_height);
grid_index = 0;		// What floor of the casino we're on

for (var i = 0; i < grid_width * grid_height; i++) {
    var x_position = (i % grid_width) * tile_size;
    var y_position = floor(i / grid_width) * tile_size;
    var r = instance_create_layer(x_position, y_position, "GridLayer", obj_grid_room);
    
    r.room_index = i; // Set room index for reference
    r.roomType = ROOM_TYPE.LOCKED; // Set default type
    r.image_index = r.roomType;

    grid_rooms[i] = r; // Store the instance in the array

    // Set starting room for level 0
	if (i == 5){
        r.roomType = ROOM_TYPE.OPEN;	
        r.image_index = r.roomType;
	}
    if (i == 6){
        r.roomType = ROOM_TYPE.LOBBY;	
        r.image_index = r.roomType;
    }
}



global.set_roomtype = function(loc, roomType) {
    var room_instance = grid_rooms[loc + offset()];
    
    if (room_instance != noone) {
        room_instance.roomType = roomType;
        room_instance.image_index = roomType;

        // Create or update the NPC animation
        var npc = instance_create_layer(room_instance.x, room_instance.y, "Animation", obj_npc_animation);
        if (npc != noone) {
            switch (roomType) {
                case ROOM_TYPE.BAR:
                    npc.npc_sprite = spr_bar_fade;
                    break;
                case ROOM_TYPE.BLACKJACK:
                    npc.npc_sprite = spr_black_jack_fade;
                    break;
                case ROOM_TYPE.BACCARAT:
                    npc.npc_sprite = spr_bacarat_fade;
                    break;
					case ROOM_TYPE.CRAPS:
                    npc.npc_sprite = spr_craps_fade;
                    break;
                case ROOM_TYPE.POKER:
                    npc.npc_sprite = spr_poker_fade;
                    break;
                case ROOM_TYPE.ROULETTE:
                    npc.npc_sprite = spr_roulette_fade;
                    break;
                case ROOM_TYPE.SLOTS:
                    npc.npc_sprite = spr_slots_fade;
                    break;
                case ROOM_TYPE.PACHINKO:
                    npc.npc_sprite = spr_pachinko_fade;
                    break;
                default:
                    npc.npc_sprite = noone;
                    break;
            }
            npc.npc_active = true; // Start animation
            npc.room_index = loc + offset();  // Link to room index
        }
		room_instance.start_room();
    }

    show_debug_message("Room " + string(loc) + " set to type " + string(roomType));
};

// Gets the character at room "loc"
global.get_roomChar = function(loc, character_id){
	var room_instance = grid_rooms[loc + offset()];
	
	if (room_instance != noone) { 
		return room_instance.room_character;
	} else {
		show_debug_message("ROOM DOES NOT EXIST");
	}	
}

global.set_roomChar = function(loc, c) {
    var room_instance = grid_rooms[loc + offset()];
    
    // Ensure the room exists
    if (room_instance != noone) {
        // Remove the old character from the room and return it to the pool
        if (room_instance.room_character >= 0) {
            global.char_setCharacter(room_instance.room_character, 1); // Return old character to the pool
        }
        
        // Deduct the new character from the pool if available
        if (global.char_getValue(c) > 0) {
            global.char_setCharacter(c, -1);
            
            // Set the new character and update the sprite
            room_instance.room_character = c;
            switch (c) {
                case CHARACTER.CHIP_GUY:
                    room_instance.room_character_sprite = IG_Chippy;
                    break;
                case CHARACTER.COOL_CHIP_GUY:
                    room_instance.room_character_sprite = IG_Chipper;
                    break;
                case CHARACTER.COW_MAN:
                    room_instance.room_character_sprite = IG_Cowman;
                    break;
                case CHARACTER.THE_GIRL:
                    room_instance.room_character_sprite = IG_Yuki;
                    break;
				case CHARACTER.SLOTSY:
                    room_instance.room_character_sprite = IG_Slotsy;
                    break;
				case CHARACTER.CARBERT:
                    room_instance.room_character_sprite = IG_Carbert;
                    break;
				case CHARACTER.BENJY:
                    room_instance.room_character_sprite = IG_Benjy;
                    break;					
                default:
                    room_instance.room_character_sprite = noone; // Fallback for invalid character
            }

            show_debug_message("Assigned " + string(c) + " to room " + string(loc));
            return true;
        } else {
            show_debug_message("Character " + string(c) + " is not available.");
            return false;
        }
    } else {
        show_debug_message("Room not found for index: " + string(loc));
        return false;
    }
};



global.start_casino = function() {
    show_debug_message("Starting Casino rooms");
    for (var i = 0; i < array_length(grid_rooms); i++) {
        var r = grid_rooms[i];
        
        if (r != noone) {
            r.start_room();
        } else {
            show_debug_message("Could not find room at index " + string(i));
        }
    }
};

global.stop_casino = function() {
    show_debug_message("Stopping Casino rooms");
    for (var i = 0; i < array_length(grid_rooms); i++) {
        var r = grid_rooms[i];
        
        if (r != noone) {
            r.stop_room();
        } else {
            show_debug_message("Could not find room at index " + string(i));
        }
    }
};

global.get_room_stats = function(room_index){
	var room_instance = grid_rooms[room_index + offset()];
	return room_instance.get_room_stats();
}

// Cycles through the grid by casino floor level
function offset() {
	return grid_height * grid_width * grid_index;	
}

function expand_grid() {
    var new_rooms = grid_width * grid_height; // Number of rooms to add
    var current_count = array_length(grid_rooms);
    var new_count = current_count + new_rooms;

    // Create a new array for the expanded grid
    var new_grid_rooms = array_create(new_count);

    // Copy over the old room instances to the new array
    for (var i = 0; i < current_count; i++) {
        new_grid_rooms[i] = grid_rooms[i];
    }

    // Resize the grid array and assign the new one
    grid_rooms = new_grid_rooms;

    // Initialize new rooms
    var i = current_count;
    var j = 0;
    while (i < new_count) {
        var x_position = (j % grid_width) * tile_size;
        var y_position = floor(j / grid_width) * tile_size;
        var r = instance_create_layer(x_position, y_position, "GridLayer", obj_grid_room);

        r.room_index = j;
        r.roomType = ROOM_TYPE.LOCKED; // Default type
        r.image_index = r.roomType;

        grid_rooms[i] = r;
        i++;
        j++;
    }

    show_debug_message("Grid expanded to " + string(new_count) + " rooms.");
    //verify_room_integrity();
}

// Method for testing purposes only
function verify_room_integrity() {
	show_debug_message("Verifying grid_rooms integrity...");
	
	var corrupted = false;
    for (var i = 0; i < array_length(grid_rooms); i++) {
        if (grid_rooms[i] != noone) {
            // Check if the instance is valid before accessing its properties
            if (instance_exists(grid_rooms[i])) {
                show_debug_message("Room " + string(i) + " - RoomType " + string(grid_rooms[i].roomType));    
            } else {
                show_debug_message("Room " + string(i) + " exists but is invalid.");
				corrupted = true;
            }
        } else {
            show_debug_message("Room " + string(i) + " does not exist.");
			corrupted = true;
        }
    }
	
	if (corrupted){
		show_debug_message("TEST FAILED: grid_rooms is corrupted");	
	} else {
		show_debug_message("TEST PASSED: grid_rooms integrity verified");
	}
}

function set_floor_visibility(visibility){
	var start_index = offset();
	var end_index = start_index + (grid_width * grid_height);
	for (var i = start_index; i < end_index; i++) {
        if (i < array_length(grid_rooms) && grid_rooms[i] != noone) {
            with (grid_rooms[i]) {
				visible = visibility;	
				show_debug_message("Room " + string(i) + " - RoomType " + string(roomType));
			}
        } 
		else {
			show_debug_message("set_floor_visibility Invalid or missing room at " + string(i));	
		}
    }
	
// Manage visibility for NPC animations
    with (obj_npc_animation) {
        visible = global.is_visible_on_floor(room_index); // Update visibility based on floor
        show_debug_message("NPC Animation for Room " + string(room_index) + " visibility set to " + string(visible));
    }
	show_debug_message("Floor " + string(grid_index) + " visibility set to " + string(visibility));
}

global.grid_floorUp = function() {
	// Make old floor invisible
	set_floor_visibility(false);
	
	grid_index++;
	if ((grid_width * grid_height * grid_index) > array_length(grid_rooms) - 1) {
		expand_grid();
	} 
	
	// Make new floor visible
	set_floor_visibility(true);
	
	show_debug_message("Casino set to floor " + string(grid_index));
}

global.grid_floorDown = function() {
	if (grid_index - 1 >= 0) {
		// Make old floor invisible
		set_floor_visibility(false);
		
		// Make new floor visible
		grid_index--;
		set_floor_visibility(true);
	}
	show_debug_message("Casino set to floor " + string(grid_index));
}

global.is_visible_on_floor = function(room_index) {
    var room_floor = floor(room_index / (grid_width * grid_height));
    return room_floor == grid_index; // True if on the current floor
};