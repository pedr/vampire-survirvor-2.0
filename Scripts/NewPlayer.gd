extends KinematicBody2D

var whip_scene = load("res://Scenes/Whip.tscn")

export (int) var speed = 80

var velocity = Vector2()
var counter = 0
var can_attack = true
var last_direction = 'left'
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _process(delta):
	var score_label = get_node('/root/Game/UserInterface/Label')
	score_label.text = "Score: %s" % str(score)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if (can_attack):
		attack()
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		last_direction = 'right'
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		last_direction = 'left'
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func attack():
	can_attack = false
	var whip = whip_scene.instance()
	whip.position = self.position
	if (last_direction == 'left'):
		whip.position.x -= 75
	if (last_direction == 'right'):
		whip.position.x += 75
	get_parent().add_child(whip)
	counter += 1
	yield(get_tree().create_timer(1.2), "timeout")
	can_attack = true
	
func keep_score(val):
	score += val
	
func hit():
	get_tree().paused = true
	var score_label = get_node('/root/Game/DeathScreen/ScoreLabel')
	score_label.text = "%s pointss" % str(score)
	var death_screen = get_node('/root/Game/DeathScreen')
	death_screen.visible = true
	
