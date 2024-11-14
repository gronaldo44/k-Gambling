// Draw the shop UI background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

// Set up text properties
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Loop through each character option and draw the name and count
for (var i = 0; i < op_length; i++) {
    var _c = c_black;
    if (pos == i) { _c = #800000; } // Highlight selected option in dark red

    // Draw the button background
    draw_sprite_ext(spr_shop_button, 0, x + op_border - 260, (y + op_border - 200) + op_space * i, 0.6, 0.32, 0, c_white, 1);
    
    // Get the name of the character
    var character_name = option[i];
    
    // Get the character count from the global.characters map
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
    draw_text_transformed_color(x + op_border - 465, (y + op_border - 230) + op_space * i, display_text, 0.8, 0.8, 0, _c, _c, _c, _c, 1);
}

// Display stats for the selected character
if (pos == 0) {
    draw_sprite_ext(spr_Schpguy_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "Red chip", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if (pos == 1) {
    draw_sprite_ext(spr_coolChip_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "Cool black chip", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if (pos == 2) {
    draw_sprite_ext(spr_cow_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "Cow Man", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
if (pos == 3) {
    draw_sprite_ext(spr_sgirl_splash, 0, 1260, 270, .20, .16, 0, c_white, 1);
    draw_text_transformed_color(1050, 450, "Yuki", .60, .60, 0, c_black, c_black, c_black, c_black, 1);
}
