dbutils.fs.ls("S3 Bucket")

from pyspark.sql import functions as F

src = "S3 Bucket"

bronze = (spark.read
    .option("header", True)
    .option("inferSchema", False)
    .option("recursiveFileLookup", "true")
    .csv(src)
    .withColumn("_ingested_at", F.current_timestamp())
    .withColumn("_source_file", F.col("_metadata.file_path")))

bronze.write.format("delta").mode("overwrite") \
    .option("overwriteSchema", "true") \
    .saveAsTable("workspace.XXXXX.bronze_vax_malaysia")

display(spark.table("workspace.XXXXXXX.bronze_vax_malaysia"))
