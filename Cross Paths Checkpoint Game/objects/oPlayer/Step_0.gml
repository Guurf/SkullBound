// Get inputs
if (hascontrol)
{
	_keyRight = keyboard_check(ord("D"));
	_keyLeft =  keyboard_check(ord("A"));
	_keyUp = keyboard_check_pressed(ord("W"));
	_keyJump =  keyboard_check_pressed(vk_space);
}
else if state == "respawn" _keyJump =  keyboard_check_pressed(vk_space);
else
{
	_keyRight = 0;
	_keyLeft =  0;
	_keyJump = 0;
}

// Work out where to move horizontally
hsp = (_keyRight - _keyLeft) * hspWalk;

// haddsp stuff
if (haddsp > 0.5) haddsp -= grv;
else if (haddsp < -0.5) haddsp += grv;
else haddsp = 0;


switch state
{
	case "free":
		if (place_meeting(x,y+10,oSolid)) trailActive = 0;
		image_angle = 0;
		hascontrol = 1;	
		// Work out where to move vertically
		vsp += grv;
		if (vsp > 10) vsp = 10; //Terminal Velocity

		if (canJump-- > 0) && (_keyJump)
		{
			vsp = vspJump;
			canJump = 0;
		}
		
	if (!place_meeting(x,y+1,oSolid))
	{
		if (sign(vsp) > 0) sprite_index = sPlayerDWN;
		else sprite_index = sPlayerUP;
	}
	else
	{
		if (hsp == 0)
		{
			image_speed = 0;
			sprite_index = sPlayer;
		}
		else
		{
			image_speed = 1;
			sprite_index = sPlayerR;	
		}
	}
	break;
	
	case "dead":
		hascontrol = 0;
		sprite_index = sPlayerDeath;
		if image_index > 4 state = "skull";
	break;
	
	case "skull":
		sprite_index = sPlayerSkull;
		canJump = 0;
		trailActive = 1;
		var closeGrave = instance_nearest(x,y,oGravestone);
		dir = point_direction(oPlayer.x, oPlayer.y, closeGrave.x, closeGrave.y);
		image_angle = dir-90;
		show_debug_message(image_angle);
		path1 = path_add();
		path_add_point(path1,x,y,30);
		path_add_point(path1,closeGrave.x,closeGrave.y,20);
		path_start(path1,20,0,0);
		if (collision_circle(x,y,3,closeGrave,0,0))
		{
			state = "respawn";
		}
	break;
	
	case "respawn":
			path_end();
			sprite_index = sPlayerRespawn;
			if (_keyJump) 
			{
				image_angle = 0;
				image_speed = 0;
				state = "awake";
			}
			if image_index > 4 state = "launch";
	break;

	case "launch":
		image_angle = 0;
		repeat 10 {
			instance_create_layer(x,y,"VFX",oParticle);	
		}
		haddsp = lengthdir_x(spd+1,dir);
		vsp = lengthdir_y(spd,dir);
		//if (vsp > 0) vsp = -0.5;
		state = "free";	
	break;
	
	case "awake":
		sprite_index = sPlayerRubble;
		vsp += grv;
		if (vsp > 10) vsp = 10; //Terminal Velocity
		if (place_meeting(x,y+2,oSolid)) image_speed = 1;
		if image_index > 6 state = "free";
	break;
}

if _keyUp && place_meeting(x,y,oDoorway)
{
	room_goto(oDoorway.roomTarget);	
}


//Trail
if trailActive
{
	trailTimer--;
	if trailTimer <= 0
	{
		trailTimer = trailInterval;
		instance_create_layer(x,y,"VFX",oTrail);
	}
}


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
