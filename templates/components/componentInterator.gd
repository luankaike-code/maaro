@tool
class_name ComponentInterator extends ComponentArea2D

signal interation_entered(interation: ComponentInteration)
signal interation_exited(interation: ComponentInteration)

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(area: Area2D):
	if area is ComponentInteration:
		interation_entered.emit(area)

func _on_area_exited(area: Area2D):
	if area is ComponentInteration:
		interation_exited.emit(area)

func interate() -> void:
	var interation: ComponentInteration = get_interation()
	
	if interation:
		interation.interate()

func get_interation() -> ComponentInteration:
	var interations: Array[ComponentInteration] = get_interations()
	
	var interation: ComponentInteration = HelperNode2D.get_nearest_node(
		self.global_position,
		interations
	)
	
	return interation

func get_interations() -> Array[ComponentInteration]:
	var areas2D: Array[Area2D] = self.get_overlapping_areas()
	var interations: Array[ComponentInteration]
	
	for area2D in areas2D:
		if area2D is ComponentInteration:
			interations.append(area2D)
	
	return interations
