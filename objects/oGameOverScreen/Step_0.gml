
var _shootKey = global.shootKey;

alpha += alphaSpd;
alpha = clamp(alpha,0,1);

if _shootKey && alpha >= 1{room_restart();}