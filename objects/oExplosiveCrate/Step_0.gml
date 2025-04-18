get_damaged(oDmgParent);

var _hpPrc = 1-(hp/maxHp);
image_index = _hpPrc * image_number;

if(hp<=0)
{
	//Explode  
	var _boom = instance_create_depth(x+8,y+8,-3000,oTntExplosion);
	with(_boom){
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	//Screen pause
	create_screen_pause();
	screen_shake(7);
	instance_destroy();
}