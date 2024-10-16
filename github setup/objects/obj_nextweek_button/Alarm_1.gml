/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 44863101
/// @DnDApplyTo : {obj_report}
with(obj_report) instance_destroy();

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 09EA10E9
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "objectid" "obj_strbusin_button"
/// @DnDSaveInfo : "objectid" "obj_strbusin_button"
instance_create_layer(x + 0, y + 0, "Instances", obj_strbusin_button);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 1B3EE25D
instance_destroy();