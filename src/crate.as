package  
{
	/**
	 * ...
	 * @author Darren Vanstaen
	 */
	public class crate extends GameObject
	{
		private var boxBlock:CircleBlock;
		
		public function crate() 
		{
			boxBlock = new CircleBlock;
			addChild(boxBlock);
			
			collisionType = "box";
			//x = y = Math.random() * 800;
			customWidth = 500;
		}
		
	}

}