extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 65
onready var player = get_parent().find_node("NewPlayer").get_node('KinematicBody2D')
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var target_pos = player.global_position
	self.rotation = target_pos.angle()
	var velocity = self.global_position.direction_to(target_pos)
	self.position += velocity * delta * speed

#	velocity += move_and_collide(velocity * delta * speed)


func _on_Area2D_area_entered(area):
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body:
		body.hit()
