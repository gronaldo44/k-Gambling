/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 173BD61F
/// @DnDArgument : "value" "-50"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "global.token"
global.token += -50;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 4091986D
/// @DnDArgument : "value" "1"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "global.level"
global.level += 1;

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 5190D4AC
/// @DnDArgument : "xpos" "500"
/// @DnDArgument : "ypos" "500"
/// @DnDArgument : "objectid" "obj_bar_room"
/// @DnDSaveInfo : "objectid" "obj_bar_room"
instance_create_layer(500, 500, "Instances", obj_bar_room);