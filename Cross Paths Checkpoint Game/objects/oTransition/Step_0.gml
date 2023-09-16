if room != roomTarget
{
	scale += 1.5;
}
else
{
	scale -= 1.5;
	x = oPlayer.x;
	y = oPlayer.y;
}
if scale > 50
{
	room_goto(roomTarget);	
}
else if scale <= 0 instance_destroy();

image_xscale = scale;
image_yscale = scale;