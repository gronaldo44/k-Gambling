// Draw the room UI background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

// Draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Define hover and default box colors
var default_color = c_white;      // Default white color
var hover_color = make_color_rgb(128, 0, 0);  // Dark red for hover effect
var default_font_color = c_black;  // Default black font color
var hover_font_color = c_white;   // White font color when hovered

// Draw the options with hover effect
for (var i = 0; i < op_length; i++) {
    // Calculate positions for the box and text
    var button_x = x + op_border - 260;
    var button_y = (y + op_border - 200) + op_space * i;

    // Determine box and font color based on hover state
    var box_color = (pos == i) ? hover_color : default_color;
    var font_color = (pos == i) ? hover_font_color : default_font_color;
	
	// Define colors for text
	var stats_text_color = c_black;    // Color for stats text
	var description_text_color = make_color_rgb(0, 0, 0); // Blue for room descriptions

	// Set the text color for descriptions
	draw_set_color(description_text_color);


    // Draw the box with hover effect
    draw_sprite_ext(spr_shop_button, 0, button_x, button_y, 0.6, 0.32, 0, box_color, 1);

    // Draw the text
    draw_text_color(button_x - 205, button_y - 30, option[i], font_color, font_color, font_color, font_color, 1);
}
//display stats of room
if(pos == 0){
	switch (room_type) {
		case ROOM_TYPE.BAR:
			draw_sprite_ext(BTO_Bar, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "The Bar generates steady income and is\na strategic asset in any casino. With each \ndrink, patrons stay longer and become\nmore inclined to make risky bets, driving up\nprofits. A well-stocked Bar encourages\nplayers to chase losses and splurge,\nmaking it a powerful tool to boost revenue.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.BLACKJACK:
			draw_sprite_ext(Building_Blackjack, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "The Blackjack Room is a classic\nattraction that draws players looking for big\nwins. While skilled players can pose a risk,\nthe house edge ensures steady returns.\nUpgrading the room can attract high rollers\nand keep players engaged, making it\na valuable profit source for any casino.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.CRAPS:
			draw_sprite_ext(Building_ZCraps, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "Craps became popular during World War II\nwhen service members played it on blankets.\nAfter the war, craps became a dominant\ncasino game in Las Vegas and the Caribbean.\nOnline casinos began offering craps after\n2004, spreading the game globally.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.BACCARAT:
			draw_sprite_ext(BTO_Bacarat_Table, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "The game's exact origins are unknown,\nbut it's believed to have been invented in\n1500s Rome, Italy. The name 'baccara'\ncomes from the Italian word for 'zero,'\nwhich refers to the value of tens, jacks,\nqueens, and kings in the game.", .50, .50, 0);
			break;
			
			
		case ROOM_TYPE.ROULETTE:
			draw_sprite_ext(BTO_Roulette_Table, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "Each spin of the wheel provides a multitude\nof options for the player. A player may bet\non single numbers, rows of numbers, or on\nadjacent numbers. A player also may play\ncolors, odd or even numbers, among others.\nA bet on a single number pays 35 to 1,\nincluding the 0 and 00. Bets on red or black,\nodd or even pay 1 for 1, or even money.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.POKER:
			draw_sprite_ext(spr_pokerUI, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "Only about 5% of people who play poker\nin casinos or online are winners. Many\npeople try poker once without knowing\nhow to play and end up losing money.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.PACHINKO:
			draw_sprite_ext(Building_Pachinko, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "Many might regard pachinko as a form of\ngambling, but technically speaking it is not.\nInstead of cash rewards, the winners of\npachinko get prizes like candy, T-shirts, and\ncosmetics, etc. However, the winners can\ntake these prizes to a nearby kankin, which\nis a place for exchanging their prizes for\nreal cash and is often located in a small hut.\nThese kankins sell back the prizes to the\nparlor, and hence the process is repeated.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.SLOTS:
			draw_sprite_ext(spr_slotsUI, 0, 1145, 220, .44, .41, 0, c_white, 1);
			draw_text_transformed(1020, 400, "Slot machines contribute about 70% of\nthe average US casino's income.", .50, .50, 0);
			break;
		
		default:
			draw_text_transformed(1020, 400, "Gambling is very risky, maybe walk away!", .50, .50, 0);
			break;
	}
}
if(pos == 1){
	draw_text_transformed(1020, 400, global.get_room_stats(room_loc), .45, .45, 0);
}
if(pos == 2){
	draw_text_transformed(1020, 400, "Under Construction", .60, .60, 0);
}


if (pos == 3) {
    var room_char = global.get_roomChar(room_loc);

    if (room_char >= 0) {
        var char_name = global.char_getCharacterName(room_char);
        var char_function = ""; // Placeholder for character functionality description
        var char_sprite = noone; // Placeholder for character sprite

        // Define functionality and sprite for each character
        switch (room_char) {
            case CHARACTER.CHIP_GUY:
                char_function = "Chippy increases token earnings by 10%.";
                char_sprite = spr_Schpguy_splash;
                break;
            case CHARACTER.COOL_CHIP_GUY:
                char_function = "Chipper boosts wager win rate by 2%.";
                char_sprite = spr_coolChip_splash
                break;
            case CHARACTER.COW_MAN:
                char_function = "CowMan doubles token wager amounts.";
                char_sprite = spr_cow_splash;
                break;
            case CHARACTER.THE_GIRL:
                char_function = "Yuki reduces token losses by 50%.";
                char_sprite = spr_sgirl_splash;
                break;
            default:
                char_function = "No functionality assigned.";
                char_sprite = noone;
                break;
        }

        // Independent positions for the components
        var frame_x = 1150; // Frame position X
        var frame_y = 250;  // Frame position Y
        var frame_width = 200; // Frame width
        var frame_height = 200; // Frame height

        var sprite_x = 1250; // Sprite position X
        var sprite_y = 350;  // Sprite position Y

        var name_x = 1250;   // Name position X
        var name_y = 460;    // Name position Y

        var function_x = 1250; // Functionality description position X
        var function_y = 520;  // Functionality description position Y

        // Draw the frame
        draw_rectangle_color(
            frame_x, frame_y, 
            frame_x + frame_width, frame_y + frame_height, 
            make_color_rgb(240, 240, 240), make_color_rgb(240, 240, 240), 
            make_color_rgb(240, 240, 240), make_color_rgb(240, 240, 240), 
            false
        );

        // Draw the character sprite
        if (char_sprite != noone) {
            draw_sprite_ext(
                char_sprite,  // Character's sprite
                0,            // Subimage index
                sprite_x,     // Independent sprite X
                sprite_y,     // Independent sprite Y
                0.2,          // X scale (smaller to fit the UI)
                0.2,          // Y scale
                0,            // Rotation
                c_white,      // Color tint
                1             // Alpha
            );
        }

        // Draw the character's name
        draw_set_halign(fa_center);
        draw_text_transformed_color(
            name_x, name_y, char_name, 
            0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1
        );

        // Draw the character's functionality description
        draw_text_transformed_color(
            function_x, function_y, char_function, 
            0.4, 0.4, 0, c_black, c_black, c_black, c_black, 1
        );
        draw_set_halign(fa_left);
    } else {
        draw_text_transformed(1020, 400, "No Employee working in this room", 0.6, 0.6, 0);
    }
}



