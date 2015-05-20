package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Boomstam extends MovieClip
	{
		private var boomstam:BoomstamAsset;
		
		public function Boomstam() 
		{
			boomstam = new BoomstamAsset;
			addChild(boomstam);
		}
		
	}

}