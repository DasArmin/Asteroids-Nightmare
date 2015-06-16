package 
{
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	
	import flash.events.Event;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	
	
	public class MuteMusic extends MovieClip
	{
		private var plaatje:Sound_Off_Button = new Sound_Off_Button;
		private var plaatje1:Sound_On_Button = new Sound_On_Button;
		
		private var myChannel:SoundChannel = new SoundChannel();
		
		private var quietSound:SoundTransform = new SoundTransform(0);
		private var loudSound:SoundTransform = new SoundTransform(1);
		
		private var BGMusic:Sound = new Sound();

		private var currentMusic:Number = 0;
		
		public function MuteMusic() 
		{
			
			this.x = 1730;
			if (stage)init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			BGMusic.load(new URLRequest("music.mp3"));
			this.addEventListener(MouseEvent.CLICK, Clicked);
			myChannel = BGMusic.play(0, 99999);
			addChild(plaatje1);
			plaatje1.width = 75;
			plaatje1.height = 75;
			plaatje.width = 75;
			plaatje.height = 75;
		}
			private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, changeMusic);
		}
		
		private function changeMusic():void
		{
			if (currentMusic == 0)
			{
				addChild(plaatje);
				removeChild(plaatje1);
				currentMusic = 1;
				myChannel.soundTransform = quietSound;
				
			}
			else if (currentMusic == 1)
			{
				addChild(plaatje1);
				removeChild(plaatje);
				currentMusic = 0;
				myChannel.soundTransform = loudSound;
			}
		}
		
		private function Clicked(e:MouseEvent):void
		{
			changeMusic();
		}
		
	}

}
