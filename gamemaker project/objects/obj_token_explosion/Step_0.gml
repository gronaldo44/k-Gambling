token_frame++;

// Stop at the last frame
if (npc_frame >= sprite_get_number(npc_sprite)) {
	instance_destroy();
}