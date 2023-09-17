if (control)
{
	right = keyboard_check_pressed(ord("D"));
	left = keyboard_check_pressed(ord("A"));
}
else
{
	right = 0;
	left = 0;	
}

if room == rLevelSelect
{
	if (right)
	{
		x += 112;	
	}
	else if (left)
	{
		x -= 112;	
	}

	if x < 320 x = 320;
}
else if room == rMenu
{
		if (right)
	{
		x += 300;	
	}
	else if (left)
	{
		x -= 300;	
	}

	if x < 200 x = 200;
	else if x > 465 x = 465;
}
