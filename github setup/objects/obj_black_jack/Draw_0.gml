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
	draw_sprite(spr_table_ui, 0, 1720, 430);

	/// @DnDAction : YoYo Games.Drawing.Draw_Rectangle
	/// @DnDVersion : 1
	/// @DnDHash : 20FACF8D
	/// @DnDParent : 237684F9
	/// @DnDArgument : "x1" "230"
	/// @DnDArgument : "y1" "30"
	/// @DnDArgument : "x2" "1260"
	/// @DnDArgument : "y2" "200"
	/// @DnDArgument : "fill" "1"
	draw_rectangle(230, 30, 1260, 200, 0);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 424CEAEE
	/// @DnDParent : 237684F9
	/// @DnDArgument : "color" "$FFFF4B38"
	draw_set_colour($FFFF4B38 & $ffffff);
	var l424CEAEE_0=($FFFF4B38 >> 24);
	draw_set_alpha(l424CEAEE_0 / $ff);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 536C8956
	/// @DnDParent : 237684F9
	/// @DnDArgument : "x" "235"
	/// @DnDArgument : "y" "50"
	/// @DnDArgument : "caption" ""BlackJack: ""
	/// @DnDArgument : "var" ""The biggest advantage the dealer gets is the player having to act first which allows them to bust even before the dealer has played hence increasing the the dealers odds""
	draw_text(235, 50, string("BlackJack: ") + string("The biggest advantage the dealer gets is the player having to act first which allows them to bust even before the dealer has played hence increasing the the dealers odds"));

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 3121942B
	/// @DnDParent : 237684F9
	draw_set_colour($FFFFFFFF & $ffffff);
	var l3121942B_0=($FFFFFFFF >> 24);
	draw_set_alpha(l3121942B_0 / $ff);}