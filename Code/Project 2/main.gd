extends Control

export (PackedScene) var next_scene
var next_scene_instance = null
#loading thread

onready var loading_thread= Thread.new()
func _ready():
	#load data
	loading_thread.start(self, "load_data")

	
	#Display splash screen
	splash_screen()
	
func splash_screen():
	print("Load splash screen")
	
	
	#create an instance
	next_scene_instance = next_scene.instance()
	
	#add to scene
	add_child(next_scene_instance)
	
func load_data(bars):
	# data loading
	for i in range(0,999999999):
		for j in range(0,7):
			
			pass
			
	
	print("Done Loading Data")
	next_scene_instance.is_loading = false
	
func _input(event):
	if(event.is_action_pressed("ui_select")):
	 get_tree().change_scene("res://GameScenes/MainGame.tscn")
	
