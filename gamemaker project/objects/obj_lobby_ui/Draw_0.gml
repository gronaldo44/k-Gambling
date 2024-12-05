// Draw the room UI background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

// Draw the options
draw_set_font(fnt_gacha);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Define hover and default box colors
var default_color = c_white;      // Default white color
var hover_color = make_color_rgb(128, 0, 0);  // Dark red for hover effect
var default_font_color = c_black;  // Default black font color
var hover_font_color = c_white;   // White font color when hovered

var text_color = c_black;

// Draw the options with hover effect
for (var i = 0; i < op_length; i++) {
    // Calculate positions for the box and text
    var button_x = x + op_border - 240;
    var button_y = (y + op_border - 200) + op_space * i;

    // Determine box and font color based on hover state
    var box_color = (pos == i) ? hover_color : default_color;
    var font_color = (pos == i) ? hover_font_color : default_font_color;
	
	// Define colors for text
	var stats_text_color = c_black;    // Color for stats text
	var description_text_color = make_color_rgb(0, 0, 0); // Blue for room descriptions



    // Draw the box with hover effect
    draw_sprite_ext(spr_shop_button, 0, button_x - 60, button_y, 0.47, 0.32, 0, box_color, 1);

    // Draw the text
    draw_text_color(button_x - 220, button_y - 30, option[i], font_color, font_color, font_color, font_color, 1);
}

var text_x = 500; 
var text_y = 650;  
var font_scale = .45; 
var text_color = c_black;

draw_text_transformed_color(
    text_x, 
    text_y, 
    "Next selection - Up/down scroll wheel\nExit Menu - Esc", 
    font_scale, 
    font_scale, 
    0, 
    text_color, 
    text_color, 
    text_color, 
    text_color, 
    1
);



if (pos == 0) {
    draw_text_transformed_color(
        900, 400, 
        get_lobby_tip(), 
        0.50, 0.50, 0, 
        text_color, text_color, text_color, text_color, 1
    );
}
if (pos == 1) {
    draw_text_transformed_color(
        900, 400, 
        global.get_room_stats(room_loc), 
        0.60, 0.60, 0, 
        text_color, text_color, text_color, text_color, 1
    );
}