extends Control

var page = 1

var pages = [
	load("res://assets/Tut1.png"),
	load("res://assets/Tut2.png"),
	load("res://assets/Tut3.png"),
	load("res://assets/Tut4.png"),
	load("res://assets/Tut5.png"),
]


func _on_back_pressed() -> void:
	if(page == 1):
		get_tree().change_scene_to_file("res://scenes/Start.tscn")
	else:
		page -= 1
		$TextureRect.texture = pages[page]


func _on_next_pressed() -> void:
	if(page == 4):
		get_tree().change_scene_to_file("res://scenes/Start.tscn")
	else:
		page += 1
		$TextureRect.texture = pages[page]
