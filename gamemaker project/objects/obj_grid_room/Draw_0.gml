// Draw the room's base sprite
if (sprite_index != noone) {
    draw_sprite(sprite_index, image_index, x, y);
}

// Draw the assigned character sprite (if any)
if (room_character_sprite != noone) {
 

    // Adjust character position based on the room type
    switch (roomType) {
        case ROOM_TYPE.BAR:
            character_x_offset = 33;
            character_y_offset = -95; 
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
            character_y_offset = -85;
            break;

        case ROOM_TYPE.SLOTS:
            character_x_offset = 140;
            character_y_offset = -10; 
            break;

        case ROOM_TYPE.ROULETTE:
            character_x_offset = -50;
            character_y_offset = -100; 
            break;

        case ROOM_TYPE.PACHINKO:
            character_x_offset = 140;
            character_y_offset = -10; 
            break;

        case ROOM_TYPE.CRAPS:
            character_x_offset = 0;
            character_y_offset = -85;
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
        .8,                     // X scale
        .8,                     // Y scale
        0,                     // Rotation
        c_white,               // Color tint
        1                      // Alpha
    );
}
