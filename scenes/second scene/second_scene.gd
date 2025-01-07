class_name Second_Scene
extends Control

const COST : int=15


func _ready() -> void:
	##decide whether to show locked or unlocked call here and check 
	if Taco_Trucker.ref.data.progression.second_scene_unlocked:
		_display_view(true)
	else:
		_display_view(false)
		(%Taco_Up_Button as Button).pressed.connect(_on_unlock_button_pressed)	




	

##displays argument of locked or unlocked
func _display_view(unlocked:bool=false)->void:
	($Taco_Up_Win as TabContainer).current_tab=int(unlocked)


##atempting to unlock logic
func _try_to_unlock()->void:
	if Taco_Trucker.ref.data.progression.second_scene_unlocked:
		return
	
	if Taco_Trucker.ref.data.resources.Tacos < COST:
		return
	
	Taco_Trucker.ref.data.resources.Tacos -= COST
	Taco_Trucker.ref.data.progression.second_scene_unlocked = true
	
	_display_view(true)

##logic to press button connector
func _on_unlock_button_pressed()->void:
	_try_to_unlock()
