package
{
	import spark.components.List;
	
	
	[Event(name="listItemClick",type="events.ListClickEvent")]
	public class MyList extends List
	{
		
		public function MyList()
		{
			super();
		}
	}
}