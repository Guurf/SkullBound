if !collected
{
	collected = 1;
	audio_play_sound(snDing,1,0,1,0,1.3);
	global.coins[coinNumber-1] = 1;
}

