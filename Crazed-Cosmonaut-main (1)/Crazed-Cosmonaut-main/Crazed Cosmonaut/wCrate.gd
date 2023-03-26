extends StaticBody2D

export (int) var crateHealth = 100


func _ready():
	$AnimatedSprite.play("default")

func takeDamage():
	crateHealth -= 100
	
	print("take damage")
	
	if crateHealth <= 0:
		
		
		$AnimatedSprite.play("break")
		$destroyed.start()
		
		yield($destroyed, "timeout")
		
		self.queue_free()

func _on_destroyed_timeout():
	pass 
