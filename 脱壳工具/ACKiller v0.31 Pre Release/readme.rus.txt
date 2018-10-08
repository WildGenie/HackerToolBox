ACKiller v 0.31
-------------------


-----------------[Основное]------------------
 Программа предназначена для автоматической
 распаковки программ, защищенных протектором
 ACProtect (в прошлом UltraProtect).


Поддерживаются версии:
 -ACProtect 1.06,
 -ACProtect 1.07,
 -ACProtect 1.09,
 -ACProtect 1.09c,
 -ACProtect 1.09e,
 -ACProtect 1.09g,
 -ACProtect 1.10,
 -ACProtect 1.20,
 -ACProtect 1.21,
 -ACProtect 1.22,
 -ACProtect 1.22b,
 -ACProtect 1.22c,
 -ACProtect 1.23,
 -ACProtect 1.30,
 -ACProtect 1.3b, 
 -ACProtect 1.3с,
 -ACProtect 1.32,
 -ACProtect 1.35a,
 -ACProtect 1.40,
 -ACProtect 1.41,
 -ACProtect 2.0

Поддерживаются опции:
 - ОЕР Obfuscation
 - API redirection
 - Code Replace

 - HR defence
 - Anti loader
 - Integrity check

 - Dynamic code en/decrypt
 - Embedded Protector
 - RSA-key locked code


 УБЕДИТЕЛЬНАЯ ПРОСЬБА!! Если распаковщик обломался в процессе распаковки файла,
 или распаковал, но при запуске распакованный файл кидает странные исключения
 типа Access Violation, Invalid/Priveleged Instruction и т.д. пожалуйста,
 пришлите запакованный файл на DragoonFly@rambler.ru вместе с логом распаковки.

---[история версий]---

- 0.31 pre-release
 - Добавлены сигнатуры версий протектора 1.06, 1.20, 1.22c, 1.30, 1.3b, 
 - Устранён баг с обработкой CR в версии 1.30
 - Добавлена возможность продолжить работу при некорректно выставленной опции CR (Баг протектора!)
 - Улучшено определение факта паковки файла ACProtect'ом
 - Загрузка файла как библиотеки по флагу в хидере (а не по расширению)

- 0.30 pre-release -
 - Добавлена возможность загрузки Dll
 - убраны мелкие баги

- 0.21 -
 - Добавлена возможность выбора секций, в которых нужно искать маркеры
 - Исправлен баг с восстановлением CR в версиях 1.3х

- 0.20 beta -
 - Ребилдер ресурсов
 - Обработка Dynamic code en/decrypt, Embedded Protector,  RSA-key locked code

- 0.12 beta -
 -Первая паблик версия 

-------[Автор]-------
	
  HoBleen
  E-mail: DragoonFly@rambler.ru