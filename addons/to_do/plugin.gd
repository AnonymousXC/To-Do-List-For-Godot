@tool
extends EditorPlugin


var panel_instance 


func _enter_tree():
	panel_instance = preload("res://addons/to_do/scenes/panel.tscn").instantiate()
	self.add_control_to_bottom_panel(panel_instance, "To Do")
	make_visible(true)


func _exit_tree():
	if panel_instance:
		self.remove_control_from_bottom_panel(panel_instance)


func make_visible(visible):
	if panel_instance:
		panel_instance.visible = visible



func has_main_screen():
	return true


func get_plugin_name():
	return "To Do List"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node" , "EditorIcons")

