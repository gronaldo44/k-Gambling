//draw the shop ui
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var items_per_column = 5; // Number of items in each column
var column_spacing = 250; // Horizontal spacing between columns
var x_offset_left = -370; // X offset for the left column
var x_offset_right = -120; // X offset for the right column

for ( var i = 0; i < op_length; i++)
	{
	var _c = c_black;
	if(pos == i){_c = #800000};
	
	// Determine row and column positions
    var row = i mod items_per_column; // Row number (0, 1, or 2)
    var column = i div items_per_column; // Column number (0 for left, 1 for right)
	// Calculate x and y positions for each button based on row and column
    var button_x = x + op_border + (column == 0 ? x_offset_left : x_offset_right); // Adjust x by column
    var button_y = (y + op_border - 210) + op_space * row; // Adjust y by row
	
	draw_sprite_ext(spr_shop_button, 0, button_x, button_y, 0.29, 0.32, 0, c_white, 1);
	
	// Draw option text
    draw_text_transformed_color(button_x - 95, button_y - 20, option[i], 0.8, 0.8, 0, _c, _c, _c, _c, 1);
	}
	
//display stats of room
if(pos == 0){
	draw_text_transformed(900, 400, get_lobby_tip(), .50, .50, 0);
}
if(pos == 1){
	draw_text_transformed(900, 400, "Under Construction", .75, .75, 0);
}
if(pos == 2){
	draw_text_transformed(900, 400, global.get_room_stats(room_loc), .60, .60, 0);
}