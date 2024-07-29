extends Node

# 建立变量存储节点方便后续调用
@onready var timer: Timer = $Timer

# 获取流逝的时间
func get_time_elapsed():
	# 返回等待时间 减去 剩余时间 就是流失掉的间
	return timer.wait_time - timer.time_left
