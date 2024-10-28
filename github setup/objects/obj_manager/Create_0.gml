global.isPrepare = true;
global.level = 0;
global.exp = 0;
global.weeklyprofit = 0;
global.weeklyloss = 0;
global.daytimer = 0;
global.days = 0;
global.token = 75;
global.gachaPulled = 0;

global.gain_exp = function(exp_gained){
	global.exp += exp_gained;
	while (global.exp >= (global.level * 100)){
		level_up()
	}
}

function level_up(){
	global.exp -= global.level * 100;
	global.level++;
	show_debug_message("Level Up: " + string(global.level));
	
	// level 1
	if (global.level == 1){
		global.set_roomtype(5, ROOM_TYPE.OPEN);
		global.token += 100;
	}
	
	// level 2
	if (global.level == 2){
		global.set_roomtype(7, ROOM_TYPE.OPEN);
	}
	
	// level 3
	if (global.level == 3){
		global.set_roomtype(4, ROOM_TYPE.OPEN);	
	}
	
	// level 4
	if (global.level == 4){
		global.set_roomtype(3, ROOM_TYPE.OPEN);
	}
	
	// level 5
	if (global.level == 5){
		global.set_roomtype(2, ROOM_TYPE.OPEN);	
	}
	
	// level 6
		if (global.level == 6){
		global.set_roomtype(1, ROOM_TYPE.OPEN);	
	}
	
	// level 7
		if (global.level == 7){
		global.set_roomtype(0, ROOM_TYPE.OPEN);	
	}
	
}