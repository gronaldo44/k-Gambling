enum ROOM_TYPE {
	LOCKED = 0,
	OPEN = 1,
	BAR = 2,
	BLACKJACK = 3,
	LOBBY = 4,
	ROULETTE = 5,
	SLOTS = 6,
	BACCARAT = 7,
	CRAPS = 8,
	PACHINKO = 9
}

// Create event of obj_grid_manager
global.grid_rooms = array_create(8, ROOM_TYPE.LOCKED); // Initialize with LOCKED rooms

// Set room positions in a 2x4 grid
var grid_width = 4;  // Number of columns in the grid
var grid_height = 2; // Number of rows in the grid
var tile_size = 448;  // Size of each room in pixels (width/height)

for (var i = 0; i < grid_width * grid_height; i++) {
    var x_position = (i % grid_width) * tile_size;
    var y_position = floor(i / grid_width) * tile_size;
    var r = instance_create_layer(x_position, y_position, "GridLayer", obj_grid_room);
    r.room_index = i; // Ensure room_index is set for instance_find()
	
	// Set starting room for level 0
	if (i == 6){
		r.roomType = ROOM_TYPE.OPEN;	
		r.image_index = r.roomType;
	}
}

// Define the purchase_room function
global.purchase_room = function(loc, roomType) {
    if (global.grid_rooms[loc] == ROOM_TYPE.OPEN || true) {
        global.grid_rooms[loc] = roomType; // Corrected roomType capitalization
		
		show_debug_message(string(loc) + " set to " + string(roomType));
		
		var room_instance = instance_find(obj_grid_room, loc);
		if (room_instance != noone) {
			room_instance.roomType = roomType;
			room_instance.image_index = roomType;
		}
    } else {
        show_debug_message("purchase_room on invalid lot: " + string(loc));
    }

	var shop_ui = instance_find(obj_shop_ui, 0);
	with(shop_ui){
		visible = false;
		room_loc = -1;
		}
};


global.start_casino = function() {
	
}

