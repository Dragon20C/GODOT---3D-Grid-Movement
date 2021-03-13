extends Spatial

var grid_size = 30
var offset = 2
onready var tile = preload("res://Ground.tscn")
onready var player = preload("res://FakePlayer.tscn")
onready var object = preload("res://Object.tscn")
var collision = []
func _ready():
	randomize()
	generate_grid()
	generate_objects()
	generate_player()
	#print(collision)
func generate_grid():
	for x in range(grid_size):
		for y in range(grid_size):
			var instance = tile.instance()
			add_child(instance)
			instance.translation = Vector3(x,0,y) - Vector3(grid_size/2,0,grid_size/2)

func generate_objects():
	for x in range(grid_size):
		for y in range(grid_size):
			var RNG = randi() % 100 - 1 
			if RNG < 5:
				var instance = object.instance()
				add_child(instance)
				instance.translation = Vector3(x,0,y) - Vector3(grid_size/2,0,grid_size/2)
				collision.append(instance.translation)

func generate_player():
	var instance = player.instance()
	add_child(instance)
	instance.translation = Vector3(0,0,0)
