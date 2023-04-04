extends StaticBody2D

#Why are there two variables? The first one is true if the body
#(i.e. the player) is in the bounding box of the traps. The second
#is true if the trap should be active (there's a delay). If both are
#active, only then does it kill the player.
var body_in_collision: = false
var kill_or_not: = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("off")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if kill_or_not and body_in_collision:
		%CharacterBody2D.queue_free()
		PointSystem.gameFinished()
		get_tree().change_scene_to_file("res://scenes/test_scene.tscn")

func _on_area_2d_body_entered(body):
	#StartFireTimer counts the delay for the trap to activate.
	$StartFireTimer.start()
	body_in_collision = true


func _on_timer_timeout():
	$AnimatedSprite2D.animation = "on"
	#StopFireTimer counts the time before the trap should deactivate.
	$StopFireTimer.start()
	kill_or_not = true

func _on_stop_fire_timer_timeout():
	$AnimatedSprite2D.animation = "off"
	kill_or_not = false


func _on_area_2d_body_exited(body):
	body_in_collision = false
