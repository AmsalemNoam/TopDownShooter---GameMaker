//Take Dmg
get_damaged(oDmgEnemy);

//Death
	if(hp<=0){
		global.enemyKillCount++;
		//Do we drop Item?
		var _chance = irandom(100);
		if(_chance<7 || global.enemyKillCount mod 25 ==0){
			instance_create_depth(x,y,depth,oBlueRegenHeart);
		}
		instance_destroy();
	}