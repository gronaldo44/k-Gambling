token_frame++;

if (image_index >= image_number - 1) {
    instance_destroy();
}

if (room_index != -1) {
    visible = global.is_visible_on_floor(room_index);
}