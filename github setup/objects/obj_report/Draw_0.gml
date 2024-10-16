/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 2355AEAE
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 658B5C89
/// @DnDArgument : "font" "fnt_gacha"
/// @DnDSaveInfo : "font" "fnt_gacha"
draw_set_font(fnt_gacha);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 3F3B5A5F
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 69C7C30F
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""Profit ""
/// @DnDArgument : "var" "global.weeklyprofit"
draw_text(x + 0, y + 0, string("Profit ") + string(global.weeklyprofit));

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 6756C931
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "40"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""Loss ""
/// @DnDArgument : "var" "global.weeklyloss"
draw_text(x + 0, y + 40, string("Loss ") + string(global.weeklyloss));

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 6B77CEDA
draw_set_halign(fa_left);
draw_set_valign(fa_top);