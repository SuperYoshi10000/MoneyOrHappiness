extends AnimatableBody2D

const COST := 4
var donated := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var touching: bool = $InteractionBox.overlaps_body($%Player)
	if !donated and Input.is_action_just_pressed("interact") and touching:
		donate()
	$DonateLabel.visible = touching and (donated or $%Player.money >= COST)
	

func donate():
	if !$%Player.pay(COST): return
	$%Player.happiness += 1
	donated = true
	$Sprite2D.region_rect.position.x = 16
	$DonateLabel.region_rect.position.y = 32
	
