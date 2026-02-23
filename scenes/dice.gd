extends Node2D

@export var outerColor:Color
@export var innerColor:Color
@export var possibleVals:Array[int]
@export var val:int
@export var valInd:int

func _ready() -> void:
	$Border.color = outerColor
	$Inner.color = innerColor
	$Label.add_theme_color_override("font_color", innerColor.inverted())
