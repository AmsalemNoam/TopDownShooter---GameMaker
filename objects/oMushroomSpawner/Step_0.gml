//Pause Self
if screen_pause() == true {exit;}

timer++

if (instance_number(oEnemyParent) >= global.activeEnemyMax 
|| global.totalEnenemiesSpawend >= global.enemyRoomMax)
	{timer = 0;}

if (timer >= spawnTime && !place_meeting(x,y,oBlueMushroom))
{
	//crate enemy
	var _inst = instance_create_depth(x,y,depth-1,oBlueMushroom);
	with(_inst){image_alpha = 0; state = -1;}
	timer = 0;
	

}