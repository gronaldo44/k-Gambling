//draw the shop ui
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 0.85);

//draw the seperator
draw_rectangle_color(1480, 417, 1485, 914, c_white, c_white, c_white, c_white, false);

//draw the sprite display box
draw_rectangle_color(1580, 450, 1820, 620, c_white, c_white, c_white, c_white, true);

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
	draw_sprite_ext(spr_rec, 0, 1700, 535, .35, .33, 0, c_white, 1);
	draw_text_transformed(1500, 700, "+100 tokens (One-Time)", .75, .75, 0);
}
if(pos == 1){
	draw_sprite_ext(spr_bar, 0, 1700, 535, .35, .33, 0, c_white, 1);
	draw_text_transformed(1500, 700, "+1 coin every 5 seconds", .75, .75, 0);
}
if(pos == 2){
	draw_sprite_ext(spr_black_jack, 0, 1700, 535, .35, .33, 0, c_white, 1);
	draw_text_transformed(1500, 700, "51% for +1 token, 49% for -1", .75, .75, 0);
}