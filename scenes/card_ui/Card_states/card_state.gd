class_name Cardstate
extends Node

enum State {BASE, CLICKED, DRAGGING, AIMING, RELEASED}

signal transition_requested(from: Cardstate, to: State)

@export var state: State

var card_ui: CardUI


func enter():
	pass


func exit():
	pass


func on_input(_event: InputEvent):
	pass


func on_gui_input(_event: InputEvent):
	pass


func on_mouse_entered():
	pass


func on_mouse_exited():
	pass
