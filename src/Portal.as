package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Portal extends GameObject
	{
		private var molshoop:MolshoopAsset;
		private var rndPortal:DisplayObject;
		
		
		public function Portal() 
		{
			molshoop = new MolshoopAsset;
			addChild(molshoop);
			
			anchored = true;
		}
		
		public override function collidingWith(collideObject:GameObject):Boolean {
			if(stage.getChildByName("Player")){
				if (Main.portalTimer > 150 && collideObject is Player && super.collidingWith(collideObject) && (stage.getChildByName("Player") as Player).currentSize == 1) {
					Main.portalTimer = 0;
					
					do
						rndPortal = Main.portals[Math.floor(Math.random() * (Main.portals.length -1 ))]
					while (rndPortal == this)
					
					collideObject.x = rndPortal.x;
					collideObject.y = rndPortal.y;
				}
					//return super.collidingWith(collideObject);
			}
			return super.collidingWith(collideObject);
		}
	}

}