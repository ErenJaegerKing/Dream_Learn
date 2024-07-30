extends Area2D
class_name HurtBoxComponent

#创建变量获取生命值组件
@export var health_component:Node

func _ready() -> void:
	# 发出信号连接出发事件
	area_entered.connect(on_area_entered)

func on_area_entered(other_area:Area2D):
	if not other_area is HitBoxComponent:
		return
	if health_component == null:
		return
	# health_component获取到HitBoxComponent组件
	var hitbox_component = other_area as HitBoxComponent
	
	# 生命组件接收hitbox_component组件的damage伤害
	health_component.damage(hitbox_component.damage)
	
