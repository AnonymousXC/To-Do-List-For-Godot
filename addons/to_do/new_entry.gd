tool
extends VBoxContainer


var to_do_line = preload("res://addons/to_do/scenes/To Do line.tscn")



func _on_Button_pressed():
	var to_line_insta = to_do_line.instance()
	add_child(to_line_insta)


func _on_Del_All_pressed():
	var children = get_children()
	for child in children:
		if child != $Button and child != $HBoxContainer:
			child.queue_free()
