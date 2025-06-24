# 🔐 Script 1 - Crear Azure Key Vault con Clave para TDE (BYOK) - Parte 1

Este script automatiza la creación de una instancia de Azure Key Vault con configuración de seguridad avanzada y almacena en él:

- 🔑 Una clave RSA para **Transparent Data Encryption (TDE)** usando BYOK (Bring Your Own Key).
- 🔐 Un secreto para la contraseña del administrador de SQL Server

---

## 🎯 Objetivo del Script

Crear una bóveda segura que cumpla con requisitos de auditoría y buenas prácticas para bases de datos cifradas, garantizando:

- Protección contra eliminación accidental (Purge Protection).
- Acceso controlado mediante **Access Policies** (no RBAC).
- Clave generada en **HSM** compatible con TDE.

---

## 🛠️ ¿Qué hace el script?

1. Crea un grupo de recursos aleatorio
2. Crea un servicio de Azure Key Vault con SKU 'Premium', habilitando:
  - `EnablePurgeProtection`
  - `DisableRbacAuthorization`
3. Asigna permisos al usuario actual para manejar claves y secretos.
4. Crea una clave HSM para TDE.
5. Solicita una contraseña segura y la guarda como secreto en la bóveda

---

## ⚙️ Servicios involucrados

- **Azure Key Vault (Premium)**
- **Microsoft Entra ID (Antes Azure AD)** (identidad del usuario actual)
- **PowerShell Az Module**

---

## 🧪 Ejecución

Antes de ejecutar el script, se recomienda tener en cuenta lo siguiente:

1. Cambiar las variables de la plantilla del script con valores reales, se puede editar facilmente en Visual Studio Code.
2. Iniciar sesión en Azure desde PowerShell, usar el siguiente script:
  - `Connect-AzAccount`, se abrirá una ventana y se pedirá acceder a Azure
3. Ejecutar el script con:
    ```PowerShell
    .\CreateKeyVaultScript.ps1
    ```
⚠️ El script solicita interactivamente la contraseña del SQL Admin

---

## 📌 Notas técnicas

- El parámetro `-DisableRbacAuthorization` es clave para permitir el uso de políticas de acceso tradicionales. Sin él, Azure por defecto tomará RBAC y podrá fallar la gestión de claves por PowerShell.
- La clave se crea con `Destination HSM`, cumpliendo requisitos de BYOK.
- Este script es la **primera parte del laboratorio MiniDropBox Security**, que también incluye la creación de un Servidor y base de datos SQL en Azure (parte 2) y habilitación de TDE (parte 3).

---

## ✅ Verificar los resultados

| **Descripción** | **Imagen** |
| --------------- | ---------- |
| Conectar cuenta de Azure | ![Conectar cuenta de azure](https://github.com/user-attachments/assets/6995ed4d-dc25-4633-a2d6-f98ec1d3582e) |
| Ingresar clave del servidor | ![ingresar clave del sql server](https://github.com/user-attachments/assets/2c80a101-0305-4815-b6e8-7851227e666a) |
| Verificar la creación del key vault en el portal | ![confirmar creacion key vault](https://github.com/user-attachments/assets/f06df723-e9d9-46ce-8eac-189ee5563931) |
| Verificar la clave para TDE | ![verificar key](https://github.com/user-attachments/assets/624f1128-ace6-438b-aa43-92262692c85b) |
| Verificar secreto para la clave del servidor | ![verificar secreto](https://github.com/user-attachments/assets/78f10a84-9961-4d2d-b0aa-d11add0bf54e) |
