# 🧩 MiniDropBox - Automatización de Backups en SQL Server con PowerShell

**Autor:** [JhonL2002] **Certificación:** Microsoft DP-300 (Azure Database Administrator Associate) **Repositorio:** Scripts de laboratorio diseñados para simular tareas reales de un DBA con SQL Server

---

## 📌 ¿Qué es esto?

Este repositorio contiene un conjunto de scripts en **PowerShell** diseñados para automatizar el respaldo de bases de datos en **SQL Server**, siguiendo una estrategia de copias completa + diferencial + logs (al estilo empresarial).
Estos scripts permiten automatizar copias  de seguridad `FULL`, `DIFFERENTIAL` y `LOG`, cada una en su propio archivo y programadas según las necesidades del entorno

> Ideales para simular escenarios de recuperación y políticas de respaldo como los que se implementan en entornos reales de producción o como lo hace Azure SQL Database y Azure Managed Instance de forma automática.

---

## 🔍 Caso de estudio

Imagina que una organización ficticia administra información crítica en una base de datos llamada **MiniDropBoxDb** alojada en una instancia de **SQL Server**. El equipo de TI ha solicitado implementar una **estrategia automatizada de respaldo** que cumpla con las siguientes políticas:
- Las copias de seguridad deben minimizar la intervención manual del DBA
- El proceso debe optimizar el uso del almacenamiento local
- Los respaldos deben estar **preparados para restauración rápida** ante cualquier falla

# 🛠️ Política de respaldo a implementar

| **Tipo de copia** | **Frecuencia** | **Observaciones** |
| ----------------- | -------------- | ----------------- |
| FULL | Semanal (cada Domingo) | Punto base para restauraciones |
| DIFERENCIAL | Cada 12 horas | Basadas en la última FULL, ejecutadas diaramente |
| LOG de transacciones | Cada 10 minutos | Requiere modo de recuperación FULL para garantizar restauraciones a punto exacto |

## 💡 Consideraciones técnicas

- Todas las copias se deben generar con nombres únicos utilizando **timestamp** (`yyyyMMdd_HHmm`)
- Las copias pueden **sobreescribirse** automáticamente para optimizar el almacenamiento, por lo que se utiliza la cláusula `WITH INIT` en cada script
- Se recomienda utilizar **el Programador de tareas de Windows** o el Agente SQL Server para ejecutar cada script según su frecuencia.

> ⚙️ Estos scripts permiten implementar dicha política de forma totalmente automatizada utilizando PowerShell + SQL Server, simulando un entorno real de producción

---

## 🔄 ¿Que hace cada script?

Cada script de este repositorio automatiza un tipo específico de respaldo en **SQL Server**, siguiendo una política realista de protección de datos. Todos los respaldos se generan con nombres únicos basados en la fecha y hora (`yyyyMMdd_HHmm`) y utilizan `WITH INIT`, `COMPRESSION` y `CHECKSUM` para optimizar espacio y validar integridad.

| **Script** | **Tipo de copia** | **Frecuencia sugerida** | **Detalles clave** |
| ---------- | ----------------- | ----------------------- | ------------------ |
| `Backup-Full.ps1` | Completa (FULL) | Semanal | Base de referencia para restauraciones |
| `Backup-Diff.ps1` | Diferencial | Cada 12 horas | Copia de cambios desde el último FULL | 
| `Backup-Log.ps1` | Logs de transacción | Cada 10 minutos | Permite recuperación a punto exacto (PITR) |

⚠️ Recuerda: todos los scripts pueden personalizarse fácilmente para adaptarse a diferentes bases de datos y rutas de almacenamiento

---

## 🔴 Importante!

Para permitir la realización de copias de seguridad completas, diferenciales y de registro de transacciones, la base de datos debe estar en modo de recuperación completa, para habilitarlo, usar el siguiente T-SQL script en el motor de la base de datos SQL Server:

```SQL
USE [master];
GO
ALTER DATABASE [MiniDropBoxDb]
SET RECOVERY FULL;
GO
```
---

## ⚙️ Automatización con el Programador de Tareas de Windows 

Ejecutar el Administrador de Tareas de Windows, una vez se ejecuta, seguir los siguientes pasos:

| **Tipo de Backup** | **Descripción** | **Imagen** | 
| ------------------ | --------------- | ---------- |
| FULL | Seleccionar la Opción de Crear tarea básica | ![crear tarea basica paso 1](https://github.com/user-attachments/assets/e0dfc60a-4896-42e0-a558-b3893d8da65b) |
| FULL | Asignar el nombre de la tarea | ![crear tarea basica paso 2](https://github.com/user-attachments/assets/d19ef1c1-9e8d-470a-94f5-909858895c75) |
| FULL | Programar la tarea como "Semanalmente" | ![crear tarea basica paso 3](https://github.com/user-attachments/assets/5ee83ae3-13e5-4b63-9970-748bd345b4b1) |
| FULL | Establecer el inicio de la tarea, que se repita cada semana, definir la hora de inicio y el día en el que se ejecutará la copia | ![crear tarea basica paso 4](https://github.com/user-attachments/assets/dc2cc4c4-69e3-4210-bb74-96ee349b8a61) |
| FULL | Establecer la acción de Iniciar un Programa | ![crear tarea basica paso 5](https://github.com/user-attachments/assets/db6de58f-e39f-4b30-8f1b-3f37a3d2345f) |
| FULL | En programa o script, escribir "powershell.exe" y en agregar argumentos, colocar la siguiente instrucción `-ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File "C:\Backups\Backup-Full.ps1"` (cambiar la ruta a donde se encuentre el script) | ![crear tarea basica paso 6](https://github.com/user-attachments/assets/73b45ad6-23ab-488a-b5cb-4c35f71931da) |
| DIFF | Seleccionar la Opción de Crear tarea | ![diferencial paso 1](https://github.com/user-attachments/assets/a17e5220-23ae-45f7-97d1-69447652a51f) |
| DIFF | Asignar el nombre y descripción de la tarea | ![diferencial paso 2](https://github.com/user-attachments/assets/821de278-2179-43e4-b919-c18bf77187d8) |
| DIFF | En las opciones de desencadenador, establecer la fecha y hora de inicio, se repite cada 1 día, seleccionar la opción **Diariamente**, habilitar la configuración avanzada y repetir cada 12 horas | ![diferencial paso 3](https://github.com/user-attachments/assets/34c6e362-da42-4163-965f-6fdb1446d200) |
| DIFF | Establecer la acción de iniciar un programa, en programa o script agregar "powershell.exe", en Agregar argumentos, colocar la siguiente instrucción `-ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File "C:\Backups\Backup-Diff.ps1"` (cambiar la ruta a donde se encuentre el script) | ![diferencial paso 4](https://github.com/user-attachments/assets/55125d32-6f6b-47e7-86f2-53f3b5508221) |
| DIFF | En las condiciones de la tarea, se recomienda para entornos de producción habilitar la opción **Iniciar la tarea solo si el equipo está conectado a la corriente alterna** | ![diferencial paso 5](https://github.com/user-attachments/assets/a8e2a838-abdc-49e8-848c-3147c2904229) |
| DIFF | En la sección de Configuración, habilitar la opción **Detener la tarea si se ejecuta durante más de:** y asignar una tasa inferior a 8 horas | ![diferencial paso 6](https://github.com/user-attachments/assets/52a37aaa-e426-4294-a870-f24aa3aa27ec) |
| LOG | Seleccionar la Opción de Crear tarea | ![diferencial paso 1](https://github.com/user-attachments/assets/a17e5220-23ae-45f7-97d1-69447652a51f) |
| LOG | Asignar el nombre y descripción de la tarea | ![logs paso 1](https://github.com/user-attachments/assets/4fbe8570-164c-44fa-a7e6-1ce0606ed0d9) |
| LOG | En las opciones de desencadenador, establecer la fecha y hora de inicio, se repite cada 1 día, habilitar la opción de repetición **Diariamente**, habilitar la configuración avanzada y repetir cada 10 minutos | ![logs paso 2](https://github.com/user-attachments/assets/5accf14f-2e1f-44d5-be2d-6684d913656c) |
| LOG | Establecer la acción de iniciar un programa, en programa o script agregar "powershell.exe", en Agregar argumentos, colocar la siguiente instrucción `-ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File "C:\Backups\Backup-Log.ps1"` (cambiar la ruta a donde se encuentre el script) | ![logs paso 3](https://github.com/user-attachments/assets/2bf9faee-0de1-4b74-a30b-f6ba7a7a6d6d) |
| LOG | En las condiciones de la tarea, se recomienda para entornos de producción habilitar la opción **Iniciar la tarea solo si el equipo está conectado a la corriente alterna** | ![logs paso 4](https://github.com/user-attachments/assets/8fbb1e19-688f-470b-8d6a-642a47e599e0) |
| LOG | En la sección de Configuración, habilitar la opción **Detener la tarea si se ejecuta durante más de:** y asignar una tasa inferior a 1 hora | ![logs paso 5](https://github.com/user-attachments/assets/16223784-cf6b-48f0-8acb-c4b0d096c4d0) |

> Una vez que los scripts estén configurados, se pueden probar manualmente para verificar su funcionamiento simplemente ejecutando la tarea manualmente desde el programador

---

## 💬 Comentarios finales

Este pequeño laboratorio permite comprender como se pueden automatizar las copias de seguridad de una base de datos, muchas veces cuando estamos desarrollando, es probable que no podamos usar el Agente SQL Server para automatizar trabajos, esta es una opción válida que se puede usar en entorno de pruebas para ejecutar scripts.























