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
			
		case ROOM_TYPE.BACCARAT:
			draw_text_transformed(1020, 400, "The game's exact origins are unknown,\nbut it's believed to have been invented in 1500s Rome, Italy.\nThe name baccara comes from the Italian word for\nzero, which refers to the value of tens,\njacks, queens, and kings in the game.", .50, .50, 0);
			break;
		case ROOM_TYPE.CRAPS:
			draw_text_transformed(1020, 400, "The Blackjack Room is a classic\nattraction that draws players looking for big\nwins. While skilled players can pose a risk,\nthe house edge ensures steady returns.\nUpgrading the room can attract high rollers\nand keep players engaged, making it\na valuable profit source for any casino.", .50, .50, 0);
			break;
		case ROOM_TYPE.POKER:
			draw_text_transformed(1020, 400, "Only about 5% of people who play poker in casinos\n or online are winners. Many people try\npoker once without knowing how\nto play and end up losing money.", .50, .50, 0);
			break;
		case ROOM_TYPE.ROULETTE:
			draw_text_transformed(1020, 400, "Each spin of the wheel provides a\nmultitude of options for the player.\nA player may bet on single numbers, rows\nof numbers, or on adjacent numbers.\nA player also may play colors, odd or even numbers,\namong others. A bet on a single number\npays 35 to 1, including the 0 and 00. Bets\non red or black, odd or even pay 1 for 1,\nor even money", .50, .50, 0);
			break;
		case ROOM_TYPE.PACHINKO:
			draw_text_transformed(1020, 400, "Gambling is banned in Japan but\nthey get around it with Pachinko.\nThe way they get around it is by having a different store\npurchase the metal balls you get from\nPachinko and exchange them for money.", .50, .50, 0);
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
	switch (room_type) {
		case ROOM_TYPE.BAR:
			draw_text_transformed(1020, 400, global.get_room_stats(room_loc), .45, .45, 0);
			break;
			
		case ROOM_TYPE.BLACKJACK:
			draw_text_transformed(1020, 400, global.get_room_stats(room_loc), .45, .45, 0);
			break;
			
			case ROOM_TYPE.BACCARAT:
			draw_text_transformed(1020, 400, global.get_room_stats(room_loc), .45, .45, 0);
			break;
		
		default:
			draw_text_transformed(1020, 400, "Under Construction", .45, .45, 0);
			break;
	}
}
if(pos == 2){
	draw_text_transformed(1020, 400, "Under Construction", .60, .60, 0);
}
if(pos == 3){
	//draw_roundrect_ext(1200, 250, 1400, 350, 1, 1, false);
}