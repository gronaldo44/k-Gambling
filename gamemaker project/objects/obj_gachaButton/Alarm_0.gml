/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 31BA4429
/// @DnDArgument : "var" "global.token"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "drawCost"
if(global.token >= drawCost)
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 1B8D27B6
	/// @DnDParent : 31BA4429
	/// @DnDArgument : "value" "-drawCost"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "var" "global.token"
	global.token += -drawCost;

	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 427CC220
	/// @DnDParent : 31BA4429
	/// @DnDArgument : "var" "result"
	/// @DnDArgument : "type" "1"
	/// @DnDArgument : "min" "1"
	/// @DnDArgument : "max" "100"
	result = floor(random_range(1, 100 + 1));

	/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
	/// @DnDVersion : 1
	/// @DnDHash : 08065E24
	/// @DnDParent : 31BA4429
	/// @DnDArgument : "msg" "result"
	show_debug_message(string(result));

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 310D8B43
	/// @DnDParent : 31BA4429
	/// @DnDArgument : "var" "result"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "80"
	if(result <= 80)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 2A0E2728
		/// @DnDParent : 310D8B43
		/// @DnDArgument : "steps" "10"
		/// @DnDArgument : "alarm" "1"
		alarm_set(1, 10);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 5F68915B
	/// @DnDParent : 31BA4429
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 73CF9C5F
		/// @DnDParent : 5F68915B
		/// @DnDArgument : "var" "result"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "95"
		if(result > 95)
		{
			/// @DnDAction : YoYo Games.Instances.Set_Alarm
			/// @DnDVersion : 1
			/// @DnDHash : 12E1B1C5
			/// @DnDParent : 73CF9C5F
			/// @DnDArgument : "steps" "10"
			/// @DnDArgument : "alarm" "2"
			alarm_set(2, 10);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 5BC03E2E
		/// @DnDParent : 5F68915B
		else
		{
			/// @DnDAction : YoYo Games.Instances.Set_Alarm
			/// @DnDVersion : 1
			/// @DnDHash : 2AF4D50D
			/// @DnDParent : 5BC03E2E
			/// @DnDArgument : "steps" "10"
			/// @DnDArgument : "alarm" "3"
			alarm_set(3, 10);
		}
	}
}