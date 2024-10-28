roomType = ROOM_TYPE.LOCKED;
image_index = roomType;
room_index = -1;	// changed to positive in grid_manager creation

OnBarUpdate = function()
{
	global.token += 5;	
}
barTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate, [], -1);

start_room = function() {
	switch (roomType) {
		case ROOM_TYPE.OPEN:
			// nothing for now
			break;
		
		case ROOM_TYPE.BAR:
			// start making money
			time_source_start(barTimer);
			break;
		
		case ROOM_TYPE.LOBBY:
			// display_tips_ui(room_index);
			break;
		
		default:
			// display_room_ui(room_index, roomType);
			break;
	}
}

var stop_room = function() {
	time_source_pause(barTimer);
}