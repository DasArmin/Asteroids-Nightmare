package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Tree extends MovieClip
	{
		private var tree:TreeAsset;
		
		public function Tree() 
		{
			tree = new TreeAsset();
			addChild(tree);
		}
		
	}

}