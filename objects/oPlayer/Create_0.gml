//Var for Movement
	moveDir = 0;
	moveSpd = 2;
	xspd = 0;
	yspd = 0;


//sprite control
	centerYOffset = -5;
	centerY = y + centerYOffset; //set in step event

	weaponOffSetDist = 4;
	aimDir = 0;

	face = 3;
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerUp;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerDown;
	
//Wepon Info
	shootTimer = 0;
	
	//Add Wepons to Inv
	array_push(global.WeaponInv,global.WeaponList.StarterPistol);
	array_push(global.WeaponInv,global.WeaponList.StarterPistolUpgrade);
	array_push(global.WeaponInv,global.WeaponList.StarterShotgun);
	array_push(global.WeaponInv,global.WeaponList.StarterShotgunUpgrade);

	selectedWeapon = 0;
	weapon = global.WeaponInv[selectedWeapon];
	
	
//Dmg
get_damaged_create(5,true);