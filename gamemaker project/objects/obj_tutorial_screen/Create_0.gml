global.uiopen = true;
isFirstClose = true;

set_tutorial_open = function(isOpen){
	if (!isOpen && visible){
		visible = false;
		global.uiopen = false;
		
		if (!isFirstClose){
			global.start_casino();	
		}
		
		var gacha_button = instance_find(obj_gachaButton_enter, 0);
		gacha_button.IsEnabled = true;
		
		show_debug_message("Closed tutorial screen");
	} else if (isOpen && !visible){
		visible = true;
		global.uiopen = true;
		
		isFirstClose = false;
		
		var gacha_button = instance_find(obj_gachaButton_enter, 0);
		gacha_button.IsEnabled = false;
		
		show_debug_message("Opened tutorial screen");
	}
}