class_name HelperNode2D extends Node

static func get_nearest_node(point: Vector2, nodes: Array) -> Node2D:
	var nearest_node: Node2D = null
	var smaller_distance: float
	
	for node: Node2D in nodes:
		if !nearest_node:
			nearest_node = node
			smaller_distance = nearest_node.global_position.distance_to(point)
		
		if node.global_position.distance_to(point) < smaller_distance:
			nearest_node = node
	
	return nearest_node
