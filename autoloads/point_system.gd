extends Node2D


var fruits: = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$FruitCount.text = "x" + String.num_int64(fruits)

func switchToKiwis():
	$FruitImage.texture = load("res://assets/Items/Fruits/Kiwi.png")

func switchToOrange():
	$FruitImage.texture = load("res://assets/Items/Fruits/Orange.png")

func switchToStrawberry():
	$FruitImage.texture = load("res://assets/Items/Fruits/Strawberry.png")
func gameFinished():
	fruits = 0

func levelOverPing():
	$levelOverPing.play()

#There's actually two tracks. The first (Music) is some music. The second
#(MusicLoop) is a part of the first track that is meant to be looped.
func _on_music_finished():
	$MusicLoop.play()
