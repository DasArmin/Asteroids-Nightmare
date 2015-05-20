package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Armin Karimi Birgani
	 */
	public class Background extends MovieClip
	{
		//Art assets
		private var background_Art:EnvironmentAsset;
		
		//Level
		private var level = [
			[2, 4, 0, 0, 2, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 4, 0, 0],
			[4, 0, 1, 0, 4, 0, 0, 0, 0, 3],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 3, 0, 0, 0, 0, 0],
			[2, 0, 0, 0, 2, 0, 0, 0, 4, 0],
			[0, 0, 2, 0, 0, 0, 0, 0, 0, 0],
			[4, 0, 0, 0, 0, 2, 0, 0, 0, 3],
			[0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
			[2, 0, 4, 0, 3, 0, 0, 0, 0, 0],
		];
		
		//Other
		private var mist_vec:Vector.<MovieClip>;
		
		public function Background() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//Add Background art
			background_Art = new EnvironmentAsset();
			addChild(background_Art);
			
			//Level loop
			/*
			0 = 
			1 = 
			2 = 
			3 = 
			4 =
			*/
			for (var x:Number = 0; x < level[0].length; x++)
            {
                for (var y:Number = 0; y < level[0].length; y++)
                {
                        if (level[y][x] == 1)
                        {
							var character:Character = new Character();
                            
							character.x = 1920 / level[0].length * x;
                            character.y = 1080 / level.length * y;
							
							stage.addChild(character);
						}
						else if (level[y][x] == 2)
						{
							var tree:Tree = new Tree();
                            
							tree.x = 1920 / level[0].length * x;
                            tree.y = 1080 / level.length * y;
							
							stage.addChild(tree);
						}
						else if (level[y][x] == 3)
						{
							var boomstam:Boomstam = new Boomstam();
							
							boomstam.x = 1920 / level[0].length * x;
                            boomstam.y = 1080 / level.length * y;
							
							stage.addChild(boomstam);
						}
						else if (level[y][x] == 4)
						{
							var bush:Bush = new Bush();
							
							bush.x = 1920 / level[0].length * x;
                            bush.y = 1080 / level.length * y;
							
							stage.addChild(bush);
						}
				}
            }
			
			//Adding Mist art 4x and changing position.
			mist_vec = new Vector.<MovieClip>;
			
			for (var i:int = 0; i < 4; i++)
			{
				mist_vec.push(new Mistbank2Asset);
				addChild(mist_vec[i]);
			}
			mist_vec[2].x = -1920;
			mist_vec[3].x = 1920;
			
			//Mask left and right
			var mask_Left:Sprite = new Sprite();
			addChild(mask_Left);
			mask_Left.graphics.lineStyle(3, 0xffffff);
			mask_Left.graphics.beginFill(0xffffff);
			mask_Left.graphics.drawRect(0, -1, 100, 2000);
			mask_Left.graphics.endFill();
			mask_Left.x = -100;
			
			var mask_Right:Sprite = new Sprite();
			addChild(mask_Right);
			mask_Right.graphics.lineStyle(3, 0xffffff);
			mask_Right.graphics.beginFill(0xffffff);
			mask_Right.graphics.drawRect(0, -1, 100, 2000);
			mask_Right.graphics.endFill();
			mask_Right.x = 1920;
			
			
			//Update event listener
			stage.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		
		private function Update(e:Event):void 
		{
			//Move mist
			for (var i:int = 0; i <= mist_vec.length -1; i++)
			{
				//Switch turning true and false
				//Move right
				if (i % 2) //False
				{
					mist_vec[i].x += 1;
					if (mist_vec[i].x >= mist_vec[i].width)
					{
						mist_vec[i].x = -mist_vec[i].width;
					}
				}
				//Move left
				else //True
				{
					mist_vec[i].x -= 2;
					if (mist_vec[i].x <= -mist_vec[i].width)
					{
						mist_vec[i].x = 1920;
					}
				}
			}
		}
		
	}

}