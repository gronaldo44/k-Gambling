//get mouse location
up_key = keyboard_check_pressed(mouse_wheel_down());
down_key = keyboard_check_pressed(mouse_wheel_up());
accept_key = mouse_check_button_pressed(mb_right);
close = keyboard_check_pressed(vk_escape);

//move through the rooms
pos += down_key - up_key;
if(pos >= op_length){pos = 0};
if(pos < 0){pos = op_length-1};

if(close){
	visible = false;
	global.uiopen = false;
}

switch(pos){
	case 0:
		break;
	case 1:
		break;
	case 2:
		break;
	case 3:
		if(accept_key){
			visible = false;
			show_debug_message("Created Character Selection " + string(x) + ", " + string(y));
			var gacha_ui = instance_create_layer(x, y, "UI", obj_gacha_ui);
			gacha_ui.room_loc = room_loc;
		}
		break;
}

//selecting the room
//if(accept_key){
	//visible = false;
	//switch(pos){
		//case 0:
			//Display tips
			
			//break;
	
		//case 1:
			//Display Weekly Report
			//break;
		
		//case 2:
			//Display Net Porfit stats
			//break;
	//}
//}