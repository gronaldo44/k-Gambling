// Check if the sprite exists
if (npc_sprite != noone) {
    // Hardcode scale and size
    var scale_x = .8; // Horizontal scale (adjust as needed)
    var scale_y = .8; // Vertical scale (adjust as needed)
    var offset_x = 200; // Horizontal offset (fine-tuning position)
    var offset_y = 250; // Vertical offset (fine-tuning position)

    // Draw the sprite with hardcoded scale and offsets
    draw_sprite_ext(
        npc_sprite,  // The sprite
        npc_frame,   // The current frame
        x + offset_x, // X position with offset
        y + offset_y, // Y position with offset
        scale_x,     // X scale
        scale_y,     // Y scale
        0,           // Rotation (default 0)
        c_white,     // Color tint
        1            // Alpha (default 1)
    );
}
