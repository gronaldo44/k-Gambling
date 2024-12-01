width = 950;
height = 500;

sprite_offset_x = 1260; // X position for sprites
sprite_offset_y = 300;  // Y position for sprites

sprite_scale_x = 0.15; // X scale for sprites
sprite_scale_y = 0.15; // Y scale for sprites

text_x_offset = 1250;
text_y_offset = 405;

allow_accept = false; // Disable accept initially
is_opened = false; // Menu has not opened yet

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 100;

pos = 0;

room_loc = -1; // Room location not yet set
visible = true; // Menu is visible by default

option[0] = "Chippy";
option[1] = "Chipper";
option[2] = "Cowman";
option[3] = "Yuki";
option[4] = "Slotsy";
option[5] = "Carbert";
option[6] = "Benjy";

op_length = array_length(option);

// Initialize `close` to prevent errors in the Step event
close = false;

