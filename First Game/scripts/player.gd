extends CharacterBody2D


const SPEED = 130.0 #移动速度
const JUMP_VELOCITY = -300.0 #跳跃速度
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity") #引力大小 默认为980


func _physics_process(delta: float) -> void:
	#当角色没有在一个平台上的时候
	if not is_on_floor():
		velocity.y += gravity * delta #当前速度向量Y 通过delta来控制每秒移动的距离
	
	# 当玩家按下空格并且在一个平台上的时候
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY #让角色执行跳跃

	#当用户按下左方向键或者右方向键的时候来移动玩家
	#通过判断 direction 的值来进行翻转立绘
	var direction := Input.get_axis("Move_Left", "Move_Right")
	
	#向右移动反转立绘
	if direction > 0:
		animated_sprite.flip_h = false
	#向左移动反转立绘  
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#播放动画
	#判断角色是否再地板上
	#角色没有动播放Idle动画
	if is_on_floor():
		# 角色没有动播放 Idle动画
		if direction == 0:
			animated_sprite.play("Idel")
		else:
			animated_sprite.play("Run")
	#否则播放jump动画
	else:
		animated_sprite.play("Jump")
	
	
	#移动玩家
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
