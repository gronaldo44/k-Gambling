/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 57A29A67
/// @DnDArgument : "obj" "obj_bar_room"
/// @DnDSaveInfo : "obj" "obj_bar_room"
var l57A29A67_0 = false;
l57A29A67_0 = instance_exists(obj_bar_room);
if(l57A29A67_0)
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 3070468C
	/// @DnDParent : 57A29A67
	/// @DnDArgument : "value" "global.profit_bar"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "global.weeklyprofit"
	global.weeklyprofit += global.profit_bar;
}

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 7A86EF9E
/// @DnDArgument : "obj" "obj_black_jack"
/// @DnDSaveInfo : "obj" "obj_black_jack"
var l7A86EF9E_0 = false;
l7A86EF9E_0 = instance_exists(obj_black_jack);
if(l7A86EF9E_0)
{
	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 62A9175C
	/// @DnDParent : 7A86EF9E
	/// @DnDArgument : "var" "prob"
	/// @DnDArgument : "type" "1"
	/// @DnDArgument : "min" "1"
	/// @DnDArgument : "max" "100"
	prob = floor(random_range(1, 100 + 1));

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 308E3A54
	/// @DnDParent : 7A86EF9E
	/// @DnDArgument : "var" "prob"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "75"
	if(prob <= 75)
	{
		/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 7DCB92A3
		/// @DnDParent : 308E3A54
		/// @DnDArgument : "value" "global.profit_BJ"
		/// @DnDArgument : "value_relative" "1"
		/// @DnDArgument : "var" "global.weeklyprofit"
		global.weeklyprofit += global.profit_BJ;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 0FBA718D
	/// @DnDParent : 7A86EF9E
	else
	{
		/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 07ACAD08
		/// @DnDParent : 0FBA718D
		/// @DnDArgument : "value" "-global.profit_BJ/2"
		/// @DnDArgument : "value_relative" "1"
		/// @DnDArgument : "var" "global.weeklyprofit"
		global.weeklyprofit += -global.profit_BJ/2;
	}
}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 1690C3E5
/// @DnDArgument : "xpos" "960"
/// @DnDArgument : "ypos" "560"
/// @DnDArgument : "objectid" "obj_report"
/// @DnDArgument : "layer" ""Report""
/// @DnDSaveInfo : "objectid" "obj_report"
instance_create_layer(960, 560, "Report", obj_report);

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

/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 7C2CD37D
/// @DnDArgument : "msg" "global.weeklyprofit"
show_debug_message(string(global.weeklyprofit));