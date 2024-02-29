extends Area2D


@export var speed:int = 100
@export var moveDistanse:int = 100

@onready var startX:float = position.x
@onready var targetX:float = position.x + moveDistanse

func _process(delta):
	position.x = move_to(position.x,targetX,speed*delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDistanse
		else:
			targetX=startX
			
func move_to(current,to,step):
	var new = current
	if new < to:
		new += step
		rotation += 0.0005
		if new > to:
			new = to 
	else:
		new -= step
		rotation -= 0.0005
		if new < to:
			new=to
			
	return new

func _on_body_entered(body):
	if body.name == "Player":
		body.die()
