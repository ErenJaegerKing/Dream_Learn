extends CanvasLayer

# 创建可以配置的变量获取
@export var experience_manager : Node

# 用变量获取节点
@onready var progress_bar = %ProgressBar

func _ready() -> void:
	# 初始化经验条的数值为0
	progress_bar.value = 0
	#连接信号获取传入的数值
	experience_manager.experience_update.connect(on_experience_update)

func on_experience_update(current_experience: float, target_experience: float):
	# 计算百分比需要除数不能为0,这里可以判断一下防止出问题
	# 计算经验条百分比
	var percent = current_experience / target_experience
	#设定经验条的value为计算出来的结果
	progress_bar.value = percent
