//Pause Self
if screen_pause() == true {exit;}

if createdDmgObj == false
{
	//Dmg Enemy
	dmgInst = instance_create_depth(x,y,0,oDmgAll);
	with(dmgInst)
	{
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	//dont create more after
	createdDmgObj = true;
}

if floor(image_index)>1{
	if instance_exists(dmgInst){
		instance_destroy(dmgInst)
	}
}