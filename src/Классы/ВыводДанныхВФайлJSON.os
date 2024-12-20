// ----------------------------------------------------------
// This Source Code Form is subject to the terms of the
// Mozilla Public License, v.2.0. If a copy of the MPL
// was not distributed with this file, You can obtain one
// at http://mozilla.org/MPL/2.0/.
// ----------------------------------------------------------
// Codebase: https://github.com/ArKuznetsov/yabr.os/
// ----------------------------------------------------------

Перем МенеджерОбработкиДанных; // ВнешняяОбработкаОбъект - обработка-менеджер, вызвавшая данный обработчик
Перем Идентификатор;           // Строка                 - идентификатор обработчика, заданный обработкой-менеджером
Перем ПараметрыОбработки;      // Структура              - параметры обработки
Перем Лог;

Перем Данные;                  // Произвольный           - произвольные данные для вывода в файл JSON
Перем ПутьКФайлу;              // Строка                 - путь к файлу JSON для сохранения данных
Перем ОбрабатыватьКакМассив;   // Булево                 - Истина - входящий массив будет обработан поэлементно;
                               //                          Ложь - входящий массив будет обработан как 1 значение.
Перем ДанныеДляСохранения;     // Массив                 - буфер данных для сохранения в файл JSON
Перем ЗаписыватьПустойСписок;  // Булево                 - Истина - Записывать данные в файл, даже если результат пустой;
                               //                          Ложь - Файл записываться не будет.

#Область ПрограммныйИнтерфейс

// Функция - признак возможности обработки, принимать входящие данные
// 
// Возвращаемое значение:
//	Булево - Истина - обработка может принимать входящие данные для обработки;
//	         Ложь - обработка не принимает входящие данные;
//
Функция ПринимаетДанные() Экспорт
	
	Возврат Истина;
	
КонецФункции // ПринимаетДанные()

// Функция - признак возможности обработки, возвращать обработанные данные
// 
// Возвращаемое значение:
//	Булево - Истина - обработка может возвращать обработанные данные;
//	         Ложь - обработка не возвращает данные;
//
Функция ВозвращаетДанные() Экспорт
	
	Возврат Ложь;
	
КонецФункции // ВозвращаетДанные()

// Функция - возвращает список параметров обработки
// 
// Возвращаемое значение:
//	Структура                                - структура входящих параметров обработки
//      *Тип                    - Строка         - тип параметра
//      *Обязательный           - Булево         - Истина - параметр обязателен
//      *ЗначениеПоУмолчанию    - Произвольный   - значение параметра по умолчанию
//      *Описание               - Строка         - описание параметра
//
Функция ОписаниеПараметров() Экспорт
	
	Параметры = Новый Структура();
	
	ДобавитьОписаниеПараметра(Параметры,
	                          "ПутьКФайлу",
	                          "Строка",
	                          Истина,
	                          "",
	                          "Путь к файлу JSON для сохранения данных.");
	ДобавитьОписаниеПараметра(Параметры,
	                          "ОбрабатыватьКакМассив",
	                          "Булево",
	                          ,
	                          Истина,
	                          "Истина - входящий массив будет обработан поэлементно;
                              |Ложь - входящий массив будет обработан как 1 значение.");
	    
	ДобавитьОписаниеПараметра(Параметры,
	                          "ЗаписыватьПустойСписок",
	                          "Булево",
	                          ,
	                          Ложь,
	                          "Истина - Записывать данные в файл, даже если результат пустой;
                              |Ложь - Файл записываться не будет.");
	    
	Возврат Параметры;
	
КонецФункции // ОписаниеПараметров()

// Функция - Возвращает обработку - менеджер
// 
// Возвращаемое значение:
//	ВнешняяОбработкаОбъект - обработка-менеджер
//
Функция МенеджерОбработкиДанных() Экспорт
	
	Возврат МенеджерОбработкиДанных;
	
КонецФункции // МенеджерОбработкиДанных()

// Процедура - Устанавливает обработку - менеджер
//
// Параметры:
//	НовыйМенеджерОбработкиДанных      - ВнешняяОбработкаОбъект - обработка-менеджер
//
Процедура УстановитьМенеджерОбработкиДанных(Знач НовыйМенеджерОбработкиДанных) Экспорт
	
	МенеджерОбработкиДанных = НовыйМенеджерОбработкиДанных;
	
КонецПроцедуры // УстановитьМенеджерОбработкиДанных()

// Функция - Возвращает идентификатор обработчика
// 
// Возвращаемое значение:
//	Строка - идентификатор обработчика
//
Функция Идентификатор() Экспорт
	
	Возврат Идентификатор;
	
КонецФункции // Идентификатор()

// Процедура - Устанавливает идентификатор обработчика
//
// Параметры:
//	НовыйИдентификатор      - Строка - новый идентификатор обработчика
//
Процедура УстановитьИдентификатор(Знач НовыйИдентификатор) Экспорт
	
	Идентификатор = НовыйИдентификатор;
	
КонецПроцедуры // УстановитьИдентификатор()

// Функция - Возвращает значения параметров обработки данных
// 
// Возвращаемое значение:
//	Структура - параметры обработки данных
//
Функция ПараметрыОбработкиДанных() Экспорт
	
	Возврат ПараметрыОбработки;
	
КонецФункции // ПараметрыОбработкиДанных()

// Процедура - Устанавливает значения параметров обработки данных
//
// Параметры:
//	НовыеПараметры      - Структура     - значения параметров обработки данных
//
Процедура УстановитьПараметрыОбработкиДанных(Знач НовыеПараметры) Экспорт
	
	ПараметрыОбработки = НовыеПараметры;
	
	Если ПараметрыОбработки.Свойство("ПутьКФайлу") Тогда
		Если НЕ МенеджерОбработкиДанных.ЭтоWindows() Тогда
			ПараметрыОбработки.ПутьКФайлу = СтрЗаменить(ПараметрыОбработки.ПутьКФайлу, "\", "/");
		КонецЕсли;
		Файл = Новый Файл(ПараметрыОбработки.ПутьКФайлу);
		ПутьКФайлу = Файл.ПолноеИмя;
	КонецЕсли;
	
	Если ПараметрыОбработки.Свойство("ОбрабатыватьКакМассив") Тогда
		ОбрабатыватьКакМассив = ПараметрыОбработки.ОбрабатыватьКакМассив;
	Иначе
		ОбрабатыватьКакМассив = Истина;
	КонецЕсли;

	Если ПараметрыОбработки.Свойство("ЗаписыватьПустойСписок") Тогда
		ЗаписыватьПустойСписок = ПараметрыОбработки.ЗаписыватьПустойСписок;
	Иначе
		ЗаписыватьПустойСписок = Ложь;
	КонецЕсли;
	
КонецПроцедуры // УстановитьПараметрыОбработкиДанных()

// Функция - Возвращает значение параметра обработки данных
// 
// Параметры:
//	ИмяПараметра      - Строка           - имя получаемого параметра
//
// Возвращаемое значение:
//	Произвольный      - значение параметра
//
Функция ПараметрОбработкиДанных(Знач ИмяПараметра) Экспорт
	
	Если НЕ ТипЗнч(ПараметрыОбработки) = Тип("Структура") Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Если НЕ ПараметрыОбработки.Свойство(ИмяПараметра) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат ПараметрыОбработки[ИмяПараметра];
	
КонецФункции // ПараметрОбработкиДанных()

// Процедура - Устанавливает значение параметра обработки
//
// Параметры:
//	ИмяПараметра      - Строка           - имя устанавливаемого параметра
//	Значение          - Произвольный     - новое значение параметра
//
Процедура УстановитьПараметрОбработкиДанных(Знач ИмяПараметра, Знач Значение) Экспорт
	
	Если НЕ ТипЗнч(ПараметрыОбработки) = Тип("Структура") Тогда
		ПараметрыОбработки = Новый Структура();
	КонецЕсли;
	
	ПараметрыОбработки.Вставить(ИмяПараметра, Значение);

	Если ВРег(ИмяПараметра) = ВРег("ПутьКФайлу") Тогда
		ПутьКФайлу = Значение;
		Если НЕ МенеджерОбработкиДанных.ЭтоWindows() Тогда
			ПутьКФайлу = СтрЗаменить(ПутьКФайлу, "\", "/");
		КонецЕсли;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ОбрабатыватьКакМассив") Тогда
		ОбрабатыватьКакМассив = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ЗаписыватьПустойСписок") Тогда
		ЗаписыватьПустойСписок = Значение;
	Иначе
		Возврат;
	КонецЕсли;
	
КонецПроцедуры // УстановитьПараметрОбработкиДанных()

// Процедура - устанавливает данные для обработки
//
// Параметры:
//	Данные      - Структура     - значения параметров обработки
//
Процедура УстановитьДанные(Знач ВходящиеДанные) Экспорт
	
	Данные = ВходящиеДанные;
	
КонецПроцедуры // УстановитьДанные()

// Процедура - выполняет обработку данных
//
Процедура ОбработатьДанные() Экспорт
	
	КоличествоНакопленныхДанных = 0;
	 
	Если ТипЗнч(ДанныеДляСохранения) = Тип("Массив") Тогда
		КоличествоНакопленныхДанных = ДанныеДляСохранения.Количество();
	КонецЕсли;
	
	Лог.Отладка("[%1]: Добавление данных ""%2"" для записи в файл ""%3""", ТипЗнч(ЭтотОбъект), Данные, ПутьКФайлу);

	ДобавитьЗаписи(Данные);
	
	Для й = КоличествоНакопленныхДанных По ДанныеДляСохранения.ВГраница() Цикл
		ПродолжениеОбработкиДанныхВызовМенеджера(ДанныеДляСохранения[й]);
	КонецЦикла;
	
КонецПроцедуры // ОбработатьДанные()

// Функция - возвращает текущие результаты обработки
//
// Возвращаемое значение:
//	Произвольный     - результаты обработки данных
//
Функция РезультатОбработки() Экспорт
	
	Возврат ДанныеДляСохранения;
	
КонецФункции // РезультатОбработки()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанных() Экспорт
	
	ЗаписатьДанныеВФайл();

	Лог.Информация("[%1]: Завершение обработки данных. Результат: ""%2"".", ТипЗнч(ЭтотОбъект), ПутьКФайлу);

	ЗавершениеОбработкиДанныхВызовМенеджера();
	
КонецПроцедуры // ЗавершениеОбработкиДанных()

#КонецОбласти // ПрограммныйИнтерфейс

#Область ОбработкаДанных

// Процедура - добавляет запись в массив данных для сохранения
//
// Параметры:
//	Элемент         - Произвольный                    - добавляемый элемент
//
Процедура ДобавитьЗаписи(Элемент)
	
	Если НЕ ТипЗнч(ДанныеДляСохранения) = Тип("Массив") Тогда
		ДанныеДляСохранения = Новый Массив();
	КонецЕсли;
	
	Если ТипЗнч(Элемент) = Тип("Массив") И ОбрабатыватьКакМассив Тогда
		Для Каждого ТекЭлемент Из Элемент Цикл
			ДанныеДляСохранения.Добавить(ТекЭлемент);
		КонецЦикла;
	Иначе
		ДанныеДляСохранения.Добавить(Элемент);
	КонецЕсли;
	
КонецПроцедуры // ДобавитьЗаписи()

// Процедура - выполняет запись переданных данных в файл
//
Процедура ЗаписатьДанныеВФайл()
	
	Если НЕ ТипЗнч(ДанныеДляСохранения) = Тип("Массив") Тогда
		ДанныеДляСохранения = Новый Массив;
	КонецЕсли;
	
	Если ДанныеДляСохранения.Количество() = 0 И Не ЗаписыватьПустойСписок Тогда
		Возврат;
	КонецЕсли;
	
	МенеджерОбработкиДанных.ОбеспечитьКаталог(ПутьКФайлу, Истина);
	
	Запись = Новый ЗаписьJSON();
	
	Запись.ОткрытьФайл(ПутьКФайлу, "UTF-8", , Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Unix, Символы.Таб));
	
	Лог.Информация("[%1]: Запись данных в файл ""%2""", ТипЗнч(ЭтотОбъект), ПутьКФайлу);

	Попытка
		ЗаписатьJSON(Запись, ДанныеДляСохранения);
	Исключение
		ТекстОшибки = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
		ВызватьИсключение ТекстОшибки;
	КонецПопытки;
	
	Запись.Закрыть();
	
КонецПроцедуры // ЗаписатьДанныеВФайл()

#КонецОбласти // ОбработкаДанных

#Область СлужебныеПроцедурыВызоваМенеджераОбработкиДанных

// Процедура - выполняет действия обработки элемента данных
// и оповещает обработку-менеджер о продолжении обработки элемента
//
//	Параметры:
//		Элемент    - Произвольный     - Элемент данных для продолжения обработки
//
Процедура ПродолжениеОбработкиДанныхВызовМенеджера(Элемент)
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МенеджерОбработкиДанных.ПродолжениеОбработкиДанных(Элемент, Идентификатор);
	
КонецПроцедуры // ПродолжениеОбработкиДанныхВызовМенеджера()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанныхВызовМенеджера()
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МенеджерОбработкиДанных.ЗавершениеОбработкиДанных(Идентификатор);
	
КонецПроцедуры // ЗавершениеОбработкиДанныхВызовМенеджера()

#КонецОбласти // СлужебныеПроцедурыВызоваМенеджераОбработкиДанных

#Область СлужебныеПроцедурыИФункции

// Процедура - добавляет описание параметра обработки
// 
// Параметры:
//     ОписаниеПараметров     - Структура      - структура описаний параметров
//     Параметр               - Строка         - имя параметра
//     Тип                    - Строка         - список возможных типов параметра
//     Обязательный           - Булево         - Истина - параметр обязателен
//     ЗначениеПоУмолчанию    - Произвольный   - значение параметра по умолчанию
//     Описание               - Строка         - описание параметра
//
Процедура ДобавитьОписаниеПараметра(ОписаниеПараметров
	                              , Параметр
	                              , Тип
	                              , Обязательный = Ложь
	                              , ЗначениеПоУмолчанию = Неопределено
	                              , Описание = "")
	
	Если НЕ ТипЗнч(ОписаниеПараметров) = Тип("Структура") Тогда
		ОписаниеПараметров = Новый Структура();
	КонецЕсли;
	
	ОписаниеПараметра = Новый Структура();
	ОписаниеПараметра.Вставить("Тип"                , Тип);
	ОписаниеПараметра.Вставить("Обязательный"       , Обязательный);
	ОписаниеПараметра.Вставить("ЗначениеПоУмолчанию", ЗначениеПоУмолчанию);
	ОписаниеПараметра.Вставить("Описание"           , Описание);
	
	ОписаниеПараметров.Вставить(Параметр, ОписаниеПараметра);
	
КонецПроцедуры // ДобавитьОписаниеПараметра()

#КонецОбласти // СлужебныеПроцедурыИФункции

#Область ОбработчикиСобытий

// Процедура - обработчик события "ПриСозданииОбъекта"
//
// Параметры:
//  Менеджер	 - МенеджерОбработкиДанных    - менеджер обработки данных - владелец
// 
// BSLLS:UnusedLocalMethod-off
Процедура ПриСозданииОбъекта(Менеджер)

	УстановитьМенеджерОбработкиДанных(Менеджер);

	Лог = МенеджерОбработкиДанных.Лог();

	Лог.Информация("[%1]: Инициализирован обработчик", ТипЗнч(ЭтотОбъект));

КонецПроцедуры // ПриСозданииОбъекта()
// BSLLS:UnusedLocalMethod-on

#КонецОбласти // ОбработчикиСобытий
