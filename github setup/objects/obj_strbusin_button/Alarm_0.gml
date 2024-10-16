/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3744297B
/// @DnDArgument : "expr" ""next week""
variable = "next week";

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 1690C3E5
/// @DnDArgument : "xpos" "960"
/// @DnDArgument : "ypos" "560"
/// @DnDArgument : "objectid" "obj_report"
/// @DnDSaveInfo : "objectid" "obj_report"
instance_create_layer(960, 560, "Instances", obj_report);

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 4DA877F0
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "objectid" "obj_nextweek_button"
/// @DnDSaveInfo : "objectid" "obj_nextweek_button"
instance_create_layer(x + 0, y + 0, "Instances", obj_nextweek_button);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 6B716F6C
instance_destroy();