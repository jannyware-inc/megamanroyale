
/// @desc Initialize
spd = 1.375
global.player = id;
//global.player.y = y;
//global.player.x = x;
//skipInit = 1;
global.pausePlayer = false;
global.player.canInput = true;
inventory = instance_create_depth(0,0,0,obj_inventoryDrawer);
invNum = 0;
//global.weapons = ds_map_create();
weapons[0] = instance_create_depth(0,0,0,dat_megabuster);
weapons[1] = instance_create_depth(0,0,0,dat_nothing);
weapons[2] = instance_create_depth(0,0,0,dat_nothing);
weapons[3] = instance_create_depth(0,0,0,dat_nothing);
weapons[4] = instance_create_depth(0,0,0,dat_rushcoil);
weapon = weapons[0];
global.weapons = weapons;
dropChance = 0;

behind_surface = noone;
surf = noone;

//ds_map_add(global.weapons,1,instance_create_depth(0,0,0,dat_megabuster));
//ds_map_add(global.weapons,2,instance_create_depth(0,0,0,dat_metalblade));
//ds_map_add(global.weapons,3,instance_create_depth(0,0,0,dat_searchsnake));
//alarm[0] = .25*room_speed;
life = 3;
etanks = 0;
uID = -1;
username = global.username;
infiniteAmmo = false;
infiniteLives = false;
dead = 0;
deadTimerMax = 180;
deadTimer = deadTimerMax;

canInput = true;

hasTimer = 1;
hasTimerGen = 0;
timer = noone;
skipDraw = false;
dabbing = false;
jumpBufferMax = 9;
jumpBuffer = 0;
hpMax = 28;
hp = hpMax;
hpIpl = hpMax;
hpTimerMax = 3;
hpTimer = 0;
curRoom = -4;
//spawning and respawning
homeY = y;
homeX = x;
respawnY = homeY;
respawnX = homeX;
checkpoint = -1;
inNoPvpZone = false;
teleportTimerMax = 120;
teleportTimer = 0;
sideUp = 1;
wasSideUp = 1;
originYOffset = -8; // center of player for enemies to attack
slideSpeed = 2.5;
hspd = 0;
vspd = 0;
externalvspd = 0; //external forces, like if he is pushed by a tornado
externalhspd = 0; 
externalWallCollide = false;
len = 0;
dir = 0;
state = move_state;
isRunning = false; //image index helper
runTimer = 0;
runTrigger = 9;
runAcceleration = .25;
//grav = .25;
grav = .20;
gravBuffer = 0;
grounded = false;
jumpHeight = 4.75 + grav * 2;
//jumpHeight = 4.64453125; according to tasvideos but doesnt feel right
currentJumpHeight = 0; //assigned in step
canCancelJump = true;
jumpDeacceleration = .25;
jumpFrames = 0;
disableJumpGravity = 0;
shootFrames = 15;
shootFrameTimer = 0;
throwTimerMax = 15;
throwTimer = 0;
sideFacing = 1;
sliding = 0;
slideFrames = 0;
maxSlideFrames = 26;

armLength = 0;
armHeight = 0;
armLengthGround = 20;
armHeightGround = -11;
armLengthAir = 18;
armHeightAir = -15;
maxBullets = 3;

maxHurtFrames = 20;
hurtFrames = 0;
hurt = 0;
hurtKnockback = -.5;
hurtKnockbackFrames = 0;
hurtIFrameTimer = 85;
upHurtFrames = 4;
hurtVspd = -1;

shakeFrames = 0;
shaken = 0;
shakeFramesMax = 60;
shakeKnockback = -.25;

idleTimerMax = 150;
idleTimer = idleTimerMax;
blinkTimerMax = 20;
blinkTimer = 0;
iFrameTimer = 360; // get 6 seconds of iframes on start
invulnerable = 0;

hCollision = true;
vCollision = true;

//last frames shit
wasGrounded = true;
wasSliding = false;
wasOnLadder = 0;
//fucking ladders
ladderSpd = 1.296875;
onLadder = false;
ladderGrabX = 10;
ladderY = 0;
ladderAnimationDelta = 15; //how many px until sprite subimage changes?
canGrabLadders = 1; //can I not grab ladders?
climbUp = 0;//
climbUpDist = 8;
climbUpAnimDist = 16;

blinkFrames = 2;
invisible = false;

guide = noone; //camera guide
dustOffsetX = 8;
dustOffsetY = -8;

healthMeter = instance_create_depth(x,y,0,obj_healthMeter);
ammoMeter = instance_create_depth(0,0,0,obj_ammoMeter);

// Sprite variables
face = 0;


global.player.x = x;
global.player.y = y;

centerx = x;
centery = y + originYOffset;

global.playerCenterx = centerx;
global.playerCentery = centery;

//colors
colorprimary = 1;
colorsecondary = 1;
coloroutline = 1;
spriteoutline = noone;
spriteprimary = noone;
spritesecondary = noone;
spriteface = noone;

remotetimestopperfrozen = false;

//outline_init();
name_surface = -1;

lastweapon = noone;
namewidth = 0;
nameheight = 0;
lastexternalhspd = 0;

timeStopperCooldownMax = 240 + 300;
timeStopperCooldown = 0;
runAnimTimer = 0;

with(instance_create_depth(x,y,depth,obj_teleportin)){
	teleporty = other.y;
}