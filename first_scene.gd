class_name  FirstScene
extends Control


##Amount of tacos owned by player
var tacos: int=0


func _ready()-> void: 
	update_label_tacos()
	##This Line Specifies label as Amount of Tacos
	
	($Taco_Button as Button).pressed.connect(_on_button_pressed_tacos)
	##This line connects the button to the pressed function 

##func is too call back taco amount and updating this updates all
func update_label_tacos()->void:
	($Taco_Amount as Label).text = "Tacos : %s"%tacos
	##renamed nodes and func to match object funtion
	##$ is same as to getnode

func create_tacos()->void:
	tacos += 1
	update_label_tacos()

func _on_button_pressed_tacos()-> void:
	create_tacos()
	##This Line Specifies label as Amount of Tacos after button press
