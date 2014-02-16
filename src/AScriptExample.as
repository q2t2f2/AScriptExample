package
{
	import flash.display.Sprite;
	
	import parser.Script;
	
	public class AScriptExample extends Sprite
	{
		public function AScriptExample()
		{
			
			Script.init(this, "class global{}");
			start();
		}
		private function start():void
		{
			trace("start")
			//声明一个脚本类Test
			Script.LoadFromString("class Test{}");
			//创建脚本类的一个实例
			var test=Script.New("Test");
			//在Test类里声明一个脚本函数，add
			Script.declare("function add(a,b){return a+b;}","Test");
			//调用这个函数
			trace(test.add(33,44));
			//
			
			//在全局对象vm里面声明一个函数
			Script.declare("function add(a,b){return a+b;}");
			//调用该脚本函数
			trace(Script.vm.add(300,200));
			//--------精彩部分---------------------
			//设置Script.vm超类为this,以实现动态继承。
			Script.vm._super=this;
			//调用vm的add2方法
			trace(Script.vm.add2(100,200));
			Script.vm.helloworld();
		}
		public function add2(a,b){
			return a+b;
		}
		public function helloworld(){
			trace("hello AScript")
		}
	}
}