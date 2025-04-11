//drawing the player weppon
function draw_weapon()
{
//Draw Wepon
	//get wepon off player body
	var _xOffset = lengthdir_x(weaponOffSetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffSetDist, aimDir);
	
	//flip wepon
	var _weaponYscl = 1;
	if (aimDir>90 && aimDir<270){
		_weaponYscl = -1;
	}
	//draw wepon
	draw_sprite_ext(weapon.sprite,0,x+_xOffset,centerY+_yOffset,1,_weaponYscl,aimDir,c_white,image_alpha);
}