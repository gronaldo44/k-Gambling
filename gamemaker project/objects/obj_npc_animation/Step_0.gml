// Only update the animation if active
if (npc_active && npc_sprite != noone) {
    npc_frame++;

    // Stop at the last frame
    if (npc_frame >= sprite_get_number(npc_sprite)) {
        npc_frame = sprite_get_number(npc_sprite) - 1; // Stay on the last frame
        npc_active = false; // Animation finished
    }
}

if (room_index != -1) {
    visible = global.is_visible_on_floor(room_index);
}