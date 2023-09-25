import boto3


### CHANGE THESE VALUES ###

# You can get the account id from the console by clicking the dropdown in the top right corner
destination_account_id = '375112818203'
# The domain name you want to transfer from route53 to the new account
domain_name = 'ballsoffwalls.com'
# The profile name you've setup in ~/.aws/credentials that has access to the domain you want to transfer from
source_profile='default'
# The profile name you've setup in ~/.aws/credentials that has access to the domain you want to transfer to
destination_profile='DuckTapeDevOps'

##########################


# Create the Route53Domains client for the source account
session_source = boto3.Session(profile_name=source_profile)
session_destination = boto3.Session(profile_name=destination_profile)
# Create the Route53Domains client for the source account
source_client_r53 = session_source.client('route53domains', region_name='us-east-1')
# Create the Route53Domains client for the final account
destination_client_r53 = session_destination.client('route53domains', region_name='us-east-1')


def get_transfer_key(source_client_r53, domain_name):
    # Replace 'example.com' with the actual domain name
    response = source_client_r53.describe_domain_transfer(DomainName=domain_name)

    transfer_password = response['OperationDetail']['TransferPassword']
    print("Transfer Password:", transfer_password)
    return transfer_password

def cancel_transfer(source_client_r53, domain_name):
    # Replace 'example.com' with the actual domain name
    response = source_client_r53.cancel_domain_transfer_to_another_aws_account(DomainName=domain_name)
    print(response)

def transfer_domain(source_client, destination_client, domain_name, destination_account_id):
    # Initiate the transfer from the source account
    response = source_client.transfer_domain_to_another_aws_account(
        DomainName=domain_name,
        AccountId=destination_account_id
    )

    # The response contains the transfer password
    transfer_password = response['Password']

    # Accept the transfer on the destination account
    response = destination_client.accept_domain_transfer_from_another_aws_account(
        DomainName=domain_name,
        Password=transfer_password
    )

    return response['OperationId']

response = transfer_domain(source_client_r53, destination_client_r53, domain_name, destination_account_id)

print(response)