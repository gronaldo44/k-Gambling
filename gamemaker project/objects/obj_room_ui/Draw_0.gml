//draw the shop ui
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for ( var i = 0; i < op_length; i++)
	{
	var _c = c_black;
	draw_sprite_ext(spr_shop_button, 0, x+op_border - 260, (y+op_border - 200) + op_space*i, 0.6, 0.32, 0, c_white, 1)
	if(pos == i){_c = #800000};
	draw_text_color(x+op_border - 465, (y+op_border - 230) + op_space*i, option[i], _c, _c ,_c, _c, 1);
	}
	
//display stats of room
if(pos == 0){
	switch (room_type) {
		case ROOM_TYPE.BAR:
			draw_text_transformed(1020, 400, "The Bar generates steady income and is\na strategic asset in any casino. With each \ndrink, patrons stay longer and become\nmore inclined to make risky bets, driving up\nprofits. A well-stocked Bar encourages\nplayers to chase losses and splurge,\nmaking it a powerful tool to boost revenue.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.BLACKJACK:
			draw_text_transformed(1020, 400, "The Blackjack Room is a classic\nattraction that draws players looking for big\nwins. While skilled players can pose a risk,\nthe house edge ensures steady returns.\nUpgrading the room can attract high rollers\nand keep players engaged, making it\na valuable profit source for any casino.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.CRAPS:
			draw_text_transformed(1020, 400, "Craps became popular during World War II\nwhen service members played it on blankets.\nAfter the war, craps became a dominant\ncasino game in Las Vegas and the Caribbean.\nOnline casinos began offering craps after\n2004, spreading the game globally.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.BACCARAT:
			draw_text_transformed(1020, 400, "The game's exact origins are unknown,\nbut it's believed to have been invented in\n1500s Rome, Italy. The name 'baccara'\ncomes from the Italian word for 'zero,'\nwhich refers to the value of tens, jacks,\nqueens, and kings in the game.", .50, .50, 0);
			break;
			
			
		case ROOM_TYPE.ROULETTE:
			draw_text_transformed(1020, 400, "Each spin of the wheel provides a multitude\nof options for the player. A player may bet\non single numbers, rows of numbers, or on\nadjacent numbers. A player also may play\ncolors, odd or even numbers, among others.\nA bet on a single number pays 35 to 1,\nincluding the 0 and 00. Bets on red or black,\nodd or even pay 1 for 1, or even money.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.POKER:
			draw_text_transformed(1020, 400, "Only about 5% of people who play poker\nin casinos or online are winners. Many\npeople try poker once without knowing\nhow to play and end up losing money.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.PACHINKO:
			draw_text_transformed(1020, 400, "Many might regard pachinko as a form of\ngambling, but technically speaking it is not.\nInstead of cash rewards, the winners of\npachinko get prizes like candy, T-shirts, and\ncosmetics, etc. However, the winners can\ntake these prizes to a nearby kankin, which\nis a place for exchanging their prizes for\nreal cash and is often located in a small hut.\nThese kankins sell back the prizes to the\nparlor, and hence the process is repeated.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.SLOTS:
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
if(pos == 3){

	var room_char = global.get_roomChar(room_loc)
	if (room_char >= 0){
		// Display the char sprite
		switch(c){
			case CHARACTER.CHIP_GUY:
				draw_sprite_ext(spr_Schpguy_splash, 0, 1199, 270, .35, .33, 0, c_white, 1);
				break;
			
			case CHARACTER.COOL_CHIP_GUY:
				draw_sprite_ext(spr_coolChip_splash, 0, 1199, 270, .35, .33, 0, c_white, 1);
				break;
		
			case CHARACTER.COW_MAN:
				draw_sprite_ext(spr_cow_splash, 0, 1199, 270, .35, .33, 0, c_white, 1);
				break;
		
			case CHARACTER.SLOTSY:
				draw_sprite_ext(spr_splash_yuki, 0, 1199, 270, .35, .33, 0, c_white, 1);
				break;
		
			case CHARACTER.THE_GIRL:
				draw_sprite_ext(spr_splash_yuki, 0, 1199, 270, .35, .33, 0, c_white, 1);
				break;
		}
	} else {
		draw_text_transformed(1020, 400, "No Employee working in this room", .60, .60, 0);	
	}
}