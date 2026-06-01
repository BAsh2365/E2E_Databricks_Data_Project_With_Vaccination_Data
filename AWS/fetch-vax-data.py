import os, urllib.request
from datetime import datetime, timezone
import boto3

s3 = boto3.client("my S3 bucket")
API_URL = os.environ["API_URL"]
BUCKET  = os.environ["BUCKET_NAME"]
PREFIX  = os.environ.get("PREFIX", "File path")

def lambda_handler(event, context):
    req = urllib.request.Request(
        API_URL, headers={"User-Agent": "malaysia-vax/1.0"})
  
    with urllib.request.urlopen(req, timeout=30) as resp:
        if resp.status != 200:
            raise RuntimeError(f"status {resp.status}")
        raw = resp.read()
    today = datetime.now(timezone.utc).strftime("%Y-%m-%d")
    key = f"{PREFIX}/dt={today}/data.csv"
    s3.put_object(Bucket=BUCKET, Key=key, Body=raw)
    return {"written": f"s3://{BUCKET}/{key}"}
