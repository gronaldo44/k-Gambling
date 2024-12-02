// Scroll through the character list using mouse wheel up/down
var up_key = mouse_wheel_up();   // True when mouse wheel is scrolled up
var down_key = mouse_wheel_down();  // True when mouse wheel is scrolled down

// Update position (scroll)
pos += down_key - up_key;
if (pos >= op_length) { 
    pos = 0; 
} else if (pos < 0) { 
    pos = op_length - 1; 
}

// Show debug message only when up or down wheel is scrolled
if (up_key || down_key) {
    show_debug_message("Current selection: " + string(pos) + ", Character: " + option[pos]);
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

