package events
{
	import flash.events.Event;
	
	public class ListClickEvent extends Event
	{
		public var data:Object;
		public function ListClickEvent(type:String, $data:*,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			data=$data;
			super(type, bubbles, cancelable);
		}
	}
}