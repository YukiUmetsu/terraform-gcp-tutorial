# Terraform-gcp-tutorial
https://www.udemy.com/course/terraform-for-beginners-using-google-cloud-platform-gcp/

<br/>

# Life cycle 

- ***create_before_destroy***

    By default, Terraform will instead destroy the existing object and then create a new replacement object with the new configured arguments. 
    
    The create_before_destroy meta-argument changes this behavior so that the new replacement object is created first, and the prior object is destroyed after the replacement is created.


- ***prevent_destroy***

    Reject with an error any plan that would destroy the infrastructure object associated with the resource, as long as the argument remains present in the configuration.

- ***ignore_changes***

    Intended to be used when a resource is created with references to data that may change in the future, but should not affect said resource after its creation.

- ***replace_triggered_by***

    Replaces the resource when any of the referenced items change.


    Replace `aws_appautoscaling_target` each time this instance of the aws_ecs_service is replaced.

    ```
    resource "aws_appautoscaling_target" "ecs_target" {

        lifecycle {
            replace_triggered_by = [
                aws_ecs_service.svc.id
            ]
        }
    }
    ```


# GCP login
1. username and password
     
     ```gcloud auth application-default login ```

2. google cloud shell
3. service account key

<br/>

# Networking
- VPC
    - VPC networks are logically isolated from each other in Google
Cloud.
    - VPC is a global resource & consist of subnets in one or more region
    - It is possible to control all the traffic which is coming in and going
outside a VPC 

<br> 

- VPC Subnets
    - Subnets are regional resources and have IP address
ranges associated with them
    - You create instances, containers, and the like in these subnets. When you create an instance, you must create it in a subnet, and the instance draws its internal IP address from that subnet.
    - Resources in public subnet CAN be accessed from
internet
    - Resources in private subnet CANNOT be accessed from
internet

<br> 

- CIDR (Classless Inter-Domain Routing) Blocks
    - CIDR blocks represent groups of IP addresses that have the same network prefixes and number of bits.
    - A CIDR block consist of a starting IP address (69.208.0.0) and a range (/28) 
    - Quick Tip: 69.208.0.0/28 shows that the first 28 bits out of 32 are fixed.  (Last 4 bits can change. 2 to power 4 = 16 addresses)
    - Best place to understand CIDR block: https://cidr.xyz/

<br> 

- GCP firewall
    - Each firewall rule has priority of (0-65535) assigned to it (0 has highest priority. 65525 has lowest priority)

    - ***Ingress Rules***: Incoming traffic from outside to GCP targets
        - Target (defines destination)
        - Source (defines where the traffic is coming from)

    <br/>
    
    - ***Egress Rules***: Outgoing traffic to destination from GCP targets
        - Target (defines the source)
        - Destination: CIDR Block
    
    <br/>

    - Firewall rule components:
        - Direction
        - Priority
        - Action on match
        - Target
        - Protocol