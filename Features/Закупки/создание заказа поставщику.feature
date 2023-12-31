﻿#language: ru



Функционал: создание документа Заказ поставщику

Как Менеджер по закупкам я хочу
создание документа Заказ поставщику
чтобы заказать товар у поставщика

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа Заказ поставщику
// создание заказа поставщику
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Заказы поставщикам'
	Тогда открылось окно 'Заказы поставщикам'
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
	Тогда открылось окно 'Заказ поставщику (создание)'
* Заполнение шапки документа
	И я нажимаю кнопку выбора у поля с именем "Партнер"
	Тогда открылось окно 'Партнеры (Поставщики)'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   | 'Основной менеджер'            |
		| 'ANT BEAUTY LTD' | 'Стрельникова Юлия Николаевна' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ поставщику (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Соглашение"
	Тогда открылось окно 'Соглашения с поставщиками об условиях закупок'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ поставщику (создание) *'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'БТ ЮНАЙТЕД ООО'
	И я нажимаю кнопку выбора у поля с именем "Склад"
	Тогда открылось окно 'Склады и магазины'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   | 'Подразделение' |
		| 'Основной склад' | 'Склад'         |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ поставщику (создание) *'
* Заполнение товарной части
	И я перехожу к закладке с именем "ГруппаТовары"
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатураПартнера"
	Тогда открылось окно 'Номенклатура поставщика'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ поставщику (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличествоУпаковок"
	И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '10,000'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1 500,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Номенклатура поставщика'                                        | 'Номенклатура'                                                                                       | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Beautiful Botanical & Marine Complex Hydrogel Mask (Новый), шт' | 'Beaut. Botan.&Marine Comp. Hydr. Mask/Beaut. Гидр. маска-патчи для рук с раст. экстр. и морс. вод.' | '1 500,00' | '10,000'     | '15 000,00' |
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Приобретение товаров и услуг (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	
// Сценарий: проверка наличия номенклатуры Бейдж
// 	И В командном интерфейсе я выбираю 'НСИ и администрирование' 'Номенклатура'
// 	Тогда открылось окно 'Номенклатура'
// 	И таблица "Номенклатура" содержит строки:
// 		| 'Наименование' |
// 		| 'Бейдж'   |
	
	