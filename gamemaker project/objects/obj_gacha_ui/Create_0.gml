width = 950;
height = 500;

sprite_offset_x = 1260; //X position for sprites
sprite_offset_y = 300;  //Y position sprites

sprite_scale_x = 0.15; //X scale sprites
sprite_scale_y = 0.15; //Y scale sprites

text_x_offset = 1250;


allow_accept = false;
is_opened = false;

sub_width = 240;
sub_height = 170;

op_border = 8;
op_space = 100;

pos = 0;

room_loc = -1;
visible = true;

option[0] = "Chippy";
option[1] = "Chipper"
option[2] = "Cowman"
option[3] = "Yuki"
option[4] = "Slotsy"
option[5] = "Carbert"
option[6] = "Benjy"
option[7] = "Characters"

op_length = array_length(option);

var has_characters = false;
for (var i = 0; i < 7; i++) { // Only check character slots (0-6)
    var character_id;
    switch (i) {
        case 0: character_id = CHARACTER.CHIP_GUY; break;
        case 1: character_id = CHARACTER.COOL_CHIP_GUY; break;
        case 2: character_id = CHARACTER.COW_MAN; break;
        case 3: character_id = CHARACTER.THE_GIRL; break;
        case 4: character_id = CHARACTER.SLOTSY; break;
        case 5: character_id = CHARACTER.CARBERT; break;
        case 6: character_id = CHARACTER.BENJY; break;
    }
    if (ds_map_find_value(global.characters, character_id) > 0) {
        has_characters = true;
        break;
    }
}

// Store whether characters are available
global.has_characters = has_characters;

// Set default position
pos = has_characters ? 0 : 7;

