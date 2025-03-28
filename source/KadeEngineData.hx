import flixel.input.gamepad.FlxGamepad;
import openfl.Lib;
import flixel.FlxG;

class KadeEngineData
{
	public static function initSave()
	{
		if (FlxG.save.data.language == null)
			FlxG.save.data.language = "en-US";

		if (FlxG.save.data.weekUnlocked == null)
			FlxG.save.data.weekUnlocked = 1;

		if (FlxG.save.data.newInput == null)
			FlxG.save.data.newInput = true;

		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.dfjk == null)
			FlxG.save.data.dfjk = false;

		if (FlxG.save.data.accuracyDisplay == null)
			FlxG.save.data.accuracyDisplay = true;

		if (FlxG.save.data.offset == null)
			FlxG.save.data.offset = 0;

		if (FlxG.save.data.songPosition == null)
			FlxG.save.data.songPosition = false;

		if (FlxG.save.data.fps == null)
			FlxG.save.data.fps = false;

		if (FlxG.save.data.changedHit == null)
		{
			FlxG.save.data.changedHitX = -1;
			FlxG.save.data.changedHitY = -1;
			FlxG.save.data.changedHit = false;
		}

		if (FlxG.save.data.fpsRain == null)
			FlxG.save.data.fpsRain = false;

		#if (web || mobile || switch)
		FlxG.save.data.fpsCap = 60;
		#else
		if (FlxG.save.data.fpsCap == null)
			FlxG.save.data.fpsCap = 120;

		if (FlxG.save.data.fpsCap > 240 || FlxG.save.data.fpsCap < 60)
			FlxG.save.data.fpsCap = 120; // baby proof so you can't hard lock ur copy of kade engine
		#end

		if (FlxG.save.data.scrollSpeed == null)
			FlxG.save.data.scrollSpeed = 1;

		if (FlxG.save.data.npsDisplay == null)
			FlxG.save.data.npsDisplay = false;

		if (FlxG.save.data.frames == null)
			FlxG.save.data.frames = 10;

		if (FlxG.save.data.accuracyMod == null)
			FlxG.save.data.accuracyMod = 0;

		if (FlxG.save.data.watermark == null)
			FlxG.save.data.watermark = true;

		if (FlxG.save.data.ghost == null)
			FlxG.save.data.ghost = true;

		if (FlxG.save.data.distractions == null)
			FlxG.save.data.distractions = true;

		if (FlxG.save.data.flashing == null)
			FlxG.save.data.flashing = true;

		if (FlxG.save.data.resetButton == null)
			FlxG.save.data.resetButton = false;

		if (FlxG.save.data.botplay == null)
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.gfCountdown == null)
			FlxG.save.data.gfCountdown = false;

		if (FlxG.save.data.zoom == null)
			FlxG.save.data.zoom = 1;

		if (FlxG.save.data.cacheCharacters == null)
			FlxG.save.data.cacheCharacters = false;

		if (FlxG.save.data.cacheSongs == null)
			FlxG.save.data.cacheSongs = false;

		if (FlxG.save.data.cacheMusic == null)
			FlxG.save.data.cacheMusic = false;

		if (FlxG.save.data.cacheSounds == null)
			FlxG.save.data.cacheSounds = false;

		if (FlxG.save.data.middleScroll == null)
			FlxG.save.data.middleScroll = false;

		if (FlxG.save.data.laneUnderlay == null)
			FlxG.save.data.laneUnderlay = false;

		if (FlxG.save.data.laneTransparency == null)
			FlxG.save.data.laneTransparency = 0.5;

		if (FlxG.save.data.selfAware == null)
			FlxG.save.data.selfAware = true;

		if (FlxG.save.data.mirrorMode == null)
			FlxG.save.data.mirrorMode = false;

		if (FlxG.save.data.hitSound == null)
			FlxG.save.data.hitSound = false;

		if (FlxG.save.data.hitSoundVolume == null)
			FlxG.save.data.hitSoundVolume = 1;

		if (FlxG.save.data.noteSplash == null)
			FlxG.save.data.noteSplash = true;

		if (FlxG.save.data.millisecond == null)
			FlxG.save.data.millisecond = false;

		psychCompat();

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		KeyBinds.gamepad = gamepad != null;

		Conductor.recalculateTimings();

		Main.watermarks = FlxG.save.data.watermark;

		(cast(Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
	}

	// Psych Engine cross-compatibility
	public static function psychCompat()
	{
		// Framerate
		if (FlxG.save.data.framerate == null)
			FlxG.save.data.framerate = FlxG.save.data.fpsCap;
		else
			FlxG.save.data.fpsCap = FlxG.save.data.framerate;

		// FPS Counter
		if (FlxG.save.data.showFPS == null)
			FlxG.save.data.showFPS = FlxG.save.data.fps;
		else
			FlxG.save.data.fps = FlxG.save.data.showFPS;

		// Downscroll
		if (FlxG.save.data.downScroll == null)
			FlxG.save.data.downScroll = FlxG.save.data.downscroll;
		else
			FlxG.save.data.downscroll = FlxG.save.data.downScroll;

		// Ghost Tapping
		if (FlxG.save.data.ghostTapping == null)
			FlxG.save.data.ghostTapping = FlxG.save.data.ghost;
		else
			FlxG.save.data.ghost = FlxG.save.data.ghostTapping;

		// Reset Button
		if (FlxG.save.data.noReset == null)
			FlxG.save.data.noReset = !FlxG.save.data.resetButton;
		else
			FlxG.save.data.resetButton = !FlxG.save.data.noReset;

		// Note Splashes
		if (FlxG.save.data.noteSplashes == null)
			FlxG.save.data.noteSplashes = FlxG.save.data.noteSplash;
		else
			FlxG.save.data.noteSplash = FlxG.save.data.noteSplashes;
	}
}
