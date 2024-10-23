enum ROOM_TYPE {
	LOCKED = 0,
	OPEN = 1,
	BAR = 2,
	BLACKJACK = 3,
	FRONT_DESK = 4
}

var grid_rooms = array_create(8);

// Set room positions in a 2x4 grid
var grid_width = 4;  // Number of columns in the grid
var grid_height = 2; // Number of rows in the grid
var tile_size = 448;  // Size of each room in pixels (width/height)

for (var i = 0; i < grid_width * grid_height; i++) {
    var x_position = (i % grid_width) * tile_size;
    var y_position = floor(i / grid_width) * tile_size;
    var r = instance_create_layer(x_position, y_position, "GridLayer", obj_grid_room);
    r.room_index = i;
}

function purchase_room(loc, room_type) {
    if (grid_room[loc] == ROOM_TYPE.OPEN){
        grid_room[loc] = room_type;

        // Get the room object instance and update its room_type
        var room_instance = instance_find(obj_grid_room, loc);
        if (room_instance != noone) {
            room_instance.room_type = room_type;
        }
    } else {
        show_debug_message("purchase_room on invalid lot");
    }
}