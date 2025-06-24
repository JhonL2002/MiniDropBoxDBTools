## 🔒 MiniDropBox Security - Habilitar Transparent Data Encryption (TDE) con BYOK - Parte 3

Este script habilita **Transparent Data Encryption (TDE)** en la base de datos creada, utilizando una clave propia (BYOK) almacenada en Azure Key Vault.

---

## 🎯 Objetivo del Script

- Registrar la clave del Key Vault como **clave de servidor** en Azure SQL.
- Conceder permisos al servidor SQL sobre la clave.
- Habilitar el protector de TDE con la clave personalizada.
- Activar la rotación automática de la clave.

---

## 🛠️ ¿Qué hace el script?

1. Recupera el servidor SQL y su identidad administrada.
2. Concede permisos `get`, `wrapKey`, `unwrapKey` al servidor sobre la clave TDE.
3. Registra la clave del vault como `Server Key` en SQL.
4. Configura TDE Protector con esa clave personalizada ('AzureKeyVault').
5. Activa la **rotación automática** de la clave.

---

## ⚙️ Servicios involucrados

- **Azure SQL Server**
- **Azure Key Vault**
- **Transparent Data Encryption (TDE)**
- **PowerShell Az Module**

---

## 🧪 Ejecución

Antes de ejecutar el script, se recomienda tener en cuenta lo siguiente:

1. Haber creado una bóveda (Azure Key Vault) para los secretos y claves necesarios, haber creado un servidor y una base de datos Azure SQL, para ver los detalles, consultar:
  - <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Security/Create%20Azure%20Key%20Vault%20Service">Parte 1 (Crear Azure Key Vault con clave TDE y secreto de contraseña SQL)</a>
  - <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Security/Implementar%20Azure%20SQL%20Database">Parte 2 (Crear una base de datos SQL de Azure con autenticación segura)</a>
2. Cambiar las variables de la plantilla del script con valores reales, usar el grupo de recursos creado en la parte 1 del laboratorio, se puede editar fácilmente en Visual Studio Code.
3. Iniciar sesión en Azure desde PowerShell, usar el siguiente script:
  - `Connect-AzAccount`, se abrirá una ventana y se pedirá acceder a Azure.
4. Ejecutar el script en la terminal con:
  ```PowerShell
  .\EnableTDEAzureSQLScript.ps1
  ```

---

## 📌 Notas técnicas

- La identidad administrada del servidor debe tener permisos sobre la clave en Key Vault.
- La rotación automática solo está disponible si la clave lo permite (RSA de 2048+ bits)
- Si se elimina la clave del servidor, no se podrán acceder a los datos y a la base de datos del servidor

---

## ✅ Verificar los resultados

| **Descripción** | **Imagen** |
| --------------- | ---------- |
| Ejecutar el script (después de iniciar sesión) | ![ejecutar script](https://github.com/user-attachments/assets/2d18000a-fba6-4a7d-ae48-c77c2f180629) |
| Confirmar la habilitación de TDE en la consola | ![confirmar habilitacion](https://github.com/user-attachments/assets/1f9995ce-19e1-41cb-98c8-55666f832f92) |
| Verificar que se usa la clave de key vault en el servidor | ![verificar clave](https://github.com/user-attachments/assets/7e2c9bdf-4dba-46eb-8191-0cfb7c93d458) |
