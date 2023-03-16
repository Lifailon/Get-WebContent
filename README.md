# Get-WebContent

Модуль для быстрой проверки наличия указанного http/https контента с помощью GET-запроса (в роли api выступаем cmdlet: **Invoke-WebRequest**) и валидности сертификата с помощью класса .NET: **System.Net.ServicePointManager**.

**Синтаксис:**

` Import-Module .\Get-WebContent.psm1 ` \
` Get-Help Get-WebContent.psm1 ` \
` Get-WebContent https://ya.ru sign `

**[Скачать модуль (Check-Web-Report.ps1)](https://github.com/Lifailon/CWeb/blob/rsa/Scripts/Check-Web-Report.ps1)**

### Пример https проверки с полным доменным именем.

Для поиска контента на сайте используется слово ` sign ` (параметр по умолчанию), присутствует на многих сайтах, в примере сервер Zabbix (Apache) и RD Web Access (IIS). В последнем случае на сайте не было найдено словосочетания ` test ` о чем сообщается: ` Not available `.

![Image alt](https://github.com/Lifailon/CWeb/blob/rsa/Screen/cweb-https.jpg)

### Пример проверки по ip-адресу.

В случае с http возращается ошибка определения сертификата, при этом используя полный url-адреса ` /zabbix ` мы получаем ` Content: Available `. Если мы используем https в связке с ip, можем прочитать сертификат, но не увидим контент, т.к. происходит ошибка подключения - **не удалось установить доверительные отношения для защищенного канала SSL/TLS**, такую ошибку: ` Your connection is not private ` в браузере можно проигнорировать.

![Image alt](https://github.com/Lifailon/CWeb/blob/rsa/Screen/cweb-ip.jpg)

### Мониторинг доступности контента.

**[Скачать скрипт (Check-Web-Report.ps1)](https://github.com/Lifailon/CWeb/blob/rsa/Scripts/Check-Web-Report.ps1)**

Проверяется условие доступности контента на сайте, и в случае его отсутствия отправляем сообщение в Teleram, используя метод **REST**.

![Image alt](https://github.com/Lifailon/CWeb/blob/rsa/Screen/cweb-send-mail.jpg)

С помощью **DateTime** можно настроить мониторинг срока действия сертификата. Пример реализации: **[Excel-Date-Report](https://github.com/Lifailon/Excel-Date-Report)**
