class_name TacoGen
extends Node

static var ref: TacoGen

func _init() -> void:
	if not ref:ref = self
	else : queue_free()


var _cycle_duration : float = 5.0

var _cycle_progression : float = 0.0

var _production : int = 10

var _paused : bool = true


func _ready() -> void:
	Clock.ref.ticked.connect(_on_clock_ticked)
	
	_paused = not Taco_Trucker.ref.data.progression.second_scene_unlocked



func _progress_cycle()->void:
	if _paused:return
	
	
	_cycle_progression +=1.0
	
	if _cycle_progression >= _cycle_duration:
		_generate()


func _generate()->void:
	_cycle_progression -= _cycle_duration
	
	Taco_Trucker.ref.data.resources.Tacos += _production

func start_generator()->void:
	if Taco_Trucker.ref.data.progression.second_scene_unlocked == false:
		return
	
	_paused = false


func _on_clock_ticked()-> void:
	_progress_cycle()
