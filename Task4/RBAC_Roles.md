# Таблица ролей RBAC для Kubernetes в PropDevelopment

| Роль | Права роли | Группы пользователей |
|------|------------|---------------------|
| `cluster-admin` | Полный доступ ко всем ресурсам кластера, включая секреты, конфигурации, управление узлами и RBAC (create, get, list, watch, update, patch, delete). | ИБ-специалисты, старшие DevOps-инженеры |
| `cluster-viewer` | Только просмотр ресурсов кластера (get, list, watch) для всех ресурсов (pods, deployments, services, configmaps и др.), без доступа к секретам. | Операционные менеджеры |
| `cluster-editor` | Управление ресурсами кластера (create, get, list, watch, update, patch, delete) для pods, deployments, services, configmaps, но без доступа к секретам и RBAC. | Разработчики, DevOps-инженеры |