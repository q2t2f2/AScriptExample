package  
{
	import flash.display.Sprite;
	import parser.Script;
	/**
	 * ...
	 * @author 邱腾飞
	 */
	public class Editor extends Sprite
	{
		
		public function Editor() 
		{
			Script.init(this);
			Script.execute("trace('啊啊哈哈哈哈啊');");
		}
		
	}

}