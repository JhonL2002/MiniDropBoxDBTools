# 🛠️ MiniDropBoxDBTools

**MiniDropBoxDBTools** es un conjunto de scripts y algunos laboratorios de ayuda para facilitar la administración de entornos SQL Server, utilizando **PowerShell** como herramienta principal. Estos recursos permiten automatizar tareas comunes que realiza un DBA, promoviendo una comprensión práctica y moderna de la gestión de bases de datos.

**MiniDropBoxDb** es una base de datos relacional creada con SQL Server que simula un entorno de gestión documental para una organización ficticia. Incluye características como:
- **"Usuarios contenidos en la base de datos de usuario"**
- **"Asignación de roles personalizados (a nivel de aplicación)"**
- **"Almacenamiento y control de rutas de archivos"**.

Este proyecto es una fuente del desarrollo basado en .Net de una API que permite a una organización ficticia administrar sus ficheros, para ver mas detalles, accede <a href="https://github.com/JhonL2002/MiniDropBox">aquí</a>

Esta base sirve como entorno base para ejecutar tareas administrativas, respaldos, restauraciones y automatización mediante PowerShell.

## 🧩 Contenido del Repositorio

```plaintext
MiniDropBoxDBTools/
|
|--- MiniDropBox Assessments (Para evaluar bases de datos antes de migrar)
|--- MiniDropBox Backups (Para automatizar backup en SQL Server local con PowerShell)
|--- MiniDropBox Database Firewall (Para gestionar el firewall y acceso a la base de datos Azure SQL)
|--- MiniDropBox Migrations (Para realizar migraciones con DMA)
|--- MiniDropBox Restore (Para realizar restauraciones con PowerShell)
|--- MiniDropBox Security (Laboratorio 3 en 1)/
|    |--- Create Azure Key Vault Service (Crear Key Vault con PowerShell)
|    |--- Habilitar TDE (Habilitar TDE en una base de datos con PowerShell)
|    |--- Implementar Azure SQL Database (Crear servicio SQL Database de Azure con PowerShell)
|--- README.md (este archivo)    
```

## 🧪 Requisitos

- PowerShell 7+
- Modulo `SqlServer` instalado (`Install-Module SqlServer`)
- SQL Server Developer Edition (`Recomendado para usar SQL Server Agent`)
- Azure CLI

## 🚀 Objetivo

Este repositorio tiene como propósito proporcionar recursos prácticos para la administración de bases de datos con SQL Server. Aquí encontrarás scripts, laboratorios y ejemplos que simulan escenarios relaes de un DBA. La idea principal es que puedas explorar, experimentar y aprender a través de la práctica, fortaleciendo así los conocimientos necesarios para enfrentar desafíos reales en el mundo de la administración de bases de datos.

¡Siéntete libre de revisar, modificar y ejecutar cada recurso por tu cuenta!

*Creado por JhonL2002 - Microsoft Certified: Azure Database Administrator Associate 🎓 (DP-300)*
