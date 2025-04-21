// Inherit the parent event
event_inherited();

maxHp = 7;
hp = 7;
spd = 0;
chaseSpd = 0.6
dir = 0;
xspd = 0
yspd = 0;

face = 1;

//State machine
state = 0;
	//Shoot
	cooldownTime = 6*60;
	shootTimer = irandom(cooldownTime);
	windUpTime = 2*60;
	recoverTime = 60;
	bulletInst = noone;
	
	bulletXOff=10;
	bulletYOff=6;
	
	
//Spawn From tree
fadeSpd = 1/15;
emergeSpd = 0.25;
