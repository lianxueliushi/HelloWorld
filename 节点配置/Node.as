package
{
	public class Node extends Object
	{
		[Bindable]
		public var des:String;
		[Bindable]
		public var time:String;
		[Bindable]
		public var order:String;
		[Bindable]
		public var light:uint;
		[Bindable]
		public var id:uint;
		[Bindable]
		public var type:String;
		public static var Type_light:String="light";
		public static var Type_wutai:String="wutai";
		
		public function Node($time:String,$order:String,$light:uint,$des:String,$type:String)
		{
			time=$time;
			order=$order;
			light=$light;
			des=$des;
			type=$type;
		}
	}
}