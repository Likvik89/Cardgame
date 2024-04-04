class_name CardStateMachine
extends Node

@export var initial_state: Cardstate

var current_state: Cardstate
var states := {}


func _init(card: CardUI):
	for child in get_children():
		if child is Cardstate:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card
			
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state


func on_input(event: InputEvent):
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent):
	if current_state:
		current_state.on_gui_input(event)


func on_mouse_entered():
	if current_state:
		current_state.on_mouse_entered()


func on_mouse_exited():
	if current_state:
		current_state.on_mouse_exited()


func _on_transition_requested(from: Cardstate, to: Cardstate.State):
	if from != current_state:
		return
	
	var new_state: Cardstate = states[to]
	if not new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state
