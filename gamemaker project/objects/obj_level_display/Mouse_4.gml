/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 6A58DDEC
/// @DnDArgument : "var" "global.level"
if(global.level == 0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 1F03BD6A
	/// @DnDParent : 6A58DDEC
	/// @DnDArgument : "steps" "10"
	/// @DnDArgument : "alarm" "2"
	alarm_set(2, 10);
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 07B8CA06
/// @DnDArgument : "var" "global.level"
/// @DnDArgument : "value" "1"
if(global.level == 1)
{
	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 642F7D3F
	/// @DnDParent : 07B8CA06
	/// @DnDArgument : "steps" "10"
	/// @DnDArgument : "alarm" "3"
	alarm_set(3, 10);
}