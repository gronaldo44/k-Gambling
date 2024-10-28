// global.purchase_room(room_index, ROOM_TYPE.OPEN);	tmp

switch (roomType) {
	case ROOM_TYPE.LOCKED:
		show_debug_message("Locked Room Clicked: " + string(room_index));
		// play meep-merp 
		break;
	
	case ROOM_TYPE.OPEN:
		show_debug_message("Open Room Clicked: " + string(room_index));
		// display_shop_ui(room_index);
		global.display_shop_ui(room_index)
		break;
		
	case ROOM_TYPE.LOBBY:
		show_debug_message("Lobby Room Clicked: " + string(room_index));
		// display_tips_ui(room_index);
		break;
		
	default:
		show_debug_message("Casino Room Clicked: " + string(room_index));
		// display_room_ui(room_index, roomType);
		break;
}