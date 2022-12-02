resource "aws_lambda_function" "bookstore-3" {
    architectures                  = [
        "x86_64",
    ]
    filename                       = "${path.module}/bookstore-3/index.zip"
    function_name                  = "bookstore-3"
    handler                        = "index.handler"
    layers                         = []
    memory_size                    = 128
    package_type                   = "Zip"
    reserved_concurrent_executions = -1
    role                           = "aws_iam_role.book-delivery-lambda-role.arn"
    runtime                        = "nodejs14.x"
    source_code_size               = 416
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