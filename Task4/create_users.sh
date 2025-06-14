#!/bin/bash
# Скрипт для создания пользователей в Kubernetes с использованием сертификатов

# Параметры
CA_KEY="/path/to/ca.key" # Путь к ключу CA кластера
CA_CERT="/path/to/ca.crt" # Путь к сертификату CA кластера
KUBECONFIG="/path/to/kubeconfig" # Путь к kubeconfig

# Пользователь 1: security-admin
openssl genrsa -out security-admin.key 2048
openssl req -new -key security-admin.key -out security-admin.csr -subj "/CN=security-admin/O=propdevelopment"
openssl x509 -req -in security-admin.csr -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial -out security-admin.crt -days 365

# Пользователь 2: ops-manager
openssl genrsa -out ops-manager.key 2048
openssl req -new -key ops-manager.key -out ops-manager.csr -subj "/CN=ops-manager/O=propdevelopment"
openssl x509 -req -in ops-manager.csr -CA $CA_CERT -CAkey $CA_KEY -CAcreateserial -out ops-manager.crt -days 365

# Добавление пользователей в kubeconfig
kubectl config set-credentials security-admin --client-certificate=security-admin.crt --client-key=security-admin.key --kubeconfig=$KUBECONFIG
kubectl config set-credentials ops-manager --client-certificate=ops-manager.crt --client-key=ops-manager.key --kubeconfig=$KUBECONFIG

echo "Пользователи security-admin и ops-manager созданы и добавлены в kubeconfig."