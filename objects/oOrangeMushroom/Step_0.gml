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
		break;
	}

//Sprite Looks

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
		var _boom = instance_create_depth(x,y+2,-3000,oTntExplosion);
	with(_boom){
		damage = 3;
		image_xscale = 0.7;
		image_yscale = 0.7;
	}
}
