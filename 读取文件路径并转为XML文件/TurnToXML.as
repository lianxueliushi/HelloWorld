package
{
	import com.xy.uitl.ReadFildToXML;
	
	import flash.display.Sprite;
	
	public class TurnToXML extends Sprite
	{
		
		public function TurnToXML()
		{
			var filetoXml:ReadFildToXML=new ReadFildToXML();
			var xml:XML=new XML("<root/>");
			filetoXml.readFileUrl("E:/山东省日照第一中学/电子书/电子翻书资料/",xml);
		}
	}
}