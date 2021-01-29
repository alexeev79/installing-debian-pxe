1. Подготовка сервера с которого будет производиться установка.

Устанавливаем dnsmasq: `sudo apt-get install dnsmasq`

Копируем конфиг dnsmasq.conf в каталог `/etc/dnsmasq.conf`

Добавляем правило для доступа к сети интернет с сети 10.0.0.0/24:
`iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -j MASQUERADE`
Файл preseed, для автоматической установки Debian размешаем на web http://10.0.0.1/

2. Создаем каталог для установочных файлов Debian /media/pxeboot
`sudo mkdir /media/pxeboot`

копируем все файлы в директорию `/media/pxeboot`.

В файле /media/pxeboot/pxelinux.cfg/default параметру 'interface=' необходимо указать имя сетевого интерфейса настраиваемого сервера (при наличии нескольких сетевых интерфейсов).

3. Подготовка Docker.
Копируем в каталог из которого будем запускать, файл docker-compose.yaml

Собираем из Dockerfile образ dnsmasq
`docker build -t my_project/dnsmasq:latest .`

Запускаем `sudo docker-compose -f docker-compose.yaml up`

4. Устанавливаем на сервере загрузку по PXE и запускаем.

Установка должна пройти в автоматическом режиме.
