1. Подготовка сервера с которого будет производиться установка.

Устанавливаем dnsmasq:
`sudo apt-get install dnsmasq`

Копируем конфиг dnsmasq.conf в каталог '/etc/dnsmasq.conf`

Добавляем правило для доступа к сети интернет с 192.168.10.0 сети:
iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -j MASQUERADE
Файл preseed, для автоматической установки Debian выложен на tauto.ddos-guard.net
2. Создаем каталог для установочных файлов Debian /media/pxeboot
sudo mkdir /media/pxeboot
копируем все файлы в директорию /media/pxeboot.
В файле /media/pxeboot/pxelinux.cfg/default параметру 'interface=' необходимо указать имя сетевого интерфейса настраиваемого сервера.
3. Подготовка Docker.
Копируем в каталог из которого будем запускать контейнер, файл docker-compose.yaml
(image выложен в registry.ddos-guard.net/dnsmasq:latest_v3)
Запускаем sudo docker-compose -f docker-compose.yaml up
4. Устанавливаем на сервере echo загрузку по PXE и запускаем.
Установка должна пройти в автоматическом режиме.
