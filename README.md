# 🛠️ MiniDropBoxDBTools

**MiniDropBoxDBTools** es un conjunto de scripts y algunos laboratorios de ayuda para facilitar la administración de entornos SQL Server, utilizando **PowerShell** como herramienta principal. Estos recursos permiten automatizar tareas comunes que realiza un DBA, promoviendo una comprensión práctica y moderna de la gestión de bases de datos.

**MiniDropBoxDb** es una base de datos relacional creada con SQL Server que simula un entorno de gestión documental para una organización ficticia. Incluye características como:
- **"Usuarios contenidos en la base de datos de usuario"**
- **"Asignación de roles personalizados (a nivel de aplicación)"**
- **"Almacenamiento y control de rutas de archivos"**.

Este proyecto es una fuente del desarrollo basado en .Net de una API que permite a una organización ficticia administrar sus ficheros, para ver mas detalles, accede <a href="https://github.com/JhonL2002/MiniDropBox">aquí</a>

Esta base sirve como entorno base para ejecutar tareas administrativas, respaldos, restauraciones y automatización mediante PowerShell.

## 🧩 Contenido del Repositorio

- `scripts/` - Scripts de PowerShell para:
  - Restaurar bases de datos (`.bak`)
  - Inspeccionar backups
  - Automatizar tareas de mantenimiento

- `sql/` - T-SQL para:
  - Habilitar TDE o Always Encrypted
  - Creación y optimización de índices
  - Optimización y monitoreo
- `docs/` - Guias con algunos tips
- `examples/` - Ejemplos de configuración

## 🧪 Requisitos

- PowerShell 7+
- Modulo `SqlServer` instalado (`Install-Module SqlServer`)
- SQL Server Developer Edition (`Recomendado para usar SQL Server Agent`)
- Azure CLI

## 🚀 Objetivo

Este repositorio tiene como propósito proporcionar recursos prácticos para la administración de bases de datos con SQL Server. Aquí encontrarás scripts, laboratorios y ejemplos que simulan escenarios relaes de un DBA. La idea principal es que puedas explorar, experimentar y aprender a través de la práctica, fortaleciendo así los conocimientos necesarios para enfrentar desafíos reales en el mundo de la administración de bases de datos.

¡Siéntete libre de revisar, modificar y ejecutar cada recurso por tu cuenta!

*Creado por JhonL2002 - Microsoft Certified: Azure Database Administrator Associate 🎓 (DP-300)*
