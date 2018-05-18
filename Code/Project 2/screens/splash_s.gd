extends Control

#next scene
export (PackedScene) var next_scene

#animation player
onready var anim_player = get_node("AnimationPlayer")


#whether or not we are loading
var is_loading = true

func _ready():
	#add user input
	set_process_input(true)
	
	# run animation 

	fade_in_out()
	
#user input
func _input(event):
	if(event.is_action_pressed("ui_select")):
	 get_tree().change_scene("res://Splash scene/main_menu.tscn")
	
func fade_in_out():
	anim_player.play("fading")
	anim_player.connect("finished", self, "goto_next_scene")
	
func goto_next_scene():
	#if game is still loadidng when splash screen anim is done
	#load next scene every second
	
	if(is_loading):
		var timer= Timer.new()
		add_child(timer)
		timer.set_wait_time(1) 
		timer.set_one_shot(false)
		timer.connect("timeout", self, "next_scene")
		timer.start()
	else:
		next_scene()
		
func next_scene():
		if (!is_loading):
			print("we are loading next scene from the splash screen!!")
			
			#go to next scene
			get_parent().add_child(next_scene.instance())
			queue_free()
			


