import boto3
import time
time.sleep(3) # Sleep for 3 seconds
client = boto3.client('ec2')
ec2 = boto3.resource('ec2')
s3_client = boto3.client('s3')


def lambda_handler(event, context):
    # gets instance id of newly created instance, trigger by state change event
    #instance_id = event['detail']['instance-id']               
    
    #time.sleep(30)

    # retriving blockDeviceMapping attributes details and storing in response variable, required to get volume
    response =  client.describe_instance_attribute(                  
        Attribute= 'blockDeviceMapping', 
        InstanceId='i-047e3946318b15ed7'
        )                                                                                                                    
    

    # pulling volume id value from response variable
    vol_id = response['BlockDeviceMappings'][0]['Ebs']['VolumeId']                                                          
    
    # creating snapshot
    snapshot = client.create_snapshot(
        Description='snapshot of ' + vol_id,
        VolumeId=vol_id)

    # retrives Snapshot ID
    snap = snapshot['SnapshotId']
    time.sleep(30)   

    new_vol = client.create_volume(AvailabilityZone='us-east-1a', SnapshotId = snap)
    time.sleep(15)                                                                                                           
    
    # Attaching new volume to instance
    client.attach_volume(                                                                                                   
    Device='/dev/sdh',
    #InstanceId = instance_id,
    InstanceId='i-047e3946318b15ed7',
    VolumeId= new_vol['VolumeId']
    )
