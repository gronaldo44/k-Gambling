// Draw the shop UI background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

// Draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Define hover and default box colors
var default_color = c_white;  // Default white color
var hover_color = make_color_rgb(128, 0, 0);  // Dark red for hover effect

// Define the number of items per column and the spacing between columns
var items_per_column = 5; // Number of items in each column
var column_spacing = 250; // Horizontal spacing between columns
var x_offset_left = -370; // X offset for the left column
var x_offset_right = -120; // X offset for the right column

// Draw the options with two columns
for (var i = 0; i < op_length; i++) {
    var _c = c_black;
    if (pos == i) { _c = #FFFFFF; } // Highlight text in dark red when hovered

    // Determine row and column positions
    var row = i mod items_per_column; // Row number (0, 1, or 2)
    var column = i div items_per_column; // Column number (0 for left, 1 for right)

    // Calculate x and y positions for each button based on row and column
    var button_x = x + op_border + (column == 0 ? x_offset_left : x_offset_right);
    var button_y = (y + op_border - 210) + op_space * row;

    // Determine the box color
    var box_color = (pos == i) ? hover_color : default_color;

    // Draw the box with hover effect
    draw_sprite_ext(spr_shop_button, 0, button_x, button_y, 0.29, 0.32, 0, box_color, 1);

    // Draw the option text
    draw_text_transformed_color(button_x - 95, button_y - 20, option[i], 0.8, 0.8, 0, _c, _c, _c, _c, 1);
}

	
//display stats of room
if(pos == 0){
	//draws the sprite of the room into the display box
	draw_sprite_ext(spr_bar, 0, 1199, 270, .35, .33, 0, c_white, 1);
	//info text of the room
	draw_text_transformed_color(1000, 380, "Income: +6 coin every second", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [75] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if(pos == 1){
	draw_sprite_ext(spr_black_jack_2, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 52% for +20 tokens,\n48% for -20 tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [125] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 2){
	draw_sprite_ext(spr_craps, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 54% for +50 tokens,\n46% for -50 tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [180] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}


if(pos == 3){
	draw_sprite_ext(spr_baccarat, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 56% for +90 tokens,\n44% for -90 tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [250] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 480, "Room ability: Every time you lose there is\na chance to turn it into a tie where no\ntokens are losed or gained. Portion of that\nwager are stashed away and are cashed\nout after a certain hold", .45, .45, 0, c_black, c_black, c_black, c_black, 1);
}


if(pos == 4){
	draw_sprite_ext(spr_poker, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 58% for +150 tokens,\n42% for -150 tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [350] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_color(1000, 480, "Room ability: Every time you lose some of\nthe bet gets stashed away. After 5 total\nloses cashout that stash", .45, .45, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 5){
	draw_sprite_ext(spr_roulette, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 62% for +200 tokens,\n38% for -200 tokens", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [475] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 480, "Room ability: On a win there is a chance\nto 35x your wager", .45, .45, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 6){
	draw_sprite_ext(spr_pachinko, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 66% for +300 tokens,\n34% for -300 tokens", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [580] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 480, "Room ability: On a win there is a chance\nto hit a muiltpler on your bet. It can range\nfrom 1x, 5x, 10x 25x your wager ", .45, .45, 0, c_black, c_black, c_black, c_black, 1);
}

if(pos == 7){
	draw_sprite_ext(spr_slots, 0, 1199, 270, .44, .41, 0, c_white, 1);
	draw_text_transformed_color(1000, 380, "Income: 72% for +400 tokens,\n28% for -400 tokens", .55, .55, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 445, "Costs : [700] tokens", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(1000, 480, "Room ability: Small chance on a win to\nwin the jackbot. 1000x your wager", .45, .45, 0, c_black, c_black, c_black, c_black, 1);
}

