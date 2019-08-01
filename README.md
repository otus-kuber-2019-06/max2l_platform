# Выполнено ДЗ №3

## В процессе сделано:

- Добавлен в описание проверки доступности pods **readinessProbe** и **livenessProbe:**.
- Создан **Deployment** для упрощения управления обновлением конфигураций подов. Стратегия обновления изменена на **RollingUpdate**.  
- Создан сервис **ClusterIP**.
- Для kube-proxy включен режим работы **IPVS**.
- Произведена установка **MetalLB**.
- Настройка балансировщика в режиме **L2**.
- Произведена настройка доступа к **CoreDNS** снаружи кластера.
- Установлен и настроен Ingress контроллер **ingress-nginx**
- Произведено подключение подов web-* к Ingress контроллеру.
- Произведено подключение **kubernetes-dashboard** к Ingress контроллеру.
- Реализовано канареечное обновление и перенаправление части трафика на выбранную группу подов с использованием Ingress контроллера.

## Используемые комманды

Отладка процесса деплоя.

```bash
kubespy trace deploy
```

или

```bash
kubectl get events --watch
```

Установка  **Metallb**

```bash
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.0/manifests/metallb.yaml
kubectl --namespace metallb-system get all
```

Установка ingress

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx --watch
```

## Ответ на вопросы

1. Проверка на десятом слайде валидна, но не имеет смысла потому, что если основной процесс завершится, то docker контейнер завершит свою работу или перезапустится.
2. Эта проверка имеет смысл если основной процесс web сервера порождает (например, с помощью системного вызова fork) дочерние процессы и они уже в свою очередь обрабатывают http запросы (Но тогда в этом случае имеет смысл проверять количество запущенных процессов). Или если процесс веб сервера порожден процессом другой демона, например с помощью **supervisord**.
