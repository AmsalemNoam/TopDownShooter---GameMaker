//Float "Animation"

floatDir +=floatSpd;
y = ystart + dsin(floatDir)*1; // moving up and down like sin graph



if place_meeting(x,y,oPlayer){
	if(oPlayer.hp<oPlayer.maxHp){
		//Heal Player
		oPlayer.hp+=heal;
		instance_destroy();
	}
}