package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Bush extends GameObject
	{
		private var bush:BushAsset;
		
		public function Bush() 
		{
			bush = new BushAsset;
			addChild(bush);
		}
		
	}

}