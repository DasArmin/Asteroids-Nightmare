package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Sebas
	 */
	public class Pause extends MovieClip
	{
		private var PauseButton:PauzeKnopUserinterfaceAsset = new PauzeKnopUserinterfaceAsset;
		private var PauseScreenClass:PauseScreen = new PauseScreen;
		public function Pause() 
		{
			this.x = 1850
			addChild(PauseButton);
			trace(Main.Score);
			this.addEventListener(MouseEvent.CLICK, Clicked);
		}
		
		private function Clicked(e:MouseEvent):void
		{
			if (!PauseScreenClass.stage)
			{
			addChild(PauseScreenClass);
			PauseScreenClass.x = 0;
			PauseScreenClass.y = 0;
			}
			else
			{
				removeChild(PauseScreenClass);
			}
		}
		
		
	}

}