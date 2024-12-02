event_inherited();

text = "";

drawCost = 150;

isPulling = false;

global.calculateResult = function(rarity)
{
	if(rarity = 3)
	{
		alarm_set(1, 10);
	}
	
	else if(rarity = 5)
	{
		alarm_set(2, 10);
	}
	
	else if(rarity = 4)
	{
		alarm_set(3, 10);
		
	}
}

display_result = function(result)
{
	instance_create_layer(960, 590, "Gacha", obj_gacha_result);
	
	isPulling = false;
	
	switch (result)
	{
	case 1:
		global.result1();
		break;
	
	case 2:
		global.result2();
		break;
	
	case 3:
		global.result3();
		break;
	
	case 4:
		global.result4();
		break;
	
	case 5:
		global.result5();
		break;
	
	case 6:
		global.result6();
		break;
	
	case 7:
		global.result7();
		break;
		
	case 8:
		global.result8();
		break;
	
	}
}