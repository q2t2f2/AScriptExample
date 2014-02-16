package  
{
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import parser.Script;
	
	/**
	 * ...
	 * @author 邱腾飞
	 */
	public class ScriptRunner extends Sprite 
	{
		private var txt:TextField;
		private var screen:MovieClip;
		
		public function ScriptRunner() 
		{
			var infoTxt:TextField = new TextField();
			infoTxt.width = 450;
			infoTxt.height = 30;
			infoTxt.htmlText = "输入脚本后按"+"<font color='#ff0000'><b>F1</b></font>运行";
			addChild(infoTxt);
			
			txt = new TextField();
			txt.width = 450;
			txt.height = 470;
			txt.y = 30;
			txt.type = TextFieldType.INPUT;
			txt.border = true;
			txt.multiline = true;
			txt.defaultTextFormat = new TextFormat("宋体", 14);
			addChild(txt);
			
			screen = new MovieClip();
			var g:Graphics = screen.graphics;
			g.lineStyle(2, 0x0000ff);
			g.drawRect(0, 0, 450, 500);
			screen.x = 450;
			addChild(screen);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			
			Script.addAPI("createSprite", createSprite);
			Script.init(this, "class Global{}");
			
			Script.vm._super = screen;
		}
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			
			var s:String = txt.text;
			switch(e.keyCode)
			{
				case 112://F1
					if (s != "")
					{						
						Script.execute(s);
					}
					break;
			}
		}
		
		private function createSprite():Sprite
		{
			return new Sprite();
		}
		
	}

}