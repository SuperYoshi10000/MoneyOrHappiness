extends AnimatableBody2D

const SPEED = 5
var active := false
var health := 50
var flash := 0
var delay := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		move_toward(position.x, $%Player.position.x, SPEED)
		move_toward(position.y, $%Player.position.y, SPEED)
		if delay > 0:
			delay -= 1
		visible = flash % 2 == 0
		if flash > 0:
			flash -= 1
	if $InteractionBox.overlaps_body($%Player) and Input.is_action_just_pressed("interact"):
		interact()
	if $AttackBox.overlaps_body($%Player):
		attack()

func interact():
	if !active:
		print($%Player.INVENTORY)
		if $%Player.money == 0 and $%Player.INVENTORY.size() == 0:
			good_ending()
		else:
			$%Barrier.show()
			$%Barrier.collision_enabled = true
			active = true
	elif $%Player.INVENTORY.has("Sword"):
		health -= 1
		if health <= 0:
			bad_ending()
		flash = 5
		
func attack():
	$%Player.health -= 1
	if $%Player.health <= 0:
		death()

func good_ending():
	$%UI/GoodEnding.show()
	end()
func bad_ending():
	$%UI/BadEnding.show()
	end()
func death():
	$%UI/Death.show()
	end()
func end():
	get_tree().paused = true
