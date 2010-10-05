package flexbrasil.controls
{
	import flash.events.Event;
	
	import mx.collections.IList;
	
	import spark.components.ComboBox;
	
	public class ComboBox extends spark.components.ComboBox
	{
		private var _selectedValue:Object;
		private var _valueField:String = "value";

		public function ComboBox()
		{
			super();
		}

		public function get selectedValue():Object
		{
			return _selectedValue;
		}

		public function set selectedValue(value:Object):void
		{
			_selectedValue = value;
			refresh();
		}

		public function get valueField():String
		{
			return _valueField;
		}

		public function set valueField(value:String):void
		{
			_valueField = value;
			refresh();
		}

		public function refresh(e:Event = null):void
		{
			if (this.dataProvider == null) return;

			for(var i:uint = 0; i < this.dataProvider.length; i++)
			{
				var current:Object = this.dataProvider.getItemAt(i);
				if (current[_valueField] == _selectedValue)
				{
					this.selectedItem = current;
					return;
				}
			}
			this.selectedItem = null;
		}

		override public function set dataProvider(value:IList):void
		{
			super.dataProvider = value;
			refresh();
		}
	}
}