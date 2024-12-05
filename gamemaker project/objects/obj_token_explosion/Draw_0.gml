// Hardcode scale and size
var scale_x = 1; // Horizontal scale (adjust as needed)
var scale_y = 1; // Vertical scale (adjust as needed)
var offset_x = 0; // Horizontal offset (fine-tuning position)
var offset_y = 0; // Vertical offset (fine-tuning position)

// Draw the sprite with hardcoded scale and offsets
draw_sprite_ext(
	sprite_index,  // The sprite
	token_frame,   // The current frame
	x + offset_x, // X position with offset
	y + offset_y, // Y position with offset
	scale_x,     // X scale
	scale_y,     // Y scale
	0,           // Rotation (default 0)
	c_white,     // Color tint
	1            // Alpha (default 1)
);