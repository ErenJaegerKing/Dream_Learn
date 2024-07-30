extends Node

# 创建经验值变量，并初始化为0
var current_experience = 0

func _ready() -> void:
	#连接全局事件中的信号触发事件
	GameEvents.experience_vial_collected.connect(on_experience_vial_collected)

# 创建一个函数来增加经验值
func incurrent_experience(number:float):
	#经验值会随着传入参数的数值而增加
	current_experience += number
	# 测试 打印经验值
	print(current_experience)

# 触发信号事件
func on_experience_vial_collected(number:float):
	# 执行增加经验函数
	incurrent_experience(number)
