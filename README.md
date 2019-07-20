# max2l_platform
max2l Platform repository
# Выполнено ДЗ №2
## В процессе сделано:
 - В первом пункте создан серверный аккаунт **bob**. Этому аккаунту назначена роль **admin** в рамках всего кластера. Создан серверный аккаунт **dave** без доступа к кластеру.
 - Во втором пункте создан namespace **prometheus**. Создан сервисный аккаунт **carol** в этом namespace. Реализована возможность делать **get**, **list**, **watch** для всех **pods** кластера используя сервесные акканты в namespace **prometheus**.
 - В третьем пункте создан namespace **dev**. Создан сервисный аккаунт **jane** в этом namespace. Этому аккаунту выдана роль **admin** в рамках namespace **dev**. Создан сервисный аккаунт **ken** в namespace **dev**. Этому namespace выданы права в рамках роли **view** для этого namespace.

## Используемые комманды.
Применение манифест файлов
```bash
kubectl apply -f task01
kubectl apply -f task02
kubectl apply -f task03
```
Получение **client-key-data** и **token**
```bash
kubectl get secrets service-admin-token-qdb8c
kubectl get secrets service-admin-token-qdb8c -o "jsonpath={.data.token}"| base64 -D
```
Проверка прав доступа к ресурсам у пользователей
```bash  
kubectl auth can-i get deploument --as system:serviceaccount:dev:alice
kubectl auth can-i get deploument --as system:serviceaccount:default:bob
```
