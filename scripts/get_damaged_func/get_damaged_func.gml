//Dmg Calculations
	//Dmg create event
	function get_damaged_create(_hp, _iframes = false)
	{
		//The Health
		maxHp = _hp;
		hp = _hp;
		
		if _iframes == true{
			iframeTimer = 0;
			iframeNum = 90;
		}
		if _iframes == false{
		//create dmg list
		damageList = ds_list_create();
		}
	
	}
	
	//If there are iframes we dont need the cleanup event!
	//Dmg In step event
	function get_damaged(_damagedObj, _iframes = false)
	{
		//exit for iframes
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--;
			if iframeTimer mod 5 == 0
			{
				if image_alpha == 1 {image_alpha=0;}
				else{image_alpha = 1};
			}
			exit;
		}
		
		//make sure blinking stops
		if _iframes == true{image_alpha = 1;}
		
		//Take Dmg
		if place_meeting(x,y,_damagedObj){
	
			//List Of Dmg Inst
			//ds_list gotta destroy at the end and can crush game, dont use much
			var _instList = ds_list_create();
			//the false is if you want to add it ordered but what is closest we dont care here
			instance_place_list(x,y,_damagedObj,_instList,false);	
			var _hitConfirm = false;
			for(var i = 0; i<ds_list_size(_instList);i++)
			{
		
				var _inst = ds_list_find_value(_instList,i);
		
				if (_iframes == true || ds_list_find_index(damageList,_inst) == -1)
				{
					if _iframes == false{ds_list_add(damageList,_inst);}
			
			
					//Take Dmg From specific inst
					hp -= _inst.damage
					_hitConfirm = true;
					//the inst impacted
					_inst.hitConfirm = true;
				}
	
			}
			//set iframes
			if _iframes == true && _hitConfirm == true
			{
				iframeTimer = iframeNum;
			}
			//free mem
			ds_list_destroy(_instList);

		}

	if _iframes == false{
		//clear dmg list from collisions/deleted ob
		var _dmgListSize = ds_list_size(damageList);
		for(var i =0; i< _dmgListSize; i++){
	
			var _inst = ds_list_find_value(damageList,i)
			if !instance_exists(_inst) || !place_meeting(x,y,_inst)
				{
				ds_list_delete(damageList,i);
				i--;
				_dmgListSize--;
				}
	
			}

		}
	}
	
	
	
	//Dmg cleanup event
	function get_damaged_cleanup()
	{
		ds_list_destroy(damageList);
	}
	