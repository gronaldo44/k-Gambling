// Scroll through the character list
var up_key = keyboard_check_pressed(mouse_wheel_down());
var down_key = keyboard_check_pressed(mouse_wheel_up());

// Update position (scroll)
pos += down_key - up_key;
if (pos >= op_length) { 
    pos = 0; 
} else if (pos < 0) { 
    pos = op_length - 1; 
}

// Close the menu when necessary
if (keyboard_check_pressed(vk_escape) || close) {
    visible = false;
    global.uiopen = false;
    instance_destroy();
    show_debug_message("Character Archive UI closed.");
}

// Ensure the menu is visible and opened
if (visible && !is_opened) {
    is_opened = true;  // Mark as opened
}

// Debugging (optional)
show_debug_message("Current selection: " + string(pos) + ", Character: " + option[pos]);
