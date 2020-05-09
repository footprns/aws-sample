import boto3
import json
import pprint

# Let's use Amazon S3
s3 = boto3.resource('s3')

# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)

client = boto3.client('s3')
response = client.get_bucket_acl(
    Bucket='imank-bucket-test'
)
print(json.dumps(response))