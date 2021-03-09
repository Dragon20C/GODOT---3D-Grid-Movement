extends Spatial

var grid_size = 30
var offset = 2
onready var tile = preload("res://Ground.tscn")
onready var player = preload("res://FakePlayer.tscn")

func _ready():
	generate_grid()
	generate_player()
	
func generate_grid():
	for x in range(grid_size):
		for y in range(grid_size):
			var instance = tile.instance()
			add_child(instance)
			instance.translation = Vector3(x,0,y) - Vector3(grid_size/2,0,grid_size/2)

func generate_player():
	var instance = player.instance()
	add_child(instance)
	instance.translation = Vector3(0,0,0)
