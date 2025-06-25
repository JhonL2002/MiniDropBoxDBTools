# 📊 Evaluación de Compatibilidad con Data Migration Assistant (DMA)

Antes de migrar una base de datos, en este caso 'MiniDropBoxDb' a **Azure SQL Database**, es fundamental evaluar su compatibilidad y verificar si existen funciones, configuraciones o características que no son compatibles con el entorno de destino.

Este paso ayuda a reducir el riesgo de fallos en producción y asegura una transición sin inconvenientes.

---

## 🛠️ Herramienta utilizada

> **Data Migration Assistant (DMA)**
> Plataforma de origen: 'SQL Server 2022 Developer Edition'
> Plataforma destino: 'Azure SQL Database (Single, S0)'

---

## 🧪 Ejecución

Antes de realizar una evaluación de compatibilidad, se recomienda tener en cuenta lo siguiente:
- Tener la base de datos 'MiniDropBox' restaurada de forma local en SQL Server, para hacerlo, puede acceder <a href="https://github.com/JhonL2002/MiniDropBoxDBTools/tree/main/MiniDropBox%20Restore">aquí</a>

| **Descripcipon** | **Imagen** |
| ---------------- | ---------- |
| 1. Ejecutar Data Migration Assistant, crear un proyecto de evaluación 'Assessment', se va a migrar de SQL Server local a Azure SQL Database | ![crear un proyecto de evaluacion](https://github.com/user-attachments/assets/27eafbc6-f774-405e-8d60-0e0b16b685f7) |
| 2. Seleccionar el tipo de reporte |  ![seleccionar los tipos de reportes](https://github.com/user-attachments/assets/9dfc7f15-9364-449d-85ea-4d9df52ed496) |
| 3. Conectar el servidor a evaluar | ![conectar al servidor de origen](https://github.com/user-attachments/assets/dc7dc79f-92ad-45df-b0b5-8262b02db02f) |
| 4. Seleccionar la base de datos a evaluar | ![seleccionar la base de datos a evaluar](https://github.com/user-attachments/assets/62b2ccbb-98b4-4c71-b123-d8e8b7f59a38) |
| 5. Iniciar la evaluación | ![iniciar evaluacion](https://github.com/user-attachments/assets/bf783cfb-3d08-438c-8187-b79fe25f0f5f) |
| 6. Verificar compatibilidad de herramientas de SQL Server hacia Azure SQL Database | ![verificar compatibilidad de sql server](https://github.com/user-attachments/assets/ea200be0-199a-4b0d-8edb-ffed1b0539e1) |
| 7. Verificar compatibilidad a nivel de base de datos | ![verificar problemas de compatibilidad](https://github.com/user-attachments/assets/10976ffe-8ff9-45c1-a03f-e35ac6da15a5) |

## 🧪 Resultado de la evaluación

- ✅ La base de datos **es compatible** con Azure SQL Database.
- ⚠️ Se detectó que **SQL Server Agent Jobs** están presentes en la instancia, pero **no son compatibles** con Azure SQL Database.
- 📌 **Recomendación**: Migrar los trabajos al servicio de **Elastic Jobs** o considerar **Azure SQL Managed Instance** si se requiere compatibilidad total.

---

## 📝 Recomendación general

> Siempre realizar esta evaluación antes de migrar, especialmente si se usan:
>
> - Jobs programados con SQL Agent
> - Procedimientos extendidos
> - Características de seguridad avanzadas
> - Replicación o Service Broker

---

## 📂 Ubicación de los archivos

```plaintext
MiniDropBox Assessments/
|
|--- MiniDropBoxAssessment_json.json
|--- MiniDropBoxAssessment_csv.csv
|--- README.md (este archivo)
```








