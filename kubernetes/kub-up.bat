@echo off

kubectl apply --validate=false -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
timeout 60

kubectl apply ^
    -f certs/selfsigned-issuer.yaml ^
    -f certs/ca-certificate.yaml ^
    -f certs/ca-issuer.yaml ^
    -f certs/mysql.yaml ^
    -f certs/phpmyadmin.yaml
timeout 15

kubectl apply ^
    -f mysql/configmap.yaml ^
    -f mysql/secret.yaml ^
    -f mysql/service.yaml ^
    -f mysql/statefulset.yaml ^
    -f redis/configmap-main.yaml ^
    -f redis/configmap-acl.yaml ^
    -f redis/configmap-pipy.yaml ^
    -f redis/statefulset-redis.yaml ^
    -f redis/statefulset-sentinel.yaml ^
    -f redis/deployment-redisproxy.yaml ^
    -f redis/service-redis.yaml ^
    -f redis/service-sentinel.yaml ^
    -f redis/service-redisproxy.yaml ^
    -f phpmyadmin/configmap.yaml ^
    -f phpmyadmin/deployment.yaml ^
    -f phpmyadmin/service.yaml ^
    -f volumes/letsencrypt.yaml ^
    -f volumes/ssl.yaml ^
    -f volumes/website.yaml ^
    -f openemr/secret.yaml ^
    -f openemr/deployment.yaml ^
    -f openemr/service.yaml 
