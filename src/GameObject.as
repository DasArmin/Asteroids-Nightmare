package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Darren Vanstaen
	 */
	public class GameObject extends MovieClip
	{
		//Movement
		public var moveDirection:Point = new Point();
		public var moveSpeed:Number = 1;
		public var speedDividor:Number = 10;
		
		//Index
		private var velocity:Point;
		private var collideChild:GameObject;
		private var collideChildDirection:Number;
		private var point1:Point = new Point();
		private var point2:Point = new Point();
		private var lookDirection:Point;
		private var faceDirection:Point;
		private var collideDistance:Number;
		private var upperRenderFoe:DisplayObject;
		
		//Values
		public var customWidth:Number = 50;
		
		//Collision
		public var anchored:Boolean = false;
		public var canCollide:Boolean = true;
		public var collisionType:String = "box";
		public var collisions:Vector.<GameObject> = new Vector.<GameObject>;
		
		public function GameObject() {}
		
		public function collidingWith(collideObject:GameObject):Boolean {
			
			point1.x = collideObject.x;	point1.y = collideObject.y;
			point2.x = this.x;			point2.y = this.y;
			
			collideDistance = Main.magnitude(point1, point2);
			
			if (collideObject != this && collideObject.collisionType == "box" && this.hitTestObject(collideObject)) {
				collisions.push(collideObject);
				return true
				
			} else if (collideObject != this && collideDistance < collideObject.customWidth / 2 + this.customWidth / 2) {
				collisions.push(collideObject);
				return true
			}
			
			return false
		}
		
		
		public function onEnterFrame():void {
			collisions.length = 0
			
			x += anchored ? 0 : moveDirection.x * moveSpeed;
			y += anchored ? 0 : moveDirection.y * moveSpeed;
			
			moveDirection.x -= moveDirection.x / speedDividor;
			moveDirection.y -= moveDirection.y / speedDividor;
			
			if (canCollide) {
				for each (collideChild in Main.colissionObjects) {
					if (collidingWith(collideChild)) {
						
						collideChild.collidingWith(this);
						
						if (!anchored && collideChild.collisionType == "box") {
							
							//BOX COLLISION
							lookDirection = Main.fromAngleToPos(Main.getFaceDirection(point1, point2));
							
							x = Math.abs(lookDirection.x) == 1 ? collideChild.x + (collideChild.customWidth / 2 + this.customWidth / 2) * (lookDirection.x * -1) : x;
							y = Math.abs(lookDirection.y) == 1 ? collideChild.y + (collideChild.height / 2 + this.height / 2) * lookDirection.y : y;
							
						} else if (!anchored) {
							
							//CIRCLE COLLISION
							lookDirection = Main.fromAngleToPos(Main.fromPosToAngle(point1, point2));
							
							x = collideChild.x + lookDirection.x * (collideChild.customWidth / 2 + this.customWidth / 2);
							y = collideChild.y + lookDirection.y * (collideChild.customWidth / 2 + this.customWidth / 2);
						}
					}
				}
			}
			while (parent && parent.getChildIndex(this) > Main.reservedStage) {
				upperRenderFoe = parent.getChildAt( parent.getChildIndex(this) - 1 );
			
				if (upperRenderFoe && y < upperRenderFoe.y)
					parent.addChildAt(this, parent.getChildIndex(upperRenderFoe) );
				else break;
			}
		}
		
	}

}