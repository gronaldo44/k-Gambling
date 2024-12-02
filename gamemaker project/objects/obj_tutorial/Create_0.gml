function onClick() {
	if(global.level >= 1)
	{
	global.stop_casino();
	var tutorial_screen = instance_find(obj_tutorial_screen, 0);
	tutorial_screen.set_tutorial_open(true);
	}
}