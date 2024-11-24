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

// Loop through each character option and draw the name and count
for (var i = 0; i < op_length; i++) {
    // Calculate positions for the button and text
    var button_x = x + op_border - 260;
    var button_y = (y + op_border - 200) + op_space * i;

    // Determine box and font color based on hover state
    var box_color = (pos == i) ? hover_color : default_color;
    var font_color = (pos == i) ? hover_font_color : default_font_color;

    // Draw the button background
    draw_sprite_ext(spr_shop_button, 0, button_x, button_y, 0.6, 0.32, 0, box_color, 1);

    // Get the name of the character
    var character_name = option[i];
    
    // Get the character ID and count from the global.characters map
    var character_id;
    switch (i) {
        case 0: character_id = CHARACTER.CHIP_GUY; break;
        case 1: character_id = CHARACTER.COOL_CHIP_GUY; break;
        case 2: character_id = CHARACTER.COW_MAN; break;
        case 3: character_id = CHARACTER.THE_GIRL; break;
    }
    var character_count = ds_map_find_value(global.characters, character_id);

    // Draw the character name and count
    var display_text = character_name + " x" + string(character_count);
    draw_text_transformed_color(button_x - 205, button_y - 30, display_text, 0.8, 0.8, 0, font_color, font_color, font_color, font_color, 1);
}

// Display stats for the selected character
if (pos == 0) {
    draw_sprite_ext(spr_Schpguy_splash, 0, 1260, 290, .18, .14, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "1.5x wager increase \non table placed at.", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if (pos == 1) {
    draw_sprite_ext(spr_coolChip_splash, 0, 1265, 290, .18, .14, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "2x wager & +1% winrate \nincrease on table placed at.", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if (pos == 2) {
    draw_sprite_ext(spr_cow_splash, 0, 1260, 290, .18, .14, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "5x wager & 15% tip increase \non table placed at.", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if (pos == 3) {
    draw_sprite_ext(spr_sgirl_splash, 0, 1260, 290, .18, .14, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "2x wager & 25% tip increase \non table placed at.", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
