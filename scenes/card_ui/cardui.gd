class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $state
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine


func _ready():
	card_state_machine.init(self)


func _input(event: InputEvent):
	card_state_machine.on_input(event)


func _on_gui_input(event: InputEvent):
	card_state_machine.on_gui_input(event)


func _on_mouse_entered():
	card_state_machine.on_mouse_entered()


func _on_mouse_exited():
	card_state_machine.on_mouse_exited()
