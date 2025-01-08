class_name Taco_Trucker
extends Control

##singleton reffernce
static var ref: Taco_Trucker

func _init() -> void:
	if not ref:ref = self
	else : queue_free()

##main data object of the game
var data : Data = Data.new()
