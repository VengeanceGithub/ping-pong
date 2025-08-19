extends Node2D


@onready var ball : Ball= $ball
@onready var player1_score_label: Label = $score/CanvasLayer/player1_score_label
@onready var player2_score_label: Label = $score/CanvasLayer/player2_score_label

@onready var p_1: CharacterBody2D = $p_1
@onready var p_2: CharacterBody2D = $p_2
@onready var score_sound: AudioStreamPlayer2D = $Node/score_sound

var player1_score = 0
var player2_score = 0

func _ready():
	# Initialize score display
	pass
	


func _on_p_1_body_entered(body: Node2D) -> void:
	if body == ball:
		player2_score += 1
		update_score_display()


func _on_p_2_body_entered(body: Node2D) -> void:
	if body == ball:
		player1_score += 1
		update_score_display()


func update_score_display():
	score_sound.play()
	player1_score_label.text = str(player1_score)
	player2_score_label.text = str(player2_score)
	reset_ball()

func reset_ball():
	# Wait a brief moment before resetting for better gameplay feel
	await get_tree().create_timer(0.5).timeout
	ball.reset_ball()
