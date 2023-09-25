import boto3


### CHANGE THESE VALUES ###

# The domain name you want to transfer from route53 to the new account
domain_name = 'ballsoffwalls.com'
# The profile name you've setup in ~/.aws/credentials that has access to the domain you want to create a certificate for
profile='DuckTapeDevOps'

##########################

session = boto3.Session(profile_name=profile)

client_acm = session.client('acm', region_name='us-east-1')

response = client_acm.request_certificate(
    DomainName=domain_name,
    ValidationMethod='DNS',
    SubjectAlternativeNames=[
        '*.' + domain_name
    ],
    IdempotencyToken='string'
)

print(response)