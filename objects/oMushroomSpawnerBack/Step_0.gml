//Pause Self
if screen_pause() == true {exit;}

timer++

if (instance_number(oEnemyParent) >= global.activeEnemyMax 
|| global.totalEnenemiesSpawend >= global.enemyRoomMax)
	{timer = 0;}

if (timer >= spawnTime && !place_meeting(x,y,oBlueMushroom) && !place_meeting(x,y,oOrangeMushroom))
{
	//crate enemy
	var _random = irandom(10);
	if _random <= 5 {
		var _inst = instance_create_depth(x,y,depth-1,oBlueMushroom);
		with(_inst){image_alpha = 0; state = -2;}
		timer = 0;
	}
	if _random >=6 && _random <=8 {
		var _inst = instance_create_depth(x,y,depth-1,oOrangeMushroom);
		with(_inst){image_alpha = 0; state = -2;}
		timer = 0;
	}
	if _random >=9 {
		var _inst = instance_create_depth(x,y,depth-1,oRedMushroom);
		with(_inst){image_alpha = 0; state = -2;}
		timer = 0;
	}
}