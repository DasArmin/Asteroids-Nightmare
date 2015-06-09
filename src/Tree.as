package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Tree extends GameObject
	{
		private var tree:TreeAsset;
		
		public function Tree() 
		{
			//Width 92.80
			
			tree = new TreeAsset();
			addChild(tree);
		}
		
	}

}