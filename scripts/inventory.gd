extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and Input.is_action_just_pressed("cancel"):
		hide()
		get_tree().paused = false
	$RichTextLabel.text = "\n".join($%Player.INVENTORY.keys())
