//draw the shop ui
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for ( var i = 0; i < 4; i++)
	{
	var _c = c_black;
	if(pos == i){_c = #800000};
	draw_sprite_ext(spr_shop_button, 0, x+op_border - 260, (y+op_border - 200) + op_space*i, 0.6, 0.32, 0, c_white, 1)
	draw_text_transformed_color(x+op_border - 465, (y+op_border - 230) + op_space*i, option[i], 0.8, 0.8, 0, _c, _c ,_c, _c, 1);
	}
	
//display stats of room
if(pos == 0){
	//draws the sprite of the room into the display box
	draw_sprite_ext(spr_bar, 0, 1199, 270, .35, .33, 0, c_white, 1);
	//info text of the room
	draw_text_transformed_color(1020, 400, "+6 coin every second", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 1){
	draw_sprite_ext(spr_black_jack_2, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "51% for +20 token, 49% for -20", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 2){
	draw_sprite_ext(spr_black_jack_2, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "56% for +90 token, 44% for -90", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}