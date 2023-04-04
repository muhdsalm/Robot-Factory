extends Node2D

# This script will be used by all the scenes.

#Exported these variable so that they can be set individually for
#each scene.
@export var nextScene: PackedScene
@export var sceneNumber: int

# Called when the node enters the scene tree for the first time.
func _ready():
	#Every scene uses a different fruit, so calling this
	#switches the fruit in the UI as well.
	if sceneNumber == 1:
		PointSystem.switchToKiwis()
	if sceneNumber == 2:
		PointSystem.switchToOrange()
	if sceneNumber == 3:
		PointSystem.switchToStrawberry()


func _on_finish_body_entered(body):
	PointSystem.levelOverPing()
	get_tree().change_scene_to_packed(nextScene)
