﻿#language: ru

@tree

Функционал: 0002 проверка добавленного функционала создания отчета Остатки. 

Как тестировщик я хочу
проверить возможность формирования отчета Остатки товаров 
чтобы подтвердить работоспособность нового функционала    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 0002 проверка возможности создания отчета Остатки товаров

//в учебной версии эти шаги не доступны:
//		Дано Табличный документ "Результат" равен макету "Макет" по шаблону
//(даже с исполненным в ручную файлом Макет из Конфигуратора)
//		И я жду, что табличный документ "Результат" заполнится данными в течение 10 секунд
//		Тогда область "R23C1:R26C3" табличного документа "Результат" равна:
//			| 'Тапочки' |  | '17,00'  |
//			| 'Торт'    |  | '365,00' |
//			| 'Туфли'   |  | '10,00'  |
//			| 'Хлеб'    |  | '317,00' |
// по-этому выполняем то, что доступно:

	* запуск отчета
		Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		И я жду когда в табличном документе "Результат" заполнится ячейка "R27C3" в течение 20 секунд
		И в табличном документе "Результат" ячейка с адресом "R27C3" равна "4 557,00"
												
	* проверка не попадания в отчет проданных товаров
		И В командном интерфейсе я выбираю 'Продажи' 'Продажи'

		* сортируем список по возрастанию даты, чтобы вставать на посл. строку и запоминать номер нового документа для последующего распроведения
			И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
			Тогда открылось окно 'Настройка списка'
			И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Порядок" я активизирую поле с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ПорядокТипУпорядочивания"
			И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Порядок" я выбираю текущую строку
			И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Порядок" из выпадающего списка с именем "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ПорядокТипУпорядочивания" я выбираю точное значение 'По возрастанию'
			И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Порядок" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'
		
		// продажа всех единиц товара "Хлеб" со склада Средний
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Продажа товара (создание)'
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Животноводство ООО '
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Средний'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'хлеб'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '300,00'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Продажа товара (создание) *' в течение 20 секунд
		И в таблице "Список" я перехожу к последней строке
		И я запоминаю значение поля с именем 'Номер' таблицы 'Список' как 'Номер1'

		// продажа всех единиц товара "Хлеб" со склада Большой
		И В командном интерфейсе я выбираю 'Продажи' 'Продажа'
		Тогда открылось окно 'Продажа товара (создание)'
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Животноводство ООО '
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'хлеб'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '17,00'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Продажа товара (создание) *' в течение 20 секунд
		И в таблице "Список" я перехожу к последней строке
		И я запоминаю значение поля с именем 'Номер' таблицы 'Список' как 'Номер2'
		
		Когда В панели открытых я выбираю 'Остатки товаров (Остатки товаров с характеристиками)'
		Тогда открылось окно 'Остатки товаров (Остатки товаров с характеристиками)'
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		И я жду когда в табличном документе "Результат" заполнится ячейка "R26C3" в течение 20 секунд
		И я жду, что в табличном документе "Результат" ячейка "R26C3" станет равна "4 240,00" в течение 20 секунд

	* восстановление остатков
		И В панели открытых я выбираю 'Продажи товара'
		И в таблице "Список" я перехожу к строке
				| 'Номер'    |
				| '$Номер1$' |
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
		И в таблице "Список" я перехожу к строке
				| 'Номер'    |
				| '$Номер2$' |
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"

	* проверка отчета с восстановленным Товаром			
		Когда В панели открытых я выбираю 'Остатки товаров (Остатки товаров с характеристиками)'
		Тогда открылось окно 'Остатки товаров (Остатки товаров с характеристиками)'
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		И я жду когда в табличном документе "Результат" заполнится ячейка "R27C3" в течение 20 секунд
		И в табличном документе "Результат" ячейка с адресом "R27C3" равна "4 557,00"
		