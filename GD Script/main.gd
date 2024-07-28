extends Node


# 游戏在第一次运行时候执行的函数
#func _ready() -> void:
	#print("Hello,World")
#@onready var label: Label = $Label
#
#@export var health = 100
#var script_variable = 100
#@export var damage:= 15
#const GRAVITY = 9.18
@export var character : Character
signal  health_change(new_health)
var health := 100:
	set(value):
		health = clamp(value,0,100)
		health_change.emit(health)

func _ready():
	health = 60
	print(chance_pct)
	chance = 0.6
	print(chance_pct)
	character.die()

func _on_health_change(new_health):
	print(new_health)
	
var chance := 0.2
var chance_pct: int:
	get:
		return chance * 100
	#var godot_is_cool = true # godot_is_cool数据类型是bool型
	#var coolness = 9001 # coolness数据类型是int型
	#var text = "nihao" + str(coolness)
	#print(godot_is_cool)
	#print(text)
	#var pi = 3.14
	#print(int(pi)) # 将pi转换为int型并输出，结果为3，只保留整数部分不四舍五入
	#$Label.text = "Hello,World!"
	#$Label.modulate = Color.GREEN
	#print(label.get_path())
	#var vec2 = Vector2(0.0,0.0)
	#var vec3 = Vector3(0.0,0.0,0.0)
	#var position = Vector3(3,10,5)
	#position.x += 2
	#print(position)
	##通过这种方式直接定义变量，赋值后也会定义damage_1为int型，这种为推断类型，效果和上方直接定义是一致
	#var damage_1 := 15
	#var roll = randf()
	#print(roll)
	#level_up.connect(_on_level_up)
	#

# input函数会在触发后调用，不会在游戏启动的时候调用     
#func _input(event):
	## 如果my_action被按下时
	#if event.is_action_pressed("my_action"):
		#jump()
		##触发操作修改Label的颜色
		#$Label.modulate = Color.RED
		#print(health)
		#health -= 20
		#if health <= 0:
			#health = 0
			#print("你死了")
	## 如果my_action释放时
	#if event.is_action_released("my_action"):
		#$Label.modulate = Color.GREEN
	

#func jump():
	#print("跳起来")
#
#
#signal level_up
#
#var xp = 0
#func _on_timer_timeout() -> void:
	#xp += 5
	#print(xp)
	#if xp >= 20:
		#xp = 0
		#level_up.emit("恭喜你升级了")
#
#
#func _on_level_up(msg) -> void:
	#print(msg)
