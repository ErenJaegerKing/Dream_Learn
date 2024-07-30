extends Node

# 创建经验更新信号
signal experience_update(current_experience: float,target_experience: float)

# 创建升级后经验值增加常量
const TARGET_EXPERIENCE_GROWTH = 5

# 创建变量初始化当前等级
var current_level = 1

# 创建经验值变量，并初始化为0
var current_experience = 0

# 创建变量初始化1级经验值
var target_experience = 5

func _ready() -> void:
	#连接全局事件中的信号触发事件
	GameEvents.experience_vial_collected.connect(on_experience_vial_collected)

# 创建一个函数来增加经验值
func incurrent_experience(number:float):
	#钳制经验值变化 让我们获取到经验值始终小于升级经验值
	current_experience = min(current_experience + number,target_experience)
	
	# 发出信号传输我们的变量数值
	experience_update.emit(current_experience,target_experience)
	
	# 提升等级和升级最大经验值
	# 获取到的经验值等于升级经验值
	if current_experience == target_experience:
		current_level += 1
		target_experience += TARGET_EXPERIENCE_GROWTH
		current_experience = 0
		# 再次发送信号传输数值
		experience_update.emit(current_experience,target_experience)
	
	# 测试 打印经验值
	print(current_experience)

# 触发信号事件
func on_experience_vial_collected(number:float):
	# 执行增加经验函数
	incurrent_experience(number)
