if !collected y = ystart + sin(get_timer()/500000)*5;
else
{
	if image_alpha >= 0.5 y-=2;
	else y-= 1;
	image_alpha-=0.05;
	if image_alpha <= 0 instance_destroy();
}
