extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Make player unit, test 1
	var playerOne = preload("res://Unit/Unit.tscn").instance()
	playerOne.init(0, 0, 0, 0, 4, 10, 10)
	add_child(playerOne)
	
	# var playerOne = preload("res://Unit/UnitBlock.tscn").instance()
	# playerOne.init(10, 10, true)
	# add_child(playerOne)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass