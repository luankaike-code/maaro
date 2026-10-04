class_name HelperInventory

static func log_item(item: ComponentItem):
	print("item: %s; index: %d" % [item.item_name, item.current_state])

static func log_items(items: Array[ComponentItem]):
	for item in items:
		log_item(item)
