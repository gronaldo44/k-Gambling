/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 20364522
draw_self();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 237684F9
/// @DnDArgument : "var" "hud_visible"
/// @DnDArgument : "value" "1"
if(hud_visible == 1){	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 1940930E
	/// @DnDParent : 237684F9
	/// @DnDArgument : "color" "$FF4C8D99"
	draw_set_colour($FF4C8D99 & $ffffff);
	var l1940930E_0=($FF4C8D99 >> 24);
	draw_set_alpha(l1940930E_0 / $ff);

	/// @DnDAction : YoYo Games.Drawing.Draw_Rectangle
	/// @DnDVersion : 1
	/// @DnDHash : 3652E82B
	/// @DnDParent : 237684F9
	/// @DnDArgument : "x1" "639"
	/// @DnDArgument : "y1" "680"
	/// @DnDArgument : "x2" "690"
	/// @DnDArgument : "y2" "910"
	/// @DnDArgument : "fill" "1"
	draw_rectangle(639, 680, 690, 910, 0);}