/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 2B368D87
/// @DnDArgument : "value" "15"
/// @DnDArgument : "var" "weeklyEarn"
global.weeklyEarn = 15;

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 294F61CB
/// @DnDApplyTo : {obj_report}
with(obj_report) instance_destroy();