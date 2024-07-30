extends Node

# 在检查器配置场景
@export var vial_scene:PackedScene

# 在检查器配置生命值组件
@export var health_component:Node

# 添加掉落几率默认值，并可以在检查器配置
@export_range(0,1) var drop_percent:float = 0.5

func _ready() -> void:
	# 将health_comconent强制转换为HealthComconent类型，并连接died信号触发事件
	(health_component as HealthComponent).died.connect(on_died)
	
func on_died():
	# 如果randf生成随机数大于drop_percent设定的几率就返回
	if randf() > drop_percent:
		return
	print(randf())
	
	# 如果vial_scene为空就返回
	if vial_scene == null:
		return
	# 如果所有者根节点不是Node2D就返回
	if not owner is Node2D:
		return
	# 获取生成位置 等于 所有者的根节点（强制转换为Node2D）的全局位置
	var spawn_position = (owner as Node2D).global_position
	
	# 实例化经验值
	var vial_instance = vial_scene.instantiate() as Node2D
	# 生成在所有者根节点的父节点场景下
	owner.get_parent().add_child(vial_instance)
	# 经验值生成位置就是获取到的位置
	vial_instance.global_position = spawn_position
