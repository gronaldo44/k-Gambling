/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7976398F
/// @DnDArgument : "var" "global.isPrepare"
/// @DnDArgument : "value" "true"
if(global.isPrepare == true){	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 49B8444E
	/// @DnDParent : 7976398F
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "isPrepare"
	global.isPrepare = false;

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 73DF01F0
	/// @DnDParent : 7976398F
	alarm_set(0, 30);}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 04C7207E
else{	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 2EEA55DF
	/// @DnDParent : 04C7207E
	/// @DnDArgument : "value" "true"
	/// @DnDArgument : "var" "isPrepare"
	global.isPrepare = true;

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 6D7B3E66
	/// @DnDParent : 04C7207E
	/// @DnDArgument : "alarm" "1"
	alarm_set(1, 30);}