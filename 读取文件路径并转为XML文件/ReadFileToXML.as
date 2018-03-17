package
{
	/**
	 *使用实例
	 * var xml:XML=<root></root>
	 * ReadFileToXML.getInstance.Turn("要读取的文件路径string","要写入的xml")
	 * ReadFileToXML.getInstance.saveFile("more.xml");
	 */	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filesystem.File;

	public class ReadFileToXML extends MovieClip
	{
		private var xml:XML;
		private var fileUrl:String;
		public  function ReadFileToXML()
		{
			super();
		}
		public static function getInstance():ReadFileToXML{
			return new ReadFileToXML();
		}
		public  function Turn(fileurl:String,$xml:XML):XML{
			xml=$xml;
			var directory:File = File.applicationDirectory.resolvePath(fileurl);
			var contents:Array = directory.getDirectoryListing(); 
			for (var i:uint = 0; i < contents.length; i++)  
			{ 
				//trace("一级目录："+decodeURI(contents[i].url));  
				var file:File=contents[i];
				if(file.isDirectory){
					var tempxml:XML=<country id={i} name={file.name}></country>;
					var ctList:Array=file.getDirectoryListing();  
					for(var j=0;j<ctList.length;j++){
						//trace("二级目录:"+decodeURI(ctList[j].url));  
						var f:File = ctList[j];
						tempxml.appendChild(<quyu id={j} name={f.name} >{j+1}</quyu>);
						if(j==ctList.length-1){
							xml.appendChild(tempxml);
						}
					}
				}else{
					xml.appendChild(<country name={file.name}></country>);
				}
			}
			return xml;
		}
		public function TurnPageToxml(fileurl:String,$xml:XML):XML{
			xml=$xml;
			var directory:File = File.applicationDirectory.resolvePath(fileurl);
			var contents:Array = directory.getDirectoryListing(); 
			for (var i:uint = 0; i < contents.length; i++)  
			{ 
				
				//trace("一级目录："+decodeURI(contents[i].url));  
				var file:File=contents[i];
				if(i==0 || i==contents.length-1){
					xml.appendChild(<page id={i} src={decodeURI(contents[i].url)}/>);
				}
				else{
					xml.appendChild(<page id={i} src={decodeURI(contents[i].url)}/>);
					xml.appendChild(<page id={i} src={decodeURI(contents[i].url)}/>);
				}
				
			}
			return xml;
		}
		public function saveFile($xml:XML,$name:String):void{
			var file:File=File.applicationDirectory.resolvePath(File.documentsDirectory.url);
			if(!file.exists){
				file.createDirectory();
				
			}
			file.save($xml,$name);
		}
	}
}