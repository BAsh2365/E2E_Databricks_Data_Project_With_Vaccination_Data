from pyspark.sql import functions as F

fact = spark.table("workspace.XXXXXXXXXXXXXX.fact_vaccination") \
    .withColumn("ds", F.to_date(F.col("date_key").cast("string"), "yyyyMMdd"))

fact.write.format("delta").mode("overwrite") \
    .option("overwriteSchema", "true") \
    .saveAsTable("workspace.XXXXXXXXXXX.fact_vaccination")
