lifetime = 0;
scale = random_range(0.8,1.3);
image_xscale = scale;
image_yscale = scale;
image_angle = irandom_range(0,360);
image_speed = 0;
if oPlayer.state == "free" image_index = 1;
else image_index = 0;