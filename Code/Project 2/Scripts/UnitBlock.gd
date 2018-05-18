extends Sprite

signal move_unit
signal is_selected

onready var attackMode = false

onready var moveTexture = preload("res://Gridmap/Grid1/move_tile.png")
onready var headTexture = preload("res://Gridmap/Grid1/smile_unit.png")
onready var tailTexture = preload("res://Gridmap/Grid1/blank_unit.png")
onready var rightSprite
onready var leftSprite
onready var upSprite
onready var downSprite

onready var emptyNeighbors
onready var unit_id
onready var isHead
onready var isSelected
onready var isSmile

onready var unitGridX
onready var unitGridY

onready var pX
onready var pY

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func triggerAttack(a_bool):
	attackMode = a_bool
	
func init(parentX, parentY, gridX, gridY, head, eNeighbors, smile):
	isHead = head
	isSmile = smile
	
	if isSmile:
		get_child(8).show()
	else:
		get_child(9).show()
	
	emptyNeighbors = eNeighbors
	pX = parentX
	pY = parentY
	
	position.x = gridX * 32
	position.y = gridY * 32

	unitGridX = (int(round(position.x / 32))) + pX
	unitGridY = (int(round(position.y / 32))) + pY

func _process(delta):
	if(Input.is_action_just_released("left_click")):
		var gridX = (int(round(get_global_mouse_position().x / 32)))
		var gridY = (int(round(get_global_mouse_position().y / 32)))
		
		var xOffset = abs(gridX - unitGridX)
		var yOffset = abs(gridY - unitGridY)
		
		if(xOffset == 0 and yOffset == 0 and isHead):
			emit_signal("is_selected", true)
			for i in range(4):
				get_child(i).show()
			
		elif(isSelected and isHead and ((xOffset == 1 and yOffset == 0) or (xOffset == 0 and yOffset == 1))):
			#position.x = posX
			#position.y = posY
			
			emit_signal("move_unit", gridX - pX, gridY - pY)
			emptyNeighbors -= 1
			for i in range(5):
				get_child(i).hide()
			
			get_child(10).show()
			
			isHead = false
			
			#var gridPos = Vector2(unitGridX, unitGridY)
			#print("Moved to: ", gridPos)
			pass
		else:
			isSelected = false
			for i in range(4):
				get_child(i).hide()
			#isHead = false
			pass