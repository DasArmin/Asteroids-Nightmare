package
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Sebas
	 */
	public class MenuManager extends MovieClip 
	{
		private var background:MenuscreenAsset = new MenuscreenAsset;
		private var creditScreen:CreditsScreen = new CreditsScreen;
		private var HTPScreen:HowToPlay = new HowToPlay;
		
		private var mySound:Sound = new Sound();
		private var transSound:Sound = new Sound();
		
		private var TheCreditsButton: CreditsButton = new CreditsButton();
		private var CreditsBackButton: BackButton = new BackButton();
		private var ThePlayButton: PlayButton = new PlayButton();
		private var TheHowToButton: HTPlayButton = new HTPlayButton();
		
		public var PlayerSelection: int = 1;
		
		
		public function MenuManager() 
		{
			addChild(background);
			background.x = 857;
			background.y = 540;
			addChild(TheCreditsButton);
			addChild(ThePlayButton);
			addChild(TheHowToButton);
			
			mySound.load(new URLRequest("../assets/Menu_music.mp3"));
			transSound.load(new URLRequest("../assets/Menuovergang.mp3"));
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			mySound.play(0, 9999);
			
			TheCreditsButton.addEventListener("GetTheCredits", GetCredits);
			ThePlayButton.addEventListener("PlayTheGame", PlayGame);
			TheHowToButton.addEventListener("GetHTP", GetHTP);
			
			TheCreditsButton.addEventListener("UnselectEverything", unselectEverything);
			ThePlayButton.addEventListener("UnselectEverything", unselectEverything);
			TheHowToButton.addEventListener("UnselectEverything", unselectEverything);
			
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, buttonPushed);
		}
	
		private function GetCredits(e:Event):void
		{
			if (background.stage)
			{
			removeChild(background);
			}
			if (TheCreditsButton.stage)
			{
			removeChild(TheCreditsButton);
			}
			if (ThePlayButton.stage)
			{
			removeChild(ThePlayButton);
			}
			if (TheHowToButton.stage)
			{
				removeChild(TheHowToButton);
			}
			addChild(creditScreen);
			addChild(CreditsBackButton);
			CreditsBackButton.addEventListener("BackToMenu", ResetMenu);
			CreditsBackButton.x = 1500;
			CreditsBackButton.y = 800;
			transSound.play(0, 0);
		}
		
		private function ResetMenu(e:Event):void
		{
			transSound.play(0, 0);
			if (CreditsBackButton.stage)
			{
			removeChild(CreditsBackButton);
			}
			if (creditScreen.stage)
			{
			removeChild(creditScreen);
			}
			if (HTPScreen.stage)
			{
			removeChild(HTPScreen);
			}
			addChild(background);
			addChild(TheCreditsButton);
			addChild(ThePlayButton);
			addChild(TheHowToButton);
		}
		
		private function GetHTP(e:Event):void
		{
			if (background.stage)
			{
			removeChild(background);
			}
			if (TheCreditsButton.stage)
			{
			removeChild(TheCreditsButton);
			}
			if (ThePlayButton.stage)
			{
			removeChild(ThePlayButton);
			}
			if (TheHowToButton.stage)
			{
				removeChild(TheHowToButton);
			}
			addChild(HTPScreen);
			addChild(CreditsBackButton);
			CreditsBackButton.x = 150;
			CreditsBackButton.y = 800;
			CreditsBackButton.addEventListener("BackToMenu", ResetMenu);
			transSound.play(0, 0);
		}
		
		private function PlayGame(e:Event):void
		{
			transSound.play(0, 0);
			trace("Hier komt het spel");
		}
		
		private function buttonPushed(e:KeyboardEvent):void
		{
			var key:uint = e.keyCode;
			if (background.stage)
			{
			switch(key)
			{
				case 38: case 87: case 98:
				PlayerSelection--;
				break;
				case 40: case 83: case 104:
				PlayerSelection++;
				break;
			}
			}
			if (PlayerSelection > 3)
			{
			PlayerSelection = 3;
			}
			if (PlayerSelection < 1)
			{
			PlayerSelection = 1;
			}
			if (PlayerSelection == 1)
			{
				TheCreditsButton.unSelectMe();
				TheHowToButton.unSelectMe();
				ThePlayButton.selectMe();
			}
			if (PlayerSelection == 3)
			{
				ThePlayButton.unSelectMe();
				TheHowToButton.unSelectMe();
				TheCreditsButton.selectMe();
			}
			if (PlayerSelection == 2)
			{
				ThePlayButton.unSelectMe();
				TheHowToButton.selectMe();
				TheCreditsButton.unSelectMe();
			}
		
		}
		
		private function unselectEverything(e:Event):void
		{
			TheCreditsButton.unSelectMe();
			ThePlayButton.unSelectMe();
			TheHowToButton.unSelectMe();
		}
	
	}
}