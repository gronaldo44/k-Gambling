// global.purchase_room(room_index, ROOM_TYPE.OPEN);	tmp
if (visible && !global.uiopen){
	if (is_locked_room){
		show_debug_message("Locked Room Clicked: " + string(room_index));
		global.grid_TryPurchaseNewRoom(room_index);
		audio_play_sound(wrong_answer_sound_effect,1,false)
		
	} else {
		switch (roomType) {
			case ROOM_TYPE.OPEN:
				// display_shop_ui(room_index);
				if(global.uiopen == false){
					show_debug_message("Open Room Clicked: " + string(room_index));
					global.display_shop_ui(room_index);
					global.uiopen = true;
					audio_play_sound(Coins_jingling,1,false)
				}
				break;
		
			case ROOM_TYPE.LOBBY:
				// display_tips_ui(room_index);
				if(global.uiopen == false){
					show_debug_message("Lobby Room Clicked: " + string(room_index));
					global.display_lobby_ui(room_index);
					global.uiopen = true;
				}
				break;
		
			default:
				// display_room_ui(room_index, roomType);
				if(global.uiopen == false){
					show_debug_message("Casino Room Clicked: " + string(room_index));
					show_debug_message(string(room_index) + " is Casino Room type " + string(roomType));
					global.display_room_ui(room_index, roomType);
					global.uiopen = true;
				}
		}
	}
}