if (place_meeting(x,y,oPlayer) && !instance_exists(oWarp))
{
	var _inst = instance_create_depth(x,y,-99999,oWarp);
	
	_inst.target_x = target_x
	_inst.target_y = target_y
	_inst.targetRoom = targetRoom
	_inst.target_face = target_face

}
