class_name  FirstScene
extends Control


##Amount of tacos owned by player
var tacos: int=0


func _ready()-> void: 
	(get_node("Label")as Label).text = "Tacos : %s"%tacos
	##This Line Specifies label as Amount of Tacos
	
	(get_node("Button")as Button).pressed.connect(_on_button_pressed)
	##This line connects the button to the pressed function 

func _on_button_pressed()-> void:
	tacos += 1
	(get_node("Label")as Label).text = "Tacos : %s"%tacos
	##This Line Specifies label as Amount of Tacos after button press
