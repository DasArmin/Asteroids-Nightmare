package 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Sebas
	 */
	public class MenuManager extends MovieClip
	{
		private var theMenu: Menu = new Menu();
		private var secondMenu:Menu = new Menu();
		private var thirdMenu:Menu = new Menu();
		
		public var PlayerSelection: int = 1;
		
		public function MenuManager() 
		{
			addChild(stage);
			addChild(theMenu);
			addChild(secondMenu);
			addChild(thirdMenu);
			
			theMenu.x = 950;
			theMenu.y = 300;
			secondMenu.x = 950;
			secondMenu.y = 200;
			thirdMenu.x = 950;
			thirdMenu.y = 100;
			
			theMenu.addEventListener("exitMenu", exitMenu);
			secondMenu.addEventListener("exitMenu", exitMenu);
			thirdMenu.addEventListener("exitMenu", exitMenu);
			
			theMenu.addEventListener("unselectEverything", unselectEvent);
			secondMenu.addEventListener("unselectEverything", unselectEvent);
			thirdMenu.addEventListener("unselectEverything", unselectEvent);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, buttonPushed);
			// entry point
		}
		
		private function buttonPushed(e:KeyboardEvent):void
		{
			var key:uint = e.keyCode;
			switch(key)
			{
				case 38: case 87: case 98:
				PlayerSelection++;
				break;
				case 40: case 83: case 104:
				PlayerSelection--;
				break;
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
				unselectAll();
				theMenu.Selected();
			}
			if (PlayerSelection == 2)
			{
				unselectAll();
				secondMenu.Selected();
			}
			if (PlayerSelection == 3)
			{
				unselectAll();
				thirdMenu.Selected();
			}
		}
		
		private function unselectAll():void
		{
			theMenu.UnSelect();
			secondMenu.UnSelect();
			thirdMenu.UnSelect();
		}
		
		private function exitMenu(e:Event):void
		{
			unselectAll();
			trace("hihi");
		}
		
		private function unselectEvent(e:Event):void
		{
			unselectAll();
		}
		
	}

}