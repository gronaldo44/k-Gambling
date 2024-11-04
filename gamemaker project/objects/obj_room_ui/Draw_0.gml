//draw the shop ui
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 0.85);

//draw the seperator
draw_rectangle_color(1410, 480, 1415, 977, c_white, c_white, c_white, c_white, false);

//draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for ( var i = 0; i < op_length; i++)
	{
	var _c = c_white;
	if(pos == i){_c = c_yellow};
	draw_text_color(x+op_border, y+op_border + op_space*i, option[i], _c, _c ,_c, _c, 1);
	}
	
//display stats of room
if(pos == 0){
	switch (room_type) {
		case ROOM_TYPE.BAR:
			draw_text_transformed(1450, 500, "The Bar generates steady income and is\na strategic asset in any casino. With each \ndrink, patrons stay longer and become\nmore inclined to make risky bets, driving up\nprofits. A well-stocked Bar encourages\nplayers to chase losses and splurge,\nmaking it a powerful tool to boost revenue.", .50, .50, 0);
			break;
			
		case ROOM_TYPE.BLACKJACK:
			draw_text_transformed(1450, 500, "The Blackjack Room is a classic\nattraction that draws players looking for big\nwins. While skilled players can pose a risk,\nthe house edge ensures steady returns.\nUpgrading the room can attract high rollers\nand keep players engaged, making it\na valuable profit source for any casino.", .50, .50, 0);
			break;
		
		default:
			draw_text_transformed(1450, 700, "Gambling is very risky, maybe walk away!", .50, .50, 0);
			break;
	}
}
if(pos == 1){
	switch (room_type) {
		case ROOM_TYPE.BAR:
			draw_text_transformed(1450, 500, global.get_room_stats(room_loc), .50, .50, 0);
			break;
			
		case ROOM_TYPE.BLACKJACK:
			draw_text_transformed(1450, 500, global.get_room_stats(room_loc), .50, .50, 0);
			break;
		
		default:
			draw_text_transformed(1450, 700, "Under Construction", .50, .50, 0);
			break;
	}
}
if(pos == 2){
	draw_text_transformed(1500, 700, "Under Construction", .60, .60, 0);
}