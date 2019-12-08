username = "None";
curRoom = -4;
uID = -1;
weapon = 0;
lastweapon = noone;
costume = 0;
//x = 20;
//y = 20;
gotox = 20;
sideUp = 1;
gotoy = 20;
fromx = 20;
fromy = 20;
lastx = x;
lasty = y;
lastGotox = 0;
lastGotoy = 0;
sliding = 0;
dabbing = 0;
movingTo = false;
moving = false;
tiptoeing = false;
tiptoedistance = 3.5;
tiptoestartx = 0;
wasMoving = false;
iplTimerMax = 8;
iplTimer = 0;
stopFramesMax = 6;
stopFrames = 0;
inRoom = false;
invisible = false;
updateTimer = 0;

idleTimerMax = 150;
idleTimer = idleTimerMax;
blinkTimerMax = 20;
blinkTimer = 0;

//ds_map_add(global.playerID,uID,id);
hurt = 0;
wasHurt = 0;
gotoGrounded = 0;
grounded = 0;
shootTimerMax = 15;
shootTimer = 0;
throwTimerMax = 15;
throwTimer = 0;
dustOffsetX = 8;
dustOffsetY = -8;
centerx = 0;
centery = 0;

wasOnLadder = 0;
onLadder = 0;
ladderY = 0;
ladderAnimationDelta = 15;
ladderDraw = 0;

hurtIFrameTimer = 120;
iFrameTimer = 0;

saystopped = 0;

iplSx = 0;
iplSy = 0;
iplEx = 0;
iplEy = 0;

colorprimary = 0;
colorsecondary = 0;
coloroutline = 0;
spriteoutline = noone;
spriteface = noone;
spritesecondary = noone;
spritesecondary = noone;

name_surface = -1;
nameheight = 0;
namewidth = 0;

targetdir = 1;
running = false;
activeTimeStopper = false;
/*
face
1 if right
-1 if left
no external hspd



if player is standing still but moving externally
put in idle animation
9 for left, 11 for right
*/