extends Node

const save_dir: StringName = 'user://'
const save_file_name: StringName = 'player_data.save'
const save_full_path: StringName = save_dir + save_file_name

const default_save_data_dict: Dictionary = preload('res://resources/save_manager/default.json').data
var save_data_dict: Dictionary = default_save_data_dict.duplicate()

#region save/load/create
func save_data() -> void: # Функция сохранения данных.
	if not FileAccess.file_exists(save_full_path): # Проверка на наличие файла сохранения.
		#Если файла нет, то:
		create_save_file() # Функция создания нового файла сохранения.
		return # Остановка выполнения функции.
	# При наличии файла:
	var save_file = FileAccess.open(save_full_path, FileAccess.WRITE) # Открывает файл с записью.
	save_file.store_var(save_data_dict) # Записывает в открытый файл текущие данные.
	save_file.close() # Закрывает файл.
	
func load_data() -> void: # Функция загрузки данных.
	if not FileAccess.file_exists(save_full_path): # Проверка на наличие файла сохранения.
		#Если файла нет, то:
		create_save_file() # Функция создания нового файла сохранения.
		return # Остановка выполнения функции.
	# При наличии файла:
	var save_file = FileAccess.open(save_full_path, FileAccess.READ) # Открывает файл с чтением.
	save_data_dict = save_file.get_var() # Записывает в переменную с текущими данными данные из файла.
	save_file.close() # Закрывает файл.

func create_save_file() -> void: # Функция создания нового файла сохранения.
	var new_file: ConfigFile = ConfigFile.new() # Создание нового ConfigFile.
	new_file.save(save_full_path) # Сохранение ранее созданного ConfigFile.
	
	save_data() # Функция сохранения
#endregion
