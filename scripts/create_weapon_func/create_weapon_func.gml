
function create_weapon(_sprite = sStarterPistol,_weponLength = 0,_bulletObj = oStarterPistolBullet,_cooldown = 1 ,_bulletNum = 1, _spread = 0) constructor{
	
	sprite = _sprite;
	length = _weponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	
}

//Wepon Inventory
global.WeaponInv = array_create(0)


//Wepons
global.WeaponList = {
	
	StarterPistol : new create_weapon(
		sStarterPistol,
		sprite_get_bbox_right(sStarterPistol) - sprite_get_xoffset(sStarterPistol),
		oStarterPistolBullet,
		20,
		1,
		0
	),
	
	StarterPistolUpgrade : new create_weapon(
		sStarterPistolUpgrade,
		sprite_get_bbox_right(sStarterPistolUpgrade) - sprite_get_xoffset(sStarterPistolUpgrade),
		oStarterPistolBulletUpgrade,
		16,
		1,
		0
	),
	StarterShotgun : new create_weapon(
		sStarterShotgun,
		sprite_get_bbox_right(sStarterShotgun) - sprite_get_xoffset(sStarterShotgun),
		oStarterShotgunBullet,
		30,
		7,
		80
	),
	
	StarterShotgunUpgrade : new create_weapon(
		sStarterShotgunUpgrade,
		sprite_get_bbox_right(sStarterShotgunUpgrade) - sprite_get_xoffset(sStarterShotgunUpgrade),
		oStarterShotgunBulletUpgrade,
		26,
		8,
		90
	),



}