tool
extends HBoxContainer

var white = Color(255,255,255,1)
var parent 


func _ready():
	parent = get_parent()



func _on_Delete_pressed():
	self.queue_free()



func _on_Function_text_changed(new_text):
	if "#Todo:" in new_text or "#todo:" in new_text or "Todo:" in new_text :
		$Function.modulate = "#50fa7b"
		$Task.add_color_override("font_color", "#50fa7b")
		$Index.modulate = "#50fa7b"
		$File.add_color_override("font_color", "#50fa7b")
		$"Line Num".add_color_override("font_color", "#50fa7b")
	if "#Hack:" in new_text or "#hack:" in new_text or "Hack:" in new_text:
		$Function.modulate = "#ffb86c"
		$Task.add_color_override("font_color", "#ffb86c")
		$Index.modulate = "#ffb86c"
		$File.add_color_override("font_color", "#ffb86c")
		$"Line Num".add_color_override("font_color", "#ffb86c")
	if "#Fix:" in new_text or "#fix:" in new_text or "Fix:" in new_text:
		$Function.modulate = "#ff5555"
		$Task.add_color_override("font_color", "#ff5555")
		$Index.modulate = "#ff5555"
		$File.add_color_override("font_color", "#ff5555")
		$"Line Num".add_color_override("font_color", "#ff5555")



func _on_Index_text_changed(new_text):
	var index = new_text.replace("#", "")
	var index_int = int(index)
	var parent_children = parent.get_child_count()
	if index_int and index_int > 0 and index_int <= parent_children:
		parent.move_child(self, index_int + 1)




func _on_Done_pressed():
	if $Task.editable == true:
		$Task.editable = false
		$Index.editable = false
		$Function.editable = false
		$"Line Num".editable = false
		$File.editable = false
		$Task.add_color_override("font_color_uneditable", "#44475a")
		$Index.add_color_override("font_color_uneditable", "#44475a")
		$Function.add_color_override("font_color_uneditable", "#44475a")
	else:
		$Task.editable = true
		$Function.editable = true
		$Index.editable = true
		$"Line Num".editable = true
		$File.editable = true


func _on_File_text_entered(new_text):
	var file
	if new_text:
		file = load(new_text)
	if file:
		var pulgin = EditorPlugin.new()
		pulgin.get_editor_interface().edit_resource(file)
		if $"Line Num".text and int($"Line Num".text) > 0:
			pulgin.get_editor_interface().get_script_editor().goto_line(int($"Line Num".text)-1)
