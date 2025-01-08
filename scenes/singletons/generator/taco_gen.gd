class_name TacoGen
extends Node

static var ref: TacoGen

func _init() -> void:
	if not ref:ref = self
	else : queue_free()

##how long each tick will be
var _cycle_duration : float = 5.0
##starting point and porgression counter
var _cycle_progression : float = 0.0
##how much the generator produces per tick
var _production : int = 10
##if the generator is opertaional or not, auto true to facilitate upgrade
var _paused : bool = true


func _ready() -> void:
	
	##connects clock tick to generator
	Clock.ref.ticked.connect(_on_clock_ticked)
	
	##sets if the gen if paused or not has reverse value to scene unlock
	_paused = not Taco_Trucker.ref.data.progression.second_scene_unlocked



func _progress_cycle()->void:
	##doesnt progress if paused
	if _paused:return
	
	##each second the tick adds one
	_cycle_progression +=1.0
	
	##once cycle value has reached above tick value, generate
	if _cycle_progression >= _cycle_duration:
		_generate()

##restes cycle duration to 0 and adds production to total
func _generate()->void:
	_cycle_progression -= _cycle_duration
	
	
	Taco_Trucker.ref.data.resources.Tacos += _production

##when the scene unlock turns true, acitivate generator by turning off paused
func start_generator()->void:
	if Taco_Trucker.ref.data.progression.second_scene_unlocked == false:
		return
	
	_paused = false

##tells cycle when a tick happends
func _on_clock_ticked()-> void:
	_progress_cycle()
