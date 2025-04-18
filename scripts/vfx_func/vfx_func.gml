function screen_pause(){
	
//Pause Self
	if instance_exists(oScreenPause)
	{
		image_speed = 0;
		return true;
	}
	else{image_speed = 1; return false;}

}

function create_screen_pause(_time = 3){
	//screen pause
	with(instance_create_depth(0,0,0,oScreenPauseTimed))
	{
		timer = _time
	}
}
	
	
function screen_shake(_amount = 5){
	_amount*=global.screenShakeAmn;
	with(oCamera){
		xShakeAmn = _amount;
		yShakeAmn = _amount;
	}
}
	
function create_animated_vfx(_x = x,_y = y,_depth = -y,_sprite = sSmallExplosion,_xScale = 1, _yScale = 1,_rot = 0)
{
	with(instance_create_depth(_x,_y,_depth,oAnimatedVFX))
	{
		sprite_index = _sprite;
		image_xscale = _xScale;
		image_yscale = _yScale;
		image_angle = _rot;
	}
}