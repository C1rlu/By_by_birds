extends Node

var Main_Camera : Camera3D
var player_position : Vector3
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
signal _active_progress_subscene(condition : bool)

signal _check_boat_zone


# dialogue signals
signal in_dialogue_zone(condition : bool)
signal hide_open_dialogue
signal _check_dialogue_photo
var _photo_checking : bool 
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


# SUBSCENE VAR 

var player_rg : RigidBody3D
var attache_node: Node3D

signal _check_zone_enter(area)
signal _check_zone_exit(area)

signal _active_this_dive_zone(condition : bool)
signal _active_this_npc_zone(condition : bool)

signal _in_delevery_zone(condition : bool)


signal _scan_mirror_xray
signal _give_photo(photo_data : PhotoData)

signal subscene_sonar_effect(position : Vector3, color : Color)

signal _open_player_map(condition : bool)
signal _back_letter


signal Open_ui_dark_backdrop(condition : bool)


var selected_photoData : PhotoData

#tools_ui
var clock_timer : float
signal active_photo_button(condition : bool)
signal active_scanner_button(condition : bool)

var current_money : int = 0
signal update_money_amount(value : int)
signal _show_zone_info(condition : bool)
signal _update_info_zone
signal _open_zone_attributions(condition : bool)


# scanner 

signal show_on_scanner(condition : bool)
var in_scanner_mode : bool = false
#signal update_element_amount
#-----------------------------
# dialogue datas
var Npc_Dialogue : Npc_datas



#-------------------- GAME STATE ------------------

signal active_prologue_demo

func _ready():

	_photo_checking = false

