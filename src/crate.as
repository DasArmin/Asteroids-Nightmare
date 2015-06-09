package  
{
	/**
	 * ...
	 * @author Darren Vanstaen
	 */
	public class crate extends GameObject
	{
		
		public function crate() 
		{
			collisionType = "circle";
			x = y = Math.random() * 800;
			addChild(new CharacterMiniAsset());
		}
		
	}

}