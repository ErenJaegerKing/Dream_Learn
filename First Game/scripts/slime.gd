extends Node2D

const  SPEED = 60 #设置速度为60

var direction = 1 #设置方向为1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1 #判断当右侧射线碰撞到某些物体后，我们将direction设置为 -1
		animated_sprite.flip_h = true #反转立绘
	if ray_cast_left.is_colliding():
		direction = 1 #判断当左侧射线碰撞到某些物体后，我们将direction设置为 1
		animated_sprite.flip_h = false #再次反转立绘
		
	position.x += direction * SPEED * delta #方向（正负1表示）乘以 速度 乘以 时间（1秒），1秒60个像素

