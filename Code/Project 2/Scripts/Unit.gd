extends Node2D

onready var isSelected
onready var isSmile

onready var attackDamage

onready var maxMove
onready var currentMove

onready var maxSize
onready var currentSize

onready var childList

onready var unit_id

func _ready():
	currentSize = 1
	childList = []
	isSelected = false

func init(unitID, aDamage, mMove, cMove, mSize, x, y, smile):
	unit_id = unitID
	attackDamage = aDamage
	maxMove = mMove
	currentMove = cMove
	maxSize = mSize
	position.x = x * 32
	position.y = y * 32
	isSmile = smile
	
	var headBlock = preload("res://Unit/UnitBlock.tscn").instance()
	headBlock.init((int(round(position.x / 32))), (int(round(position.y / 32))), 0, 0, true, 4, isSmile)
	headBlock.show()
	headBlock.connect("is_selected", self, "setSelection")
	headBlock.connect("move_unit", self, "createUnit")
	add_child(headBlock)
	
func setSelection(selected):
	
	for N in get_children():
		N.isSelected = selected
		
func createUnit(newX, newY):
	
	if(currentSize == maxSize):
		deleteUnit(1)
		currentSize -= 1
		
	if(!childList.has(Vector2(newX, newY))):
		childList.append(Vector2(newX, newY))
		currentSize += 1
	
	var headBlock = preload("res://Unit/UnitBlock.tscn").instance()
	
	headBlock.init((int(round(position.x / 32))), (int(round(position.y / 32))), newX, newY, true, 3, isSmile)
	headBlock.show()
	headBlock.connect("is_selected", self, "setSelection")
	headBlock.connect("move_unit", self, "createUnit")
	add_child(headBlock)
	#currentSize += 1

func deleteUnit(numUnits):
	for i in range(numUnits):
		for N in get_children():
			if(N.emptyNeighbors == 3 and !N.isHead):
				for N2 in get_children():
					if (abs(N2.unitGridX - N.unitGridX) == 1 and abs(N2.unitGridY - N.unitGridY) == 0) or (abs(N2.unitGridX - N.unitGridX) == 0 and abs(N2.unitGridY - N.unitGridY) == 1):
						N2.emptyNeighbors += 1 
						if(N2.emptyNeighbors >= 4):
							N2.emptyNeighbors = 3
				childList.remove(childList.find(Vector2(N.unitGridX-N.pX, N.unitGridY-N.pY)))
				N.queue_free()
				break
	pass
	
func _process(delta):
	if(Input.is_action_just_released("left_click")):
		var gridX = (int(round(get_global_mouse_position().x / 32))) - (int(round(position.x / 32)))
		var gridY = (int(round(get_global_mouse_position().y / 32))) - (int(round(position.y / 32)))
		var posX = gridX * 32
		var posY = gridY * 32	
		
		for N in get_children():
			if N.unitGridX == gridX and N.unitGridY == gridY:
				isSelected = true
				setSelection(true)
				