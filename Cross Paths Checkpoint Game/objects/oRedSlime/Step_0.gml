// haddsp stuff
if (haddsp > 0.5) haddsp -= grv;
else if (haddsp < -0.5) haddsp += grv;
else haddsp = 0;

// Work out where to move vertically
vsp += grv;
if (vsp > 10) vsp = 10; //Terminal Velocity

hsp = hspWalk;
if state == "free"
{
	hsp = hspWalk;
	image_speed = 1;
	if !(place_meeting(x + hsp, y + 3, oSolid)) && hsp != 0 hspWalk = -hspWalk;
	path_end();
	sprite_index = sRedSlime;
	}
else if state == "dead"
{
	hsp = 0;
	sprite_index = sRedSlimeDeath;
	if image_index > 7 image_speed = -1;
	if image_speed == -1 && image_index < 1
	state = "free";
}


//Collision and Movement
var hspMomentum = hsp + haddsp;
if (place_meeting(x + hspMomentum, y, oSolid)) 
{
    while (abs(hspMomentum) > 0.1) 
    {
        hspMomentum *= 0.25;
        if (!place_meeting(x + hspMomentum, y, oSolid)) x += hspMomentum;
    }
    hspMomentum = 0;
	haddsp = 0;
	hspWalk = -hspWalk;
}
x += hspMomentum;

if (place_meeting(x, y + vsp, oSolid)) 
{
	if (vsp > 0) canJump = 10;
	haddsp = 0;
	while (abs(vsp) > 0.1) 
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oSolid)) y += vsp;
	}
	vsp = 0;
}
y += vsp;

if (hsp != 0) image_xscale = sign(hsp);