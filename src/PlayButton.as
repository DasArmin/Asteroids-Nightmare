package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class PlayButton extends Sprite
	{
		private var creditButton:Screen_ButtonPlayAsset = new Screen_ButtonPlayAsset;
		
		public var amISelected:Boolean = true;
		
		public function PlayButton() 
		{
			this.addEventListener(MouseEvent.CLICK, Clicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, Hover);
			this.addEventListener(MouseEvent.MOUSE_OUT, Leave);
			this.x = 200;
			this.y = 100;
			this.alpha = 1;
			addChild(creditButton);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function Clicked(e:MouseEvent):void
		{
			dispatchMe();
		}
		
		public function Hover(e:MouseEvent):void
		{
			selectMe();
		}
		
		public function Leave(e:MouseEvent):void
		{
			unSelectMe();
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, buttonSelect);
			// entry point
		}
		
		
		private function buttonSelect(e:KeyboardEvent):void
		{
			if (this.stage)
			{
			var key:uint = e.keyCode;
			switch(key)
			{
					case 13: case 32: case 90:
					if (amISelected == true)
					{
					dispatchMe();
					}
					break;
			}
			}
		}
		
		private function dispatchMe():void
		{
			dispatchEvent(new Event("PlayTheGame"));	
		}
		
		public function selectMe():void
		{
			dispatchEvent(new Event("UnselectEverything"));
			this.alpha = 1;
			amISelected = true;
		}
		
		public function unSelectMe():void
		{
			this.alpha = 0.333;
			amISelected = false;
		}
			
	}

}