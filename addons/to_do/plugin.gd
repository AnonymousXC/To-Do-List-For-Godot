tool
extends EditorPlugin


const main_panel = preload("res://addons/to_do/scenes/panel.tscn")

var panel_instance 


func _enter_tree():
	panel_instance = main_panel.instance()
	get_editor_interface().get_editor_viewport().add_child(panel_instance)
	make_visible(false)


func _exit_tree():
	if panel_instance:
		panel_instance.queue_free()


func make_visible(visible):
	if panel_instance:
		panel_instance.visible = visible



func has_main_screen():
	return true


func get_plugin_name():
	return "To Do List"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node" , "EditorIcons")

