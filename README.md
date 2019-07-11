# max2l_platform
max2l Platform repository
## Домашнее задание №1
### В ходе домашнего задания выполнено.
* Установлен **minikube**, **kubectl** и **k9s**.
* Произведено тестирование отказоустойчивости работы kubernetes после удаления docker контейнеров и pods в namespase **kube-system**.
* Создан docker образ c web сервисом nginx.
* Создан манифест файл создающий pod **web**. 
* В pod **web** добавлен init контейнер и **volume**.
* Протестирована корректность работы запущенного pod-а.
