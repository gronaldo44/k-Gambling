/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5278F0DE
/// @DnDArgument : "code" "// Scroll through the character list$(13_10)var up_key = keyboard_check_pressed(mouse_wheel_down());$(13_10)var down_key = keyboard_check_pressed(mouse_wheel_up());$(13_10)$(13_10)// Update position (scroll)$(13_10)pos += down_key - up_key;$(13_10)if (pos >= op_length) { $(13_10)    pos = 0; $(13_10)} else if (pos < 0) { $(13_10)    pos = op_length - 1; $(13_10)}$(13_10)$(13_10)// Close the menu when necessary$(13_10)if (keyboard_check_pressed(vk_escape) || close) {$(13_10)    visible = false;$(13_10)    global.uiopen = false;$(13_10)    instance_destroy();$(13_10)    show_debug_message("Character Archive UI closed.");$(13_10)}$(13_10)$(13_10)// Ensure the menu is visible and opened$(13_10)if (visible && !is_opened) {$(13_10)    is_opened = true;  // Mark as opened$(13_10)}$(13_10)$(13_10)// Debugging (optional)$(13_10)show_debug_message("Current selection: " + string(pos) + ", Character: " + option[pos]);$(13_10)"
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