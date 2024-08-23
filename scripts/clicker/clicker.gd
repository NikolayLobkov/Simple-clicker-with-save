extends CanvasLayer

var clicks: int = 0: # Количество кликов.
	set(value): # Сеттер.
		clicks = value # Задаёт новое значение в переменной.
		
		SaveManager.save_data_dict['clicks'] = clicks # Обновляет значение 'clicks' в данных для сохранения.
		%clicks.text = 'Clicks: %d' % clicks # Обновляет текст таблички.

func _ready() -> void:
	clicks = SaveManager.save_data_dict['clicks'] # Задаёт в переменной clicks значение из данных для сохранения.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton: # Если event это нажатие кнопки мыши, то:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed(): # Если нажатая кнопка - ЛКМ, то:
			clicks += 1 # Добавляет 1 к количеству кликов.
