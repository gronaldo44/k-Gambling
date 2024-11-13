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
	draw_sprite_ext(spr_Schpguy_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
	//info text of the room
	draw_text_transformed_color(1050, 450, "Red chip", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 1){
	draw_sprite_ext(spr_coolChip_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
	draw_text_transformed_color(1050, 450, "Cool black chip", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 2){
	draw_sprite_ext(spr_cow_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
	draw_text_transformed_color(1050, 450, "Cow Man", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 3){
	draw_sprite_ext(spr_sgirl_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
	draw_text_transformed_color(1050, 450, "Cow Man", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}