extends KinematicBody2D

var dir = Vector2()
var currentDir = Vector2()

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

var speed = 0
var stepSize = 128
var moreOrLess = 4
const MAX_SPEED = 320

var atGridStep = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if(Input.is_action_just_released("left_click")):
		var posX = int(round(get_global_mouse_position().x / 32)) * 32
		var posY = int(round(get_global_mouse_position().y / 32)) * 32
		position.x = posX
		position.y = posY
		print("Grid Pos: ", position)
	
#func _input(event):
	# Mouse in viewport coordinates
	#if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
		#print("X Grid Pos: ", int(round(event.position.x / 32)))
		#print("Y Grid Pos: ", int(round(event.position.y / 32)))
		#position.x = int(round(event.position.x / 32)) * 32
		#position.y = int(round(event.position.y / 32)) * 32
		