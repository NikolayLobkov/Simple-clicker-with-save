extends Node

func _init() -> void:
	SaveManager.load_data() # Загрузка данных.

func _exit_tree() -> void:
	SaveManager.save_data() # Сохранение данных.
