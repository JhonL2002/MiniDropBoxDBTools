## 🔐 MiniDropBox Database Firewall - Habilitar acceso al seridor SQL en Azure

Este directorio contiene scripts de PowerShell para **agregar y eliminar reglas de firewall** en un servidor **Azure SQL**, permitiendo o revocando el acceso desde la IP pública del equipo cliente actual.

> ⚠️ Estos scripts son útiles especialmente en procesos de migración, mantenimiento o acceso temporal desde clientes externos

---

## Requisitos de permisos

Para ejecutar correctamente los scripts, el usuario autenticado en PowerShell debe tener asignado el rol de contribuidor a nivel de **grupo de recursos**.

Se puede asignar roles desde PowerShell con el comando:
```PowerShell
New-AzRoleAssignment `
    -ObjectId "<tu-object-id>" `
    -RoleDefinitionName "Contributor" `
    -Scope "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>"
```

---

## 📜 Scripts incluidos

| **Archivo** | **Descripción** |
| ----------- | --------------- |
| `AddFirewallRuleForClient.ps1` | Obtiene la IP pública actual del cliente y la habilita en el firewall del servidor SQL |
| `RemoveFirewallRuleForClient.ps1` | Elimina la regla previamente creada para cerrar el acceso externo |

---

## 🧪 Ejecución

Antes de ejecutar el script, se recomienda tener en cuenta lo siguiente:

1. Haber creado previamente una base de datos de Azure SQL, para ver los detalles, consultar <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Security/Implementar%20Azure%20SQL%20Database">aquí</a>.
2. Cambiar las variables de las plantillas con valores reales, estos scripts se pueden editar en Visual Studio Code.
3. Iniciar sesión en Azure desde PowerShell, usar el siguiente script:
  - `Connect-AzAccount`, se abrirá una nueva ventana y se podrá acceder a Azure.
4. Ejecutar los scripts dependiendo del uso de la siguiente forma en la terminal:
  - Para agregar una regla:
    ```PowerShell
    .\AddFirewallRuleForClient.ps1
    ```
  - Para remover una regla:
    ```PowerShell
    .\RemoveFirewallRuleForClien.ps1
    ```

----

## ✅ Verificar los resultados

| **Descripción** | **Imagen** |
| --------------- | ---------- |
| Iniciar sesión en Azure | ![iniciar sesion](https://github.com/user-attachments/assets/0d1cecd5-27da-418c-851a-f52954e88d08) |
| Ejecutar el script para agregar una regla al firewall (revisar previamente las variables de la plantilla) | ![ejecutar script cubierto](https://github.com/user-attachments/assets/260c211f-ff4d-49ea-8240-3a946fcfc6f0) |
| Ejecutar el script para remover una regla al firewall (revisar previamente las variables de la plantilla) | ![ejecutar scrip remover](https://github.com/user-attachments/assets/d7295226-e7e1-495b-9b96-86c2ce205ce9) |



