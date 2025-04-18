get_damaged(oDmgParent);

var _hpPrc = 1-(hp/maxHp);
image_index = _hpPrc * (image_number);

if(hp<=0)
{
	create_animated_vfx(x+8,y+16,depth,sSmallExplosion,1.5,1.5);
	instance_destroy();
}
