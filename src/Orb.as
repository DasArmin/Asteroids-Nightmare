package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Orb extends GameObject
	{
		private var orb:OrbAsset;
		
		public function Orb() 
		{
			orb = new OrbAsset;
			addChild(orb);
		}
		
	}

}