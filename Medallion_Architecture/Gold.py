from pyspark.sql import functions as F
silver = spark.table("workspace.XXXXXXXXX.silver_vax_malaysia")


dim_date = (silver.select("date").distinct()
    .withColumn("date_key",     F.date_format("date", "yyyyMMdd").cast("int"))
    .withColumn("full_date",    F.col("date"))
    .withColumn("year",         F.year("date"))
    .withColumn("month",        F.month("date"))
    .withColumn("week_of_year", F.weekofyear("date"))
    .withColumn("day_name",     F.date_format("date", "EEEE")))

fact = (silver
    .withColumn("date_key", F.date_format("date", "yyyyMMdd").cast("int"))
    .selectExpr(
        "date_key",
        "daily_partial", "daily_full", "daily_booster",
        "daily as daily_total",
        "cumul_partial", "cumul_full", "cumul as cumul_total"))


gold_summary = silver.select("date", "daily", "cumul")

write_opts = {"overwriteSchema": "true"}

(dim_date.write.format("delta").mode("overwrite")
    .options(**write_opts)
    .saveAsTable("workspace.XXXXXXXXX.dim_date"))

(fact.write.format("delta").mode("overwrite")
    .options(**write_opts)
    .saveAsTable("workspace.XXXXXXXX.fact_vaccination"))

(gold_summary.write.format("delta").mode("overwrite")
    .options(**write_opts)
    .saveAsTable("workspace.XXXXXXXX.gold_vax_malaysia"))

display(spark.table("workspace.XXXXXXXXXX.fact_vaccination"))
