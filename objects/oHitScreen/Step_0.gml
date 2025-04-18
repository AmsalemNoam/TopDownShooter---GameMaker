//Screen Pause
if screen_pause() {exit;}

alpha -= alphaSpd;
if alpha <= 0 {instance_destroy();}