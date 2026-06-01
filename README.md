# E2E_Databricks_Data_Project_With_Vaccination_Data
Created an End-to-end Databricks Project using AWS functions, Databricks workflows, PySpark, SQL, and AutoML (Covering Data Engineering, Data Analytics, and Data Science/ML)

## Architecture

![Architecture diagram](Databricks_E2E_Data_Project_Final.jpeg)

**MyVaccination CSV (Git Repo) -> AWS EventBridge -> Lambda config -> IAM → S3 -> Databricks Catalog -> Medallion Architecture -> Bronze -> Silver -> Gold -> Extra Data -> SQL Dashboard + MLflow AutoML model runs Forecast**


## Data sources

Malaysia's COVID-19 vaccination data, published by the **Special Committee for Ensuring Access to COVID-19 Vaccine Supply (CITF)**.

- CITF-Malaysia public data (GitHub): https://github.com/CITF-Malaysia/citf-public
- https://raw.githubusercontent.com/CITF-Malaysia/citf-public/main/vaccination/vax_malaysia.csv


## Screenshots

**Databricks Workspace with Data tables (pyspark tables)**
![Catalog tables](Databricks_Screenshots/Workspace%20Databricks.png)

**Workflow run ELT (bronze → silver → gold)**
![Workflow run](Databricks_Screenshots/Databricks_ELT_Orchestration.png)

**MLflow / AutoML forecasting experiment**
![MLflow experiment](Databricks_Screenshots/Databricks%20Model%20runs%20Auto%20ML.png)

**Best model run (ARIMA) — time series**
![ARIMA Time Series Run](Databricks_Screenshots/Best%20Model%20run%20(ARIMA)%20time%20series.png)

## Resources that helped/aided in the project development ##

- https://www.databricks.com/databricks-documentation

- https://spark.apache.org/docs/latest/api/python/user_guide/
  
- Alex the Analyst (SQL and Databricks overview): https://youtu.be/OT1RErkfLNQ?si=AtltqiVrrCHNxIAI, https://youtu.be/jegmI_hSx84?si=g74QBJ0BdNY7veCb, https://www.youtube.com/@AlexTheAnalyst (His Entire Databricks Series is helpful! His Entire Youtube Channel is helpful!)

- More SQL: https://www.thedataschool.co.uk/le-luu/order-of-operations-and-order-of-execution-in-sql/, https://www.datacamp.com/cheat-sheet/sql-basics-cheat-sheet

- Luke Bryne | AI Coding (Project Orchestration): https://youtu.be/zIS_ssTQmO0?si=M_6kjVj8T243pqmf, https://www.youtube.com/@ai-luke (Gave me the idea and the "spark" to start this project)

- Codebasics (In-depth Analysis of Databricks, PySpark, and the Underlying Concepts): https://youtu.be/761SQ9Hxbic?si=qMaxoX0Hio9NSJ3J (EXTREMELY helpful video for understanding WHY certain things work in Databricks like Distributed Compute with workers and nodes, Coalesce functions (while not used here, important for production workflows), etc.), https://www.youtube.com/@codebasics

- freeCodeCamp.org (PySpark guidelines): https://youtu.be/_C8kWso4ne4?si=UZceG9zzfveq7RcI Good for understanding PySpark, Data Transformations with filter, map, etc.)

- AI usage (Claude Opus 4.8 and Genie Code, used as a coding companion rather than an autocomplete fill-in-the-blank machine. More info in the AI log)
