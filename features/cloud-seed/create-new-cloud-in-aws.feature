Feature: Create a new Cloud in AWS
  As a Cloud Admin
  I need to be able to initialise a new Cloud in AWS
  so that I can log in to the Cloud Dashboard

  Scenario: The first region is the global region which is the only region having Cloud IAM deployed
    Given an AWS account
    And   an AWS profile with AdministratorAccess policy
    And   a region string "us-west-2"
    And   an AMI built for BCS cloud controller
    And   an AMI version string
    And   a host name "sb-cloud.peterbean.net"
    And   Cloud Admin email "admin@sb-cloud.peterbean.net"
    And   Cloud Admin password "12345678"
    And   no other regions have been initialised yet

    When  the new Cloud is initialised

    Then  the correct AMI version and AWS Region are picked up
    And   a VPC with Tag Name BCS-CloudController and Class A range is created if not exists
    And   a public subnet with CIDR 10.0.0.0/11 is created if not exists
    And   a private subnet with CIDR 10.32.0.0/11 is created if not exists
    And   the EC2 instance is launched in the private subnet
    And   the EC2 instance can be connected to using AWS SSM
    And   the visitor can access the Cloud Dashboard at dashboard.sb-cloud.peterbean.net using email "admin@sb-cloud.peterbean.net" and password "12345678"
