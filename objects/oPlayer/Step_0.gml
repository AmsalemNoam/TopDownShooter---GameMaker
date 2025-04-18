//get Inputs
	var upKey = global.upKey
	var leftKey = global.leftKey
	var downKey = global.downKey
	var rightKey = global.rightKey
	var shootKey =global.shootKey
	var swapKeyPressed = global.swapKeyPressed
	var startKeyPressed = global.startKeyPressed;

//Pause Menu
if startKeyPressed
{
	if !instance_exists(oPauseMenu)
	{
		instance_create_depth(0,0,0,oPauseMenu);
	}
	else
	{
		instance_destroy(oPauseMenu);
	}
}

//Pause Self
if screen_pause() == true {exit;}

//Player Movement
#region
	//get direction
	var _horizKey = global.xaxisLeft;
	var _vertiKey = global.yaxisLeft;
	moveDir = point_direction(0, 0, _horizKey, _vertiKey);
	  
	//get x and y speeds
	var spd = 0;
	var inputlevel = point_distance(0, 0, _horizKey, _vertiKey);
	inputlevel = clamp(inputlevel, 0, 1);
	spd = moveSpd * inputlevel;
 
	xspd = lengthdir_x(spd, moveDir);
	yspd = lengthdir_y(spd, moveDir);
	
	//Check For Collisions
	if place_meeting(x+xspd,y,oWall){
		xspd = 0;	
	}
	if place_meeting(x,y+yspd,oWall){
		yspd = 0;	
	}
	//move
	x += xspd;
	y += yspd;
	
	//depth
	depth = -bbox_bottom;
	
#endregion

//Get Dmg
if get_damaged(oDmgPlayer,true)
{
	instance_create_depth(0,0,0,oHitScreen);
	create_screen_pause(20);
	screen_shake(5);
}

//Sprite Control
#region
	
	//Player Aim
		centerY = y+centerYOffset;
		if global.controllerMode == 0 {aimDir = point_direction(x,centerY,mouse_x,mouse_y);} //Using Keyboard
		//using controller
		if global.controllerMode == 1 
		{
			if global.xaxisRight != 0 || global.yaxisRight !=0{aimDir = point_direction(0,0,global.xaxisRight,global.xaxisLeft);}
		}

	//player facing correctly
		face = round(aimDir/90);
		if face == 4 { face = 0; };
	
	//Animate The Sprite
		if (xspd == 0 && yspd == 0)
		{
			image_index = 0;
		}
	
	//set the player sprite
		mask_index = sprite[3];
		sprite_index = sprite[face];

#endregion


//Wepon Swapping
#region
	var _playerWeapons = global.WeaponInv;
	if(swapKeyPressed){
		
		selectedWeapon++;
		if (selectedWeapon>= array_length(_playerWeapons)) { selectedWeapon = 0;}
		
		weapon = _playerWeapons[selectedWeapon];
	}
#endregion


//Shoot
#region
	if shootTimer > 0 {shootTimer -= 1;};
	if shootKey && shootTimer <=0
	{
		//reset Timer
		shootTimer = weapon.cooldown;
		
		//create the Bullet
			var _xOffset = lengthdir_x(weapon.length + weaponOffSetDist,aimDir);
			var _yOffset = lengthdir_y(weapon.length + weaponOffSetDist,aimDir);
			
			var _spread = weapon.spread;
			var _spreadDiv = _spread/max(weapon.bulletNum-1,1);
			
			//Shoot VFX
			create_animated_vfx(x+ _xOffset,centerY+_yOffset,depth-10,weapon.SplashSprite,1,1,aimDir);
			
			
			for(var i = 0; i<weapon.bulletNum; i++){
				var _bulletInst = instance_create_depth(x+ _xOffset,centerY+_yOffset,depth-100,weapon.bulletObj);
			
				//Change Bullet Dir
					with(_bulletInst)
					{
						dir = other.aimDir - _spread/2 + _spreadDiv*i;
						
						//Correct Dir If Needed
						if (dirFix == true){
							image_angle = dir;	
						}
						
					}
				
				
				
			}
	}
#endregion
	
//Death
if hp <= 0 
{
	
	instance_create_depth(0,0,-10000,oGameOverScreen);
	create_animated_vfx(x,y,depth,sSmallExplosion,1.5,1.5);
	instance_destroy();
	
}
	
	
	
	
	