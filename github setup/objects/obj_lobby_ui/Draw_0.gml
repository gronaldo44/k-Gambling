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
	draw_text_transformed(1450, 500, get_lobby_tip(), .50, .50, 0);
}
if(pos == 1){
	draw_text_transformed(1500, 700, "Under Construction", .75, .75, 0);
}
if(pos == 2){
	draw_text_transformed(1500, 500, global.get_room_stats(room_loc), .60, .60, 0);
}