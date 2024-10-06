extends Node


var player_position : Vector3
var bird_raycast_ground_position : Vector3
var Player_InMenu : bool
var Player_InDialogue : bool
var Player_InDialogue_zone : bool
signal _open_menu(condition : bool)


# input type
signal using_pad(condition : bool)
var player_using_pad : bool = false
var move_right : String
var move_left : String
var move_forward : String
var move_backward : String
# scene signals

signal _active_sonar(position : Vector3)
signal _follow_target(position : Vector3)
signal _roll_bird
var player_area : Area3D
signal _check_player_zone


# FOCUS VIEW  
signal _open_focus_view(condition : bool)

# dialogue signals
signal in_dialogue_zone(condition : bool)
signal hide_open_dialogue
signal _check_dialogue_photo
var photo_checking : bool 
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
signal _show_object_legend(condtion : bool, legend : String)



var player_rg : RigidBody3D


signal _check_zone_enter(area)
signal _check_zone_exit(area)

signal _active_this_dive_zone(condition : bool)
signal _active_this_npc_zone(condition : bool)

signal _in_focus_zone(condition : bool, position : Vector3)
signal _in_delevery_zone(condition : bool)



signal _give_photo(photo_data : PhotoData)
signal _back_letter

signal subscene_sonar_effect(position : Vector3, color : Color)
signal _open_player_map(condition : bool)


var Npc_Dialogue : Npc_datas


signal active_prologue_demo
