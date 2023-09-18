if currentRoom != room && (room != rMenu && room != rLevelSelect && room != rInit)
{
	currentRoom = room;
	instance_create_layer(0,0,"Dev",oTitle);
}