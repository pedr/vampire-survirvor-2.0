extends Node2D


var bullet_scene = load("res://Scenes/Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maxtime = 0.3
var spawn_rate = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "_on_EnemyTimer_timeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_EnemyTimer_timeout():
	var player = get_node("/root/Game/NewPlayer/KinematicBody2D")
	var pos = player.position
	
	for enemy in range(spawn_rate):
		var e = bullet_scene.instance()

		if randf() < 0.5:
			# On the left
			pos.x -= rand_range(50.0, 200.0)
		else:
			# On the right
			pos.x += rand_range(50.0, 200.0)

		e.position = pos
		get_parent().add_child(e)

func increase_spawn_rate():
	spawn_rate *= 1.5
