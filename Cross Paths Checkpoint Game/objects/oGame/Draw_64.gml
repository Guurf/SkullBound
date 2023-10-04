if currentRoom != room && (room != rMenu && room != rLevelSelect && room != rInit && room != rEnding)
{
	currentRoom = room;
	instance_create_layer(0,0,"Dev",oTitle);
}
if room == rEnding
{
	draw_text(320,150,"Thank you for playing!\n I intend to add more levels and mechanics in\nthe future, so look out for updates on itch.io!\n\n\n(I wonder what happens if you get all of the coins...)");	
}