extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var start = Vector2.ZERO
#var direction = Vector2.ZERO
var maxtime = 0.4 # adjust this in seconds
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	self.queue_free()
	
func _on_Area2D_area_entered(area):
	if area.is_in_group('hurtbox'):
		get_node("/root/Game/NewPlayer/KinematicBody2D").keep_score(1)
		area.get_parent().queue_free()
