extends StaticBody2D

export (int) var crateHealth = 100
var newpos = position
signal BREAK 

func _ready():
	$AnimatedSprite.play("default")

func takeDamage():
	crateHealth -= 100
	
	if crateHealth <= 0:
		
		
		$AnimatedSprite.play("break")
		$destroyed.start()
		$CollisionShape2D.queue_free()
		
		yield($destroyed, "timeout")
		
		emit_signal("BREAK")
		#var nodeInstance = preload("res://HPotion.tscn")
		#var po = nodeInstance.instance()
		#po.position = Vector2(0,0)
		
		self.queue_free()

func _on_destroyed_timeout():
	pass 
