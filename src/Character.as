package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Character extends MovieClip
	{
		private var character:CharacterAsset;
		
		public function Character() 
		{
			character = new CharacterAsset;
			addChild(character);
		}
		
	}

}