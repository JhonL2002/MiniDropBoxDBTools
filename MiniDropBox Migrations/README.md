# 🛠 MiniDropBox Migrations - Migración de Base de Datos SQL Server a Azure SQL con DMA

Este proyecto muestra el proceso de **migración** de una base de datos local a **Azure SQL Database** utilizando **Database Migration Assistant (DMA)**.

---

## 📌 Requisitos Previos

- Tener una **base de datos local** en SQL Server, para restaurar una base de datos, puede consultar <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Restore">este recurso</a>.
- Tener una **instancia de Azure SQL Database** ya desplegada, para automatizar este proceso, puede consultar <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Security/Implementar%20Azure%20SQL%20Database">este recurso</a>.
- Haber instalado [DMA](https://learn.microsoft.com/sql/dma/dma-overview) en tu máquina.

---

## 📊 Paso 1: Evaluación con DMA

Antes de realizar la migración, se debe verificar la compatibilidad de la base de datos de origen, para este paso, puede acceder a <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Assessments">este recurso</a>

---

## 🔐 Paso 2: Permitir el acceso desde tu IP

Antes de iniciar la evaluación con DMA, es necesario agregar la IP pública de tu máquina como regla en el servidor SQL de Azure.

Para permitir el acceso desde PowerShell, puede acceder a <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Database%20Firewall">este recurso</a>

---

## 🚀 Paso 3: Migración

Una vez se valida la compatibilidad, se puede realizar la migración, a continuación, se muestra como hacerlo desde DMA

| **Descripción** | **Imagen** |
| --------------- | ---------- |
| Crear un proyecto de migración, se debe elegir la opción 'Migration' | ![crear proyecto de migracion](https://github.com/user-attachments/assets/2b6f8f0e-089d-47f9-8d7a-5b6f2ff35722) |
| Seleccionar servidor de origen | ![seleccionar servidor de origen](https://github.com/user-attachments/assets/548379fb-ac06-4ddc-b88a-ff8bb47c5c39) |
| Seleccionar la base de datos a migrar | ![seleccionar la base a migrar](https://github.com/user-attachments/assets/7d649475-abed-432e-940d-275d16d6643d) |
| Seleccionar el servidor de destino | ![seleccionar servidor de destino](https://github.com/user-attachments/assets/85888602-65b9-4371-9df1-88586acefe63) |
| Verificar la selección de la nueva base de datos | ![verificar base de datos nueva](https://github.com/user-attachments/assets/6ebca238-765a-441a-85f6-66a562263cda) |
| Verificar las tablas y usuarios a migrar | ![verificar tablas y usuarios](https://github.com/user-attachments/assets/b74d5980-71ac-456f-838f-b472bdef82f8) |
| Verificar script de migración | ![verificar script de migracion](https://github.com/user-attachments/assets/fccd509d-7ed2-4680-a451-a1f51e9de992) |
| Desplegar el esquema de la base de datos y confirmar que todo salió bien | ![verificar cambios finales](https://github.com/user-attachments/assets/75d72d75-03ed-49ac-b1e7-221e3d881ea8) |
| Seleccionar las tablas a migrar | ![seleccionar tablas finales](https://github.com/user-attachments/assets/0dac61a8-da32-4224-bc6b-5f4db9c5367f) |
| Verificar si la migración ha sido exitosa | ![migracion exitosa](https://github.com/user-attachments/assets/4365119e-42e2-461c-ac6a-dbbd1d538027) |

⚠️ El usuario `NT AUTHORITY\SYSTEM` es un usuario de Windows, no se migrará porque este usuario es el que accede al SQL Agent, es prefereible crear **Elastic Jobs** después de realizar la migración o usar **Azure SQL Managed Instance** en su lugar.

---

## ✅ Verificar los resultados

Una vez que se haya migrado la base de datos, en SSMS se puede acceder con las credenciales del servidor SQL de Azure, verificar que las tablas y datos estén ubicados.

![final](https://github.com/user-attachments/assets/cc02260c-f133-4ece-ad6e-c9ddad6870b9)
