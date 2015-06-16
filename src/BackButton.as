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
	public class BackButton extends Sprite
	{
		private var creditButton:BackButtonCredits = new BackButtonCredits;
		
		public var amISelected:Boolean = false;
		
		public function BackButton():void
		{
			this.addEventListener(MouseEvent.CLICK, Clicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, Hover);
			this.addEventListener(MouseEvent.MOUSE_OUT, Leave);
			this.x = 1500;
			this.y = 800;
			this.alpha = 0.333;
			addChild(creditButton);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, buttonSelect);
			// entry point
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
		
		
		private function buttonSelect(e:KeyboardEvent):void
		{
			if (this.stage)
			{
			var key:uint = e.keyCode;
			switch(key)
			{
				
					case 38: case 87: case 98: case 40: case 83: case 104:
					selectMe();
					break;
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
			unSelectMe();
			dispatchEvent(new Event("BackToMenu"));	
		}
		
		private function selectMe():void
		{
			this.alpha = 1;
			amISelected = true;
		}
		
		private function unSelectMe():void
		{
			this.alpha = 0.333;
			amISelected = false;
		}
	}

}