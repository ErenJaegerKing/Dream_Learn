extends Node
class_name HealthComponent

#设定最大生命并可在检查器配置
@export var max_health : float = 10

#创建死亡信号
signal died
#当前生命值
var current_health

func _ready() -> void:
	#初始化当前生命值等于最大生命值
	current_health = max_health

func damage(damage_amount:float):
	#受伤害后我们要将这个伤害设定为当前生命值，并且通过max限制最小值为0
	current_health = max(current_health - damage_amount,0)
	# 延迟调用
	Callable(chack_death).call_deferred()

func chack_death():
	#当生命值为0发送死亡信号，并删除实例
	if current_health == 0:
		died.emit()
		owner.queue_free()
