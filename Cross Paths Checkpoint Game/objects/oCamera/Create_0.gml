cam = view_camera[0];
if room != rLevelSelect follow = oPlayer;
else follow = oFollow;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;
if instance_exists(follow)
{
	x = follow.x;
	y = follow.y;
}

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;