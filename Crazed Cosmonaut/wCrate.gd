extends StaticBody2D

export (int) var crateHealth = 100


func _ready():
	pass 

func takeDamage():
	crateHealth -= 100
	
	print("take damage")
	
	if crateHealth <= 0:
		self.queue_free()
		
