# https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/index.html

import boto3
import json
import time
ec2 = boto3.client('ec2')

# Retrieves all regions/endpoints that work with EC2
# response = ec2.describe_regions()
# print('Regions:', response['Regions'])

# Retrieves availability zones only for region of the ec2 object
# response = ec2.describe_availability_zones()
# print('Availability Zones:', response['AvailabilityZones'])

# response = ec2.describe_images(Owners=['self'])
# print(response)

response = ec2.describe_images(Owners=['137112412989'])
for item in response['Images']:
    print(item)
    time.sleep(10)
# print(response)