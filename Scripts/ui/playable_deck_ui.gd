class_name PlayableDeckUI extends TextureButton

var deck: PlayableDeck

func draw() -> CardWithID:
	return deck.draw_card()

func is_empty():
	return deck.is_empty()
