/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 679404D1
draw_self();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 237684F9
/// @DnDArgument : "var" "hud_visible"
/// @DnDArgument : "value" "1"
if(hud_visible == 1){	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 0C125915
	/// @DnDParent : 237684F9
	/// @DnDArgument : "x" "1720"
	/// @DnDArgument : "y" "430"
	/// @DnDArgument : "sprite" "spr_table_ui"
	/// @DnDSaveInfo : "sprite" "spr_table_ui"
	draw_sprite(spr_table_ui, 0, 1720, 430);}