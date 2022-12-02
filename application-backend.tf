resource "aws_lambda_function" "application-backend" {
    architectures                  = [
        "x86_64",
    ]
    filename                       = "${path.module}/application-backend/index.zip"
    function_name                  = "application-backend"
    handler                        = "index.handler"
    layers                         = []
    memory_size                    = 128
    package_type                   = "Zip"
    reserved_concurrent_executions = -1
    role                           = "aws_iam_role.book-delivery-lambda-role.arn"
    runtime                        = "nodejs14.x"
    timeout                        = 60
    version                        = "$LATEST"

    ephemeral_storage {
        size = 512
    }

    timeouts {}

    tracing_config {
        mode = "PassThrough"
    }
  
}