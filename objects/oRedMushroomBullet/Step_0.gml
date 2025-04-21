//Pause Self
if screen_pause() == true {exit;}


switch(state)
{
	case 0:
		if instance_exists(oPlayer){ dir = point_direction(x,y,oPlayer.x,oPlayer.centerY);}
		depth = -y-50;
	break;
	
	case 1:
	
	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	
	x+= xspd;
	y += yspd;
	
	depth = -y;
	
		
	break;
	
}

	//cleanup

	//hit confim destroy
	if (hitConfirm == true && playerDestroy == true){destroy =true;} 
	
	//Destroy
		if (destroy == true)
		{
			create_animated_vfx(x,y,depth-50,sRedMushroomBulletHit,0.5,0.5);
			instance_destroy();
		}
	//Collision
		if place_meeting(x,y,oSolidWall){destroy = true;}
	//bullet out of range
	var _pad = 16;
		if (bbox_right<-_pad || bbox_left > room_width+_pad || bbox_bottom < 0-_pad || bbox_top > room_height+_pad){destroy = true;}

