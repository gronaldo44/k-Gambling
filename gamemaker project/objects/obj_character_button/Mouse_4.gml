if (!global.is_gacha){
	if (!global.uiopen) { 
	    // Check if another instance of obj_menu already exists
	    if (!instance_exists(obj_menu)) {
	        // Create the obj_menu at a specific position
	        var new_menu = instance_create_layer(1020, 450, "UI", obj_menu);

	        // Ensure it's properly set as the active UI
	        global.uiopen = true;

	        // Optional: Initialize menu-specific properties or states here
	        show_debug_message("Character menu opened.");
	    }
	} else {
	    // Close the obj_menu if it's already open
	    with (obj_menu) {
	        instance_destroy();
	    }
	    global.uiopen = false;
	    show_debug_message("Character menu closed.");
	}
}