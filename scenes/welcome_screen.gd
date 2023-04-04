extends Control

# This script is used by the welcome, finish and contact screens.
# The button_pressed, contact_pressed and quit_pressed methods are
# used by the welcome and finish screen. The back_pressed method
# is used by the contact screen

var bg_colors = ["Blue", "Brown", "Gray", "Green", "Pink", "Purple", "Yellow"]

# Called when the node enters the scene tree for the first time.
func _ready():
	#Select a random color background from the backgrounds because it looks good
	$Sprite2D.texture = load("res://assets/Background/" + bg_colors[randi_range(0,6)] + ".png")


func _on_button_pressed():
	PointSystem.gameFinished()
	get_tree().change_scene_to_file("res://scenes/test_scene.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/welcome_screen.tscn")


func _on_contact_pressed():
	get_tree().change_scene_to_file("res://scenes/contact.tscn")
