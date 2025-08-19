class_name menu
extends Control
@onready var resumee: Button = $PanelContainer/VBoxContainer/resume
@onready var retry: Button = $PanelContainer/VBoxContainer/retry
@onready var quit: Button = $PanelContainer/VBoxContainer/quit

@onready var hover: AudioStreamPlayer2D = $hover
@onready var click: AudioStreamPlayer2D = $click

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		click.play()
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		click.play()
		resume()


func _process(delta: float):
	testEsc()


func _on_resume_pressed() -> void:
	click.play()
	resume()


func _on_retry_pressed() -> void:
	click.play()
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_mouse_entered() -> void:
	hover.play()


func _on_retry_mouse_entered() -> void:
	hover.play()


func _on_quit_mouse_entered() -> void:
	hover.play()
