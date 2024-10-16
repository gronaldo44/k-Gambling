/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 4E194E7E
/// @DnDArgument : "value" "-50"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "global.token"
global.token += -50;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 4D8A1C78
/// @DnDArgument : "value" "1"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "global.level"
global.level += 1;

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 5C816CC2
/// @DnDArgument : "xpos" "1340"
/// @DnDArgument : "ypos" "640"
/// @DnDArgument : "objectid" "obj_black_jack"
/// @DnDSaveInfo : "objectid" "obj_black_jack"
instance_create_layer(1340, 640, "Instances", obj_black_jack);