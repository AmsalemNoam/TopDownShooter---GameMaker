
//get camera widht and height
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//Center On Player
	if instance_exists(oPlayer){ x = oPlayer.x - _camW/2; y = oPlayer.centerY - _camH/2;}
	
//Shake
	if xShakeAmn > 0
	{
		xShakeDir += xShakeDirSpd;
		xShakeAmn -= xShakeAmnSpd;
	}
	else
	{
		xShakeAmn = 0;
		xShakeDir = 0;
	}
	xShake = dsin(xShakeDir)*xShakeAmn;
	
	if yShakeAmn > 0
	{
		yShakeDir += yShakeDirSpd;
		yShakeAmn -= yShakeAmnSpd;
	}
	else
	{
		yShakeAmn = 0;
		yShakeDir = 0;
	}
	yShake = dsin(yShakeDir)*yShakeAmn;
	
	
//Add Shake
x+=xShake;
y+=yShake;

	
//Clampp cam pos to room borders
	x = clamp(x,0,room_width - _camW);
	y = clamp(y,0,room_height - _camH);
	
//set Camera pos
	camera_set_view_pos(view_camera[0],x,y);
