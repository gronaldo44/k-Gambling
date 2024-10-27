roomType = ROOM_TYPE.LOCKED;
image_index = roomType;

var barTimer = time_source_create(time_source_game, 1, time_source_units_seconds, OnBarUpdate(), [], -1);
var OnBarUpdate = function()
{
	global.token += 5;	
}

global.start_room = function() {
	switch (roomType) {
	case ROOM_TYPE.OPEN:
		// play meep-merp sound
	
	case ROOM_TYPE.BAR:
		// display_shop_ui(room_index);
		
	case ROOM_TYPE.LOBBY:
		// display_tips_ui(room_index);
		
	default:
		// display_room_ui(room_index, roomType);
	}
}