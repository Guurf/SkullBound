// haddsp stuff
if (haddsp > 0.5) haddsp -= grv;
else if (haddsp < -0.5) haddsp += grv;
else haddsp = 0;

// Work out where to move vertically
vsp += grv;
if (vsp > 10) vsp = 10; //Terminal Velocity

show_debug_message(state);

switch state
{
	
	
	case "free":
		hsp = hspWalk;
		image_speed = 1;
		if !(place_meeting(x + hsp, y + 3, oSolid)) && hsp != 0 hspWalk = -hspWalk;
		path_end();
		sprite_index = sSlime;
		image_angle = 0;
	
	break;	
	
	case "dead":
		sprite_index = sSlimeDeath;
		hsp = 0;
		vsp = 0;
		if image_index > 6 state = "respawn";
	
	break;	
	
	case "respawn":
		if sprite_index == sSlimeDeath image_index = 0;
		sprite_index = sSlimeRespawn;
		vsp = -1;
		if image_index > 6 state = "bit";
	break;	
	
	
	case "bit":
		vsp = 0;
		trailTimer--;
			if trailTimer <= 0
			{
				trailTimer = trailInterval;
				instance_create_layer(x,y,"VFX",oSlimeTrail);
			}
		sprite_index = sSlimeBit;
		dir = point_direction(x, y, oPlayer.x, oPlayer.y-56);
		image_angle = dir-90;
		show_debug_message(image_angle);
		path1 = path_add();
		path_add_point(path1,x,y,15);
		path_add_point(path1,oPlayer.x,oPlayer.y-56,20);
		path_start(path1,20,0,0);
		if (collision_line(x,y,x,y+50,oPlayer,0,0)) && oPlayer.hsp == 0 && !(place_meeting(x, y, oSolid)) && oPlayer.state = "free"
		{
			image_angle = 0;
			path_end();
			state = "slam";
		}
	
	break;
	
	case "slam":
		hsp = 0;
		sprite_index = sSlimeSlam;
		if image_index <= 9 vsp = -0.5;
		else 
		{
			vsp = 3;
			image_speed = 0;
			if (place_meeting(x, y + vsp, oSolid)) 
			{
				instance_create_layer(x,y,"VFX",oJump,{image_xscale : 1.5});
				state = "free";
			}
		}
	break;
	
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