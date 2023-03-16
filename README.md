# Get-WebContent

Модуль для быстрой проверки наличия указанного http/https контента с помощью GET-запроса (в роли api выступаем cmdlet: **Invoke-WebRequest**) и валидности сертификата с помощью класса .NET: **System.Net.ServicePointManager**.

**Синтаксис:**

` Import-Module .\Get-WebContent.psm1 ` \
` Get-Help Get-WebContent.psm1 ` \
` Get-WebContent https://ya.ru sign `

**[Скачать модуль (Get-WebContent.psm1)](https://github.com/Lifailon/Get-WebContent/releases)**

### Пример https проверки с полным доменным именем.

Для поиска контента на сайте используется слово ` sign ` (параметр по умолчанию, присутствует на многих сайтах), в примере сервер Zabbix (Apache) и RD Web Access (IIS). В последнем случае на сайте не было найдено словосочетания ` test ` о чем сообщается: ` Not available `.

![Image alt](https://github.com/Lifailon/Get-WebContent/blob/rsa/Screen/Get-WebContent-Example.jpg)

### Пример проверки по ip-адресу.

В случае с http возращается ошибка определения сертификата, при этом используя полный url-адреса ` /zabbix ` мы получаем ` Content: Available `. Если мы используем https в связке с ip, можем прочитать сертификат, но не увидим контент, т.к. происходит ошибка подключения - **не удалось установить доверительные отношения для защищенного канала SSL/TLS**, такую ошибку: ` Your connection is not private ` в браузере можно проигнорировать.

![Image alt](https://github.com/Lifailon/Get-WebContent/blob/rsa/Screen/Get-WebContent-Example-ip.jpg)

### Мониторинг доступности контента.

Проверяется условие доступности контента, и в случае его отсутствия отправляем сообщение в Teleram, используя метод **REST**.

**[Скачать скрипт (Get-WebContent-Telegram.ps1)](https://github.com/Lifailon/Get-WebContent/blob/rsa/Scripts/Get-WebContent-Telegram.ps1)**

![Image alt](https://github.com/Lifailon/Get-WebContent/blob/rsa/Screen/Report-Rest-Telegram.jpg)

С помощью **DateTime** можно настроить мониторинг срока действия сертификата. Пример реализации: **[Excel-Date-Report](https://github.com/Lifailon/Excel-Date-Report)**
