// Draw the room's base sprite
if (sprite_index != noone) {
    draw_sprite(sprite_index, image_index, x, y);
}

// Draw the assigned character sprite (if any)
if (room_character_sprite != noone) {
    // Default offsets
    var character_x_offset = 0;
    var character_y_offset = -50;

    // Adjust character position based on the room type
    switch (roomType) {
        case ROOM_TYPE.BAR:
            character_x_offset = 0;
            character_y_offset = -60; 
            break;

        case ROOM_TYPE.BLACKJACK:
            character_x_offset = 0; 
            character_y_offset = -100; 
            break;

        case ROOM_TYPE.BACCARAT:
            character_x_offset = -0; 
            character_y_offset = -100;
            break;

        case ROOM_TYPE.POKER:
            character_x_offset = 0;
            character_y_offset = -100;
            break;

        case ROOM_TYPE.SLOTS:
            character_x_offset = 90;
            character_y_offset = 30; 
            break;

        case ROOM_TYPE.ROULETTE:
            character_x_offset = 5;
            character_y_offset = -50; 
            break;

        case ROOM_TYPE.PACHINKO:
            character_x_offset = 0;
            character_y_offset = -80; 
            break;

        case ROOM_TYPE.CRAPS:
            character_x_offset = 0;
            character_y_offset = -65;
            break;

        default:
            character_x_offset = 0;
            character_y_offset = -120; 
            break;
    }

    // Draw the character sprite with adjusted offsets
    draw_sprite_ext(
        room_character_sprite, // Sprite of the assigned character
        0,                     // Subimage index
        x + sprite_width / 2 + character_x_offset,  // X position
        y + sprite_height / 2 + character_y_offset, // Y position
        1,                     // X scale
        1,                     // Y scale
        0,                     // Rotation
        c_white,               // Color tint
        1                      // Alpha
    );
}
