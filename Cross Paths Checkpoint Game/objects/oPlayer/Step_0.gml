// Get inputs
if (hascontrol)
{
	_keyRight = keyboard_check(ord("D"));
	_keyLeft =  keyboard_check(ord("A"));
	_keyUp = keyboard_check(ord("W"));
	_keyDown = keyboard_check(ord("S"));
	_keyJump =  keyboard_check_pressed(vk_space);
}
else if state == "respawn" || state == "skull" _keyJump =  keyboard_check_pressed(vk_space);
else
{
	_keyRight = 0;
	_keyLeft =  0;
	_keyJump = 0;
	_keyUp = 0;
	_keyDown = 0;
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
			instance_create_layer(x,y,"VFX",oJump);
			audio_play_sound(snJump,1,0,1,0,random_range(0.8,1.2));
			vsp = vspJump;
			canJump = 0;
		}
		
		//Slime Check
		if (instance_exists(oSlime))
		{
			var closeSlime = instance_nearest(x,y,oSlime);
			if (place_meeting(x,y,closeSlime)) && y < closeSlime.y-5 && closeSlime.state == "free"
			{
				closeSlime.state = "dead";
				instance_create_layer(x,y,"VFX",oJump);
				audio_play_sound(snStab,1,0,1,0,random_range(0.8,1.2));
				vsp = vspJump;
				canJump = 0;
			}
			else if (place_meeting(x,y,closeSlime)) && (closeSlime.state == "free" || closeSlime.state == "slam")
			{
				audio_play_sound(snDeath,1,0);
				state = "dead";	
			}
		}
		
		
	if (!place_meeting(x,y+1,oSolid))
	{
		audio_stop_sound(snWalk);
		if (sign(vsp) > 0) sprite_index = sPlayerDWN;
		else sprite_index = sPlayerUP;
	}
	else
	{
		if sprite_index == sPlayerDWN audio_play_sound(snLand,1,0);
		if (hsp == 0)
		{
			image_speed = 1;
			audio_stop_sound(snWalk);
			sprite_index = sPlayer;
		}
		else
		{
			image_speed = 1;
			if !audio_is_playing(snWalk) audio_play_sound(snWalk,1,0);
			sprite_index = sPlayerR;	
			trailTimer--;
			if trailTimer <= 0
			{
				trailTimer = dustInterval;
				instance_create_layer(x,y-4,"VFX",oDust);
			}
		}
	}
	break;
	
	case "dead":
		hascontrol = 0;
		vsp = 0;
		hsp = 0;
		haddsp = 0;
		sprite_index = sPlayerDeath;
		image_speed = 1;
		if image_index > 4 state = "skull";
	break;
	
	case "skull":
		sprite_index = sPlayerSkull;
		canJump = 0;
		trailActive = 1;
		var closeGrave = instance_nearest(x,y,oGravestone);
		if !instance_exists(oGravestone) closeGrave = instance_nearest(x,y,oGrave);
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
		if (_keyJump) && (!place_meeting(x,y+1,oSolid)) && (!collision_line(x,y,x,y+150,oDeath,0,0))
		{
			path_end();
			image_angle = 0;
			image_speed = 0;
			state = "awake";
		}
	break;
	
	case "respawn":
			path_end();
			sprite_index = sPlayerRespawn;
			if (_keyJump) && (!collision_line(x,y,x,y+300,oDeath,0,0))
			{
				image_angle = 0;
				image_speed = 0;
				state = "awake";
			}
			if image_index == 3 audio_play_sound(snDing,1,0);
			if image_index > 5 state = "launch";
	break;

	case "launch":
		image_angle = 0;
		audio_play_sound(snLaunch,1,0,);
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
