package flexbrasil.controls
{
	import flash.events.Event;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.events.CollectionEvent;
	import mx.events.ListEvent;
	import mx.events.PropertyChangeEvent;
	
	import spark.components.List;

	public class ListSelectValue
	{
		private var _list:List;
		private var _property:String;
		private var _value:Object;
		private var _watcher:ChangeWatcher;

		public function ListSelectValue()
		{
			_list = null;
			_property = "value";
			_value = null;
		}

		public function refresh(e:Event = null):void
		{
			if (_list == null) return;

			for(var i:uint = 0; i < _list.dataProvider.length; i++)
			{
				var current:Object = _list.dataProvider.getItemAt(i);
				if (current[_property] == _value)
				{
					_list.selectedItem = current;
					return;
				}
			}
			_list.selectedItem = null;
		}

		public function get list():List
		{
			return _list;
		}

		public function set list(v:List):void
		{
			_list = v;
			setupWatcher();
			refresh();
		}

		public function get property():String
		{
			return _property;
		}

		public function set property(v:String):void
		{
			_property = v;
			refresh();
		}

		public function get value():Object
		{
			return _value;
		}

		public function set value(v:Object):void
		{
			_value = v;
			refresh();
		}

		private function setupWatcher():void
		{
			if (_watcher)
			{
				_watcher.unwatch();	
				_watcher = null;
			}
			if (_list)
				_watcher = ChangeWatcher.watch(_list, "dataProvider", refresh);
		}
	}
}