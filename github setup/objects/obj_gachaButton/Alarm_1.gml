/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 62632C86
/// @DnDArgument : "msg" ""You get a 1 star""
show_debug_message(string("You get a 1 star"));

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 353302FA
/// @DnDArgument : "value" "1"
/// @DnDArgument : "value_relative" "1"
/// @DnDArgument : "var" "global.gachaPulled"
global.gachaPulled += 1;

/// @DnDAction : YoYo Games.Random.Get_Random_Number
/// @DnDVersion : 1
/// @DnDHash : 76E838CC
/// @DnDArgument : "var" "result_1"
/// @DnDArgument : "type" "1"
/// @DnDArgument : "max" "2"
result_1 = floor(random_range(0, 2 + 1));

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 23749474
/// @DnDArgument : "var" "result_1"
if(result_1 == 0){	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 36450632
	/// @DnDParent : 23749474
	/// @DnDArgument : "value" "1"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "global.token"
	global.token += 1;

	/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
	/// @DnDVersion : 1
	/// @DnDHash : 249800A2
	/// @DnDParent : 23749474
	/// @DnDArgument : "msg" ""You get 1 token""
	show_debug_message(string("You get 1 token"));}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0BE32A53
/// @DnDArgument : "var" "result_1"
/// @DnDArgument : "value" "1"
if(result_1 == 1){	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 2250549C
	/// @DnDParent : 0BE32A53
	/// @DnDArgument : "value" "5"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "global.token"
	global.token += 5;

	/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
	/// @DnDVersion : 1
	/// @DnDHash : 555645B2
	/// @DnDParent : 0BE32A53
	/// @DnDArgument : "msg" ""You get 5 token""
	show_debug_message(string("You get 5 token"));}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0F31B123
/// @DnDArgument : "var" "result_1"
/// @DnDArgument : "value" "2"
if(result_1 == 2){	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 3DD1357D
	/// @DnDParent : 0F31B123
	/// @DnDArgument : "value" "10"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "global.token"
	global.token += 10;

	/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
	/// @DnDVersion : 1
	/// @DnDHash : 02862E39
	/// @DnDParent : 0F31B123
	/// @DnDArgument : "msg" ""You get 10 token""
	show_debug_message(string("You get 10 token"));}