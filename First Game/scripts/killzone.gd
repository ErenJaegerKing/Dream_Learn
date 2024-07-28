extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("你已经死亡")
	Engine.time_scale = 0.5 #让引擎整体时间流速变慢为0.5倍 //TODO 有错误
	body.get_node("CollisionShape2D").queue_free() #移除玩家角色碰撞区域 
	timer.start() #触发timer计时器

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene() #重启游戏
