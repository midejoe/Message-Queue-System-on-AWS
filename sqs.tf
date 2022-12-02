resource "aws_sqs_queue" "book-ordering-queue" {
    content_based_deduplication       = false
    deduplication_scope               = "queue"
    delay_seconds                     = 0
    fifo_queue                        = true
    fifo_throughput_limit             = "perQueue"
    kms_data_key_reuse_period_seconds = 300
    max_message_size                  = 262144
    message_retention_seconds         = 86400
    name                              = "book-ordering-queue.fifo"
    receive_wait_time_seconds         = 0
    sqs_managed_sse_enabled           = true
    visibility_timeout_seconds        = 60

}


resource "aws_lambda_event_source_mapping" "book-1" {
  event_source_arn = aws_sqs_queue.book-ordering-queue.arn
  function_name    = aws_lambda_function.bookstore-1.arn
}

resource "aws_lambda_event_source_mapping" "book-2" {
  event_source_arn = aws_sqs_queue.book-ordering-queue.arn
  function_name    = aws_lambda_function.bookstore-2.arn
}

resource "aws_lambda_event_source_mapping" "book-3" {
  event_source_arn = aws_sqs_queue.book-ordering-queue.arn
  function_name    = aws_lambda_function.bookstore-3.arn
}