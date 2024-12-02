if (!global.is_gacha && !global.uiopen){
	show_debug_message("Tutorial Button Pressed" + string(global.is_gacha));
	layer_set_visible("Tutorial_Screen", true);
	onClick();
}