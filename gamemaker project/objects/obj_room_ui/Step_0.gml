//get mouse location
up_key = keyboard_check_pressed(mouse_wheel_down());
down_key = keyboard_check_pressed(mouse_wheel_up());
accept_key = keyboard_check_pressed(vk_lshift);
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
			show_debug_message("Created Character Selection")
			instance_create_layer(x, y, 1, obj_gacha_ui);
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