/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7E6390CA
/// @DnDArgument : "var" "global.level"
/// @DnDArgument : "op" "2"
if(global.level > 0){	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 240805AB
	/// @DnDParent : 7E6390CA
	/// @DnDArgument : "code" "global.isPrepare = false;$(13_10)$(13_10)global.daytimer += 10;$(13_10)$(13_10)alarm_set(0, 20);$(13_10)$(13_10)bus = true;"
	global.isPrepare = false;
	
	global.daytimer += 10;
	
	alarm_set(0, 20);
	
	bus = true;}