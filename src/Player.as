package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Darren Vanstaen
	 */
	public class Player extends GameObject
	{
		//public var bullet:Bullet;
		private var direction = 180;
		
		private var currentAnimation:MovieClip;
		
		public var hiding = false;
		private var frameCount:Number = 0;
		
		private var animations = [
			[//Groot
				[//Idle
					new CharacterIdleBack,
					new IdleFront,
					new IdleSide
				],
				[//Run
					new Character_Walk_Back,
					new Character_Walk_Front,
					new Character_Walk_Side
				],
				[//Die
					new Character0_Die,
					new Character90_Die,
					new Character180_Die,
					new Character270_Die
				],
				[//Throw
					new Character0_Throw,
					new Character90_Throw,
					new Character180_Throw,
					new Character270_Throw
				],
				[//Swap
					new Character180_Swap,
					new Character0_Swap,
					new Character270_Swap,
					new Character90_Swap
					
				]
			],
			[//Small
				[//Mini Walk
					new Mini_Walk
				],
				[//Mini Die
					new Mini_Die
				],
			]
		]
		/* 0 = Groot;
		 * 1 = Small;
		 */
		public var currentSize:int = 0;
		
		
		/* 0 = Idle;
		 * 1 = Run;
		 * 2 = Die;
		 * 3 = Throw;
		 * 4 = Swap;
		 */
		private var currentAnimationType:int = 2;
		
		/*
		 * 0 = Rechts
		 * 1 = Links
		 * */
		private var currentRotation:int = 0;
		
		public function Player() 
		{			
			y = 400;
			
			addChild(new CharacterIdleBack);
			
			name = "Player";
			
			collisionType = "circle";
		}
		
		private function setAnimation():void
		{
			if (this.numChildren > 0)
				this.removeChildAt(0);
			
			addChild(animations[currentSize][currentAnimationType][currentRotation]);
			currentAnimation = animations[currentSize][currentAnimationType][currentRotation];
		}
		
		public override function onEnterFrame():void 
		{
			super.onEnterFrame();
			
			frameCount++;
			/*
			if ( frameCount > 100)
			{
				frameCount = 0;
				
			}
			*/
			if (Main.inputDown["d"]) {
				
				this.moveDirection.x += 1;
				
			} else if (Main.inputDown["a"]) {
				this.moveDirection.x -= 1;
			}
			if (Main.inputDown["w"]) {
				this.moveDirection.y -= 1;
			} else if (Main.inputDown["s"]) {
				this.moveDirection.y += 1;
			}
			
			if (Main.inputClick[" "] && currentSize == 0) {
				var bullet:Kogel = new Kogel();
				
				bullet.x = x;
				bullet.y = y;
				
				bullet.moveDirection = Main.fromAngleToPos(Main.fromPosToAngle(new Point(0,0),new Point(moveDirection.x, moveDirection.y)));
				
				Main.updateFrame.push(bullet);
				//Main.colissionObjects.push(bullet);
				stage.addChild(bullet);
			}
			
			if (Main.inputClick["e"]) {
				
				currentSize = 1; //klein
				currentAnimationType = 0; //Walk
				currentRotation = 0;
				setAnimation();
			}
			
			frameCount += 0.5;
			
			if (frameCount >= 1 && currentSize == 1)
			{
				frameCount = 0;
				this.removeChildAt(0);
				currentAnimationType = 0;
				setAnimation();
			}
			
			//trace(Main.getFaceDirection(new Point(0, 0), moveDirection));
			
			if (Main.getFaceDirection(new Point(0, 0), moveDirection) != direction && currentSize == 0 ) {
				switch (Main.getFaceDirection(new Point(0, 0), moveDirection))
				{
					case 0:
						currentRotation = 0;
						setAnimation();
						direction = 0;
						this.scaleX = 1;
						break;
					case 90:
						currentRotation = 1;
						setAnimation();
						direction = 90;
						this.scaleX = -1;
						break;
					case 180:
						currentRotation = 2;
						direction = 180;
						this.scaleX = 1;
						break;
					case 270:
						currentRotation = 3;
						setAnimation();
						direction = 270;
						this.scaleX = 1;
						break;
				}
			}
		}
		
	}

}