class_name Clock
extends Node


static var ref: Clock

func _init() -> void:
	if not ref:ref = self
	else : queue_free()

##signal to connect ticks
signal ticked
##how much a tick is equal to, number per second
var _tick_duration:float=1.0
##start of tick tracker
var _tick_progression:float=0.0

func _process(delta : float)->void:
	##keep adding over time
	_tick_progression += delta
	##when tracker is over duration value tick
	if _tick_progression >= _tick_duration:
		_tick()
##once ticked rest progress to 0 and emit signal
func _tick()->void:
	_tick_progression -=_tick_duration
	ticked.emit()
