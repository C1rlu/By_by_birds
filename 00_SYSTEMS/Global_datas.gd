extends Node


var player_position : Vector3
var camera_offset : Vector3
var bird_raycast_ground_position : Vector3
var Player_InMenu : bool

signal _open_menu(condition : bool)
signal _open_desk(condition : bool)


var player_on_desk : bool
var camera_state_index : int 

# input type
signal using_pad(condition : bool)
var player_using_pad : bool = false
# scene signals

signal _active_sonar(position : Vector3)
signal _follow_target(position : Vector3)
signal _roll_bird
var player_area : Area3D
signal _check_player_zone


signal _open_scene(scene : PackedScene)

# OWL VIEW
signal start_prologue

signal open_owl_view(condition : bool)
var player_owl_moment : bool
var selected_clue_data : clue_data
signal _add_next_clues
signal _reset_clues

# FOCUS VIEW  
signal _open_focus_view(condition : bool)

var active_focus_view : focus_data
var head_player_NodePosition : Node3D
var transition_target : Vector3
var moving_transition : bool
signal _in_transition_start
signal _end_of_transition
var current_focus_data : focus_data
var previous_bird_hit : Node

signal set_instant_focus(Camera : Camera3D)
signal set_new_focus(node : Node3D)

var look_at_sensivity : float 


signal hide_all_FocusScene_dialogue


var photo_pause : bool
signal _take_photo

# Journal_mission_done
signal _add_journal(condition : bool)


# dialogue signals
signal in_dialogue_zone(condition : bool)
signal hide_open_dialogue
signal  _open_dialogue
signal  _close_dialogue
signal _type_text(count : int)
signal _update_cam_focus(position : Vector3)
signal _change_language_state(l_state : int)
signal _start_dialogue_box
signal _hide_dialogue_box
signal _show_dialogue_box


# for save game
var photo_archives : Array[PhotoData] 

#UI VAR 
signal set_resolution(resolution : Vector2i)
signal _show_object_legend(condition : bool,legend : String)

var player_rg : RigidBody3D


signal _check_zone_enter(area)
signal _check_zone_exit(area)

signal _active_this_dive_zone(condition : bool)
signal _active_this_npc_zone(condition : bool)

signal _in_focus_zone(condition : bool)
signal _in_desk_zone(condition : bool)


#Book globals
signal open_book_board(condition : bool)
signal focus_on_board_book(condition:bool)
var all_book_page_data : Array[book_page]
signal turn_to_page(page : int)
signal turn_left
signal turn_right
var legend_page_index : int

#------ focus view ---

signal subscene_sonar_effect(position : Vector3, color : Color)

signal active_prologue_demo
