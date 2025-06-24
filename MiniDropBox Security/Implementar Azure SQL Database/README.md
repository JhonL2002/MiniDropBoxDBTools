## 🗄️ MiniDropBox Security - Crear Azure SQL Database (Single, S0) con Autenticación Segura - Parte 2

Este script automatiza la creación de una instancia **Azure SQL Database** bajo el modelo **Single Database**, en nivel se servicio **S0 (Standard)**, vinculada con la clave del administrador alamcenada previamente en Key Vault.

---

## 🎯 Objetivo del Script

- Crear un servidor SQL Azure con nombre aleatorio.
- Utilizar la contraseña segura almacenada como secreto en Key Vault.
- Crear una base de datos de tipo **Single Standard (S0)**

---

## 🛠️ ¿Qué hace el script?

1. Recupera el secreto de 'SQLAdminPassword' desde Azure Key Vault.
2. Crea una nueva instancia de **Azure SQL Server** con autenticación SQL tradicional.
3. Crea una base de datos SQL llamada 'MiniDropBoxDb'
4. Habilita la identidad administrada del servidor (necesaria para TDE con BYOK).

---

## ⚙️ Servicios involucrados

- **Azure SQL Database (Single, S0)**
- **Azure Key Vault** (consulta del secreto)
- **PowerShell Az Module**

---

## 🧪 Ejecución

Antes de ejecutar el script, se recomienda tener en cuenta lo siguiente:

1. Haber creado previamente una bóveda (Azure Key Vault) para crear los secretos y claves necesarios, para ver los detalles, se sugiere ver el paso 1 que integra esta tarea <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Security/Create%20Azure%20Key%20Vault%20Service">aquí</a>.
2. Cambiar las variables de la plantilla del script con valores reales, usar el grupo de recursos creado en la parte 1 del laboratorio, se puede editar fácilmente en Visual Studio Code.
3. Iniciar sesión en Azure desde PowerShell, usar el siguiente script:
  - `Connect-AzAccount`, se abrirá una ventana y se pedirá acceder a Azure.
4. Ejecutar el script en la terminal con:
  ```PowerShell
  .\CreateKeyVaultScript.ps1
  ```
⚠️ El script asume que el Key Vault ya existe y que contiene el secreto `SQLAdminPassword`.

---

## 📌 Notas técnicas

- Se recomienda usar nombres aleatorios para evitar conflictos.
- La identidad administrada es necesaria para que el servidor SQL acceda a la clave del Vault para la parte 3.

---

## ✅ Verificar los resultados

| **Descripción** | **Imagen** |
| --------------- | ---------- |
| Ejecutar el script (se debe iniciar sesión antes de ejecutarlo) | ![ejecutar comando](https://github.com/user-attachments/assets/58780c8b-ce85-4079-b211-b03ef43d82f1) |
| Verificar creación en el portal | ![verificar creacion en el portal](https://github.com/user-attachments/assets/e658ede5-a462-464f-a889-a2202ccd572c) |
| Verificar estado de la base de datos | ![verificar estado de la base de datos](https://github.com/user-attachments/assets/088e6c9d-46fd-4dd2-a007-d305ee702049) |


