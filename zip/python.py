below code send email if lambda gets a triggered woth event changed

import boto3

client = boto3.client('sns')

def lambda_handler(event, context):
    # TODO implement
    
    
    instance_id = event['detail']['instance-id']
    state       = event['detail']['state']
    message = 'The following EC2 instance with ID : {} has {}'.format(instance_id,state)
    client.publish(
        TopicArn='arn:aws:sns:us-east-1:685648142693:SNS-Lambda',
        Message = message
        )
        
        