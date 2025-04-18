
//Pause Self
if screen_pause() == true {exit;}


var _wallCollisions = true;
var _getDmg = true;


//State Machine
	switch(state)
	{
		case -2:
			//Fade In
			if image_alpha<1{spd = 0; image_alpha+=fadeSpd};
			//Walk Out
			_wallCollisions = false;
			//Invincble till out
			_getDmg = false
			
			if image_alpha>=1{spd = emergeSpd; dir = 90;}
			
			if !place_meeting(x,y,oWall){state = 0;}
			
		break;
		//Spawn from tree
		case -1:
			//Fade In
			if image_alpha<1{spd = 0; image_alpha+=fadeSpd};
			//Walk Out
			_wallCollisions = false;
			//Invincble till out
			_getDmg = false
			
			if image_alpha>=1{spd = emergeSpd; dir = 270;}
			
			if !place_meeting(x,y,oWall){state = 0;}
			
		break;
		
		//Chase the player state
		case 0:
		if(instance_exists(oPlayer)){
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		}
		spd = chaseSpd;
		
		//Go Shooting
		//check if enemy on screen
		var _camLeft = camera_get_view_x(view_camera[0]);
		var _camRight =_camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop+camera_get_view_height(view_camera[0]);
		if(bbox_right>_camLeft&&bbox_left<_camRight&&bbox_top>_camTop&&bbox_bottom<_camBottom){
			shootTimer++;
		}
		if shootTimer>cooldownTime{state = 1; shootTimer=0;}
		break;
		
		//Pause and Shoot
		case 1:
		if(instance_exists(oPlayer)){
			dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		}
		spd = 0;
		//no animation enemy
		image_index= 0;
		
		shootTimer++;
		//create bullet
		if shootTimer == 1{ bulletInst = instance_create_depth(x+bulletXOff*face,y+bulletYOff,depth,oBlueMushroomBullet);}
		//Bullet Correct place
		if shootTimer <= windUpTime && instance_exists(bulletInst){
			bulletInst.x = x +bulletXOff*face;
			bulletInst.y = y + bulletYOff;
		}
		//shoot bullet after the windup time
		if shootTimer == windUpTime && instance_exists(bulletInst){
			bulletInst.state=1;
		}
		if shootTimer>windUpTime + recoverTime{state = 0; shootTimer = 0;}
		
			

	}




//Chase Player

	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);

	if (dir > 90 && dir <270){face = -1}
	else{face = 1;} 


	//Wall Collisions
		if _wallCollisions == true
		{
			if (place_meeting(x+xspd,y,oWall)){xspd = 0;}
			if (place_meeting(x,y+yspd,oWall)){yspd = 0;}
		}
	//Enemy Collisions
		if (place_meeting(x+xspd,y,oEnemyParent)){xspd = 0;}
		if (place_meeting(x,y+yspd,oEnemyParent)){yspd = 0;}
	//Moving
	x+=xspd;
	y+=yspd;
	
	depth = -y;


// Inherit the parent event(Dmg/Die)
if _getDmg == true
{
	event_inherited();
}
if hp<=0
{
	create_animated_vfx(x,y,depth,sDeadBlueMushroomExp);
}



