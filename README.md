# CWeb - Module check http/https content and SSL Certificate

**Модуль для быстрой проверки присутствия указанного http/https контента с помощью GET-запроса, а так же валидности сертификата.**

**[Скачать (wcheck.psm1)](https://github.com/Lifailon/cweb/releases/tag/cweb)**

**Синтаксис:**

` .\Import-Module cweb.psm1 ` \
` Get-Help wcheck.psm1 ` \
` wprot https://ya.ru sign `

**Пример https проверки с полным доменным именем**. Для поиска контента на сайте использую слово ` signin ` (параметр по умолчанию), присутствует на многих сайтах, на примере, сервера RD Web Access (IIS) и Zabbix (Apache):

![Image alt](https://github.com/Lifailon/Web-Check/blob/rsa/Screen/WCheck-https.jpg)
