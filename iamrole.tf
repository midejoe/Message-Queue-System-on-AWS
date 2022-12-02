resource "aws_iam_role" "book-delivery-lambda-role" {
    assume_role_policy = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "lambda.amazonaws.com"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    description           = "Allows Lambda functions to call AWS services on your behalf."
    force_detach_policies = false
    managed_policy_arns   = [
        "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
        "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
    ]
    max_session_duration  = 3600
    name                  = "book-delivery-lambda-role"
    path                  = "/"
}