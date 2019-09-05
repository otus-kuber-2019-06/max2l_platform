# Выполнено ДЗ №5

## В процессе сделано

- Подготовлен конфигурационный **cluster.yaml** файл для запуска kubernates с помощью **kind**.
- Создан **StorageClass** для CSI Host Path Driver.
- Создан объект PVC c именем **storage-pvc**.
- Создан объект Pod c именем **storage-pod**.
- Хранилище смонтировано в директорию **/data**.
- В смонтированную директорию загруженны тестовые данные.
- Протестирован механизм работы snapshot реализованный в CSI драйвере Host Path.
- Произведены изменения в проекте и docker images необходимые для прохождения тестов в **travis-ci.com**.

## Используемые команды

Запуск кластера с использованием пользовательской конфигурации.

```bash
kind create cluster --config=kubernetes-storage/cluster/cluster.yaml
```

Применения манифестов.
```bash
kubectl apply -f kubernetes-storage/hw
```
