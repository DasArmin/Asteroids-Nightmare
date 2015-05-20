package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Sebas
	 */
	public class Menu extends MovieClip
	{		
		public function Menu() 
		{
			this.addEventListener(MouseEvent.CLICK, Clicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, Hover);
			this.addEventListener(MouseEvent.MOUSE_OUT, Leave);
			this.graphics.lineStyle(3,0x00ff00);
			this.graphics.beginFill(0x0000FF);
			this.graphics.drawRect(0,0,410,70);
			this.graphics.endFill();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, buttonSelect);
			// entry point
		}
		
		
		private function buttonSelect(e:KeyboardEvent):void
		{
			var key:uint = e.keyCode;
			switch(key)
			{
					case 13: case 32: case 90:
					dispatchMe();
					break;
			}
		}
		
		
		private function Clicked(e:MouseEvent):void
		{
			dispatchMe();	
		}
		
		public function Hover(e:MouseEvent):void
		{
			Selected();
		}
		
		public function Leave(e:MouseEvent):void
		{
			UnSelect();
			dispatchEvent(new Event("unselectEverything"));
		}
		
		public function dispatchMe():void
		{
			dispatchEvent(new Event("exitMenu"));
		}
		
		public function Selected():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(3,0x00ff00);
			this.graphics.beginFill(0x99FFFF);
			this.graphics.drawRect(0,0,410,70);
			this.graphics.endFill();
		}
		
		public function UnSelect():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(3,0x00ff00);
			this.graphics.beginFill(0x0000FF);
			this.graphics.drawRect(0,0,410,70);
			this.graphics.endFill();
		}
	}

}