class_name CardWithID extends RefCounted

var id: int
var card: UsableCard

func  _init(_id: int, _card: UsableCard):
	id = _id
	card = _card
