package  
{
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
		private var background_Art:BackgroundArt;
		
		//Other
		private var mist_vec:Vector.<MovieClip>;
		private var tree_vec:Vector.<MovieClip>;
		
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
			background_Art = new BackgroundArt();
			addChild(background_Art);
			
			//Adding Tree art 4x and changing position.
			tree_vec = new Vector.<MovieClip>;
			
			for (var j:int = 0; j < 4; j++)
			{
				tree_vec.push(new TreeAsset);
				addChild(tree_vec[j]);
			}
			
			//Position tree in every corner
			/*
			tree_vec[0].x = 130;
			tree_vec[0].y = 150;
			
			tree_vec[1].x = 130;
			tree_vec[1].y = 930;
			
			tree_vec[2].x = 1790;
			tree_vec[2].y = 150;
			
			tree_vec[3].x = 1790;
			tree_vec[3].y = 930;
			*/
			
			//Random spawn + Hit test
			for each( var child:TreeAsset in tree_vec) 
			{
				child.x = 130 + Math.floor(Math.random() * (1790 - 130));
				child.y = 150 + Math.floor(Math.random() * (930 - 150));
				
				if (child.hitTestObject(child))
				{
					child.x = 130 + Math.floor(Math.random() * (1790 - 130));
					child.y = 150 + Math.floor(Math.random() * (930 - 150));
				}
			}
			
			
			//Adding Mist art 4x and changing position.
			mist_vec = new Vector.<MovieClip>;
			
			for (var i:int = 0; i < 4; i++)
			{
				mist_vec.push(new MistArt);
				addChild(mist_vec[i]);
			}
			mist_vec[2].x = -1920;
			mist_vec[3].x = 1920;
			
			
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