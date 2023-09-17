if goGo = 0
	{
	if id == oLevelManager.levelChoice
	{
		if selected = 0 audio_play_sound(snLaunch,1,0,2,0.7,0.3);
		selected = 1;
		image_index = 1;	
	}
	else
	{
		selected = 0;
		image_index = 0;	
	}

	if selected
	{
		scale += 0.02;
		if scale >= 1.1 scale = 1.1;
		trailTimer--;
		if trailTimer <= 0
		{
			trailTimer = trailInterval;
			instance_create_layer(x,y,"VFX",oParticle);
		}
		if keyboard_check_pressed(vk_space)
		{
			audio_play_sound(snLaunch,1,0,2,0.6,0.5);
			goGo = 1;
		}
	}
	else 
	{
		scale -= 0.02;
		if scale <= 0.9 scale = 0.9;
	}
}
else if room == rLevelSelect
{
	oFollow.control = 0;
	if y < 200 && up == 0 y+= 3;
	else if up == 0
	{
		audio_play_sound(snLaunch,1,0,2,0.5,0.7);
		up = 1;	
	}
	if up == 1
	{
		titleY = y;
		nameY = y;	
		y = lerp(y,-64,0.08);
		if bbox_bottom <= 0 room_goto(roomTarget);
	}
}
else if room == rMenu
{
	oFollow.control = 0;
	image_alpha = lerp(image_alpha,-1,0.08);
	if image_alpha <= 0 room_goto(roomTarget);
}
image_xscale = scale;
image_yscale = scale;