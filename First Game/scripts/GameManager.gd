extends Node

var score = 0 #创建一个分数变量默认值为0

@onready var score_lable: Label = $ScoreLable

func add_point():
	score += 1
	score_lable.text = "Your point is " + str(score) + " coins" #重新设置显示文字内容
