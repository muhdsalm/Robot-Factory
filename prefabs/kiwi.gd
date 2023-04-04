extends Area2D

# This script is used by all fruits

# Called when the node enters the scene tree for the first time.
func _ready():
	#"Kiwi" is an animation which is basically the animation of
	#the fruit rotating. It is called "Kiwi" because I first named
	#the animation "Kiwi" as the kiwi was the first fruit I 
	#implemented. I decided to roll with it.
	$AnimatedSprite2D.play("Kiwi")

func _on_body_entered(body):
	$Pop.play()
	PointSystem.fruits += 1
	$AnimatedSprite2D.animation = "collected"


#The next two functions. The first kills the texture and detection.
#However, the 'pop' sound lasts longer than the animation, so the
#second kills the sprite after the sound has finished
func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.queue_free()
	$CollisionShape2D.queue_free()

func _on_pop_finished():
	queue_free()
