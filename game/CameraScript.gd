extends Camera3D


@onready var target: Object = %Opossum
@export var smooth_speed: float
@export var offset: Vector3





func _physics_process(delta: float) -> void:
	if(target != null):
		self.position= lerp(self.position, target.position + offset, smooth_speed * delta)
		
