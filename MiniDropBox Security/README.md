# 🔐 MiniDropBox Security - Protección de Datos en Azure SQL con BYOK y PowerShell

La protección de datos es una tarea clave en el diseño y desarrollo de bases de datos, es buena práctica **cifrar los datos en reposo** para que los datos siempre estén protegidos.

---

## Caso de estudio

La organización que desarrolla **MiniDropBox**, ha decidido **migrar su sistema de base de datos a la nube** utilizando **Azure SQL Database**. Debido a requerimientos de cumplimiento normativo y lineamientos internos de seguridad, la empresa establece los siguientes criterios obligatorios para su infraestructura:

1. **Todos los datos en reposo deben estar cifrados**, usando una clave gestionada por la empresa (BYOK).
2. Las claves y secretos deben almacenarse únicamente en **Azure Key Vault**, con control total sobre el acceso.
3. El proceso de despliegue debe minimizar el esfuerzo administrativo, automatizado **mediante scripts de PowerShell**, para garantizar repetibilidad y trazabilidad técnica.
4. La solución debe permitir la **rotación automática de claves** para reducir el riesgo de exposición prolongada.

---

Este repositorio contiene un caso práctico dividido en 3 partes donde se implementa una solución de **Transparent Data Encryption en Azure SQL** utilizando:

- **Azure Key Vault (Premium)**
- **Transparent Data Encryption (TDE)** con BYOK (Bring Your Own Key)
- **PowerShell Az Module** para automatizar toda la infraestructura

---

## 🧪 Escenarios implementados

| **Parte** | **Descripción** | **Tecnología clave** |
| --------- | --------------- | -------------------- |
| 1 | Crear un servicio de Azure Key Vault seguro y una clave RSA en HSM para TDE | Azure Key Vault, RSA-HSM |
| 2 | Crear servicio de Azure SQL Server y base de datos Single S0, almacenando la clave del servidor SQL como secreto en Key Vault | Azure SQL, Managed Identity |
| 3 | Habilitar TDE en la base con BYOK y rotación automática | TDE, BYOK, Key Vult |

## 📂 Estructura del repositorio

```plaintext
MiniDropBox Security/
|
|--- Create Azure Key Vault Service/
|    |--- CreateKeyVaultScript.ps1
|    |--- README.md
|
|--- Implementar Azure SQL Database
|    |--- DeploySQLDatabaseS0.ps1
|    |--- README.md
|
|--- Habilitar TDE
|    |--- EnableTDEAzureSQLScript.ps1
|    |--- README.md
|
|--- README.md (este archivo)     
```
