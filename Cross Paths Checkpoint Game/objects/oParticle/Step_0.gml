timer--;
if timer <= 0
{
	speed = 1;
	timer = 0;
	scale-= 0.05;
	gravity = 0.1;
}
image_xscale = scale;
image_yscale = scale;
if scale <= 0 instance_destroy();