@tool
class_name ComponentInventory extends Component

@export var inventory_space: int = -1
@export var inventory_storage: Dictionary[int, ComponentItem]
@export var state_on_inventory: ItemsConfig.ItemStates = ItemsConfig.ItemStates.OnInventory
@export var state_out_inventory: ItemsConfig.ItemStates = ItemsConfig.ItemStates.OnWorld


func get_item(index: int) -> ComponentItem:
	if !inventory_storage.has(index):
		return null
	
	return inventory_storage.get(index)

func has_remmaing_space() -> bool:
	if inventory_space < 0:
		return true
	
	return inventory_storage.size() > inventory_space

func remove_item(index: int,  update_item_state: bool = true) -> ComponentItem:
	if !inventory_storage.has(index):
		return null
	
	var item: ComponentItem = inventory_storage.get(index)
	
	if update_item_state:
		item.current_state = state_out_inventory
		
	inventory_storage.erase(index)
	
	return item

func stock_up(item: ComponentItem, index: int = -1, update_item_state: bool = true) -> bool:
	if !has_remmaing_space():
		return false
	
	index = inventory_storage.size() if index < 0 else index
	
	if inventory_storage.has(index) && index >= 0:
		return false
	
	inventory_storage.set(index, item)
	
	if update_item_state:
		item.current_state = state_on_inventory
	
	return true
