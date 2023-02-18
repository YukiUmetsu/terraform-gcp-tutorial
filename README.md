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