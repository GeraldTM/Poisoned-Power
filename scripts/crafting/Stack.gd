class_name Stack

var _item_type: Item
var _size:int

func Stack(item:Item, size:int):
	_size=size
	_item_type=item

func add_item():
	_size = _size + 1

func remove_item(item:Item):
	if (_size > 0):
		_size = _size - 1
	else:
		push_error(("tried to remove a " + _item_type.get_item_name() + " from empty an stack"))
