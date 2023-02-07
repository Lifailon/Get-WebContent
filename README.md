# CWeb

**Модуль для быстрой проверки наличия указанного http/https контента с помощью GET-запроса, а так же валидности сертификата.**

**[Скачать (cweb.psm1)](https://github.com/Lifailon/cweb/releases/tag/cweb)**

**Синтаксис:**

` .\Import-Module cweb.psm1 ` \
` Get-Help cweb.psm1 ` \
` cweb https://ya.ru sign `

### Пример https проверки с полным доменным именем.

Для поиска контента на сайте использую слово ` signin ` (параметр по умолчанию), присутствует на многих сайтах, на примере, сервера RD Web Access (IIS) и Zabbix (Apache). В последнем примере на сайте не было найдено ` signin ` о чем сообщается ` Not Available `

![Image alt](https://github.com/Lifailon/CWeb/blob/rsa/Screen/cweb-https.jpg)

### Пример проверки по ip-адресу**.

В случае с http выдаётся ошибка определения сертификата. При использовании полного url-адреса ` /zabbix ` мы получаем ` Content: Available `. Если мы используем https в связке с ip, можем прочитать сертификат, но не увидим контент, т.к. будет ошибка подключения - **не удалось установить доверительные отношения для защищенного канала SSL/TLS**, такую ошибку: ` Your connection is not private ` в браузере можно проигнорировать.

![Image alt](https://github.com/Lifailon/CWeb/blob/rsa/Screen/cweb-ip.jpg)

![Image alt](https://github.com/Lifailon/CWeb/blob/rsa/Screen/cweb-send-mail.jpg)

**[Скачать (Check-Web-Report.ps1)](https://github.com/Lifailon/CWeb/blob/rsa/Check-Web-Report.ps1)**
