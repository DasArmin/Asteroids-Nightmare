package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Boomstam extends GameObject
	{
		private var boomstam:BoomstamAsset;
		
		public function Boomstam() 
		{
			boomstam = new BoomstamAsset;
			addChild(boomstam);
		}
		
	}

}