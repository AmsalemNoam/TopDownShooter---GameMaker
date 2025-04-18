//Pause Self
if screen_pause() == true {exit;}

//Move The Bullet
	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	
	x+= xspd;
	y+= yspd;

depth =-y;
//cleanup

	//hit confim destroy
	if (hitConfirm == true && enemyDestroy == true){destroy =true;} 
	
	//Destroy
		if (destroy == true)
		{
			create_animated_vfx(x,y,depth-50,sBulletHit);
			instance_destroy();
		}
	//Collision
		if place_meeting(x,y,oSolidWall){destroy = true;}
	//bullet out of range
		if (point_distance(xstart,ystart,x,y)>maxDist){destroy = true;}







