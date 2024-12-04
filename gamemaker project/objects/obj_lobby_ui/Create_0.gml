width = 950;
height = 500;

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 100;

pos = 0;

room_loc = -1;
visible = false;

option[0] = "Tips";
option[1] = "Net Earnings";

op_length = array_length(option);

global.display_lobby_ui = function(room_index){
	show_debug_message("Displaying lobby info and tips " + string(room_index));
	visible = true;
	room_loc = room_index;
}

function get_lobby_tip() {
	switch (global.level) {
		case 1:
			return("Congratulations on opening your first" +
		       "\ncasino! This is the lobby, where you will" +
		       "\nmonitor your casino progress." +
		       "\n\nRemember, gambling can be risky. Even" +
		       "\nthehouse has losses now and then. Let" +
		       "\nus start by securing a steady income." +
			   "\nTry buying a Bar Room!");
			
		case 2:
			return
				("\n\nOur casino has two types of income. A" +
				"\nroom generates Tokens and Experience." +
				"\n\nThe Black Jack Room earns much more" +
				"\nExperience than the Bar Room." +
				"\n\nHowever, we need to watch our Tokens" +
				"\nto make sure we can pay out winners" +
				"\nin our gambling rooms.");
		
		default:
	        if (global.level < 7) {
	            return("Congratulations on reaching Level " + string(global.level) + "!" +
					"\n\nKeep gaining Experience to level up" +
					"\nand expand your casino. You can buy" +
					"\nnew rooms with the Tokens you earn.");
	        } else {
	            return("You have fully expanded your" +
					"\ncasino for our Alpha!" +
					"\n\nThank you for playing!!");
	        }
	}
}
