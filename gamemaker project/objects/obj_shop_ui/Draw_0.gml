//draw the shop ui
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
//MUST CHANGED CODE LATER
// Define the number of items per column and the spacing between columns
var items_per_column = 5; // Number of items in each column
var column_spacing = 250; // Horizontal spacing between columns
var x_offset_left = -370; // X offset for the left column
var x_offset_right = -120; // X offset for the right column

// Draw the options with two columns
for (var i = 0; i < op_length; i++) {
    var _c = c_black;
    if (pos == i) { _c = #800000; } // Highlight selected option in dark red

    // Determine row and column positions
    var row = i mod items_per_column; // Row number (0, 1, or 2)
    var column = i div items_per_column; // Column number (0 for left, 1 for right)

    // Calculate x and y positions for each button based on row and column
    var button_x = x + op_border + (column == 0 ? x_offset_left : x_offset_right); // Adjust x by column
    var button_y = (y + op_border - 210) + op_space * row; // Adjust y by row

    // Draw white box (button background)
    draw_sprite_ext(spr_shop_button, 0, button_x, button_y, 0.29, 0.32, 0, c_white, 1);

    // Draw option text
    draw_text_transformed_color(button_x - 95, button_y - 20, option[i], 0.8, 0.8, 0, _c, _c, _c, _c, 1);
}
	
//display stats of room
if(pos == 0){
	//draws the sprite of the room into the display box
	draw_sprite_ext(spr_bar, 0, 1199, 270, .35, .33, 0, c_white, 1);
	//info text of the room
	draw_text_transformed_color(1020, 400, "+6 coin every second", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [75] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 1){
	draw_sprite_ext(spr_black_jack_2, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "52% for +20 token, 48% for -20", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [125] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 2){
	draw_sprite_ext(spr_craps, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "54% for +50 token, 46% for -50", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [180] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}


if(pos == 3){
	draw_sprite_ext(spr_baccarat, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "56% for +90 token, 44% for -90", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [250] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}


if(pos == 4){
	draw_sprite_ext(spr_poker, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "58% for +150 token, 42% for -150", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [350] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 5){
	draw_sprite_ext(spr_roulette, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "62% for +200 token, 38% for -200", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [475] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 6){
	draw_sprite_ext(spr_pachinko, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "66% for +300 token, 34% for -300", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [580] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 7){
	draw_sprite_ext(spr_slots, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1010, 400, "72% for +400 token, 28% for -400", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1020, 450, "Costs : [700] tokens", .75, .75, 0, c_black, c_black, c_black, c_black, 1);
}

