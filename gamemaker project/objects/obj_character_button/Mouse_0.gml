/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 5DE27FF3
/// @DnDArgument : "obj" "obj_charaManage"
/// @DnDSaveInfo : "obj" "obj_charaManage"
var l5DE27FF3_0 = false;
l5DE27FF3_0 = instance_exists(obj_charaManage);
if(l5DE27FF3_0)
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 0FE9DA9E
	/// @DnDParent : 5DE27FF3
	/// @DnDArgument : "xpos" "500"
	/// @DnDArgument : "ypos" "200"
	/// @DnDArgument : "objectid" "obj_menu"
	/// @DnDArgument : "layer" ""UI""
	/// @DnDSaveInfo : "objectid" "obj_menu"
	instance_create_layer(500, 200, "UI", obj_menu);
}