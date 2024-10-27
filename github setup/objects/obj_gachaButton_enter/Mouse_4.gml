/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 3AD17388
/// @DnDArgument : "var" "global.level"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "1"
if(global.level >= 1){	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 23005327
	/// @DnDParent : 3AD17388
	/// @DnDArgument : "room" "room_gacha_menu"
	/// @DnDSaveInfo : "room" "room_gacha_menu"
	room_goto(room_gacha_menu);}