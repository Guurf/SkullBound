if keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"))
{
	learnt = 1;	
}
else
{
	walkTeach--;
}

if keyboard_check_pressed(vk_space)
{
	learnt = 3;	
}
else if oPlayer.x >= 160
{
	jumpTeach--;	
}
if learnt == 3 instance_destroy();