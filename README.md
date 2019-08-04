# Выполнено ДЗ №4

## В процессе сделано

- Установлен **kind**.
- Развернут **StatefulSet** с использованием **MinIO**.
- Создан **Headless Service** для доступа к подам, которые **StatefulSet** изнутри кластера.
- Установлен и настроен консольный клиент minio mc.
- Произведена диагностика работы кластера в соответствии с требованиями домашнего задания.
- Настроен **secret** для работы с конфигурацией **MinIO**.

## Используемые команды

Создание кластера kubernetes с помощью **kind**.

```bash
kind create cluster
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
```

 Команды для отладки.

```bash
kubectl get statefulsets
kubectl get pods
kubectl get pvc
kubectl get pv
kubectl describe <resource> <resource_name>
```
