extends Node

var player_name_1 : String = "Player 1"
var player_name_2 : String = "Player 2"

#0 - RANDOM; #1 - MANUAL
var game_mode : int = 0

#0 - PLAYER VS PLAYER, #1 - BOT, #2 - player vs player ONLINE
var player_mode : int = 0

#0 ENGLISH; #1 SPANISH; #2 MAPUDUNGUN
var language_mode : int = 0

#who is the pangui - 0: first, 1: second
var pangui_player_mode : int = 0
#0: first, 1: bot
var pangui_bot_mode : int = 0
