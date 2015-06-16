package 
{
	import flash.display.MovieClip;
	import flash.events.AVLoadInfoEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Sebas
	 */
	public class HeartsUI extends MovieClip
	{
		
		private var TestPlayerHealth:int = 20;
		
		private var UIBackground:UserInterface = new UserInterface;
		
		private var Hartje1:LevenLevendUserinterfaceAsset = new LevenLevendUserinterfaceAsset;
		private var Hartje2:LevenLevendUserinterfaceAsset = new LevenLevendUserinterfaceAsset;
		private var Hartje3:LevenLevendUserinterfaceAsset = new LevenLevendUserinterfaceAsset;
		
		private var DeadHart1:LevenErafUserinterfaceAsset = new LevenErafUserinterfaceAsset;
		private var DeadHart2:LevenErafUserinterfaceAsset = new LevenErafUserinterfaceAsset;
		private var DeadHart3:LevenErafUserinterfaceAsset = new LevenErafUserinterfaceAsset;
		
			private var myText:TextField = new TextField();
			private var myFormat:TextFormat = new TextFormat();
		
		public function HeartsUI() 
		{	
			myFormat.size = 60;
			myText.defaultTextFormat = myFormat;
			myText.text = "Score: "+Main.Score;
			addChild(UIBackground);
			
			addChild(Hartje1);
			Hartje1.width = 120;
			Hartje1.height = 120;
			Hartje1.x = 30;
			
			addChild(Hartje2);
			Hartje2.width = 120;
			Hartje2.height = 120;
			Hartje2.x = 150;
			
			addChild(Hartje3);
			Hartje3.width = 120;
			Hartje3.height = 120;
			Hartje3.x = 270;
			
			DeadHart1.width = 120;
			DeadHart1.height = 120;
			DeadHart1.x = Hartje1.x;
			
			DeadHart2.width = 120;
			DeadHart2.height = 120;
			DeadHart2.x = Hartje2.x;
			
			DeadHart3.width = 120;
			DeadHart3.height = 120;
			DeadHart3.x = Hartje3.x; 
			
			UpdateHealth();
			addChild(myText);
			myText.x = 500;
			myText.width = 300;
		}
		
		public function UpdateHealth():void
		{
			//Get the player health
			if (TestPlayerHealth < 67)
			{
				addChild(DeadHart3);
			}
			if (TestPlayerHealth < 34)
			{
				addChild(DeadHart2);
			}
			if (TestPlayerHealth < 1)
			{
				addChild(DeadHart1);
			}
		}
	}

}