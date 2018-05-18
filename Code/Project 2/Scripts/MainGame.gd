extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Make player unit, test 1
	var playerUnit = preload("res://Unit/Unit.tscn").instance()
	playerUnit.init(0, 0, 0, 0, 4, 3, 5, true)
	add_child(playerUnit)
	
	playerUnit = preload("res://Unit/Unit.tscn").instance()
	playerUnit.init(0, 0, 0, 0, 4, 3, 10, true)
	add_child(playerUnit)
	
	playerUnit = preload("res://Unit/Unit.tscn").instance()
	playerUnit.init(0, 0, 0, 0, 4, 3, 15, true)
	add_child(playerUnit)
	
	playerUnit = preload("res://Unit/Unit.tscn").instance()
	playerUnit.init(0, 0, 0, 0, 4, 21, 5, false)
	add_child(playerUnit)
	
	playerUnit = preload("res://Unit/Unit.tscn").instance()
	playerUnit.init(0, 0, 0, 0, 4, 21, 10, false)
	add_child(playerUnit)
	
	playerUnit = preload("res://Unit/Unit.tscn").instance()
	playerUnit.init(0, 0, 0, 0, 4, 21, 15, false)
	add_child(playerUnit)
	
	# var playerOne = preload("res://Unit/UnitBlock.tscn").instance()
	# playerOne.init(10, 10, true)
	# add_child(playerOne)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass