extends CharacterBody2D

# 创建一个速度常量
const MAX_SPEED = 200
# 创建一个加速度平滑常量
const ACCELERATION_SHOOTHING = 25

# 在场景运行的时候会执行的代码
func _ready() -> void:
	pass # Engine.max_fps = 20


# 在场景运行的时候每一帧都会执行的代码
func _process(delta: float) -> void:
	# 保存获取到的二维向量
	var movement_vector = get_movement_vector()
	# 将二维向量归一化
	var direction = movement_vector.normalized()
	# 设置期望的目标速度
	var target_velocity = direction * MAX_SPEED
	# 设置角色移动的向量速度 为我们移动速度做一个线性插值
	velocity = velocity.lerp(target_velocity,1 - exp(-delta * ACCELERATION_SHOOTHING))
	
	# 让角色移动起来
	move_and_slide()

func get_movement_vector():
	#创建变量x_movement用来获取是否在X轴向左还是向右移动
	var x_movement = Input.get_action_strength("move_right ") - Input.get_action_strength("move_left")
	#创建变量y_movement用来获取是否在y轴向上还是向下移动
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return Vector2(x_movement,y_movement)
