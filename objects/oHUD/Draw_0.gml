	
	
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _border = 8;
var _hudX = _camX+_border
var _hudY = _camY+_border
	
	//players hp
if instance_exists(oPlayer){
	draw_sprite(sPlayerHealth,0,_hudX,_hudY);
	for(var i = 0; i<playerMaxHp; i++){
	
		var _img = 1;
		if(i+1 <= playerHp) {_img = 2;}
	
		var _sep = 3;
		draw_sprite(sPlayerHealth,_img,_hudX+_sep*i,_hudY);
	}
}

//Enemies Killed
var _enemyCountOffset = 34;
var _ecHudX = _hudX +_enemyCountOffset;
var _ecHudY =_hudY +_enemyCountOffset;
draw_sprite (sEnemyCountHud,0,_ecHudX,_ecHudY);
//draw nums
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fntBitop);

draw_text(_ecHudX-17,_ecHudY-8, string(global.enemyKillCount));
draw_text(_ecHudX+6,_ecHudY-8, "/" + string(global.enemyRoomMax));






