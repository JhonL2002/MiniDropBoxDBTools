# 🛠️ MiniDropBox - SQL Server Restore Automation Scripts

**Autor:** [JhonL2002]
**Certificación:** Microsoft DP-300 (Azure Database Administrator Associate)
**Repositorio:** Scripts de laboratorio diseñados para simular tareas reales de un DBA con SQL Server

---

## 📌 ¿Qué es esto?

Este repositorio contiene scripts en **PowerShell** que automatizan la generación y ejecución de comandos `RESTORE DATABASE` en **SQL Server**, a partir de archivos `.bak`.
Fueron creados como parte de una serie de **mini-labs autodidactas**, que replican escenarios de administración de bases de datos **al estilo Azure**, incluyendo tareas de respaldo, restauración y manejo de archivos de base de datos

---

## 📂 Estructura del proyecto

```plaintext
MiniDropBox Restore/
|- Check-BackupAndGenerateRestore # Script principal para generar el comando RESTORE
|- MiniDropBoxDB.bak # Archivo .bak a restaurar
|- README.md # Este archivo
```
---

## 🔄 ¿Que hace el script?

El script realiza los siguientes pasos:
1. **Valida** si el archivo `.bak` existe
2. **Lee la cabecera del backup** (`RESTORE HEADERONLY`) y muestra:
  - Tipo de backup (FULL, DIFF, LOG)
  - Fecha de creación
  - Modelo de recuperación
  - Nombre de la base de datos
3. **Consulta si la base ya existe** en la instancia
4. **Pide confirmación para sobreescribirla** (con `REPLACE` si es necesario)
5. **Obtiene los nombres lógicos** de los archivos (`RESTORE FILELISTONLY`)
6. **Genera el script T-SQL completo** para restaurar la base con:
  - `MOVE` hacia una nueva ruta
  - `RECOVERY` (el archivo .bak tiene habilitado la opción COPY_ONLY)
  - Opción `REPLACE` si aplica
7. **Guarda el script** generado en un archivo `.sql` (el archivo se guarda en la ruta de destino especificada en la plantilla)

---

## 💻 Parámetros de entrada

```PowerShell
param (
    [string]$backupPath = "C:\YourPath\Backups\MiniDropBoxDB.bak",
    [string]$restoreToPath = "C:\YourPath\RestoreTarget",
    [string]$serverInstance = "Instance\Instance",
    [string]$newDatabaseName = "MiniDropBoxDb"
)
```
---

## 🚀 Ejemplo de uso

```PowerShell
.\Check-BackupAndGenerateRestore `
 -backupPath "C:\Backups\MiniDropBoxDB.bak" `
 -restoreToPath "D:\SQLData" `
 -serverInstance "DESKTOP\SQLEXPRESS" `
 -newDatabaseName "MiniDropBoxRestored"
```
Estos parámetros se pueden omitir si se modifican los parámetros del script en el archivo

## 📷 Capturas del proceso paso a paso del script

| **Descripción** | **Imagen** |
| --------------- | ---------- |
| Cabecera del backup (.bak) | ![image](https://github.com/user-attachments/assets/f5c7e610-d823-4be2-a094-b75073721120) |
| Confirmación REPLACE | ![image](https://github.com/user-attachments/assets/fea1821e-2876-46df-b978-893174c6f527) |
| Script generado en consola | ![image](https://github.com/user-attachments/assets/9fbb4fb5-6a2b-4eb3-8a2a-17a1fb17bece) |
| Ejecución en SSMS | ![image](https://github.com/user-attachments/assets/f0b29b08-4cca-47f6-8f26-cc180cbcf80d) |

---

## ✅ ¿Por qué es relevante este proyecto?

- Simula tareas reales de un **SQL Server DBA**
- Emplea comandos avanzados como `RESTORE HEADERONLY`, `FILELISTONLY` y `MOVE`
- Muestra comprensión profunda del **modelo de recuperación de SQL Server**

## 🌟 Certificación relacionada

Este laboratorio forma parte del proceso de estudio y preparación para la certificación:
> Microsoft Certified: Azure Database Administrator Associate (DP-300)

---

## 💬 Comentarios finales

Este laboratorio fué desarrollado con un enfoque práctico y autodidacta, con el objetivo de consolidad habilidades reales de la administración de bases de datos.
¡Siéntete libre de probar, modificar o extender el script para adaptarlo a tus propios entornos!



