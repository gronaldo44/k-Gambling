/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 0AA4AA3F
draw_self();

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 27BAA210
/// @DnDArgument : "x" "167"
/// @DnDArgument : "y" "934"
/// @DnDArgument : "caption" ""Tokens: ""
/// @DnDArgument : "var" "global.token"
draw_text(167, 934, string("Tokens: ") + string(global.token));