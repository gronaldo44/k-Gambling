enum ROOM_TYPE {	// frame for this room on the sprite
	OPEN = 0,
	LOCKED = 1,
	BAR = 2,
	PACHINKO = 3,
	LOBBY = 4,
	BLACKJACK = 5,
	BACCARAT = 6,
	POKER = 7,
	ROULETTE = 8,
	SLOTS = 9,
	CRAPS = 10,
}

// Set room positions in a 2x4 grid
grid_width = 4;  // Number of columns in the grid
grid_height = 2; // Number of rows in the grid
tile_size = 410;  // Size of each room in pixels (width/height)
grid_rooms = array_create(grid_width * grid_height);

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

// Set the room at "loc" to the type "roomType"
global.set_roomtype = function(loc, roomType) {
    var room_instance = grid_rooms[loc];
    
    if (room_instance != noone) {
        room_instance.roomType = roomType;
        room_instance.image_index = roomType;
        room_instance.start_room();
        
        show_debug_message("Room " + string(loc) + " set to type " + string(roomType));
    }
    
    var shop_ui = instance_find(obj_shop_ui, 0);
    with(shop_ui) {
        visible = false;
        room_loc = -1;
    }
};

// Set the character at room "loc"
global.set_roomChar = function(loc, c) {
    var room_instance = grid_rooms[loc];
    
    if (room_instance != noone) {
        room_instance.room_character = c;
        
        show_debug_message("Room " + string(loc) + " character set to " + string(c));
    }
    
    var shop_ui = instance_find(obj_shop_ui, 0);
    with(shop_ui) {
        visible = false;
        room_loc = -1;
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
	var room_instance = grid_rooms[room_index];
	return room_instance.get_room_stats();
}
