// Draw the shop UI background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

// Set up text properties
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Define hover and default box colors
var default_color = c_white;      // Default white color
var hover_color = make_color_rgb(128, 0, 0);  // Dark red for hover effect
var default_font_color = c_black;  // Default black font color
var hover_font_color = c_white;   // White font color when hovered

// Number of items per column and spacing
var items_per_column = 4;    // Adjust based on the number of options
var column_spacing = 240;    // Horizontal spacing between columns
var row_spacing = op_space;  // Vertical spacing between rows
var x_offset = -360;         // Base x-offset for the left column
var y_offset = -160;         // Base y-offset for rows

// Loop through each character option and draw the name and count
for (var i = 0; i < op_length; i++) {
    // Determine the column and row position
    var column = i div items_per_column; // 0 for left, 1 for right
    var row = i mod items_per_column;

    // Calculate positions for the button and text
    var button_x = x + op_border + x_offset + (column * column_spacing);
    var button_y = y + op_border + y_offset + (row * row_spacing);

    // Determine box and font color based on hover state
    var box_color = (pos == i) ? hover_color : default_color;
    var font_color = (pos == i) ? hover_font_color : default_font_color;

    // Draw the button background
    draw_sprite_ext(spr_shop_button, 0, button_x, button_y, 0.31, 0.32, 0, box_color, 1);

    // Get the name of the character
    var character_name = option[i];
    
    // Get the character ID and count from the global.characters map
    var character_id;

    switch (i) {
        case 0: character_id = CHARACTER.CHIP_GUY; break;
        case 1: character_id = CHARACTER.COOL_CHIP_GUY; break;
        case 2: character_id = CHARACTER.COW_MAN; break;
        case 3: character_id = CHARACTER.THE_GIRL; break;
		case 4: character_id = CHARACTER.SLOTSY; break;
		case 5: character_id = CHARACTER.CARBERT; break;
		case 6: character_id = CHARACTER.BENJY; break;
    }
    var character_count = ds_map_find_value(global.characters, character_id);

    // Draw the character name and count
    var display_text = character_name + " x" + string(character_count);
    draw_text_transformed_color(button_x - 98, button_y - 20, display_text, 0.8, 0.8, 0, font_color, font_color, font_color, font_color, 1);
}

// Use local offsets and scaling for sprite positions
var sprite_x = sprite_offset_x;
var sprite_y = sprite_offset_y;
var scale_x = sprite_scale_x;
var scale_y = sprite_scale_y;


// Display stats for the selected character
if (pos == 0) {
    draw_sprite_ext(spr_Schpguy_splash, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    // Center-align text
    draw_set_halign(fa_center);
    draw_text_transformed_color(
        text_x_offset, 450, 
        "Chip Guy increases token\n earnings by 10%.", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); // Reset alignment to default
}

if (pos == 1) {
    draw_sprite_ext(spr_coolChip_splash, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    // Center-align text
    draw_set_halign(fa_center);
    draw_text_transformed_color(
        text_x_offset, 450, 
        "Cool black chip", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); 
}

if (pos == 2) {
    draw_sprite_ext(spr_cow_splash, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    draw_set_halign(fa_center);
    draw_text_transformed_color(
       text_x_offset, 450, 
        "Cow Man", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); 
}

if (pos == 3) {
    draw_sprite_ext(spr_sgirl_splash, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    draw_set_halign(fa_center);
    draw_text_transformed_color(
       text_x_offset, 450, 
        "Yuki", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); 
}

if (pos == 4) {
    draw_sprite_ext(SA_Slotsy, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    draw_set_halign(fa_center);
    draw_text_transformed_color(
       text_x_offset, 450, 
        "Slotsy", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); 
}

if (pos == 5) {
    draw_sprite_ext(SA_Carbert, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    draw_set_halign(fa_center);
    draw_text_transformed_color(
       text_x_offset, 450, 
        "Carbert", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); 
}

if (pos == 6) {
    draw_sprite_ext(SA_Benjy, 0, sprite_x, sprite_y, scale_x, scale_y, 0, c_white, 1);

    draw_set_halign(fa_center);
    draw_text_transformed_color(
       text_x_offset, 450, 
        "Benjy", 
        0.60, 0.60, 0, 
        c_black, c_black, c_black, c_black, 1
    );
    draw_set_halign(fa_left); 
}