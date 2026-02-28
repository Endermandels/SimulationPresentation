extends Node
#Global

var saveables: Array[Saveable] = []

func register(obj: Saveable) -> void:
	print("* Registering obj")
	saveables.append(obj)

func unregister(obj: Saveable) -> void:
	print("* Unregistering obj")
	saveables.erase(obj)

func save_game() -> void:
	print("* Save Game")
	var save_data = []

	for s in saveables:
		save_data.append({
			"path": s.get_path(),
			"data": s.get_save_data()
		})
	
	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data, "  "))

func load_game() -> void:
	if !FileAccess.file_exists("user://save.json"):
		return
	print("* Load Game")
	
	var file = FileAccess.open("user://save.json", FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())

	for entry in parsed:
		var node = get_node_or_null(entry.path)
		if node:
			node.load_save_data(entry.data)
