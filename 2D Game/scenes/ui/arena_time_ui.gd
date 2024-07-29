extends CanvasLayer

# 创建变量获取，在检查器添加需要的节点
@export var area_time_manager : Node
# 引用Lanel节点，通过%来代替路径
@onready var label: Label = %Label

func _process(delta: float) -> void:
	# 先判断arena_time_manager是否为空，不为空再执行
	if area_time_manager == null:
		return
	# 用变量保存获取到的时间
	var time_elapsed = area_time_manager.get_time_elapsed()
	# 显示时间在label节点上
	label.text = format_seconds_to_string(time_elapsed)

# 时间数字转换
func format_seconds_to_string(seconds:float):
	# 计算分钟数，一分钟等于秒数除以60，使用floor向下取整不足1显示0
	var minutes = floor(seconds/60)
	#不够一分钟剩余秒数
	var remaining_seconds = seconds - (minutes * 60)
	# 返回最终显示的时间 分钟 + 秒数
	return str(minutes) + ":" + ("%02d" % floor(remaining_seconds))
