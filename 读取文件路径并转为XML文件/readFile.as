package 
{


	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.filesystem.File;

	public class readFile extends Sprite
	{

		private var xml:XML;

		private var myFileReference:File;

		public function readFile()
		{
			xml=<root></root>;
			
			this.btn.addEventListener(MouseEvent.CLICK,onChoose);
		}
		private function onChoose(e:MouseEvent):void
		{
			myFileReference=new File();
			myFileReference.browseForDirectory("Select Directory");
			myFileReference.addEventListener(Event.SELECT, directorySelected);
			/*myFileReference = new FileReference();
			myFileReference.browse(["*"]);
			myFileReference.addEventListener(Event.SELECT,onSelect);*/
			//ReadFileToXML.getInstance().TurnPageToxml(txt_file.text,xml);

			//ReadFileToXML.getInstance().TurnPageToxml("D:/项目资料/郑州市二七区人民法院/电子翻书/pages",xml);
			//ReadFileToXML.getInstance().saveFile(xml,"page.xml");
		}
		function directorySelected(event:Event):void
		{
			var directory:File = event.target as File;
			var files:Array = directory.getDirectoryListing();
			ReadFileToXML.getInstance().Turn(directory.url,xml);
			ReadFileToXML.getInstance().saveFile(xml,"code.xml");
			for (var i:uint = 0; i < files.length; i++)
			{
				trace(files[i].name,files[i].url);
			}
		}
	}
}