extends Node2D



func _ready() -> void:
	# 创建信号触发信号的时候执行事件
	$Area2D.area_entered.connect(on_area_entered)

# 当触发信号之后执行事件
func on_area_entered(other_area:Area2D):
	# 让经验消失
	queue_free()



