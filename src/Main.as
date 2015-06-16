package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Darren Vanstaen
	 */
	public class Main extends Sprite 
	{
		static public var updateFrame:Vector.<MovieClip> = new Vector.<MovieClip>;
		static public var frameChild:MovieClip;
		
		static public var colissionObjects:Vector.<MovieClip> = new Vector.<MovieClip>;
		
		//Values
		public static var portalTimer:int = 300;
		static public var reservedStage:int = 1;
		static public var stageObjects:int = 0;
		
		static public var inputDown:Object = {};
		static public var inputUp:Object = {};
		static public var inputClick:Object = {};

		static public var screenWidth:Number = Capabilities.screenResolutionX;
		static public var screenHeight:Number = Capabilities.screenResolutionY;
		
		/* 0 = Nothing/Air;
		 * 1 = Tree;
		 * 2 = Bush;
		 * 3 = TreeTrunk;
		 * 4 = Mushroom;
		 * 5 = Portal;
		 * 6 = Player;
		 * 7 = RiverBlockSmall;
		 * 8 = RiverBlockMedium;
		 * 9 = RiverBlockBig;
		 * 
		 */
		static public var currentLevel:int = 0;
		static public var levels:Array = [
			[//Level 1
				[7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 9, 9, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,], 
				[8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 9, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 9, 0, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 9, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 7, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8,],
				[7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,],
				
			],
			[//Menu
				[10,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0,0,0],
			],
		]
		
		//Index
		private var input:String;
		static private var lookFace:Number;
		static private var lookDirection:Number;
		static private var x:int;
		static private var y:int;
		static private var sceneObject:GameObject;
		static private var stageObject:DisplayObject;
		static public var portals:Vector.<Portal> = new Vector.<Portal>;
		private var mist_vec:Vector.<MovieClip>;
		
		//test background
		private var bg:EnvironmentAsset;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			//Events
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			
			//test background
			bg = new EnvironmentAsset();
			addChild(bg);
			
			mist_vec = new Vector.<MovieClip>;
			
			for (var i:int = 0; i < 4; i++)
			{
				mist_vec.push(new Mistbank2Asset);
				addChild(mist_vec[i]);
			}
			mist_vec[2].x = -1920;
			mist_vec[3].x = 1920;
		}
		
		
		//FUNCTIONS
		static public function loadScene(stage:Stage, scene:int):void
		{
			currentLevel = scene;
			
			portals.length = colissionObjects.length = updateFrame.length = 0;
			while (stage.numChildren > 1)
				stage.removeChildAt(1);
			
			for (y = 0; y < levels[scene].length; y++ ) {
				for (x = 0; x < levels[scene][0].length; x++ ) {
					
					switch (levels[scene][y][x]){
						case 1:
							sceneObject = new Tree();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//dsceneObject.width = sceneObject.height = 600 / levels[scene].length + 100;
							
							sceneObject.customWidth = 50;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							//colissionObjects.push(stageObject);
							break;
						case 2:
							sceneObject = new Bush();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length + 100;
							
							sceneObject.customWidth = 50;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							//colissionObjects.push(stageObject);
							break;
						case 3:
							sceneObject = new Boomstam();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length + 100;
							
							sceneObject.customWidth = 50;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							//colissionObjects.push(stageObject);
							break;
						case 4:
							sceneObject = new Mushroom();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length + 100;
							
							sceneObject.customWidth = 50;
							
							stageObject = stage.addChild(sceneObject);
							updateFrame.push(stageObject);
							//colissionObjects.push(stageObject);
							break;
						case 5:
							sceneObject = new Portal();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length + 100;
							
							sceneObject.customWidth = 50;
							
							stageObject = stage.addChild(sceneObject);
							updateFrame.push(stageObject);
							//colissionObjects.push(stageObject);
							portals.push(stageObject);
							break;
						case 6:
							sceneObject = new Player();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length;
							
							stageObject = stage.addChild(sceneObject);
							updateFrame.push(stageObject);
							colissionObjects.push(stageObject);
							break;
						case 7:
							sceneObject = new RiverBlockSmall();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							colissionObjects.push(stageObject);
							break;
						case 8:
							sceneObject = new RiverBlockMedium();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							colissionObjects.push(stageObject);
							break;
						case 9:
							sceneObject = new RiverBlockBig();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							colissionObjects.push(stageObject);
							break;
							/*
						case 10:
							sceneObject = new MenuManager();
							sceneObject.x = (1920 / levels[scene][0].length) * x;
							sceneObject.y = (1080 / levels[scene].length) * y;
							//sceneObject.width = sceneObject.height = 600 / levels[scene].length;
							
							stageObject = stage.addChild(sceneObject);
							//updateFrame.push(stageObject);
							//colissionObjects.push(stageObject);
							break;
							*/
					}
				}
			}
		}
		
		
		//EVENT HANDLERS
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (!inputDown[String.fromCharCode(e.charCode)] || inputDown[String.fromCharCode(e.charCode)] == false)
				inputClick[String.fromCharCode(e.charCode)] = true;
			
			inputUp[String.fromCharCode(e.charCode)] = false;
			inputDown[String.fromCharCode(e.charCode)] = true;
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			inputUp[String.fromCharCode(e.charCode)] = true;
			inputDown[String.fromCharCode(e.charCode)] = false;
		}
		
		private function onMouseUp(e:MouseEvent):void 
		{
			if (inputDown["button1"] == false)
				inputClick["button1"] = true;
			
			inputUp["button1"] = false;
			inputDown["button1"] = true;
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			inputUp["button1"] = true;
			inputDown["button1"] = false;	
		}
		
		private function onEnterFrame(e:Event):void 
		{
			portalTimer++;
			
			if (Main.inputDown["r"])
				Main.loadScene(stage, 0);
			
			for each (frameChild in updateFrame)
				frameChild.onEnterFrame();
			
			for (input in inputClick)
				inputClick[input] = false;
				
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
		
		
		//PUBLIC STATIC FUNCTIONS
		static public function getFaceDirection(pos1:Point, pos2:Point):Number {
			
			lookDirection = Main.fromPosToAngle(pos1, pos2);
			
			lookFace = (Math.floor(lookDirection / 90) * 90 + Math.round(lookDirection / 90 - Math.floor(lookDirection / 90)) * 90) * -1;
			if (lookFace < 0) lookFace = (360 - Math.abs(lookFace)) % 360;
			
			return lookFace;
		}
		
		static public function magnitude(pos1:Point, pos2:Point):Number {
			return Math.sqrt( (pos1.x - pos2.x) * (pos1.x - pos2.x) + (pos1.y - pos2.y) * (pos1.y - pos2.y) )
		}
		
		static public function pointToUnit(pos1:Point, pos2:Point):Point {
			return Main.fromAngleToPos(Main.fromPosToAngle(pos1, pos2));
		}
		
		static public function fromAngleToPos(angle:Number):Point {
			return new Point(
				Math.cos( (angle-90)/180 * Math.PI ) * -1,
				Math.sin( (angle-90)/180 * Math.PI )
			)
		}
		static public function fromPosToAngle(pos1:Point, pos2:Point):Number {
			return Math.atan2( pos1.x - pos2.x, pos1.y - pos2.y ) * 180 / Math.PI
		}
		
		static public function destroyChild(child:DisplayObject):void 
		{
			
			if (Main.colissionObjects.indexOf(child)>=0)
				Main.colissionObjects.splice(Main.colissionObjects.indexOf(child), 1);
			
			if (Main.updateFrame.indexOf(child)>=0)
				Main.updateFrame.splice(Main.updateFrame.indexOf(child), 1);
			
			if (Main.portals.indexOf(child) >= 0)
				Main.portals.splice(Main.portals.indexOf(child), 1);
			
			child.parent.removeChild(child);
		}
		
	}
	
}