draw_sprite_ext(sprite_index,image_index,x,y,face,image_yscale,image_angle,image_blend,image_alpha);

//draw hp bar
var _healthPr = hp/maxHp;
var _hpImage = _healthPr * (sprite_get_number(sEnemyHealthBar)-1);
draw_sprite_ext(sEnemyHealthBar,_hpImage,x,y-sprite_height-1,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
