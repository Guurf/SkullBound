//Movement
grv = 0.3; //gravity
hsp = 0; //current horizontal speed
haddsp = 0; //current horizontal momentum
vsp = 0; //current vertical speed
hspWalk = 2; //walk speed
vspJump = -5; //jump speed
canJump = 0; //are we touching the ground
spd = 10; //speed of checkpoint exit
state = "free";

hascontrol = 1;

trailActive = 0;
trailInterval = 3;
dustInterval = 10;
trailTimer = trailInterval;