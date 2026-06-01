from pyspark.sql import functions as F
bronze = spark.table("workspace.XXXXXX.bronze_vax_malaysia")


silver = (bronze
.withColumn("date", F.to_date("date"))
.withColumn("daily_partial", F.col("daily_partial").cast("int"))
.withColumn("daily_full", F.col("daily_full").cast("int"))
.withColumn("daily_booster", F.col("daily_booster").cast("int"))
.withColumn("daily", F.col("daily").cast("int"))
.withColumn("cumul_partial", F.col("cumul_partial").cast("long"))
.withColumn("cumul_full", F.col("cumul_full").cast("long"))
.withColumn("cumul", F.col("cumul").cast("long"))
.filter(F.col("date").isNotNull())
.dropDuplicates(["date"]))
(silver.write.format("delta").mode("overwrite") \
.option("overwriteSchema", "true") \
.saveAsTable("workspace.XXXXXXXX.silver_vax_malaysia"))
