enum states
{
	normal,
		unused_1,
	tumble,
	finishingblow,
	ejected,
	transitioncutscene,
	fireass,
	firemouth,
	titlescreen,
	hookshot,
	tacklecharge,
	cheeseball,
	slap,
	cheesepep,
	cheesepepstick,
	boxxedpep,
	pistolaim,
	climbwall,
	knightpepslopes,
	portal,
	secondjump,
	chainsawbump,
	handstandjump,
	gottreasure,
	knightpep,
	knightpepattack,
	meteorpep,
	bombpep,
	grabbing,
	chainsawpogo,
	shotgunjump,
	stunned,
	highjump,
	chainsaw,
	facestomp,
		unused_2,
	timesup,
	machroll,
	shotgun,
	pistol,
	machfreefall,
	_throw,
	slam,
	superslam,
	skateboard,
	grind,
	grab,
	punch,
	backkick,
	uppunch,
	shoulder,
	backbreaker,
	bossdefeat,
	pizzathrow,
	bossintro,
	gameover,
	keyget,
	tackle,
	jump,
	ladder,
	slipnslide,
	comingoutdoor,
	smirk,
	Sjump,
	victory,
	Sjumpprep,
	crouch,
	crouchjump,
	crouchslide,
	mach1,
	mach2,
	machslide,
	bump,
	hurt,
	freefall,
	hang,
		unused_3,
	freefallland,
	door,
	barrelcrouch,
	barrelfloat,
	barrelmach2,
	barrelmach1,
	barrelfall,
	barrelnormal,
	barrelslipnslide,
	barrelroll,
	current,
	boulder,
	taxi,
	runonball,
	mach3,
	freefallprep,
	Sjumpland,
	
	// enemy states
	enemy_idle,
	enemy_bounce,
	enemy_charge,
	pizzagoblin_throw,
	enemy_turn,
		unused_4, // enemy_hitceiling?
		unused_5, // enemy_hitwall?
		unused_6,
	enemy_walk,
		unused_7,
	enemy_land,
	enemy_hit,
	enemy_stun,
		unused_8,
		unused_9,
	
	grabbed, // its also used by the player for coop
	shoulderbash,
	golf,
	shoryuken,
	breakdance,
	bombpepNEW,
	parry
}

scr_initinput()
global.saveroom = ds_list_create()
grav = 0.5
hsp = 0
vsp = 0
global.playerhealth = 5
xscale = 1
yscale = 1
facehurt = false
steppy = 0
depth = -7
movespeed = 19
jumpstop = false
visible = true
state = states.titlescreen
jumpAnim = true
landAnim = false
machslideAnim = false
moveAnim = true // unused
stopAnim = true
crouchslideAnim = true
crouchAnim = true
machhitAnim = false
stompAnim = false
inv_frames = 0
hurted = false
autodash = false // unused
mach2 = 0
input_buffer_jump = 8
input_buffer_secondjump = 8
input_buffer_highjump = 8
player_x = x
player_y = y
targetRoom = 0
targetDoor = "A"
flash = false
global.key_inv = false
global.shroomfollow = false
global.cheesefollow = false
global.tomatofollow = false
global.sausagefollow = false
global.pineapplefollow = false
global.keyget = 0 // unused
global.collect = 0
global.collectN = 0
global.treasure = false
global.combo = 0
global.combotime = 0
global.pizzacoin = 0
global.toppintotal = 1
global.hit = 0
global.baddieroom = ds_list_create()
global.gotshotgun = false
key_particles = false
barrel = 0
bounce = 0
a = 0
idle = 0
attacking = 0
slamming = 0
superslam = 0
grounded = true
grinding = 0
machpunchAnim = 0
punch = 0
machfreefall = 0
shoot = 1
instakillmove = 0
windingAnim = 0
facestompAnim = 0
ladderbuffer = 0
toomuchalarm1 = 0
toomuchalarm2 = 0
idleanim = 0
momemtum = 0
cutscene = 0
grabbing = 0
dir = xscale
shotgunAnim = 0
goingdownslope = 0
goingupslope = 0
fallinganimation = 0
bombpeptimer = 100
suplexmove = 0
suplexhavetomash = 0
anger = 0
angry = 0
baddiegrabbedID = 0
spr_palette = spr_peppalette
character = "P"
scr_characterspr()
paletteselect = 1
global.panic = false
global.snickchallenge = 0
colorchange = 0
treasure_x = 0
treasure_y = 0
treasure_room = 0
wallspeed = 0
tauntstoredstate = states.normal;
tauntstoredmovespeed = 6
tauntstoredsprite = spr_player_idle
taunttimer = 20
tauntstoredvsp = 0
global.golfhit = 0
ini_open("saveData.ini")
global.option_fullscreen = ini_read_real("Option", "fullscreen", 1)
global.option_resolution = ini_read_real("Option", "resolution", 1)
ini_close()
if (global.option_fullscreen == 0)
	window_set_fullscreen(true)
if (global.option_fullscreen == 1)
	window_set_fullscreen(false)
if (global.option_resolution == 0)
	window_set_size(480, 270)
if (global.option_resolution == 1)
	window_set_size(960, 540)
if (global.option_resolution == 2)
	window_set_size(1920, 1080)
backtohubstartx = x
backtohubstarty = y
backtohubroom = 0
global.style = 0
slapcharge = 0
slaphand = 1
slapbuffer = 8
slapflash = 0
freefallsmash = 0
costumercutscenetimer = 0
heavy = 0
lastroom_x = 0
lastroom_y = 0
lastroom = 0
hallway = 0
hallwaydirection = 0
box = 0
roomstartx = 0
roomstarty = 0
global.secretfound = 0
global.shotgunammo = 0
swingdingbuffer = 0
lastmove = 0
backupweapon = 0
ini_open("saveData.ini")
if (!ini_section_exists("SAGE2019"))
{
	ini_write_string("SAGE2019", "shotgunsnick", 0)
	ini_write_string("SAGE2019", "dungeonbackup", 0)
	ini_write_string("SAGE2019", "srank", 0)
	ini_write_string("SAGE2019", "snicksrank", 0)
	ini_write_string("SAGE2019", "combo10", 0)
	ini_write_string("SAGE2019", "secret", 0)
	ini_write_string("SAGE2019", "knight", 0)
	ini_write_string("SAGE2019", "toppin", 0)
	ini_write_string("SAGE2019", "treasure", 0)
}
global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0)
global.SAGEshotgunsnicknumber = 0
global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0)
global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0)
global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0)
global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0)
global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0)
global.SAGEknight = ini_read_string("SAGE2019", "knight", 0)
global.SAGEknighttaken = 0
global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0)
global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0)
global.fireassdashkeylearned = ini_read_string("KeyLearned", "fireassdashkey", 0)
ini_close()
stickpressed = 0
spotlight = 1
macheffect = 0
chargeeffectid = obj_null
dashcloudid = obj_null
crazyruneffectid = obj_null
fightball = 0
superslameffectid = obj_null
speedlineseffectid = obj_null
angryeffectid = obj_null
global.coop = 0
thrown = 0
mach1snd = -1
mach2snd = -1
mach3snd = -1
knightslide = -1
bombpep1snd = -1
mach4snd = -1
tumble2snd = -1
tumble1snd = -1
tumble3snd = -1
superjumpholdsnd = -1
superjumpprepsnd = -1
suplexdashsnd = -1
hitX = x
hitY = y
hithsp = 0
hitvsp = 0
hitLag = 25
golfid = -4
slope_buffer = 8
exitgateblend = 0
breakdance = 50
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡.:?¿1234567890ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", true, 0)
global.slop = 0
bombgrabID = -4
parry = 0
parry_inst = -4
taunt_to_parry_max = 10
parry_count = 0
parry_max = 8
flamecloud_buffer = 0
doublejump = 0